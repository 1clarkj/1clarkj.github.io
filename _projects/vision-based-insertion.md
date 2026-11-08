---
title: Multi-Camera Perception for Robotic Cable Insertion
description: >-
  Trained the perception model for our team's entry to the Intrinsic AI for Industry
  Challenge: segmentation and keypoints of cables, plugs and ports from three robot
  cameras, reaching 88.5% mIoU on held-out views.
org: Intrinsic AI for Industry Challenge
date_label: 2026
role: Team project · perception model training, policy design
tech: [PyTorch, ConvNeXt (DINOv3), FPN, Isaac Sim, Gazebo, PPO, Imitation learning]
category: learning
featured: true
order: 2
thumbnail: /assets/media/insertion/thumb.gif
media:
  type: image
  src: /assets/media/insertion/predictions.png
  alt: Camera images with ground-truth and predicted segmentation masks and keypoints
  caption: >-
    Held-out validation views from three simulators/sessions: camera input, ground truth
    and the model's prediction. Coloured regions are segmentation masks; circles are the
    predicted plug-tip and port-centre keypoints.
---

## Overview

The challenge task is cable insertion: a robot arm must insert a cable's SFP or SC plug into the matching port on a task board. Our team's approach separated **perception** from **control**. I trained the perception model and designed the policy pipeline with the team.

## Perception model

From each of the robot's three cameras, a single network predicts:

- **Segmentation masks** for the cable, SFP and SC plugs, SFP and SC ports, and the task board.
- **The cable centreline.**
- **Keypoint heatmaps** for the plug tip, plug base, port centre and approach point, plus 12 points along the cable.

Keypoints from the three views are triangulated into 3D plug and port poses for the controller.

**Architecture.** A ConvNeXt-Small encoder with DINOv3-pretrained weights, a feature-pyramid neck, and three lightweight heads, trained at 512 × 512 with a weighted binary cross-entropy loss that up-weights the small plug and port classes.

**Data.** 10,015 labelled scenes × 3 cameras, collected in Isaac Sim and Gazebo with randomised component placements. Scenes are split 90/10 *by scene*, so all three views of a validation scene are unseen in training.

**Training schedule.**

| Phase | What trains | Learning rate |
|---|---|---|
| 1 · warm-up (15 epochs) | neck and heads, encoder frozen | 1e-3 |
| 2 · fine-tune | everything, cosine schedule | encoder 1e-4, heads 1e-3 |
| 3 · polish | everything | 1e-5 constant |

## Results

On all **3,006 held-out validation views**, the model reaches **88.5% mean IoU** (mask threshold 0.5). The task board and ports are segmented most reliably; the thin, deformable cable is the hardest class.

{% include media.html type="image" src="/assets/media/insertion/per_class_iou.png" alt="Bar chart of IoU per class" caption="Per-class IoU on the held-out validation views." %}

{% include media.html type="image" src="/assets/media/insertion/training_history.png" alt="Validation mIoU over training epochs" caption="Validation mIoU during training, as logged by the training script (stricter mask threshold of 0.35, hence the lower values). The jump after epoch 15 is where the pretrained encoder is unfrozen." %}

## Challenges and lessons learned

- **Mixed-precision divergence.** Around epoch 35 the fp16 run's loss became NaN and never recovered. I resumed from the best checkpoint in full precision, which trained stably, then finished with a low-learning-rate polish phase.
- **Check the data, not just the metric.** Inspecting predictions showed that in many views from two of the Gazebo sessions, the task board was *labelled but not rendered* in the camera image. The model still "found" it, which means it had learned where the board usually is rather than seeing it. Showcase images above are from sessions without this problem; the reported metric includes all validation data.
- **Report the threshold.** The same model scores 84.4% mIoU at the training script's 0.35 mask threshold and 88.5% at 0.5. A single number without its threshold is not comparable.

## Policy pipeline

I designed the control side with the team as a teacher–student scheme:

1. **Privileged experts.** PPO policies trained in Isaac Lab with access to the simulator's ground-truth state.
2. **Imitation learning.** Expert rollouts become demonstrations for a student policy.
3. **Vision-based student.** The deployable policy uses a pretrained DINOv2 visual encoder instead of privileged state.

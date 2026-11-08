---
title: "MimicVLA: Learning Insertion from Phone Videos"
description: >-
  Teaching a simulated Franka Panda to plug in a USB stick from 134 iPhone videos of my
  own hand, by retargeting the motion in MuJoCo and fine-tuning the SmolVLA
  vision-language-action model.
org: Personal research project
date_label: 2026
tech: [SmolVLA, LeRobot, MuJoCo, ArUco tracking, PyTorch, SAC (DSRL)]
category: learning
featured: true
order: 1
thumbnail: /assets/media/mimicvla/unseen_start_222751.gif
media:
  type: video
  src: /assets/media/mimicvla/unseen_start_222751.mp4
  loop: true
  caption: >-
    Left to right: the iPhone recording with marker tracking, the Panda replaying that
    motion in MuJoCo, and the trained policy from the same start pose. This recording was
    never used for training; the policy inserts in 2.7 s (5/5 seeds).
links:
  - label: Code
    url: https://github.com/1clarkj/MimicVLA
  - label: Full results
    url: https://github.com/1clarkj/MimicVLA/blob/main/RESULTS.md
  - label: Dataset
    url: https://huggingface.co/datasets/1clarkj/mimicvla-panda-usb
  - label: Policy
    url: https://huggingface.co/1clarkj/mimicvla-smolvla-usb
---

## Problem and motivation

USB insertion is hard for a robot: the plug must be aligned to within a millimetre, pushed through contact, and corrected when slightly off. A phone video gives none of that directly: no force, no robot state, and a pose estimate noisier than the tolerance. The question was **how far a VLA gets from a small amount of such imperfect human data.**

## Method

1. **Track.** ArUco markers on the plug and next to the port give the plug tip's pose relative to the port in every frame, so the handheld camera's motion cancels. A second plug marker raised tracking coverage from 70% to 90% of frames.
2. **Replay.** The plug-tip trajectory drives the Panda's end effector in MuJoCo through differential IK. Front and wrist cameras, joint states and 6-D Cartesian actions are recorded at 20 Hz.
3. **Select.** Every clip was reviewed next to its replay; 72 episodes pass the replay gate (64 for training, 8 held out).
4. **Train and evaluate.** SmolVLA is fine-tuned on the demonstrations and evaluated closed loop with **5 seeds per start** on **55 start poses no model trained on**, with 95% bootstrap intervals.

The simulated port is widened to 15 × 7 mm because the 1–3 mm tracking error is larger than the real port's 0.7 mm clearance.

## Results

From 64 imperfect demonstrations the policy inserts in **49% [39, 59]** of rollouts from unseen starts and **60% [52, 68]** from its training starts.

| Policy | Training starts | Unseen starts | Deep-collision rollouts |
|---|---|---|---|
| **Raw labels** | 60% [52, 68] | 49% [39, 59] | **4%** |
| Raw labels + recovery data | 55% [48, 61] | 51% [44, 56] | 14% |
| 2 Hz low-pass labels | **82%** [74, 89] | 34% [23, 46] | 61% |
| Low-pass labels + recovery data | 66% [57, 75] | **52%** [43, 62] | 44% |

{% include media.html type="image" src="/assets/media/mimicvla/data_scaling.png" alt="Success rate against number of demonstrations" caption="Data scaling: 16 → 32 → 64 demonstrations gives 16% → 24% → 49% on unseen starts, and the curve has not flattened." %}

## What I learned

- **Data quantity dominates.** Doubling the data from 32 to 64 demonstrations added 25 points; every algorithmic change moved unseen-start success by a few points at most.
- **Noise in human data may be a feature.** Smoothing the tracking jitter made the policy fit its training starts better and generalise worse, and DART-style recovery data brought generalisation back. My hypothesis is that the jitter acts as free recovery data; the direct test was not run.
- **Evaluation decides the conclusion.** A single seed or the 8-clip holdout would have picked the wrong model.
- **Negative results:** RL on the diffusion noise (DSRL) and mirrored demonstrations gave no gain.

{% include media.html type="video" src="/assets/media/mimicvla/unseen_start_222751_lowpass_vs_raw.mp4" caption="Same unseen start: the low-pass policy (bottom left) fails on 0/5 seeds, the raw-label policy (bottom right) inserts on 5/5." %}

## Limitations

Simulation only: no policy ran on hardware, the port is widened, and contact forces (median peaks around 200 N) are too high for a real robot. One person, one port pose.

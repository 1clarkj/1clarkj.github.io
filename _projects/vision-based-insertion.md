---
title: Vision-Based Robotic Insertion
description: >-
  Privileged-state PPO experts trained in Isaac Lab, turned into a deployable
  vision-based insertion policy through imitation learning with a pretrained
  DINOv2 encoder.
org: Intrinsic AI for Industry Challenge
date_label: 2026
tech: [Isaac Lab, PPO, Imitation learning, DINOv2, PyTorch]
featured: true
order: 3
placeholder: Robotic insertion · Isaac Lab
---

## Problem and motivation

Insertion requires precise alignment under contact, and a deployable policy has to work from camera images, not the simulator's ground-truth state.

## Technical approach

1. **Privileged experts.** PPO expert policies trained with deep reinforcement learning in Isaac Lab, with access to privileged simulator state.
2. **Imitation learning.** Expert rollouts were converted into an imitation-learning dataset for a student policy.
3. **Vision-based student.** A pretrained DINOv2 visual encoder was integrated into the deployable, vision-based policy.

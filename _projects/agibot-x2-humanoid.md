---
title: AgiBot X2 Humanoid for Elderly Care
description: >-
  Whole-body motion and person-tracking behaviours on the AgiBot X2 humanoid, enabling
  autonomous following and physical assistance for standing up.
org: RoboHack, EPFL · Lausanne
date_label: May 2026
role: Hackathon team
tech: [ROS 2, YOLOv8, Stereo depth, Whole-body control, AgiBot X2]
featured: true
order: 4
placeholder: Humanoid · person following
links:
  - label: Code
    url: https://github.com/1clarkj/Humanoid_agibot-x2_RoboHack2026
---

## Problem and motivation

Elderly-care assistance: a humanoid that can follow a person and help them stand up. The AgiBot X2's software stack was early-stage, with limited public documentation.

## System

The code is split into two ROS 2 packages:

- **Perception (`robot_vision`).** Real-time stereo person detection with YOLOv8 and per-person stereo depth, publishing the target person's position.
- **Motion (`robot_motion`).** Head tracking toward the target, a locomotion supervisor that walks toward the person and stops at a set distance, and an arm pose triggered on arrival.

## Challenges

Integrating perception with whole-body control on an early-stage stack meant troubleshooting the robot software and iterating on behaviours directly on the physical humanoid.

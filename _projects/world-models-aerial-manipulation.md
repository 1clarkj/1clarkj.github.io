---
title: World Models for Aerial Manipulation
description: >-
  Can an embodiment-agnostic world model plan contact-rich manipulation for an aerial
  manipulator, while the robot's own dynamics decide which plans are feasible?
org: AMR Lab, TU Delft
date_label: 2026 – present
role: MSc thesis
tech: [PyTorch, JEPA world models, CEM planning, MuJoCo, Newton]
featured: true
order: 2
placeholder: Aerial manipulation · world models
links:
  - label: Research direction
    url: /research/
---

## Problem and motivation

Learned manipulation skills are usually tied to the robot they were trained on. Aerial manipulators make this especially hard: the end-effector motion and contact forces affect the flight dynamics, the platform is typically underactuated, and demonstrations are expensive to collect. This project studies the *dynamic feasibility* of embodiment-agnostic world models when they are used for an embodiment-specific robot.

## Technical approach

- **World model.** A JEPA-based world model in PyTorch, trained on robotic interaction data I collect, predicts future latent states from end-effector actions.
- **Planning.** Sampling-based planning (CEM) in the model's latent space against task-specific objectives, with receding-horizon replanning.
- **Feasibility.** Candidate trajectories are checked by a model-based controller for the aerial platform, so that infeasible plans are rejected without retraining the world model.
- **Evaluation.** Reproducible simulation and evaluation pipelines in Newton and MuJoCo to assess model performance, dynamic feasibility and sim-to-real transfer on an aerial manipulator.

The full research plan is on the [Research](/research/) page.

## Status

Ongoing. Results, videos and code will be added here as they become available.

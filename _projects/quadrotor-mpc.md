---
title: Autonomous Quadrotor Navigation with MPC
description: >-
  A constrained Model Predictive Control framework for quadrotor trajectory tracking in
  PyBullet, with an RRT* global planner and a low-level PID attitude controller.
org: TU Delft course project
date_label: 2026
role: Team project
tech: [MPC, CVXPY, OSQP, RRT*, PID, PyBullet, gym-pybullet-drones]
category: learning
featured: true
order: 4
placeholder: Quadrotor · MPC tracking
links:
  - label: Code
    url: https://github.com/1clarkj/Autonomous_Drone_Navigation
---

## Pipeline

RRT\* global planner → MPC local planner → PID attitude controller, in simulation with gym-pybullet-drones.

## Technical approach

- **MPC.** State and input constraints formulated in CVXPY and solved with OSQP for quadrotor trajectory tracking.
- **Low-level control.** The MPC output is tracked by a PID attitude controller.
- **Planning.** Explored real-time replanning and RRT-based obstacle avoidance.

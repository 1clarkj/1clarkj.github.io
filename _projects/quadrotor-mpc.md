---
title: Autonomous Quadrotor Navigation with MPC
description: >-
  An RRT* global planner and a constrained MPC that tracks its path and avoids obstacles the
  global plan did not know about, on a simulated quadrotor in PyBullet.
org: TU Delft · Delft
date_label: 2026
role: Team project
tech: [MPC, CVXPY, OSQP, RRT*, PID, PyBullet, gym-pybullet-drones]
category: learning
featured: true
order: 5
thumbnail: /assets/media/quadrotor/thumb.gif
media:
  type: video
  src: /assets/media/quadrotor/mpc-flight.mp4
  caption: >-
    One flight with five extra obstacles (red) placed on the RRT* path (purple) after it was
    planned. Green: the MPC's current plan. Orange: the path flown.
links:
  - label: Code
    url: https://github.com/1clarkj/Autonomous_Drone_Navigation
---

## Pipeline

RRT\* global planner → MPC local planner → PID attitude controller, simulated with gym-pybullet-drones.

- **Global planning.** RRT\* plans a path from start to goal through the known environment, and the path is smoothed into a reference trajectory.
- **Local planning with MPC.** A constrained MPC (CVXPY, solved with OSQP, 30-step horizon) tracks that reference. Obstacles are sphere keep-out constraints with slack, so the problem stays feasible when the drone is pushed close to one.
- **Low-level control.** A PID attitude controller tracks the MPC's commands.

{% include media.html type="image" src="/assets/media/quadrotor/rrt-star-tree.png" alt="3D plot of the RRT* tree with the final path from start to goal" caption="The RRT* tree and final path for the flight in the video." %}

## Obstacles the global plan did not know about

The red spheres are added on the RRT\* path *after* it has been planned, so the global planner never saw them; only the MPC has to deal with them. In the flight above (five extra obstacles), the drone reaches the goal in 14.6 s of simulated time without a collision, with a mean MPC solve time of 5.2 ms.

That run is one of the good ones, not the typical one. Over 16 seeds with a single extra obstacle, the drone reached the goal in 12 runs, but only 4 of those were free of any contact with an obstacle. Making the avoidance reliable, not just possible, is what this setup would need next.

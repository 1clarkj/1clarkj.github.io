---
title: Real-Time Control Testbed for 6G Networks
description: >-
  A hand-teleoperated ball-balancing table for the 6G-SANDBOX, used to show how network
  latency and where the computation runs affect a control task that needs fine precision.
org: Keysight Technologies · Rotselaar
date_label: 07/2024 – 08/2026
role: Robotics and Real-Time Systems Intern (part-time)
tech: [C++, UDP, Real-time control, Hand tracking, 5G, Edge computing]
category: engineering
featured: false
order: 10
thumbnail: /assets/media/keysight/card.gif
media:
  type: video
  src: /assets/media/keysight/trade-show-demo.mp4
  caption: The testbed at the 6G-SANDBOX booth.
---

## Problem and motivation

When sensing, computation and actuation are spread over a network, every link adds delay, and delay degrades closed-loop control. The testbed makes that effect visible with a task that needs fine control: guiding a ball through a maze on a tilting table, teleoperated by hand.

## System

- **Teleoperation.** The operator steers with their hands: gloves track the hand skeleton, and hand poses become commands for the ball. I implemented the ML-based skeletal hand tracking and the C++ interfaces that turn the raw hardware signals into real-time skeletal data.
- **Control.** The ball-balancing table closes the loop on the ball's position and tracks the operator's commands; the data moves between machines over UDP, and I optimised that pipeline for low latency.
- **Network and compute scenarios.** The same task runs over different links (Ethernet, Wi-Fi and 5G) and with the computation placed in different spots, from local to edge, so its control performance can be compared across network and compute set-ups.

{% include media.html type="image" src="/assets/media/keysight/control-dashboard.png" alt="Maze-control dashboard with the maze, the ball's path, the per-link latency and the controller parameters" caption="The control dashboard I built: the maze with the ball's path, live round-trip latency per link, and the controller settings." %}

## Use

The testbed is used to demonstrate, live, how network and compute choices affect the control of a teleoperated system that spans several machines and depends on fine, responsive control.

---
title: Real-Time Control Testbed for 6G Networks
description: >-
  A ball-balancing robotic control testbed for the 6G-SANDBOX, used to measure how
  network latency affects closed-loop control performance.
org: Keysight Technologies · Rotselaar
date_label: 07/2024 – 08/2026
role: Robotics and Real-Time Systems Intern
tech: [C++, UDP, Real-time control, Hand tracking, Edge computing]
category: engineering
featured: false
order: 10
placeholder: Ball-balancing testbed
---

## Problem and motivation

Networked control is limited by latency: when sensing, computation and actuation are split across a network, delays degrade closed-loop performance. The testbed makes that effect measurable.

## Technical approach

- **Testbed.** A real-time ball-balancing platform for the 6G-SANDBOX, used to evaluate the impact of network latency on closed-loop control.
- **Architecture study.** Edge-computing and network architectures and their effect on control latency, responsiveness and overall system performance.
- **Hand tracking.** ML-based skeletal hand tracking, with C++ interfaces that convert raw hardware signals into usable real-time skeletal data.
- **Low latency.** Optimised the software and communication pipeline, including real-time data transfer over UDP.

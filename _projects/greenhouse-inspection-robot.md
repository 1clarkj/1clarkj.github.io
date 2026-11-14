---
title: Autonomous Greenhouse Inspection Robot
description: >-
  A mobile manipulator that maps a greenhouse, drives between flower beds and scans each
  bed with an arm-mounted camera, reporting where every flower and pest is.
org: MIRTE Master · Delft
date_label: 2026
role: Perception lead, in a team
tech: [ROS 2, YOLOv8, Homography, Nav2, SLAM, MIRTE Master]
category: engineering
featured: true
order: 4
thumbnail: /assets/media/greenhouse-robot/thumb.gif
media:
  type: video
  src: /assets/media/greenhouse-robot/waypoint-navigation.mp4
  caption: >-
    The full pipeline: the robot drives to each flower bed on its saved waypoints and scans
    it with the arm-mounted camera (2× speed).
---

## Problem and motivation

Monitoring crops by hand is slow. The goal was a low-cost robot that builds a map of the greenhouse, drives to each flower bed on its own, and reports which flowers are where and whether pests are present, on the open-source MIRTE Master mobile manipulator.

## System

The robot runs a ROS 2 stack in three stages:

- **Mapping.** The greenhouse is mapped once by teleoperation with `slam_toolbox`, and a waypoint is saved in front of each flower bed.
- **Navigation.** The robot localises on that map with AMCL and drives between the waypoints with Nav2, updating its local costmap to avoid obstacles that are not on the map.
- **Bed scanning.** At each waypoint, a state-machine node runs the multi-step scan through ROS 2 actions and services: it positions the arm, captures images with the close-range camera on the gripper, and hands them to the detector. Keeping this in one node keeps the detector and the GUI decoupled.

{% include media.html type="image" src="/assets/media/greenhouse-robot/map-waypoints.png" alt="Top-down photo of the greenhouse arena and the SLAM occupancy map, with an arrow at each flower bed" caption="The arena from above (left) and the SLAM map of it (right). Arrows mark the scan waypoint at each flower bed." %}

{% include media.html type="video" src="/assets/media/greenhouse-robot/obstacle-avoidance.mp4" caption="Avoiding an obstacle that is not on the map." %}

## Perception

{% include media.html type="video" src="/assets/media/greenhouse-robot/bed-scan.mp4" caption="Scanning one flower bed with the arm-mounted camera." %}

- **Detector.** I fine-tuned a YOLOv8n model for four classes (red, white and pink tulips, and bugs). On the held-out test split (86 images) it reaches **mAP@50 0.92** (mAP@50-95 0.69), with precision 0.91 and recall 0.88, and the F1 score stays above 0.85 over a wide range of confidence thresholds. It runs live on the robot's camera.
- **From detections to a bed map.** A homography projects detections from the left and right views of a bed onto its grid (two rows, thirteen columns), and an outlier filter merges duplicate sightings so a flower seen twice is counted once.

{% include media.html type="image" src="/assets/media/greenhouse-robot/homography-grid.png" alt="YOLO detections in two camera views of a flower bed, and the resulting grid of the bed with each cell coloured by flower type" caption="Detections from two views of one bed (top) projected onto the bed's grid (bottom)." %}

## Results

On eight hand-annotated captures (54 objects), **89%** of detections land in the correct cell or a neighbouring one; exact-cell accuracy is 44%. The errors were traced to the robot's base position relative to the bed rather than to the detector, so for the final demonstration I recalibrated the homography by averaging over a sequence of captures instead of a single image.

<div class="media-row">
{% include media.html type="image" src="/assets/media/greenhouse-robot/confusion-matrix.png" aspect="1.3333" alt="Normalised confusion matrix of the detector on the test split" caption="Normalised confusion matrix on the test split." %}
{% include media.html type="image" src="/assets/media/greenhouse-robot/f1-curve.png" aspect="1.5" alt="F1 score against confidence threshold per class" caption="F1 against confidence threshold; all-class peak 0.90." %}
</div>

## What I learned

Perception is only useful once its output is in a form the rest of the system can act on. Most of the work was not the detector but getting reliable bed positions out of it, and the main error source turned out to be where the robot stood, not what the network saw.

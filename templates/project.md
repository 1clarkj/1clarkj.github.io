---
# Copy this file to _projects/<short-name>.md. The page appears at /projects/<short-name>/.
# Every field and section is optional except title.
title: Project title
description: One or two sentences, shown on the card and under the page title.
org: Lab, company or event
date_label: 2027
role: e.g. MSc thesis, team project
tech: [PyTorch, MuJoCo]
category: learning     # learning | engineering: the section on the Projects page
featured: false        # true = shown in "Selected Projects" on the homepage (keep an even number)
order: 20              # lower numbers come first
thumbnail:             # card image or GIF, e.g. /assets/media/<project>/thumb.gif
placeholder: Short label shown while there is no media
media:                 # big figure at the top of the page (delete the block if none)
  type: video          # image | gif | video | youtube
  src: /assets/media/<project>/demo.mp4   # or the YouTube id for type: youtube
  loop: true           # video only: autoplay silently like a GIF
  caption: What the video shows.
links:
  - label: Code
    url: https://github.com/1clarkj/...
  - label: Paper
    url: https://arxiv.org/abs/...
---

## Problem and motivation

## Technical approach

## System architecture

{% include media.html type="image" src="/assets/media/<project>/architecture.png" caption="System overview." %}

## Experiments and results

Maths: $$x_{t+1} = f(x_t, u_t)$$

## Challenges and lessons learned

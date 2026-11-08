---
title: Research
permalink: /research/
lead: >-
  Robot learning and embodied AI: methods that let robots acquire, adapt and generalise
  complex behaviour, and that can run on real robotic systems.
---

## Current research

### World models for generalisable robotic manipulation
{: .research-title}

<p class="entry__meta">MSc thesis · AMR Lab, TU Delft · 2026 – 2027 · Supervised by Sihao Sun and Javier Alonso-Mora</p>

Robot learning can now produce manipulation skills that generalise across tasks, but transferring them across *embodiments*, to robots with different physical and dynamic constraints, remains hard. My thesis studies whether **embodiment-agnostic world models** can be used to plan for **embodiment-specific robots**, taking an aerial manipulator performing contact-rich manipulation as the case study.

Aerial manipulation is a demanding test: contact and arm motion affect the flight dynamics, the platforms are typically underactuated, and demonstrations are expensive to collect. That makes it a good setting to ask how much manipulation knowledge can be reused across very different robots.

More detail will follow as results are published.

## Related work

- [MimicVLA](/projects/mimicvla/): fine-tuning a vision-language-action model on demonstrations retargeted from phone videos of my own hand.
- [Multi-camera perception for cable insertion](/projects/vision-based-insertion/): segmentation and keypoint model trained for the Intrinsic AI for Industry Challenge.

## Broader interests

- **Deep reinforcement learning:** model-free and model-based RL, policy optimisation, exploration, robust skill acquisition.
- **World models and representation learning:** predictive dynamics, latent representations, generalisation across environments.
- **Generalisable robot learning:** cross-task and cross-embodiment transfer, imitation learning, VLAs, robotic foundation models.
- **Learning-based planning and control:** combining learned policies and predictive models with optimisation and model-based controllers.

{% if site.data.research.publications.size > 0 %}
## Publications

{% include publications.html %}
{% endif %}

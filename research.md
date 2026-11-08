---
title: Research
permalink: /research/
math: true
lead: >-
  Robot learning and embodied AI: methods that let robots acquire, adapt and generalise
  complex behaviour, and that can run on real robotic systems.
---

## Current research

### World models for generalisable robotic manipulation
{: .research-title}

<p class="entry__meta">MSc research assignment &amp; thesis · AMR Lab, TU Delft · 2026 – 2027 · Supervised by Sihao Sun and Javier Alonso-Mora</p>

{% include media.html label="Aerial manipulation · world-model planning" caption="Experiment media will be added as the project progresses." %}

**Motivation.** Robot learning can now produce manipulation skills that generalise across tasks, but transferring them across *embodiments* remains hard, especially when the target robot has different physical and dynamic constraints. Aerial manipulation is a demanding test case:

- **Dynamic constraints.** End-effector motion and contact affect whole-body dynamics, flight stability and control feasibility, and common aerial platforms are underactuated.
- **Data collection.** Aerial manipulation demonstrations are expensive, slow and technically difficult to obtain.
- **Generalisation.** Embodiment-specific training or adaptation limits how much manipulation knowledge can be reused across platforms.

**Objective.** I am investigating whether *embodiment-agnostic* world models can learn transferable representations of manipulation dynamics, so that one model supports planning across robots while each robot's own physical constraints are respected. The experimental setting is contact-rich aerial manipulation, with valve rotation as a representative task.

**Approach.** A hierarchical planner combines an embodiment-agnostic predictive model with embodiment-specific feasibility feedback:

1. **Action-conditioned world models.** JEPA-based predictive models (including LeWorldModel) learn compact latent dynamics. Future latent states are predicted from *end-effector* action sequences rather than embodiment-specific actuator commands. I am comparing visual and state-based observations, including ego-motion and wrist-camera viewpoints.
2. **Sampling-based latent planning.** The Cross-Entropy Method (CEM; MPPI as an alternative) samples and refines end-effector trajectories, rolls them out through the world model, and scores predicted outcomes against a task-specific latent objective, replanning in a receding horizon.
3. **Controller-based physical grounding.** Each candidate trajectory is evaluated by a lower-level geometric controller or nonlinear MPC. The resulting tracking cost, control effort and constraint violations indicate whether the robot can actually execute it. Task and feasibility costs are combined to guide the search over end-effector trajectories $$\tau$$:

   $$J(\tau) = J_{\text{task}}(\tau) + J_{\text{feasibility}}(\tau).$$

   The world model is kept fixed across embodiments and only the dynamics and control component changes, without fine-tuning on aerial demonstrations.

**Open questions.**

- *Representation and transfer:* do latent predictions generalise across tasks and under strong camera ego-motion?
- *Feasibility metrics:* can controller-derived costs separate feasible, marginal and infeasible trajectories cheaply?
- *Multi-rate integration:* how should slow, long-horizon world-model planning interact with fast, short-horizon control?

## Related work

- [MimicVLA](/projects/mimicvla/): fine-tuning a vision-language-action model on demonstrations retargeted from phone videos of my own hand.
- [Vision-based robotic insertion](/projects/vision-based-insertion/): RL experts distilled into a vision-based policy with a DINOv2 encoder.

## Broader interests

- **Deep reinforcement learning:** model-free and model-based RL, policy optimisation, exploration, robust skill acquisition.
- **World models and representation learning:** predictive dynamics, latent representations, generalisation across environments.
- **Generalisable robot learning:** cross-task and cross-embodiment transfer, imitation learning, VLAs, robotic foundation models.
- **Learning-based planning and control:** combining learned policies and predictive models with optimisation and model-based controllers.

{% if site.data.research.publications.size > 0 %}
## Publications

{% include publications.html %}
{% endif %}

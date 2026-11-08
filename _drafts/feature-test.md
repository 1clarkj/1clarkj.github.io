---
title: Feature test (draft, never published)
description: Checks that maths, code, images and video render. Only visible with scripts/serve.sh --drafts.
tags: [test]
---

Inline maths: the Bellman equation $$V^\pi(s) = \mathbb{E}_\pi\left[r_t + \gamma V^\pi(s_{t+1}) \mid s_t = s\right]$$.

Display maths:

$$
\mathcal{L}^{\text{CLIP}}(\theta) = \mathbb{E}_t\left[\min\left(r_t(\theta)\hat{A}_t,\ \operatorname{clip}(r_t(\theta), 1-\epsilon, 1+\epsilon)\hat{A}_t\right)\right]
$$

Python:

```python
import torch

def gae(rewards, values, gamma=0.99, lam=0.95):
    adv, last = torch.zeros_like(rewards), 0.0
    for t in reversed(range(len(rewards))):
        delta = rewards[t] + gamma * values[t + 1] - values[t]
        last = delta + gamma * lam * last
        adv[t] = last
    return adv
```

C++:

```cpp
Eigen::Vector3d pid(const Eigen::Vector3d& e, double dt) {
  integral_ += e * dt;
  return kp_ * e + ki_ * integral_ + kd_ * (e - prev_) / dt;
}
```

Image:

{% include media.html type="image" src="/assets/media/mimicvla/data_scaling.png" caption="A local image." %}

Local MP4:

{% include media.html type="video" src="/assets/media/mimicvla/unseen_start_222751.mp4" caption="A local video with controls." %}

YouTube (any public video id):

{% include media.html type="youtube" src="aircAruvnKk" caption="A YouTube embed." %}

Placeholder:

{% include media.html label="Media coming soon" %}

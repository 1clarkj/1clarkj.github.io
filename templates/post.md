---
# Copy to _posts/YYYY-MM-DD-short-title.md. The date in the filename is the post date.
# While writing, keep it in _drafts/short-title.md and preview with: scripts/serve.sh --drafts
title: Post title
description: One-sentence summary for the blog list and search engines.
tags: [world-models]
---

Write in Markdown.

Inline maths uses double dollars: $$\gamma \in [0, 1)$$. A display equation is $$...$$ on its own lines.

```python
print("code blocks are highlighted")
```

{% include media.html type="image" src="/assets/media/blog/<post>/figure.png" caption="Figure caption." %}
{% include media.html type="video" src="/assets/media/blog/<post>/clip.mp4" %}
{% include media.html type="youtube" src="VIDEO_ID" %}

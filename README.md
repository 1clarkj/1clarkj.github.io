# 1clarkj.github.io

Personal research portfolio of John Douglas Clark, built with Jekyll and hosted on GitHub Pages.

## Preview locally

Needs only Docker.

```bash
scripts/serve.sh            # http://localhost:4000, reloads when you save a file
scripts/serve.sh --drafts   # also shows posts in _drafts/
scripts/build.sh            # one-off build into _site/
```

Restart `serve.sh` after editing `_config.yml`.

## Where everything lives

| To change… | Edit |
|---|---|
| Name, email, GitHub, LinkedIn, CV path, photo | `_config.yml` → `author:` |
| Homepage biography | `_includes/bio.md` |
| News | `_data/news.yml` (newest first) |
| Experience | `_data/experience.yml` |
| Education and achievements | `_data/education.yml` |
| Current research and publications | `_data/research.yml` (homepage) and `research.md` (Research page) |
| Projects | one file per project in `_projects/` |
| Blog posts | `_posts/YYYY-MM-DD-title.md` |
| Navigation | `_data/navigation.yml` |
| Look and feel | `assets/css/main.css` |
| CV | replace `files/clark_research_CV.pdf` (same name, or update `_config.yml`) |
| Profile photo | add `assets/img/profile.jpg` and set `author.photo` in `_config.yml` |

Layouts (`_layouts/`) and components (`_includes/`) never need touching to add content.

## Add a project

1. Copy `templates/project.md` to `_projects/<short-name>.md`.
2. Put media in `assets/media/<short-name>/`.
3. Fill in the front matter; delete sections you have nothing for.
4. `featured: true` puts it on the homepage; `order` sets the position.

Without `thumbnail` or `media` the card and page show a neat placeholder, so a project can go up before its videos exist.

## Add a blog post

The blog is currently **hidden** (no published posts yet). To turn it on with the first post: delete the `published: false` line in `blog.html` and uncomment Blog in `_data/navigation.yml`. The homepage Blog section appears by itself once `_posts/` has a post.


1. Copy `templates/post.md` to `_drafts/<title>.md` and write it; preview with `scripts/serve.sh --drafts`.
2. When ready, move it to `_posts/YYYY-MM-DD-<title>.md`.

The three newest posts appear on the homepage automatically.

## Writing reference

**Maths** (MathJax): use `$$...$$` for both inline and display maths. On its own line it is a display equation.

**Code**: fenced blocks with a language, e.g. ```` ```python ```` or ```` ```cpp ````.

**Media**, in any project or post:

```liquid
{% include media.html type="image"   src="/assets/media/x/fig.png" caption="..." %}
{% include media.html type="gif"     src="/assets/media/x/demo.gif" %}
{% include media.html type="video"   src="/assets/media/x/demo.mp4" caption="..." %}
{% include media.html type="video"   src="/assets/media/x/clip.mp4" loop=true %}  <!-- silent loop, like a GIF -->
{% include media.html type="youtube" src="VIDEO_ID" %}
{% include media.html label="Video coming soon" %}                              <!-- placeholder -->
```

Images and embeds are lazy-loaded. Keep videos short and compressed (H.264 MP4, ideally under ~5 MB).
For a card thumbnail, a short GIF or a JPG works best. To shrink a video:

```bash
ffmpeg -i in.mov -vf "scale=1280:-2" -c:v libx264 -crf 28 -preset slow -an out.mp4
```

`_drafts/feature-test.md` shows every feature; it is never published.

## Deploy

Built and published by GitHub Actions (`.github/workflows/pages.yml`) on every push to `main`.

One-time setup:

1. Create a public GitHub repository named exactly **`1clarkj.github.io`**.
2. Push this folder:
   ```bash
   git remote add origin git@github.com:1clarkj/1clarkj.github.io.git
   git push -u origin main
   ```
3. In the repository: **Settings → Pages → Build and deployment → Source: GitHub Actions**.
4. The site appears at <https://1clarkj.github.io> a minute or two after each push (progress under the **Actions** tab).

## Credits

Layout and styling modelled on [rikiyat.github.io](https://rikiyat.github.io/) (academicpages / Minimal Mistakes, MIT). All code here is written from scratch.

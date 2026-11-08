source "https://rubygems.org"

# Plain Jekyll 4; GitHub Actions builds and deploys it (see .github/workflows/pages.yml).
gem "jekyll", "~> 4.3"
gem "webrick", "~> 1.8"   # needed by `jekyll serve` on Ruby 3

group :jekyll_plugins do
  gem "jekyll-feed"      # RSS feed for the blog
  gem "jekyll-seo-tag"   # <title>, description, Open Graph tags
  gem "jekyll-sitemap"   # sitemap.xml for search engines
end


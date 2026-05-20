# cicd-sensor.github.io

Source for the [cicd-sensor documentation site](https://cicd-sensor.github.io/).

This repository owns the mdbook configuration, theme, and deployment
pipeline. The markdown content itself lives in the
[main repository](https://github.com/cicd-sensor/cicd-sensor) under
`docs/src/` and is pulled in at build time.

## Local development

Clone both repositories as siblings:

```sh
git clone https://github.com/cicd-sensor/cicd-sensor.git
git clone https://github.com/cicd-sensor/cicd-sensor.github.io.git
```

Then from this repository:

```sh
scripts/dev.sh
```

`mdbook serve` opens `http://127.0.0.1:3000` with live reload on changes to:

- `../cicd-sensor/docs/src/` (markdown content from the main repo)
- `./theme/` (site theme owned by this repo)

Override the default sibling path with `SRC=path/to/docs/src scripts/dev.sh`.

## Deployment

Pushes to `main` and `repository_dispatch` events from the main repository
trigger `.github/workflows/deploy.yml`, which checks out both repositories,
runs `mdbook build`, and deploys the rendered book to GitHub Pages.

## Layout

| Path | Owner | Purpose |
| --- | --- | --- |
| `book.toml` | this repo | mdbook configuration |
| `theme/` | this repo | site theme overrides |
| `scripts/dev.sh` | this repo | local live-reload preview |
| `.github/workflows/` | this repo | build and deploy pipeline |
| `build/src/` | generated at build time | markdown copied from the main repo |

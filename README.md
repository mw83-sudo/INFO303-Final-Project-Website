# INFO303-Final-Project-Website

A small static website created for the INFO303 final project. The site is intentionally lightweight and can be served locally or deployed to GitHub Pages or any static hosting provider.

## Features
- Static HTML + assets (images, video, scripts)
- Single-page layout (`index.html`)

## Tech / Tools
- HTML, CSS, JavaScript (vanilla)
- Uses the built-in Python HTTP server for quick local testing

## Run locally
Run a simple static server from the project root:

```bash
python3 -m http.server 8000
```

Then open: http://localhost:8000

## Directory layout
```
index.html
assets/
  docs/        # any documentation files
  images/      # site images (thumbs, micro)
  video/       # source and generated micro videos
scripts/       # utility scripts used in the project
build_micro_video.sh
```

## Deployment
- GitHub Pages: push to the `main` branch (or configure Pages to use `main` / `docs/`) — no build step required for this static site.
- Any static host (Netlify, Vercel, Surge) will work; point the host to the repository root.

## Notes / tips
- Keep assets small for fast load times (optimize images and videos).
- Use the browser devtools to test responsive behavior and debug scripts.

## Credits & license
Add project authorship, collaborators, or a license here if you want to make the repo re-usable. Example: "MIT License — see LICENSE file".

## Contact
If you want changes or have issues, open an issue or contact the maintainer.

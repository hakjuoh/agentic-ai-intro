# Autonomy in AI Agents: Concepts and Practice

A single-file HTML slide deck on how "agent" has been defined, what makes an agent, and how agents are given autonomy, with AgentStudio as a worked example.

**Live deck:** https://hakjuoh.github.io/agentic-ai-intro/

## Slides

1. Title
2. How Definitions Evolved (2023 to 2026)
3. What Makes an Agent (characteristics and building blocks)
4. AgentStudio
5. AgentStudio Built Itself
6. How Agents Are Given Autonomy

## Controls

| Key | Action |
|---|---|
| `Space`, `→`, `↓`, `PageDown` | Next slide |
| `←`, `↑`, `PageUp` | Previous slide |
| `F` | Full screen |
| `N` | Presenter script and notes pad, shown over the slide |
| `S` | Presenter window: script, notes pad, next slide title, timers, Prev/Next |

The URL hash (`#3`) holds the current slide. The theme (Light, Dark, System) and the title-slide sky follow the viewer's settings; `?time=18.5` previews a time of day.

## Presenter scripts and notes

- Each slide's script is an `<aside class="notes">` inside its `<section class="slide">` in `index.html`. Edit the text there.
- Notes typed in the pad are saved per slide in the browser's `localStorage` and can be exported as Markdown. They stay in that browser only.
- The scripts are part of the page source, so they are visible to anyone who opens the public site.

## Run locally

No build step. Open `index.html` in a browser, or serve the folder:

```bash
python3 -m http.server 8000
```

## Hosting

Served by GitHub Pages from the `main` branch.

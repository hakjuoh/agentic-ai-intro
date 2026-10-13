#!/bin/bash
# Build the blog version of the article from main.tex.
#   ./web/build.sh
set -euo pipefail
cd "$(dirname "$0")/.."

pandoc main.tex \
  --from latex --to html5 --standalone \
  --template web/template.html \
  --lua-filter web/filter.lua \
  --citeproc --bibliography references.bib --csl web/author-year.csl \
  --shift-heading-level-by=1 \
  --css style.css \
  -M lang=en \
  -M link-citations=true \
  -M reference-section-title=References \
  -o web/building-an-agent-workflow.html

echo "Wrote web/building-an-agent-workflow.html"

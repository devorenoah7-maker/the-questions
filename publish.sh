#!/bin/bash
# Republish The Questions: copies latest build, commits, pushes -> Pages auto-updates same URL
set -e
SRC="/private/tmp/claude-501/-Users-noahdevore/fd23eaac-e61a-4c3b-a83e-0e0b82cbbb51/scratchpad/thesis2.html"
[ -f "$SRC" ] || SRC="$HOME/Desktop/Orthodoxy_Thesis/The_Questions.html"
cp "$SRC" ~/the-questions/index.html
cd ~/the-questions
git add -A
git -c user.name="Noah DeVore" -c user.email="devorenoah7@gmail.com" commit -q -m "Update The Questions ($(date +%Y-%m-%d\ %H:%M))

Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>" && git push -q origin main && echo "pushed — live in ~1 min at https://devorenoah7-maker.github.io/the-questions/" || echo "no changes to publish"

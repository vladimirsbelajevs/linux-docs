#!/usr/bin/env bash

git add .
git commit -m "Update notes"
git push origin main
mkdocs gh-deploy

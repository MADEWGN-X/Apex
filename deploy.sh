#!/bin/bash
rm menu/menu.zip
zip -r menu/menu.zip menu/menu
git add .
git commit -m update
git push

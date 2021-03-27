#!/usr/bin/env zsh

brew install node nvm

npm install --global pnpm

node_apps=(
	degit
	npx
	speed-test
	spoof
)
pnpm install --global $node_apps

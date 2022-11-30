»s() { pnpm run ${1:-dev} }

# create project
+s() {
	appdir="${1:-sv$(word)}"
	pnpm create svelte@next "$appdir"
	cd $appdir
	pnpm install
	git init
	git add .
	git commit -m "🚀 init $appdir"
}

# svelte-add to project
s+(){ npx svelte-add $@ }

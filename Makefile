all: ready

ready:
	git submodule update --init --recursive
	vim -E -c ':source .vimrc' -c :quit meh || true

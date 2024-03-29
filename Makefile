dep:	install_pygame_sdl2	install_nuikta
	pip3 install -r requirements.txt

run:
	python3 src/main.py

clean:
	rm -rf __pycache__ .idea *.pyc

install_nuikta:
	sudo apt install -y nuitka

install_pygame_sdl2_dep:
	sudo apt update -y
	pip3 install cython

install_pygame_sdl2:	install_pygame_sdl2_dep
	sudo apt install -y python3-pygame-sdl2

exe_win:
	nuitka3 --follow-imports --standalone --remove-output --windows-icon=icon.ico src/main.py
	cp -r resource main.dist
exe_mac: exe
exe_lin: exe
exe:
	nuitka3 --follow-imports --standalone --remove-output --clang src/main.py
	cp -r resource main.dist
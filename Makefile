all: pink.3mf purple.3mf

pink.3mf: cube.scad
	openscad -o pink.3mf --enable lazy-union -D 'part_color="pink"' cube.scad

purple.3mf: cube.scad
	openscad -o purple.3mf --enable lazy-union -D 'part_color="purple"' cube.scad

clean:
	rm -f pink.3mf purple.3mf

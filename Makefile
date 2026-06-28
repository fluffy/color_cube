cube.3mf: cube.scad
	openscad -o cube.3mf cube.scad

clean:
	rm -f cube.3mf

// 8 small cubes (1cm each) arranged in a 2x2x2 checkerboard of pink and purple

size = 10; // 1cm in mm

module small_cube(is_pink) {
    color(is_pink ? "DeepPink" : "Purple")
        cube([size, size, size]);
}

// 2x2x2 checkerboard: adjacent cubes always differ in color
// pink when (x+y+z) is even, purple when odd
for (x = [0:1], y = [0:1], z = [0:1]) {
    translate([x * size, y * size, z * size])
        small_cube((x + y + z) % 2 == 0);
}

// 8 small cubes (1cm each) arranged in a 2x2x2 checkerboard of pink and purple

size = 10; // 1cm in mm
big_size = size * 2; // 20mm overall cube

// Set to "pink", "purple", or "all"
part_color = "all";

module small_cube(is_pink) {
    color(is_pink ? "DeepPink" : "Purple")
        cube([size, size, size]);
}

// Frustum cutter: 16x16 base, 1mm tall, sides sloping in at 15 degrees from horizontal.
// Base (16x16) sits at z=0 centered on origin; tapers inward toward z=2.
module face_cutter() {
    base_size = 16;
    height = 1;
    top_size = base_size - 2 * height / tan(15);
    translate([0, 0, -0.01])
        linear_extrude(height, scale = top_size / base_size)
            square(base_size, center = true);
}

difference() {
    // 2x2x2 checkerboard: adjacent cubes always differ in color
    // pink when (x+y+z) is even, purple when odd
    for (x = [0:1], y = [0:1], z = [0:1]) {
        is_pink = (x + y + z) % 2 == 0;
        if (part_color == "all" || (part_color == "pink" && is_pink) || (part_color == "purple" && !is_pink))
            translate([x * size, y * size, z * size])
                small_cube(is_pink);
    }

    // Remove face_cutter shape from each of the 6 faces
    // Bottom (z=0): cutter points inward (+z)
    translate([big_size/2, big_size/2, 0])
        face_cutter();

    // Top (z=20): cutter points inward (-z)
    translate([big_size/2, big_size/2, big_size])
        rotate([180, 0, 0])
            face_cutter();

    // Front (y=0): cutter points inward (+y)
    translate([big_size/2, 0, big_size/2])
        rotate([-90, 0, 0])
            face_cutter();

    // Back (y=20): cutter points inward (-y)
    translate([big_size/2, big_size, big_size/2])
        rotate([90, 0, 0])
            face_cutter();

    // Left (x=0): cutter points inward (+x)
    translate([0, big_size/2, big_size/2])
        rotate([0, 90, 0])
            face_cutter();

    // Right (x=20): cutter points inward (-x)
    translate([big_size, big_size/2, big_size/2])
        rotate([0, -90, 0])
            face_cutter();
}

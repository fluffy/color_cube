# Agents

## Project Context

This project generates an OpenSCAD model of a large cube assembled from 8 smaller cubes (1cm per side) in a pink/purple checkerboard pattern, split into separate print files by color.

## Key Facts

- Units: millimeters (10mm = 1cm)
- Small cube size: 10mm × 10mm × 10mm
- Overall cube size: 20mm × 20mm × 20mm
- Layout: 2×2×2 grid (8 cubes total)
- Colors: DeepPink and Purple, alternating checkerboard (pink when x+y+z is even)
- Main file: `cube.scad`
- Output files: `pink.3mf`, `purple.3mf` (built via `make`)

## Face Cutters

Each of the 6 faces has a centered pocket subtracted from it:

- Base footprint: 16mm × 16mm at the surface
- Depth: 1mm
- Side slope: 15° from horizontal (tapers inward)
- Implemented as a `linear_extrude` with `scale` to create a frustum, translated -0.01mm to avoid coplanar z-fighting

## Part Filtering

`part_color` variable in `cube.scad` controls which pieces are rendered:

- `"pink"` — only the 4 pink pieces
- `"purple"` — only the 4 purple pieces
- `"all"` — all 8 pieces together

`make` overrides this via `-D 'part_color="pink"'` / `-D 'part_color="purple"'` on the OpenSCAD command line.

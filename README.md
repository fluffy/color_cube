# Cube

An OpenSCAD project that assembles a big cube from 8 small cubes in a 2×2×2 checkerboard pattern of pink and purple. Each face has a chamfered pocket cut into it.

## Layout

8 small cubes (1cm × 1cm × 1cm each) arranged in a 2×2×2 grid, checkerboard pattern:

```
Top layer:        Bottom layer:
[purple] [pink]   [pink  ] [purple]
[pink  ] [purple] [purple] [pink  ]
```

The resulting shape is 2cm × 2cm × 2cm — a true cube.

## Face cutters

Each face has a centered pocket removed — 16mm × 16mm at the surface, tapering inward at 15° over 1mm depth.

## Files

- `cube.scad` — main OpenSCAD model
- `pink.3mf` — pink pieces only (for printing in pink filament)
- `purple.3mf` — purple pieces only (for printing in purple filament)

## Building

```
make
```

Produces `pink.3mf` and `purple.3mf` via OpenSCAD. To build individually:

```
make pink.3mf
make purple.3mf
```

To preview all parts together, open `cube.scad` in OpenSCAD and press F5. Set `part_color` to `"pink"`, `"purple"`, or `"all"` to filter which pieces are shown.

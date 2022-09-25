// include <gridfinity_modules.scad>
use <gridfinity_cup_modules.scad>

// X dimension in grid units
width = 2; // [ 0.5, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13 ]
// Y dimension in grid units
depth = 1; // [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13 ]
// Z dimension (multiples of 7mm)
height = 3;// [2, 3, 4, 5, 6, 7]
// (Zack's design uses magnet diameter of 6.5)
magnet_diameter = 0;  // .1
// (Zack's design uses depth of 6)
screw_depth = 0;
// Hole overhang remedy is active only when both screws and magnets are nonzero (and this option is selected)
hole_overhang_remedy = true;
// Fill in solid block (overrides all following options)
filled_in = false;
// X dimension subdivisions
chambers = 1;
// Include overhang for labeling
withLabel = false;
// Include larger corner fillet
fingerslide = true;
// Width of the label in number of units: positive numbers are measured from the 0 end, negative numbers are measured from the far end, value of zero means full width (as long as withLabel is true)
labelWidth = 0;  // .1
// Minimum thickness above cutouts in base (Zack's design is effectively 1.2)
floor_thickness = 0.7;
// Wall thickness (Zack's design is 0.95)
wall_thickness = 0.95;  // .01
// Efficient floor option saves material and time, but the floor is not smooth (only applies if no magnets, screws, or finger-slide used)
efficient_floor = false;
// When enabled, irregular subdivisions have to be defined in code
irregular_subdivisions = false;

module end_of_customizer_opts() {}

// Separator positions are defined in terms of grid units from the left end
separator_positions = [ 0.25, 0.5, 1.4 ];

if (filled_in) {
  grid_block(width, depth, height, magnet_diameter=magnet_diameter, 
    screw_depth=screw_depth, hole_overhang_remedy=hole_overhang_remedy);
}
else if (irregular_subdivisions) {
  irregular_cup(
    num_x=width,
    num_y=depth,
    num_z=height,
    withLabel=withLabel,
    labelWidth=labelWidth,
    fingerslide=fingerslide,
    magnet_diameter=magnet_diameter,
    screw_depth=screw_depth,
    floor_thickness=floor_thickness,
    wall_thickness=wall_thickness,
    hole_overhang_remedy=hole_overhang_remedy,
    separator_positions=separator_positions
  );
}
else {
  basic_cup(
    num_x=width,
    num_y=depth,
    num_z=height,
    chambers=chambers,
    withLabel=withLabel,
    labelWidth=labelWidth,
    fingerslide=fingerslide,
    magnet_diameter=magnet_diameter,
    screw_depth=screw_depth,
    floor_thickness=floor_thickness,
    wall_thickness=wall_thickness,
    hole_overhang_remedy=hole_overhang_remedy,
    efficient_floor=efficient_floor
  );
}
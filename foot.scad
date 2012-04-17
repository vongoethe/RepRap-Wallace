include <config.scad>;

//feet for printing
for(x = [1, -1]) for(y = [1, -1]) translate([x * (rod_size * 1.5 + 2), y * (rod_size * 1.5 + 2), 0]) foot();

//foot module
module foot() difference() {
	linear_extrude(height = rod_size, convexity = 5) difference() {
		//minkowski() {
		//	square(rod_size + 2, center = true);
		//	circle(rod_size, $fn = 16);
		//}
		translate([1,0,0]) circle(r = 2 * rod_size);
		circle(rod_size / 2, $fn = 12);
	}
	translate([0, 0, -rod_size / 16]) cylinder(r1 = rod_size * 3/4, r2 = rod_size / 4, h = rod_size / 2, $fn = 12);
	translate([0, 0, rod_size / 2 + rod_size / 16]) cylinder(r2 = rod_size * 3/4, r1 = rod_size / 4, h = rod_size / 2, $fn = 12);
	translate([-2 * rod_size,rod_size / 2 + 4,0]) cube([4*rod_size,2 * rod_size,rod_size]);
}


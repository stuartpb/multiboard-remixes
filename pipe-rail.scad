pipe_diam = 40;
thickness = 1.2;

clasp_height = 40;
front_width = 20; //pipe_diam+2*thickness

gap_width = 2;

$fa = 1;

lite = 1;
difference() {
  union() {
    linear_extrude(clasp_height) difference() {
      hull(){
        translate([-front_width/2, -(pipe_diam/2+thickness)])
          square([front_width,pipe_diam/2+thickness]);
        circle(d=pipe_diam+2*thickness);
      }
      circle(d=pipe_diam);
    }
    translate([0,-(pipe_diam/2+thickness+(lite?2:3)),lite?19:18.5]) rotate([90,0,180]) import(lite ? "lite-rail.stl" : "heavy-rail.stl");
  }
  translate([-gap_width/2,-pipe_diam,-1]) cube([gap_width,pipe_diam,clasp_height+2]);
  translate([-10,-(pipe_diam/2+thickness),0]) rotate([90+45,0,0]) cube([20,20,20]);
}
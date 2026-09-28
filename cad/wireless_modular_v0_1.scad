// Modular Wireless Holder V0.1
// Parametric OpenSCAD prototype for:
// - Shure SLXD UniSlot (SLXD1 or SLXD2, one device at a time)
// - MIPRO ACT-5/7 UniSlot
// - Sennheiser EK IEM G4
// - Electronic tag dummy
// - Horizontal dovetail connector
// - Front/rear bridge connector
//
// NOTE: These are TEST FIT parts based on published nominal dimensions.
// Measure real devices before final print.

$fn = 64;

clearance = 0.6;
wall = 3.0;
floor_t = 4.0;
module_w = 52.0;
module_d = 82.0;
module_h = 42.0;
tag_h = 26.0;
tag_d = 9.0;

rail_h = 18.0;
rail_depth = 5.0;
rail_taper = 2.0;

bridge_socket_w = 12.0;
bridge_socket_h = 7.0;
bridge_socket_d = 10.0;

module dovetail_male(len=rail_h){
    linear_extrude(height=len)
        polygon(points=[
            [0,0],
            [rail_depth,rail_taper],
            [rail_depth,10-rail_taper],
            [0,10]
        ]);
}

module dovetail_female(len=rail_h){
    translate([-0.01,0,0])
    linear_extrude(height=len)
        polygon(points=[
            [0,-0.3],
            [rail_depth+0.6,rail_taper-0.2],
            [rail_depth+0.6,10-rail_taper+0.2],
            [0,10.3]
        ]);
}

module tag_bay(){
    difference(){
        cube([module_w, tag_d+wall*2, tag_h+wall], center=false);
        translate([wall,wall,wall])
            cube([module_w-2*wall, tag_d, tag_h], center=false);
    }
}

module base_shell(){
    difference(){
        union(){
            cube([module_w,module_d,floor_t], center=false);
            cube([wall,module_d,module_h], center=false);
            translate([module_w-wall,0,0])
                cube([wall,module_d,module_h], center=false);
            translate([0,-(tag_d+wall*2),0]) tag_bay();

            translate([-rail_depth, module_d/2-5, floor_t+6])
                rotate([0,90,0]) dovetail_male(rail_h);
        }

        translate([module_w-wall-0.01, module_d/2-5, floor_t+6])
            rotate([0,90,0]) dovetail_female(rail_h);

        for (yy=[8,module_d-8-bridge_socket_d])
            translate([module_w/2-bridge_socket_w/2,yy,0])
                cube([bridge_socket_w,bridge_socket_d,bridge_socket_h], center=false);
    }
}

module rear_bridge(){
    union(){
        cube([bridge_socket_w-0.4,28,bridge_socket_h-0.4], center=false);
        translate([-4,10,0]) cube([bridge_socket_w+8,8,bridge_socket_h-0.4], center=false);
    }
}

module endcap_left(){
    difference(){
        cube([10,module_d,module_h], center=false);
        translate([10-wall, module_d/2-5, floor_t+6])
            rotate([0,90,0]) dovetail_female(rail_h);
    }
}

module endcap_right(){
    union(){
        cube([10,module_d,module_h], center=false);
        translate([-rail_depth, module_d/2-5, floor_t+6])
            rotate([0,90,0]) dovetail_male(rail_h);
    }
}

// Shure published nominal:
// SLXD1 = 98 x 68 x 25.5 mm
// SLXD2 = 37.1 mm dia x 176 mm
// IMPORTANT: one device at a time.
module shure_unislot(){
    difference(){
        base_shell();

        translate([module_w/2, module_d/2+6, module_h-4])
            rotate([90,0,0])
            cylinder(h=module_d-16, d=39.0+clearance, center=true);

        translate([module_w/2-(39+clearance)/2,12,floor_t])
            cube([39+clearance,module_d-24,module_h+20], center=false);

        translate([(module_w-(25.5+clearance))/2,20,floor_t+5])
            cube([25.5+clearance,50,30], center=false);
    }

    shelf_w = 8;
    translate([wall,24,floor_t+8])
        cube([shelf_w,45,18], center=false);
    translate([module_w-wall-shelf_w,24,floor_t+8])
        cube([shelf_w,45,18], center=false);
}

// MIPRO ACT-700 published nominal:
// handheld = 51 mm dia x 272 mm
// bodypack = 63 x 80 x 25 mm
// ACT-5/7 real units still need verification.
// IMPORTANT: one device at a time.
module mipro_unislot(){
    difference(){
        base_shell();

        translate([module_w/2, module_d/2+6, module_h-3])
            rotate([90,0,0])
            cylinder(h=module_d-16, d=52.5+clearance, center=true);

        translate([module_w/2-(52.5+clearance)/2,10,floor_t])
            cube([52.5+clearance,module_d-20,module_h+22], center=false);

        translate([(module_w-(25+clearance))/2,18,floor_t+5])
            cube([25+clearance,54,30], center=false);
    }

    shelf_w = 8;
    translate([wall,22,floor_t+8])
        cube([shelf_w,48,18], center=false);
    translate([module_w-wall-shelf_w,22,floor_t+8])
        cube([shelf_w,48,18], center=false);
}

// Sennheiser EK IEM G4 published approx 82 x 64 x 24 mm.
module g4_slot(){
    difference(){
        base_shell();

        translate([(module_w-(24+clearance))/2,15,floor_t+4])
            cube([24+clearance,56,module_h+8], center=false);
    }

    lip = 6;
    translate([wall,18,floor_t+5])
        cube([lip,50,20], center=false);
    translate([module_w-wall-lip,18,floor_t+5])
        cube([lip,50,20], center=false);
}

module tag_dummy(){
    difference(){
        cube([module_w-4, tag_d, tag_h-4], center=false);
        translate([2,2,2])
            cube([module_w-8, tag_d, tag_h-8], center=false);
    }
}

part = "shure"; // shure, mipro, g4, bridge, tag, leftcap, rightcap

if (part=="shure") shure_unislot();
if (part=="mipro") mipro_unislot();
if (part=="g4") g4_slot();
if (part=="bridge") rear_bridge();
if (part=="tag") tag_dummy();
if (part=="leftcap") endcap_left();
if (part=="rightcap") endcap_right();

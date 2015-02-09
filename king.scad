head_height=25;
head_mid_dia=10;
head_bot_dia=5;
head_top_dia=head_mid_dia/3;

cross_size=(head_height+head_mid_dia)/3*2;

body_top_dia=head_bot_dia;
body_bot_dia=15;
body_height=50;

foot_height = 10;
foot_bot_dia= 17.5;
foot_mid_dia=14;
foot_top_dia=body_bot_dia;
foot_factor=1.5;

R=0; //0=cross, 1=crown
	n=8; //number of crownthingies

x=3;
	dif= [0, 8, 15];
	size=[20, 25, 22];



cylinder(h=(foot_height/foot_factor),r1=foot_bot_dia,r2=foot_mid_dia);

translate([0,0,(foot_height/foot_factor)])
	cylinder(h=foot_height-(foot_height/foot_factor), r1=foot_mid_dia, r2=foot_top_dia);


translate([0,0,foot_height])
	cylinder(h=body_height, r1=body_bot_dia, r2=body_top_dia);

translate([0,0,body_height+foot_height])
	cylinder(h=head_height-(head_top_dia), r1 =body_top_dia, r2 =head_mid_dia);
translate([0,0,(head_height-(head_top_dia)+body_height+foot_height)])
	cylinder(h=3,r1=head_mid_dia,r2=head_bot_dia);



if (R==0){// option between cross and crown
translate([0,0,(head_height+body_height+foot_height)])
	cube([3,3,cross_size], center=true);
translate([0,0,head_height+(cross_size/4)+body_height+foot_height])
	cube([cross_size/2,3,3], center=true);
}	//add crown

translate([0,0,(head_height+body_height+foot_height-3)])
if (R==1){
	difference(){	
		cylinder(h=5, r1=head_mid_dia, r2=head_mid_dia);
		translate([0,0,(2)])
		cylinder(h=3, r1=head_mid_dia/1.8, r2=head_mid_dia/1.8);
	}
		translate([0,0,5])
		for(i=[0:(n-1)]){	
				rotate((360/n*i))	
					translate([((head_mid_dia/1.8) + head_mid_dia)/2,0,0])
    				sphere(r = 2);
	}
}

for(i=[0:x-1]){
	translate([0,0,body_height+foot_height-(dif[i])])
		resize(newsize=[size[i],size[i],5])
			sphere($fs =0.01);

}
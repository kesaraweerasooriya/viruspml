// This file has been autogenerated using CoD4X 1.8 server. //
// If it contains wrong data, please create issue here:     //
//    https://github.com/callofduty4x/CoD4x_Server/issues   //
init(){a="promod/destructible.csv";level.de=[];for(i=0;i<8;i++)level.de[tablelookup(a,0,i,1)]=LoadFX(tablelookup(a,0,i,2));level.do=[];for(i=8;i<22;i++)level.do[tablelookup(a,0,i,1)]=1;a=getentarray("destructible","targetname");for(i=0;i<a.size;i++)a[i]thread a();}a(){self endon("explosion");a=self.destructible_type;precachemodel(a+"_destroyed");precachemodel(a+"_mirror_R");precachemodel(a+"_mirror_L");a=self.model;b=getnumparts(a);while(b){b--;c=getpartname(a,b);if(isdefined(c)&&getsubstr(c,c.size-2)=="_d")self hidepart(c);}self setcandamage(1);self.dT=0;self.dO=undefined;c=1;d=1;self thread f();for(;;){self waittill("damage",e,f,i,g,h,j,k,l);if(isdefined(e)&&isdefined(l)&&l!="left_wheel_01_jnt"&&l!="right_wheel_01_jnt"&&l!="left_wheel_02_jnt"&&l!="right_wheel_02_jnt"){if(isdefined(level.do[l]))self b(l);else if(h!="MOD_MELEE"&&h!="MOD_IMPACT"){if(h=="MOD_GRENADE"||h=="MOD_GRENADE_SPLASH"||h=="MOD_PROJECTILE"||h=="MOD_PROJECTILE_SPLASH"||h=="MOD_EXPLOSIVE"){k=getnumparts(a);m=undefined;n=distance(g,self.origin);for(i=0;i<k;i++){o=getpartname(a,i);p=distance(g,self gettagorigin(o));if(p<=256&&isdefined(level.do[o]))self b(o);if(!isdefined(m)||p<m)m=p;if((isSubStr(o,"tag_hood")||isSubStr(o,"tag_trunk")||isSubStr(o,"tag_door_")||isSubStr(o,"tag_bumper_"))&&p<n)n=p;}if(!isdefined(m))m=n;e=int(11*e-5.6*n+4*m);}if(e>0){self.dO=f;self.dT+=e;}}}if(self.dT>250&&c){c=0;self thread d();}if(self.dT>550&&d){d=0;self thread e();}}}b(a){switch(a){case"tag_glass_left_front":case"tag_glass_right_front":case"tag_glass_left_back":case"tag_glass_right_back":case"tag_glass_front":case"tag_glass_back":case"tag_glass_left_back2":case"tag_glass_right_back2":self playsound("veh_glass_break_large");b="medium";if(strtok(a,"_").size==3)b="large";playfxontag(level.de["car_glass_"+b],self,a+"_fx");self hidepart(a);break;case"tag_light_left_front":case"tag_light_right_front":case"tag_light_left_back":case"tag_light_right_back":self playsound("veh_glass_break_small");playfxontag(level.de["light_"+strtok(a,"_")[3]],self,a);self hidepart(a);self showpart(a+"_d");break;case"tag_mirror_left":case"tag_mirror_right":self hidepart(a);b=spawn("script_model",self gettagorigin(a));b.angles=self gettagangles(a);s="R";if(getsubstr(a,11,12)=="l")s="L";b setmodel(self.destructible_type+"_mirror_"+s);b physicslaunch(self gettagorigin(a),vectornormalize(self gettagorigin(a))*200);b thread c();break;}}c(){wait 5;self delete();}d(){self endon("explosion");for(a="white_smoke";;){if(self.dT>550)a="black_smoke_fire";else if(self.dT>450)a="black_smoke";playfxontag(level.de[a],self,"tag_hood_fx");wait.4;}}e(){self endon("explosion");self playsound("fire_vehicle_flareup_med");self playloopsound("fire_vehicle_med");for(;self.dT<1250;wait.2)self.dT+=12;}f(){while(self.dT<1250)wait.05;self stoploopsound("fire_vehicle_med");self notify("explosion");self playsound("car_explode");playfxontag(level.de["small_vehicle_explosion"],self,"tag_death_fx");a=self.origin+(0,0,80);b=250;if(getsubstr(self.destructible_type,0,19)=="vehicle_80s_sedan1_")b=375;if(isdefined(self.dO))self radiusdamage(a,b,300,20,self.dO);else self radiusdamage(a,b,300,20);self movez(16,.3,0,.2);self rotatepitch(10,.3,0,.2);self setmodel(self.destructible_type+"_destroyed");wait.3;self movez(-16,.3,.15,0);self rotatepitch(-10,.3,.15,0);}
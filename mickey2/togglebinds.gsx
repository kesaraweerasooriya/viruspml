// This file has been autogenerated using CoD4X 1.8 server. //
// If it contains wrong data, please create issue here:     //
//    https://github.com/callofduty4x/CoD4x_Server/issues   //
//  ________/\\\\\\\\\__________________________________________________________        
//   _____/\\\////////___________________________________________________________       
//    ___/\\\/_________________________________________________________/\\\__/\\\_      
//     __/\\\______________/\\/\\\\\\\___/\\\\\\\\\_____/\\\\\\\\\\\___\//\\\/\\\__     
//      _\/\\\_____________\/\\\/////\\\_\////////\\\___\///////\\\/_____\//\\\\\___    
//       _\//\\\____________\/\\\___\///____/\\\\\\\\\\_______/\\\/________\//\\\____   
//        __\///\\\__________\/\\\__________/\\\/////\\\_____/\\\/_______/\\_/\\\_____  
//         ____\////\\\\\\\\\_\/\\\_________\//\\\\\\\\/\\__/\\\\\\\\\\\_\//\\\\/______ 
//          _______\/////////__\///___________\////////\//__\///////////___\////________
init( modVersion )
{
	level.fullbrightkey = "8";
	level.fovkey = "9";
	
	thread onPlayerConnected();
	thread onPlayerSpawn();
}
 
onPlayerConnected()
{
	for(;;)
	{
		level waittill("connected",player);
		
		if(!isDefined(player.pers["fov"]))
			player.pers["fov"] = player getstat(1322);
		if(!isDefined(player.pers["fullbright"]))
			player.pers["fullbright"] = player getstat(1222);
		
		player thread blindkeys();
		player thread ToggleBinds();
		player thread Nodify();
	}
}
onPlayerSpawn()
{
	self endon("disconnect");
	
	for(;;)
	{
		level waittill( "player_spawn", player );
		if(player.pers["fullbright"] == 1)
			player setClientDvar( "r_fullbright", 1 );
			
		if(player.pers["fov"] == 1)
			player setClientDvar( "cg_fovscale", 1.25 );
		if(player.pers["fov"] == 2)
			player setClientDvar( "cg_fovscale", 1.125 );
		if(player.pers["fov"] == 3)
			player setClientDvar( "cg_fovscale", 1.250 );
		if(player.pers["fov"] == 4)
			player setClientDvar( "cg_fovscale", 1.500 );
		if(player.pers["fov"] == 5)
			player setClientDvar( "cg_fovscale", 2 );
	}
}
blindkeys()
{
	wait 1;
	self clientCmd("bind "+level.fullbrightkey +" openscriptmenu -1 fps");
	wait 1;
	self clientCmd("bind "+level.fovkey +" openscriptmenu -1 fov");
}
Nodify()
{
	self endon("disconnect");
	for(;;)
	{
		wait RandomInt(60)+50;
		self iPrintln("Press ^5"+level.fovkey +"^7 To Toggle FieldOfView");
		wait 1;
		self iPrintln("Press ^5"+level.fullbrightkey+"^7 To Toggle Fullbright");
	}
}
ToggleBinds()
{
	self endon("disconnect");
	
	for(;;)
	{
		self waittill("menuresponse", menu, response);
		if(response == "fps")
		{
			if(self.pers["fullbright"] == 0)
			{
				self iPrintln( "You Turned Fullbright ^7[^5ON^7]" );
				self setClientDvar( "r_fullbright", 1 );
				self setstat(1222,1);
				self.pers["fullbright"] = 1;
			}
			else if(self.pers["fullbright"] == 1)
			{
				self iPrintln( "You Turned Fullbright ^7[^5OFF^7]" );
				self setClientDvar( "r_fullbright", 0 );
				self setstat(1222,0);
				self.pers["fullbright"] = 0;
			}
		}
		if(response == "fov")
		{
			if(self.pers["fov"] == 0 )
			{
				self iPrintln( "You Changed FieldOfView To ^7[^51.25^7]" );
				self setClientDvar( "cg_fovscale", 1.25 );
				self setstat(1322,1);
				self.pers["fov"] = 1;
			}
			else if(self.pers["fov"] == 1)
			{
				self iPrintln( "You Changed FieldOfView To ^7[^51.125^7]" );
				self setClientDvar( "cg_fovscale", 1.125 );
				self setstat(1322,2);
				self.pers["fov"] = 2;

			}
			else if(self.pers["fov"] == 2)
			{
				self iPrintln( "You Changed FieldOfView To ^7[^51.250^7]" );
				self setClientDvar( "cg_fovscale", 1.250 );
				self setstat(1322,3);
				self.pers["fov"] = 3;
			}
			else if(self.pers["fov"] == 3)
			{
				self iPrintln( "You Changed FieldOfView To ^7[^51.500^7]" );
				self setClientDvar( "cg_fovscale", 1.500 );
				self setstat(1322,4);
				self.pers["fov"] = 4;
			}
			else if(self.pers["fov"] == 4)
			{
				self iPrintln( "You Changed FieldOfView To ^7[^52^7]" );
				self setClientDvar( "cg_fovscale", 2 );
				self setstat(1322,5);
				self.pers["fov"] = 5;
			}
			else if(self.pers["fov"] == 5)
			{
				self iPrintln( "You Changed FieldOfView To ^7[^51^7]" );
				self setClientDvar( "cg_fovscale", 1 );
				self setstat(1322,1);
				self.pers["fov"] = 1;
			}
		}
	}
}

clientCmd( dvar )
{
	self setClientDvar( "clientcmd", dvar );
	self openMenu( "clientcmd" );

	if( isDefined( self ) ) //for "disconnect", "reconnect", "quit", "cp" and etc..
		self closeMenu( "clientcmd" );	
}

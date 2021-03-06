// This file has been autogenerated using CoD4X 1.8 server. //
// If it contains wrong data, please create issue here:     //
//    https://github.com/callofduty4x/CoD4x_Server/issues   //
init()
{
	level thread onPlayerConnect();
}

onPlayerConnect()
{
	for( ;; )
	{
		level waittill( "connecting", player );

		if( isdefined( player.pers["player_welcomed"] ) )
			return;
		player.pers["player_welcomed"] = true;

		player thread onSpawnPlayer();
		
	}
}

onSpawnPlayer()
{
	self endon ( "disconnect" );
	self waittill( "spawned_player" );
	self playLocalSound("ui_mp_suitcasebomb_timer");
	clantext("^5 V I R U S ^7G A M I N G ^5P R O M O D");
	self playLocalSound("ui_mp_suitcasebomb_timer");
	presentstext("^5 W W W.^7V I R U S G A M I N G^5.X Y Z");
	self playLocalSound("ui_mp_suitcasebomb_timer");
	rotutext("^5S E A R C H ^7& ^7D E S T R O Y ");
	self playLocalSound("ui_mp_suitcasebomb_timer");
	funtext("^5H A V E   ^7F U N");
	
	checkvip();
		self.msgactive = 1;
		self thread madebyduff( 800, 1, -1, "^0..::^5Welcome^7 " + self.name + " ^5From^7 " + self getgeolocation (2) + "^0::.." );
		self thread madebyduff( 800, 1, 1, "^0..::^5Welcome^7 " + self.name + " ^5From^7 " + self getgeolocation (2) + "^0::.." );
		//self playSound("exp_suitcase_bomb_main");
}

madebyduff( start_offset, movetime, mult, text )
{
	self endon ( "disconnect" );
	start_offset *= mult;
	hud = schnitzel( "center", 0.1, start_offset, -130 );
	hud setText( text );
	hud moveOverTime( movetime );
	hud.x = 0;
	wait( movetime );
	wait( 3 );
	self.msgactive = 0;
	hud moveOverTime( movetime );
	hud.x = start_offset * -1;
	wait movetime;
	hud destroy();
}

schnitzel( align, fade_in_time, x_off, y_off )
{
	hud = newClientHudElem(self);
    hud.foreground = true;
	hud.x = x_off;
	hud.y = y_off;
	hud.alignX = align;
	hud.alignY = "middle";
	hud.horzAlign = align;
	hud.vertAlign = "middle";
 	hud.fontScale = 2;
	hud.color = (1, 1, 1);
	hud.font = "objective";
	hud.glowColor = ( 0.2, 0.3, 0.7 );
	hud.glowAlpha = 1;
	hud.alpha = 1;
	hud fadeovertime( fade_in_time );
	hud.alpha = 1;
	hud.hidewheninmenu = false;
	hud.sort = 10;
	return hud;
}

clantext(msg)
{
	logoText = newClientHudElem(self);
	//logoText.x = 60;
	logoText.y = 270;
	logoText.alignX = "center";
	logoText.alignY = "middle";
	logoText.horzAlign = "center";
	logoText.vertAlign = "top";
	logoText.alpha = 0;
	logoText.sort = -3;
	logoText.fontScale = 2;
	logoText.archieved = true;
	logoText.color = (1.0, 1.0, 1.0);
	//logoText setPoint( "TOP", "BOTTOM", 0, 20 );
	logoText.font = "objective";
	logoText.glowColor = (0.2, 0.3, 0.7);
	logoText.glowAlpha = 1;
	logoText fadeOverTime(1);
	logoText.alpha = 1;
	logoText setText(msg);
	
	wait 1;
	logoText fadeOverTime(9);
	logoText.alpha = 0;
}

presentstext(msg)
{
	logoText = newClientHudElem(self);
	//logoText.x = 80;
	logoText.y = 290;
	logoText.alignX = "center";
	logoText.alignY = "middle";
	logoText.horzAlign = "center";
	logoText.vertAlign = "top";
	logoText.alpha = 0;
	logoText.sort = -3;
	logoText.fontScale = 2;
	logoText.archieved = true;
	logoText.color = (1.0, 1.0, 1.0);
	//logoText setPoint( "TOP", "BOTTOM", 0, 20 );
	logoText.font = "objective";
	logoText.glowColor = (0.2, 0.3, 0.7);
	logoText.glowAlpha = 1;
	logoText fadeOverTime(1);
	logoText.alpha = 1;
	logoText setText(msg);

	wait 1;
	logoText fadeOverTime(7);
	logoText.alpha = 0;
}

rotutext(msg)
{
	logoText = newClientHudElem(self);
	//logoText.x = 100;
	logoText.y = 310;
	logoText.alignX = "center";
	logoText.alignY = "middle";
	logoText.horzAlign = "center";
	logoText.vertAlign = "top";
	logoText.alpha = 0;
	logoText.sort = -3;
	logoText.fontScale = 2;
	logoText.archieved = true;
	logoText.color = (1.0, 1.0, 1.0);
	//logoText setPoint( "TOP", "BOTTOM", 0, 20 );
	logoText.font = "objective";
	logoText.glowColor = (0.2, 0.3, 0.7);
	logoText.glowAlpha = 1;
	logoText fadeOverTime(1);
	logoText.alpha = 1;
	logoText setText(msg);

	wait 1;
	logoText fadeOverTime(5);
	logoText.alpha = 0;
}

funtext(msg)
{
	logoText = newClientHudElem(self);
	//logoText.x = 100;
	logoText.y = 330;
	logoText.alignX = "center";
	logoText.alignY = "middle";
	logoText.horzAlign = "center";
	logoText.vertAlign = "top";
	logoText.alpha = 0;
	logoText.sort = -3;
	logoText.fontScale = 2;
	logoText.archieved = true;
	logoText.color = (1.0, 1.0, 1.0);
	//logoText setPoint( "TOP", "BOTTOM", 0, 20 );
	logoText.font = "objective";
	logoText.glowColor = (0.2, 0.3, 0.7);
	logoText.glowAlpha = 1;
	logoText fadeOverTime(1);
	logoText.alpha = 1;
	logoText setText(msg);

	wait 1;
	logoText fadeOverTime(3);
	logoText.alpha = 0;
}
checkvip()
{
		if(self getGuid() == "myguid"){

		}
}

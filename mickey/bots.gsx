// This file has been autogenerated using CoD4X 1.8 server. //
// If it contains wrong data, please create issue here:     //
//    https://github.com/callofduty4x/CoD4x_Server/issues   //
init()
{
	setDvar( "scr_testclients", 0 );
	wait 5;

	for(;;)
	{
		if(getDvarInt("scr_testclients") > 0)
			break;
		wait 1;
	}

	testclients = getdvarInt("scr_testclients");
	setDvar( "scr_testclients", 0 );
	for(i = 0; i < testclients; i++)
	{
		ent[i] = addTestClient();	
			
		while(! isDefined(ent[i]))
		wait 0.05;
		ent[i].pers["isBot"] = true;
		ent[i] thread TestClient("autoassign");
	}
	
	thread init();
}

TestClient(team)
{
	self endon( "disconnect" );

	while(!isdefined(self.pers["team"]))
		wait .05;

	self notify("menuresponse", game["menu_team"], team);
	wait 0.5;
	self notify("menuresponse", game["menu_changeclass_allies"], "assault");
	wait 0.5;
	self notify("menuresponse", game["menu_changeclass"] , "go");
			
	self waittill( "spawned_player" );
	wait ( 0.10 );
}
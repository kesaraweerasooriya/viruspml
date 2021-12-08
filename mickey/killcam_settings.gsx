// This file has been autogenerated using CoD4X 1.8 server. //
// If it contains wrong data, please create issue here:     //
//    https://github.com/callofduty4x/CoD4x_Server/issues   //
#include mickey\utility;
init()
{
	setArchive( true );

	thread mickey\events::addDeathEvent( ::onPlayerKilled );
}

onPlayerKilled( eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration )
{
	if( sMeansOfDeath == "MOD_FALLING" || sMeansOfDeath == "MOD_SUICIDE" )
		return;
	
	//iprintlnbold( "Attacker: " + attacker.name + " sMeansOfDeath: " + sMeansOfDeath + " Weapon: " + sWeapon );
	
	team = attacker.team;
	
	if( isDefined( attacker ) && self != attacker && isDefined( team ) )
	{
		level.caminfo[ team ][ "attackerNum" ] = attacker getEntityNumber();
		level.caminfo[ team ][ "time" ] = getTime();
		level.caminfo[ team ][ "victim" ] = self;
		level.caminfo[ team ][ "sWeapon" ] = sWeapon;
		level.caminfo[ team ][ "predelay" ] = 4;
		level.caminfo[ team ][ "psOffsetTime" ] = psOffsetTime;

		if( isDefined( eInflictor ) && eInflictor != self && eInflictor != attacker )
			level.caminfo[ team ][ "killcamentity" ] = eInflictor getEntityNumber();
		else
			level.caminfo[ team ][ "killcamentity" ] = -1;
			
		level.caminfo[ team ][ "attacker" ] = attacker;		
	}
	
	level thread specCheck( self.team );
	self thread kcEnd();
}

kcEnd()
{
	self endon( "disconnect" );
	level endon( "game_ended" );
	
	self waittill( "end_killcam" );
	wait .5;
	
	if( isDefined( level.everyoneIsDead ) )
	{
		self allowSpectateTeam("allies", true);
		self allowSpectateTeam("axis", true);
	}
}

specCheck( team )
{
	level notify( "specThreadEnd" );
	level endon( "specThreadEnd" );
	level endon( "game_ended" );
	
	num = 0;
	
	for(i=0;i<level.players.size;i++)
	{	
		player = level.players[ i ];
		
		if( player.team == team )
		{
			if( player isReallyAlive() )
			{
				num++;
				break;
			}
		}
		waittillframeend;
	}
	
	if( num == 0 )
	{
		for(i=0;i<level.players.size;i++)
		{
			player = level.players[ i ];
			player allowSpectateTeam("allies", true);
			player allowSpectateTeam("axis", true);
		}
		waittillframeend;
		level.everyoneIsDead = true;
	}
}
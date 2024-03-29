#include <a_samp>
#include <Pawn.CMD>
#include <sscanf2>

main()
	{}

/* -------------------------------------------------------------------------- */

public OnGameModeInit()
{
	SetGameModeText(!"Blank Script");
	DisableInteriorEnterExits();
	EnableStuntBonusForAll(0);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetSpawnInfo(playerid, 0, random(311), -2073.2422, 264.8374, 35.4231, 0.4546, 0, 0, 0, 0, 0, 0);
	SpawnPlayer(playerid);
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	SetPlayerPos(playerid, fX, fY, fZ);
	return 1;
}

/* -------------------------------------------------------------------------- */

COMMAND:skin(playerid, params[])
{
	if(sscanf(params, "d", params[0]))
	{
	    SendClientMessage(playerid, 0xFFFFFFFF, !"/setskin <skinid>");
	    return 1;
	}
	if(params[0] < 1 || params[0] > 311)
	    return 1;

	SetPlayerSkin(playerid, params[0]);
	return 1;
}

COMMAND:vehicle(playerid, params[])
{
	if(sscanf(params, "d", params[0]))
	{
        SendClientMessage(playerid, 0xFFFFFFFF, !"/vehicle <vehicleid>");
	    return 1;
	}
	if(params[0] < 400 || params[0] > 611)
	    return 1;
	    
	new Float:fX, Float:fY, Float:fZ, Float:fAngle;
	GetPlayerPos(playerid, fX, fY, fZ);
	GetPlayerFacingAngle(playerid, fAngle);
	
	CreateVehicle(params[0], fX, fY, fZ, fAngle, 1, 1, 300);
    return 1;
}

COMMAND:teleport(playerid, params[])
{
	if(sscanf(params, "d", params[0]))
	{
	    SendClientMessage(playerid, 0xFFFFFFFF, !"/teleport <playerid>");
	    return 1;
	}
	
	new Float:fX, Float:fY, Float:fZ, fVirtualWorld, fInterior;
	GetPlayerPos(params[0], fX, fY, fZ);
	fVirtualWorld = GetPlayerVirtualWorld(params[0]);
	fInterior = GetPlayerInterior(params[0]);
	
	SetPlayerVirtualWorld(playerid, fVirtualWorld);
	SetPlayerInterior(playerid, fInterior);
	SetPlayerPos(playerid, fX + 1, fY + 1, fZ + 1);
    return 1;
}

COMMAND:weapon(playerid, params[])
{
	if(sscanf(params, "d", params[0]))
	{
	    SendClientMessage(playerid, 0xFFFFFFFF, !"/weapon <weaponid>");
	    return 1;
	}
	if(params[0] < 1 || params[1] > 46)
	    return 1;
	    
	GivePlayerWeapon(playerid, params[0], 99999);
	return 1;
}

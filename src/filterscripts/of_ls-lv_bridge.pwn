/*
 *  Arquivo:				of_ls-lv_bridge.pwn
 *  Tipo:					Filterscript para adicionar uma ponte entre a igreja Epsilon de Las Venturas e Montgomery (Los Santos)
 *  Autor:					Vico
 *  Licença:				MIT
*/

/* ------------------------------- DEFINIÇÕES -------------------------------- */
#define FILTERSCRIPT								// Cabeçalho do FilterScript
#define	FS_NAME "Ponte LV-LS"						// Nome do FilterScript

/* ------------------------------- BIBLIOTECAS ------------------------------- */
#include <a_samp>									// Biblioteca padrão

/* ---------------------------- VARIÁVEIS GLOBAIS ---------------------------- */
new bridge_objects[9];								// Array pra armazenar as IDs dos objetos da ponte

/* -------------------------------- EVENTOS ---------------------------------- */

public OnFilterScriptInit()
{
	// Cria a ponte e armazena as IDs no array
	bridge_objects[0] = CreateObject(16357, 1446.78418, 563.39001, 13.65500,   0.00000, 3.00000, 90.00000);
	bridge_objects[1] = CreateObject(18797, 1443.10437, 465.32639, 18.50210,   0.00000, 0.00000, 259.34329);
	bridge_objects[2] = CreateObject(18796, 1433.98462, 446.64139, 18.72400,   0.00000, 2.50000, 64.84190);
	bridge_objects[3] = CreateObject(3331, 1438.66162, 563.28949, 23.39820,   -2.62000, 0.00000, 359.62189);
	bridge_objects[4] = CreateObject(3330, 1446.78809, 563.35822, 3.28630,   0.00000, 0.00000, 0.00000);
	bridge_objects[5] = CreateObject(19425, 1429.28284, 426.42148, 19.11620,   0.00000, 0.00000, 334.85236);
	bridge_objects[6] = CreateObject(19425, 1426.28284, 427.82672, 19.11620,   0.00000, 0.00000, 334.85236);
	bridge_objects[7] = CreateObject(19425, 1423.29321, 429.24155, 19.11620,   0.00000, 0.00000, 334.85236);
	bridge_objects[8] = CreateObject(19425, 1421.46545, 430.12415, 19.11620,   0.00000, 0.00000, 334.85236);

	// Confirma que foi iniciado com sucesso
	printf("FS \"%s\" iniciado com sucesso!", FS_NAME);
	return 1;
}

public OnFilterScriptExit()
{
	// Destrói os objetos da ponte armazenados no array
	for (new i = 0; i < sizeof(bridge_objects); i++)
	{
		if (IsValidObject(bridge_objects[i])) DestroyObject(bridge_objects[i]);
	}
	
	// Confirma que foi encerrado com sucesso
	printf("FS \"%s\" encerrado com sucesso!", FS_NAME);
	
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
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
	if (strcmp("/mycommand", cmdtext, true, 10) == 0)
	{
		// Do something here
		return 1;
	}
	return 0;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnObjectMoved(objectid)
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
	return 0;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

public OnEnterExitModShop(playerid, enterexit, interiorid)
{
	return 1;
}

public OnIncomingConnection(playerid, ip_address[], port)
{
	return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	return 1;
}

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY,
	Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
	return 1;
}


public OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ,
	Float:fRotX, Float:fRotY, Float:fRotZ)
{
	return 1;
}


public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
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

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
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

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}


public OnPlayerSelectObject(playerid, type, objectid, modelid, Float:fX, Float:fY, Float:fZ)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	return 1;
}


public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	return 1;
}

public OnTrailerUpdate(playerid, vehicleid)
{
	return 1;
}

public OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat, Float:new_x, Float:new_y, Float:new_z, Float:vel_x, Float:vel_y, Float:vel_z)
{
	return 1;
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
	return 1;
}

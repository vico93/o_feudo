/*
 *  Arquivo:				of_realtime.pwn
 *  Tipo:					Filterscript para adicionar tempo real no servidor
 *  Autor:					Vico
 *  Licença:				MIT
*/

/* ------------------------------- DEFINIÇÕES -------------------------------- */
#define FILTERSCRIPT								// Cabeçalho do FilterScript
#define	FS_NAME "Hora Real"							// Nome do FilterScript

/* ------------------------------- BIBLIOTECAS ------------------------------- */
#include <a_samp>									// Biblioteca padrão

/* ---------------------------- VARIÁVEIS GLOBAIS ---------------------------- */
new Text:clock_hud;									// Textdraw do relógio

/* -------------------------------- EVENTOS ---------------------------------- */
//
// Inicialização do filterscript
//
public OnFilterScriptInit()
{
	// Cria a textdraw do relógio
	clock_hud = TextDrawCreate(600.000000, 17.000000, "00:00");
	TextDrawFont(clock_hud, 3);
	TextDrawLetterSize(clock_hud, 0.370833, 1.850000);
	TextDrawTextSize(clock_hud, 310.000000, 267.500000);
	TextDrawSetOutline(clock_hud, 2);
	TextDrawSetShadow(clock_hud, 0);
	TextDrawAlignment(clock_hud, 2);
	TextDrawColor(clock_hud, -1);
	TextDrawBackgroundColor(clock_hud, 255);
	TextDrawBoxColor(clock_hud, 50);
	TextDrawUseBox(clock_hud, 0);
	TextDrawSetProportional(clock_hud, 1);
	TextDrawSetSelectable(clock_hud, 0);
	
	// Confirma que foi iniciado com sucesso
	printf("FS \"%s\" iniciado com sucesso!", FS_NAME);
	return 1;
}

public OnFilterScriptExit()
{
	// Destrói a textdraw do relógio
	TextDrawDestroy(clock_hud);
	
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

//
// Quando o jogador é "spawnado" no mundo
//
public OnPlayerSpawn(playerid)
{
	// Mostra (novamente) a textdraw do relógio ao spawnar
	TextDrawShowForPlayer(playerid, clock_hud);
	
	return 1;
}

//
// Quando o jogador morre
//
public OnPlayerDeath(playerid, killerid, reason)
{
	// Oculta temporariamente a textdraw do relógio
	TextDrawHideForPlayer(playerid, clock_hud);
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

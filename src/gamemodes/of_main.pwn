/*
 *  Arquivo:				of_main.pwn
 *  Tipo:					Gamemode 4Fun
 *  Autor:					Vico
 *  Licença:				MIT
 *  Versão:					0.1b
*/

/* ------------------------------- BIBLIOTECAS ------------------------------- */
#include "../includes/of_utils.inc"						// Biblioteca do projeto

/* ------------------------------- DEFINIÇÕES -------------------------------- */
#define	GM_NAME "O Feudo (4Fun) 0.1b"					// Nome do GameMode

/* ---------------------------- VARIÁVEIS GLOBAIS ---------------------------- */

/* ----------------------------- MÉTODO PRINCIPAL ---------------------------- */
main()
{
	// Mensagem após todo o total carregamento do sistema
    print("Feito! Servidor funcional!");
}

/* -------------------------------- EVENTOS ---------------------------------- */
//
// Ao iniciar o gamemode
//
public OnGameModeInit()
{
	// Define o nome do gamemode
	SetGameModeText(GM_NAME);
	
	// Deshabilita os ENEXs (cones amarelos para acesso aos interiores)
	DisableInteriorEnterExits();
	
	// Inicializa as classes de skins no gamemode
	inicializar_skins();
	
	// Confirma que foi iniciado com sucesso
	printf("\"%s\" iniciado com sucesso!", GM_NAME);
	
	return 1;
}

//
// Ao encerrar o gamemode
//
public OnGameModeExit()
{
	// Confirma que foi encerrado com sucesso
	printf("\"%s\" encerrado com sucesso!", GM_NAME);
	return 1;
}

//
// Quando o jogador alterna entre as classes na tela de spawn
//
public OnPlayerRequestClass(playerid, classid)
{
	// Inicializa posições e interior da tela de escolha de skins
	inicializar_skins2(playerid);
	
	return 1;
}

//
// Quando o jogador se conecta ao servidor
//
public OnPlayerConnect(playerid)
{
	return 1;
}

//
// Quando o jogador desconecta do servidor
//
public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

//
// Quando o jogador é "spawnado" no mundo
//
public OnPlayerSpawn(playerid)
{
	// LOCAL: GROVE STREET (um pouco mais à frente da porta da casa do CJ)
	SetPlayerPos(playerid, 2495.3767, -1687.6876, 13.5162);
	SetPlayerFacingAngle(playerid, 7.3733);
	SetPlayerInterior(playerid, 0);
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

//
// Quando o jogador faz um comando
//
public OnPlayerCommandText(playerid, cmdtext[])
{
	dcmd(help, 4, cmdtext);					// Ajuda
	SendClientMessage(playerid, 0xFF5555FF, "Comando desconhecido. Digite /help para ver a lista de comandos");
	return 1;
}
/* ------------------------------- COMANDOS ------------------------------- */
//
// Comando de ajuda
//
dcmd_help(playerid, params[]) // just change "kill" to whatever you put for the first parameter in the onplayercommandtext bit
{
	// Caso não vá utilizar argumentos...
	#pragma unused params
	
	// Envia a tabela de comandos
	SendClientMessage(playerid, 0x00AA00FF, "--- Mostrando página de ajuda 1 de 1 (/help <página>) ---");
	SendClientMessage(playerid, -1, "/help [página/nome do comando]");
	SendClientMessage(playerid, 0x00AA00FF, "---------------------------------------------------------");
    return 1;
}
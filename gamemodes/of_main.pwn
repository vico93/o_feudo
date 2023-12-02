/*
 *  Arquivo:				of_main.pwn
 *  Tipo:					Gamemode 4Fun
 *  Autor:					Vico
 *  Licença:				MIT
 *  Versão:					0.1b
*/

/* ------------------------------- BIBLIOTECAS ------------------------------- */
#include "../includes/of_i_base.inc"					// Biblioteca principal do GameMode
#include "../includes/of_i_colors.inc"					// Biblioteca de cores

/* ------------------------------- DEFINIÇÕES -------------------------------- */
#pragma warning disable 239								// TODO: Retirar essa desativação assim que souber como contornar
#define	GM_NAME "O Feudo (4Fun) 0.1b"					// Nome do GameMode

/* ---------------------------- VARIÁVEIS GLOBAIS ---------------------------- */

/* ----------------------------- MÉTODO PRINCIPAL ---------------------------- */
main()
{
	// Mensagem após todo o total carregamento do sistema
    print("Feito! Servidor funcional!");
}

/* -------------------------------- EVENTOS ---------------------------------- */
/* Ao iniciar o gamemode */
public OnGameModeInit()
{
	// Define o nome do gamemode
	SetGameModeText(GM_NAME);
	
	// Registra as classes (skins) "escolhíveis" no gamemode
	RegisterSkins();
	
	// Confirma que foi iniciado com sucesso
	printf("\"%s\" iniciado com sucesso!", GM_NAME);
	return 1;
}

/* Ao encerrar o gamemode */
public OnGameModeExit()
{
	// Confirma que foi encerrado com sucesso
	printf("\"%s\" encerrado com sucesso!", GM_NAME);
	return 1;
}

//
// Quando o jogador se conecta ao servidor
//
public OnPlayerConnect(playerid)
{
	// Informa no chat a entrada do jogador
	new join_msg[MAX_TEXT_OUTPUT];
	format(join_msg, sizeof(join_msg), "%s entrou na partida", GetPlayerNameRet(playerid));
	SendClientMessageToAll(MC_YELLOW, join_msg);

	// Informa no killfeed a entrada do jogador
	SendDeathMessage(INVALID_PLAYER_ID, playerid, 200);	

	return 1;
}

//
// Quando o jogador desconecta do servidor
//
public OnPlayerDisconnect(playerid, reason)
{
	// Informa no chat a saída do jogador
	new left_msg[MAX_TEXT_OUTPUT];
	format(left_msg, sizeof(left_msg), "%s saiu da partida", GetPlayerNameRet(playerid));
	SendClientMessageToAll(MC_YELLOW, left_msg);
	
	// Informa no killfeed a saída do jogador
	SendDeathMessage(INVALID_PLAYER_ID, playerid, 201);
	
	return 1;
}

//
// Quando o jogador alterna entre as skins/classes na tela de spawn
//
public OnPlayerRequestClass(playerid, classid)
{
	// Inicializa posições e interior da tela de escolha de skins (LOCAL: ARMÁRIO DO CJ - interior 14)
	PositionPlayerSpawn(playerid);
	
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
	SetPlayerWeather(playerid, GetWeather());
	SetCameraBehindPlayer(playerid);
	return 1;
}

//
// Quando o jogador morre
//
public OnPlayerDeath(playerid, killerid, WEAPON:reason)
{
	// Mostra o acontecido no killfeed
	SendDeathMessage(killerid, playerid, reason);
	
	// Envia o anúncio da morte para o chat
	SendDeathToChat(playerid, killerid, reason, MC_RED);
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

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, KEY:newkeys, KEY:oldkeys)
{
	return 1;
}

public OnPlayerStateChange(playerid, PLAYER_STATE:newstate, PLAYER_STATE:oldstate)
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

public OnPlayerGiveDamageActor(playerid, damaged_actorid, Float:amount, WEAPON:weaponid, bodypart)
{
	return 1;
}

public OnActorStreamIn(actorid, forplayerid)
{
	return 1;
}

public OnActorStreamOut(actorid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerEnterGangZone(playerid, zoneid)
{
	return 1;
}

public OnPlayerLeaveGangZone(playerid, zoneid)
{
	return 1;
}

public OnPlayerEnterPlayerGangZone(playerid, zoneid)
{
	return 1;
}

public OnPlayerLeavePlayerGangZone(playerid, zoneid)
{
	return 1;
}

public OnPlayerClickGangZone(playerid, zoneid)
{
	return 1;
}

public OnPlayerClickPlayerGangZone(playerid, zoneid)
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

public OnClientCheckResponse(playerid, actionid, memaddr, retndata)
{
	return 1;
}

//
// Acionado durante qualquer tentativa de login via RCON
//
public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerFinishedDownloading(playerid, virtualworld)
{
	return 1;
}

public OnPlayerRequestDownload(playerid, DOWNLOAD_REQUEST:type, crc)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 0;
}

public OnPlayerSelectObject(playerid, SELECT_OBJECT:type, objectid, modelid, Float:fX, Float:fY, Float:fZ)
{
	return 1;
}

public OnPlayerEditObject(playerid, playerobject, objectid, EDIT_RESPONSE:response, Float:fX, Float:fY, Float:fZ, Float:rotationX, Float:rotationY, Float:rotationZ)
{
	return 1;
}

public OnPlayerEditAttachedObject(playerid, EDIT_RESPONSE:response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ)
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

public OnPlayerPickUpPlayerPickup(playerid, pickupid)
{
	return 1;
}

public OnPickupStreamIn(pickupid, playerid)
{
	return 1;
}

public OnPickupStreamOut(pickupid, playerid)
{
	return 1;
}

public OnPlayerPickupStreamIn(pickupid, playerid)
{
	return 1;
}

public OnPlayerPickupStreamOut(pickupid, playerid)
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

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, WEAPON:weaponid, bodypart)
{
	return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float:amount, WEAPON:weaponid, bodypart)
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, CLICK_SOURCE:source)
{
	return 1;
}

public OnPlayerWeaponShot(playerid, WEAPON:weaponid, BULLET_HIT_TYPE:hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	return 1;
}

public OnScriptCash(playerid, amount, source)
{
	return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	return 1;
}

public OnIncomingConnection(playerid, ip_address[], port)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	return 1;
}

public OnTrailerUpdate(playerid, vehicleid)
{
	return 1;
}

public OnVehicleSirenStateChange(playerid, vehicleid, newstate)
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

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnEnterExitModShop(playerid, enterexit, interiorid)
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

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
	return 1;
}

public OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat, Float:new_x, Float:new_y, Float:new_z, Float:vel_x, Float:vel_y, Float:vel_z)
{
	return 1;
}

//
// Quando o jogador envia um comando
//
public OnPlayerCommandText(playerid, cmdtext[])
{
	dcmd(help, 4, cmdtext);					// Ajuda

	return 0;
}

/* ------------------------------- COMANDOS ------------------------------- */
//
// Comando de ajuda
//
dcmd_help(playerid, params[])
{
	// Caso não vá utilizar argumentos...
	#pragma unused params
	
	// Envia a tabela de comandos
	SendClientMessage(playerid, MC_DARK_GREEN, "--- Mostrando página de ajuda 1 de 1 (/help <página>) ---");
	SendClientMessage(playerid, MC_WHITE, "/help [página/nome do comando]");
	SendClientMessage(playerid, MC_DARK_GREEN, "---------------------------------------------------------");
    return 1;
}
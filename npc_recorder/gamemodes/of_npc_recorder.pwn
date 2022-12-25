/*
 *  Arquivo:				of_npc_recorder.pwn
 *  Tipo:					Gamemode para gravação de NPCs
 *  Autor:					Vico
 *  Licença:				MIT
 *  Versão:					0.1b
*/

/* ------------------------------- BIBLIOTECAS ------------------------------- */
#include <a_samp>											// Biblioteca padrão
#include "../includes/sscanf.inc"							// Biblioteca sscanf

/* ------------------------------- DEFINIÇÕES -------------------------------- */
#pragma warning disable 239									// Pra parar de encher o saco com o warning 239
#define	GM_NAME "Gravador de NPCs - O Feudo"				// Nome do GameMode
#define MAX_STRING 1024										// Tamanho máximo de string
#define MAX_TEXT_OUTPUT 144									// Tamanho máximo de string em SendClientMessage

// DCMD
#define dcmd(%1,%2,%3) if ((strcmp((%3)[1], #%1, true, (%2)) == 0) && ((((%3)[(%2) + 1] == 0) && (dcmd_%1(playerid, "")))||(((%3)[(%2) + 1] == 32) && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1

// RGBA para Inteiro (para usar cores)
#define RGBAToInt(%0,%1,%2,%3) ((16777216 * (%0)) + (65536 * (%1)) + (256 * (%2)) + (%3))

// LISTA DE CORES PARA MENSAGENS (inspirado no Minecraft)
#define MC_BLACK					RGBAToInt(0, 0, 0, 255)
#define MC_DARK_BLUE				RGBAToInt(0, 0, 170, 255)
#define MC_DARK_GREEN				RGBAToInt(0, 170, 0, 255)
#define MC_DARK_AQUA				RGBAToInt(0, 170, 170, 255)
#define MC_DARK_RED					RGBAToInt(170, 0, 0, 255)
#define MC_DARK_PURPLE				RGBAToInt(170, 0, 170, 255)
#define MC_GOLD						RGBAToInt(255, 170, 0, 255)
#define MC_GRAY						RGBAToInt(170, 170, 170, 255)
#define MC_DARK_GRAY				RGBAToInt(85, 85, 85, 255)
#define MC_BLUE						RGBAToInt(85, 85, 255, 255)
#define MC_GREEN					RGBAToInt(85, 255, 85, 255)
#define MC_AQUA						RGBAToInt(85, 255, 255, 255)
#define MC_RED						RGBAToInt(255, 85, 85, 255)
#define MC_LIGHT_PURPLE				RGBAToInt(255, 85, 255, 255)
#define MC_YELLOW					RGBAToInt(255, 255, 85, 255)
#define MC_WHITE					RGBAToInt(255, 255, 255, 255)
#define MC_MINECOIN_GOLD			RGBAToInt(221, 214, 5, 255)

// Checks whether a string is null (empty). More efficient than checking if strlen is 0.
#if !defined isnull
    #define isnull(%1) ((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif

/* ---------------------------- VARIÁVEIS GLOBAIS ---------------------------- */
new scriptname[64];						// Nome do arquivo de NPCmode à ser salvo
new bool:is_recording = false;			// Se está ou não gravando

/* -------------------------------- FUNÇÕES ---------------------------------- */
stock GetPlayerNameEx(playerid)
{
	new playername[MAX_PLAYER_NAME + 1];
	GetPlayerName(playerid, playername, sizeof(playername));
	
	return playername;
}

/* ----------------------------- MÉTODO PRINCIPAL ---------------------------- */
main()
{
	// Mensagem após todo o total carregamento do sistema
    print("Feito! Servidor funcional!");
}

/* -------------------------------- EVENTOS ---------------------------------- */
public OnGameModeInit()
{
	// Define o nome do gamemode
	SetGameModeText(GM_NAME);
	
	// Adiciona só o CJ mesmo
	AddPlayerClass(0, 259.104156, -41.613594, 1002.023437, 99.760757, 0, 0, 0, 0, 0, 0);
	
	// Confirma que foi iniciado com sucesso
	printf("\"%s\" iniciado com sucesso!", GM_NAME);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	// LOCAL: ARMÁRIO DO CJ (Interior 14)
	SetPlayerInterior(playerid, 14);
	SetPlayerPos(playerid, 259.104156, -41.613594, 1002.023437);
	SetPlayerFacingAngle(playerid, 99.760757);
	SetPlayerCameraLookAt(playerid, 259.104156, -41.613594, 1002.023437);
	SetPlayerCameraPos(playerid, 259.104156 + (5 * floatsin(-99.760757, degrees)), -41.613594 + (5 * floatcos(-99.760757, degrees)), 1002.023437);
	
	return 1;
}

public OnPlayerConnect(playerid)
{
	// Informa no chat a entrada do jogador
	new join_msg[MAX_TEXT_OUTPUT];
	format(join_msg, sizeof(join_msg), "%s entrou na partida", GetPlayerNameEx(playerid));
	SendClientMessageToAll(MC_YELLOW, join_msg);
	
	// Informa no killfeed a entrada do jogador
	SendDeathMessage(INVALID_PLAYER_ID, playerid, 200);
	
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	// Informa no chat a saída do jogador
	new left_msg[MAX_TEXT_OUTPUT];
	format(left_msg, sizeof(left_msg), "%s saiu da partida", GetPlayerNameEx(playerid));
	SendClientMessageToAll(MC_YELLOW, left_msg);
	
	// Informa no killfeed a saída do jogador
	SendDeathMessage(INVALID_PLAYER_ID, playerid, 201);
	
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	// LOCAL: GROVE STREET (um pouco mais à frente da porta da casa do CJ)
	SetPlayerPos(playerid, 2495.3767, -1687.6876, 13.5162);
	SetPlayerFacingAngle(playerid, 7.3733);
	SetPlayerInterior(playerid, 0);
	SetCameraBehindPlayer(playerid);
	
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

// Caso o jogador interaja com o teclado...
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	// Por enquanto gravações apenas em veículos...
	if (IsPlayerAdmin(playerid) && IsPlayerInAnyVehicle(playerid))
	{
		// Saída para o usuário
		new stdout[MAX_TEXT_OUTPUT];
		
		// Caso tenha apertado a tecla Y
		if ((newkeys & KEY_YES) && !(oldkeys & KEY_YES))
		{
			// Se ainda não está gravando...
			if (!is_recording && !isnull(scriptname))
			{
				StartRecordingPlayerData(playerid, PLAYER_RECORDING_TYPE_DRIVER, scriptname);
				is_recording = true;
				format(stdout, sizeof(stdout), "Gravação de NPC iniciada! Arquivo -> scriptfiles/%s.rec", scriptname);
				SendClientMessage(playerid, MC_GOLD, stdout);
				PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
			}
			else
			{
				SendClientMessage(playerid, MC_RED, "Gravação já está em andamento, ou o arquivo da gravação não foi definido com /setscriptname!");
			}
		}
		
		// Caso tenha apertado a tecla N
		if ((newkeys & KEY_NO) && !(oldkeys & KEY_NO))
		{
			// Verifica se está gravando
			if (is_recording)
			{
				StopRecordingPlayerData(playerid);
				is_recording = false;
				format(stdout, sizeof(stdout), "Gravação de NPC encerrada! Deve ter sido salvo em -> scriptfiles/%s.rec", scriptname);
				SendClientMessage(playerid, MC_GOLD, stdout);
				PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
				scriptname = "";
			}
			else
			{
				SendClientMessage(playerid, MC_RED, "Gravação não foi iniciada, ou está pausada!");
			}
		}
	}
	
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

public OnActorStreamIn(actorid, forplayerid)
{
	return 1;
}

public OnActorStreamOut(actorid, forplayerid)
{
	return 1;
}

public OnPlayerFinishedDownloading(playerid, virtualworld)
{
	return 1;
}

public OnPlayerGiveDamageActor(playerid, damaged_actorid, Float: amount, weaponid, bodypart)
{
	return 1;
}

public OnVehicleSirenStateChange(playerid, vehicleid, newstate)
{
	return 1;
}

//
// Quando o jogador faz um comando
//
public OnPlayerCommandText(playerid, cmdtext[])
{
	dcmd(help, 4, cmdtext);					// Ajuda
	dcmd(v, 1, cmdtext);					// Spawnar veículo
	dcmd(bmx, 3, cmdtext);					// Spawnar Bicicleta
	dcmd(bus, 3, cmdtext);					// Spawnar Ônibus
	dcmd(coach, 5, cmdtext);				// Spawnar Coach
	dcmd(camper, 6, cmdtext);				// Spawnar Kombi
	
	dcmd(setscriptname, 13, cmdtext);		// Definir o nome da gravação à ser feita
	
	// Caso digite um comando inexistente...
	SendClientMessage(playerid, MC_RED, "Comando desconhecido. Digite /help para ver a lista de comandos");
	return 1;
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
	SendClientMessage(playerid, MC_DARK_GREEN, "--- Mostrando página de ajuda ---");
	SendClientMessage(playerid, MC_WHITE, "/help");
	SendClientMessage(playerid, MC_WHITE, "/v - Spawnar qualquer veículo");
	SendClientMessage(playerid, MC_WHITE, "/bmx - Spawnar Bicicleta");
	SendClientMessage(playerid, MC_WHITE, "/bus - Spawnar Ônibus");
	SendClientMessage(playerid, MC_WHITE, "/coach - Spawnar Coach");
	SendClientMessage(playerid, MC_WHITE, "/camper - Spawnar Kombi");
	SendClientMessage(playerid, MC_WHITE, "/setscriptname - Definir o nome do arquivo .rec da gravação atual");
	SendClientMessage(playerid, MC_DARK_GREEN, "---------------------------------------------------------");
    return 1;
}

// Spawnar qualquer veículo
dcmd_v(playerid, params[])
{
	new modelid;
	
	// Verifica se foi passado um modelo válido no argumento
	if (!sscanf(params, "i", modelid))
	{
		// Caso não tenha sido
		if (modelid < 400 || modelid > 611)
		{
			SendClientMessage(playerid, MC_RED, "ID inválida!");
		}
		// Caso tenha sido
		else
		{
			// Pega as coordenadas do jogador
			new Float:x, Float:y, Float:z, Float:a;
			GetPlayerPos(playerid, x, y, z);
			GetPlayerFacingAngle(playerid, a);
			
			// Cria o veículo na posição do jogador
			CreateVehicle(modelid, x, y, z, a, random(128), random(128), 60);
		}
	}
	else
	{
		// Avisa que o comando está errado
		SendClientMessage(playerid, MC_RED, "Uso: /v <id de veículo>");
	}
	
	return 1;
}

dcmd_bmx(playerid, params[])
{
	#pragma unused params
	// Pega as coordenadas do jogador
	new Float:x, Float:y, Float:z, Float:a;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);
	
	// Cria o veículo na posição do jogador
	CreateVehicle(481, x, y, z, a, random(128), random(128), 60);
	
	return 1;
}

dcmd_bus(playerid, params[])
{
	#pragma unused params
	// Pega as coordenadas do jogador
	new Float:x, Float:y, Float:z, Float:a;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);
	
	// Cria o veículo na posição do jogador
	CreateVehicle(431, x, y, z, a, random(128), random(128), 60);
	
	return 1;
}

dcmd_coach(playerid, params[])
{
	#pragma unused params
	// Pega as coordenadas do jogador
	new Float:x, Float:y, Float:z, Float:a;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);
	
	// Cria o veículo na posição do jogador
	CreateVehicle(437, x, y, z, a, random(128), random(128), 60);
	
	return 1;
}

dcmd_camper(playerid, params[])
{
	#pragma unused params
	// Pega as coordenadas do jogador
	new Float:x, Float:y, Float:z, Float:a;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);
	
	// Cria o veículo na posição do jogador
	CreateVehicle(483, x, y, z, a, random(128), random(128), 60);
	
	return 1;
}

dcmd_setscriptname(playerid, params[])
{
	if (!sscanf(params, "s", scriptname))
	{
		new stdout[MAX_TEXT_OUTPUT];
		format(stdout, sizeof(stdout), "Gravações de NPC serão salvas com o nome %s.rec", scriptname);
		SendClientMessage(playerid, MC_YELLOW, stdout);
	}
	else
	{
		// Avisa que o comando está errado
		SendClientMessage(playerid, MC_RED, "Uso: /setscriptname <nome do arquivo sem a extensão .rec>");
	}
	
	return 1;
}
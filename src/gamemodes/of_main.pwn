/*
 *  Arquivo:				of_main.pwn
 *  Tipo:					Gamemode 4Fun
 *  Autor:					Vico
 *  Licença:				MIT
 *  Versão:					0.1b
*/

/* ------------------------------- BIBLIOTECAS ------------------------------- */
#include "../includes/of_utils.inc"						// Biblioteca do projeto
#include "../includes/of_colors.inc"					// Biblioteca de cores
#include "../includes/of_playerdata.inc"				// Biblioteca de banco de dados

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
	
	// Inicializa o banco de dados
	InitDatabase();
	
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
	// Encerra o acesso ao banco de dados
	CloseDatabase();
	
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
	// Informa no chat a entrada do jogador
	new join_msg[MAX_TEXT_OUTPUT];
	format(join_msg, sizeof(join_msg), "%s entrou na partida", GetPlayerNameEx(playerid));
	SendClientMessageToAll(MC_YELLOW, join_msg);
	
	// Informa no killfeed a entrada do jogador
	SendDeathMessage(INVALID_PLAYER_ID, playerid, 200);
	
	// TEMPORÁRIO: Verifica se o jogador tem o nick "Vico". Se fez, automaticamente dá o nível de permissão 4 para ele.
    if (!strcmp(GetPlayerNameEx(playerid), "Vico", true))
    {
        SetPVarInt(playerid, "perm_level", 4);
		print("Admin entrou");
    }
	else
	{
		SetPVarInt(playerid, "perm_level", 0);
		print("Player entrou");
	}

	return 1;
}

//
// Quando o jogador desconecta do servidor
//
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

//
// Quando o jogador é "spawnado" no mundo
//
public OnPlayerSpawn(playerid)
{
	// LOCAL: GROVE STREET (um pouco mais à frente da porta da casa do CJ)
	SetPlayerPos(playerid, 2495.3767, -1687.6876, 13.5162);
	SetPlayerFacingAngle(playerid, 7.3733);
	SetPlayerInterior(playerid, 0);
	SetCameraBehindPlayer(playerid);
	
	return 1;
}

//
// Quando o jogador morre
//
public OnPlayerDeath(playerid, killerid, reason)
{
	// Mostra o acontecido no killfeed
	SendDeathMessage(killerid, playerid, reason);
	
	// Envia o anúncio da morte para o chat
	SendDeathToChat(playerid, killerid, reason, MC_RED);
	
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

//
// Acionado durante qualquer tentativa de login via RCON
//
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
	dcmd(kill, 4, cmdtext);					// Matar (ou morrer)
	dcmd(level, 5, cmdtext);				// Checar nível (debug?)
	dcmd(tp, 2, cmdtext);					// Comando de teleporte
	
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
	SendClientMessage(playerid, MC_DARK_GREEN, "--- Mostrando página de ajuda 1 de 1 (/help <página>) ---");
	SendClientMessage(playerid, MC_WHITE, "/help [página/nome do comando]");
	SendClientMessage(playerid, MC_DARK_GREEN, "---------------------------------------------------------");
    return 1;
}

//
// Matar alguém (ou se matar)
//
dcmd_kill(playerid, params[])
{
	// Se o jogador que usou o comando tem nível maior ou igual à dois, procede na execução...
	if (GetPlayerPermissionLevel(playerid) >= 2)
	{
		new targetid = INVALID_PLAYER_ID;
		// Verifica se o comando teve algum argumento passado. Se não tiver, mata o próprio jogador...
		if (sscanf(params, "u", targetid))
		{
			SetPlayerHealth(playerid, 0.0);
		}
		// ...e se tiver argumento, verifica se o jogador-alvo existe. Se existir, mata-o, caso contrário, avisa que não existe
		else
		{
			if (IsPlayerConnected(targetid))
			{
				SetPlayerHealth(targetid, 0.0);
			}
			else
			{
				SendClientMessage(playerid, MC_RED, "Não foi possível encontrar o jogador indicado");
			}
		}
	}
	// ...caso contrário, envia um aviso de permissão
	else
	{
		SendClientMessage(playerid, MC_RED, "Você não tem permissão para usar este comando");
	}
	return 1;
}

//
// DEBUG
//
dcmd_level(playerid, params[])
{
	// Caso não vá utilizar argumentos...
	#pragma unused params
	
	new stdout[MAX_TEXT_OUTPUT];
	
	format(stdout, sizeof(stdout), "Seu nível de permissão é %i", GetPlayerPermissionLevel(playerid));
	SendClientMessage(playerid, MC_MINECOIN_GOLD, stdout);
	
	return 1;
}

//
// Comando de teleporte. Tentando ser o mais próximo possível da implementação do Minecraft
//
dcmd_tp(playerid, params[])
{
	// Se o jogador que usou o comando tem nível maior ou igual à dois, procede na execução...
	if (GetPlayerPermissionLevel(playerid) >= 2)
	{
		// Para a mensagem confirmando o teletransporte
		new stdout[MAX_TEXT_OUTPUT];
		
		// Posição X, Y, Z, se houverem
		new Float:posX, Float:posY, Float:posZ;
		
		// Nomes dos jogadores envolvidos, se houverem
		new victim, destination = INVALID_PLAYER_ID;
		
		// Primeiro verifica se tentou passar coordenadas no comando...
		if (!sscanf(params, "fff", posX, posY, posZ))
		{
			// Caso positivo, teleporta para as coordenadas especificadas (TODO: permitir passar valores de interior e levar ou não veículo)
			TeleportPlayer(playerid, posX, posY, posZ, 0, true);
			SetCameraBehindPlayer(playerid);
			
			// Avisa no chat e no log
			format(stdout, sizeof(stdout), "%s teletransportou-se para %f, %f, %f", GetPlayerNameEx(playerid), posX, posY, posZ);
			print(stdout);
			SendClientMessageToAll(MC_YELLOW, stdout);
		}
		// Agora verifica se está tentando passar dois jogadores
		else if (!sscanf(params, "uu", victim, destination))
		{
			// Teleporta o primeiro para a posição do segundo (TODO: permitir passar valores de interior e levar ou não veículo)
			GetPlayerPos(destination, posX, posY, posZ);
			TeleportPlayer(victim, posX, posY, posZ, 0, true);
			SetCameraBehindPlayer(victim);
			
			// Avisa no chat e no log
			format(stdout, sizeof(stdout), "%s foi teletransportado(a) para %s", GetPlayerNameEx(victim), GetPlayerNameEx(destination));
			print(stdout);
			SendClientMessageToAll(MC_YELLOW, stdout);
		}
		// Agora verifica se está tentando passar um jogador e coordenadas para teleportá-lo
		else if (!sscanf(params, "ufff", victim, posX, posY, posZ))
		{
			// Teleporta o jogador para as coordenadas especificadas (TODO: permitir passar valores de interior e levar ou não veículo)
			TeleportPlayer(victim, posX, posY, posZ, 0, true);
			SetCameraBehindPlayer(victim);
			
			// Avisa no chat e no log
			format(stdout, sizeof(stdout), "%s teletransportou-se para %f, %f, %f", GetPlayerNameEx(victim), posX, posY, posZ);
			print(stdout);
			SendClientMessageToAll(MC_YELLOW, stdout);
		}
		// Verifica agora se ele passou apenas um jogador, se for ele se teleporta pra lá
		else if (!sscanf(params, "u", destination))
		{
			// Teleporta o para a posição do player indicado (TODO: permitir passar valores de interior e levar ou não veículo)
			GetPlayerPos(destination, posX, posY, posZ);
			TeleportPlayer(playerid, posX, posY, posZ, 0, true);
			SetCameraBehindPlayer(playerid);

			// Avisa no chat e no log
			format(stdout, sizeof(stdout), "%s foi teletransportado(a) para %s", GetPlayerNameEx(playerid), GetPlayerNameEx(destination));
			print(stdout);
			SendClientMessageToAll(MC_YELLOW, stdout);
		}
		// Ao se esgotar as possibilidades, mostra como fazer o comando
		else
		{
			SendClientMessage(playerid, MC_RED, "Uso: /tp [jogador alvo] <jogador de destino> OU /tp [jogador alvo] <x> <y> <z>");
		}
		
	}
	// ...caso contrário, envia um aviso de permissão
	else
	{
		SendClientMessage(playerid, MC_RED, "Você não tem permissão para usar este comando");
	}
	
	return 1;
}
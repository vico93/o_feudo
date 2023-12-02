/*
 *  Arquivo:				of_i_base.inc
 *  Tipo:					Biblioteca principal do gamemode O Feudo
 *  Autor:					Vico
 *  Licença:				MIT
*/

/* ------------------------------- BIBLIOTECAS ------------------------------- */
#include <open.mp>											// Biblioteca padrão do open.mp
#include "../includes/sscanf.inc"							// Biblioteca sscanf

/* ------------------------------- DEFINIÇÕES -------------------------------- */
// DCMD
#define dcmd(%1,%2,%3) if ((strcmp((%3)[1], #%1, true, (%2)) == 0) && ((((%3)[(%2) + 1] == 0) && (dcmd_%1(playerid, "")))||(((%3)[(%2) + 1] == 32) && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1

#define MAX_STRING 1024										// Tamanho máximo de string
#define MAX_TEXT_OUTPUT 144									// Tamanho máximo de string em SendClientMessage

/* -------------------------------- FUNÇÕES ---------------------------------- */
//
// Uma cópia exata (!?) da função rand() do PHP
//
stock rand(minnum = cellmin,maxnum = cellmax) return random(maxnum - minnum + 1) + minnum;

//
//	Verifica se a ID de skin passada é válida (apenas skins "vanilla"/do jogo original)
//
stock IsValidUnmoddedSkin(skinid)
{
    if (skinid == 74 || skinid > 311 || skinid < 0)
	{
        return 0;
	}	
    return 1;
}

//
//	Registra as classes (skins) "escolhíveis" em ordem aleatória (vai no evento OnGameModeInit)
//
stock RegisterSkins()
{
	// Faz com que todos tenham o andar do CJ
	// UsePlayerPedAnims(); -- open.mp já tem isso!
	
	// Cria um vetor para armazenar as IDs de skins válidas
	new skins[312];
	
    // Gera o vetor ordenado (311 é a ID mais alta de skins não-customizadas)
    for (new i = 0; i < sizeof(skins); i++)
    {
		skins[i] = i;
    }
	
    // Embaralha o vetor
    for (new i = 0; i < sizeof(skins); i++)
    {
        new j = random(sizeof(skins));
        new temp = skins[i];
        skins[i] = skins[j];
        skins[j] = temp;
    }

	// Finalmente adiciona as classes de skins no gamemode
	for (new i = 0; i < sizeof(skins); i++)
	{
		// Verifica se a ID de skin é válida
		if (IsValidUnmoddedSkin(skins[i]))
		{
			// LOCAL: ARMÁRIO DO CJ (Interior 14)
			AddPlayerClass(skins[i], 259.104156, -41.613594, 1002.023437, 99.760757, WEAPON_FIST, 0, WEAPON_FIST, 0, WEAPON_FIST, 0);
		}
	}
	
	return 1;
}

//
// Posiciona o jogador na tela de seleção de classe/skin (essa vai no evento OnPlayerRequestClass)
//
stock PositionPlayerSpawn(playerid)
{
	// LOCAL: ARMÁRIO DO CJ (Interior 14)
	SetPlayerWeather(playerid, 21);				// Emular a claridade dos interiores trocando o tempo para 21
	SetPlayerInterior(playerid, 14);
	SetPlayerPos(playerid, 259.104156, -41.613594, 1002.023437);
	SetPlayerFacingAngle(playerid, 99.760757);
	SetPlayerCameraLookAt(playerid, 259.104156, -41.613594, 1002.023437);
	SetPlayerCameraPos(playerid, 259.104156 + (5 * floatsin(-99.760757, degrees)), -41.613594 + (5 * floatcos(-99.760757, degrees)), 1002.023437);
	
	return 1;
}

//
// Variação do GetPlayerName que RETORNA a string do nome
//
stock GetPlayerNameRet(playerid)
{
	new playername[MAX_PLAYER_NAME + 1];
	GetPlayerName(playerid, playername, sizeof(playername));
	
	return playername;
}

//
// Variação do GetWeaponName que RETORNA a string da arma
//
stock GetWeaponNameRet(WEAPON:weaponid)
{
	new weaponname[MAX_STRING];
	GetWeaponName(weaponid, weaponname, sizeof(weaponname));
	
	return weaponname;
}

//
//	Envia as "fatalidades" no chat (baseado nas mensagens de morte do Minecraft)
//
stock SendDeathToChat(playerid, killerid, WEAPON:reason, color)
{
	new death_msg[144];
	if(killerid != INVALID_PLAYER_ID)
	{
		switch (reason)
		{
			// Soco ou soqueira
			case WEAPON_FIST, WEAPON_BRASSKNUCKLE:
			{
				format(death_msg, sizeof(death_msg), "%s agrediu %s", GetPlayerNameRet(killerid), GetPlayerNameRet(playerid));
			}
			// Armas de corte
			case WEAPON_KNIFE, WEAPON_KATANA:
			{
				format(death_msg, sizeof(death_msg), "%s atravessou %s", GetPlayerNameRet(killerid), GetPlayerNameRet(playerid));
			}
			// Outras armas brancas
			case WEAPON_GOLFCLUB, WEAPON_NITESTICK, WEAPON_BAT, WEAPON_SHOVEL, WEAPON_POOLSTICK, WEAPON_FLOWER, WEAPON_CANE:
			{
				format(death_msg, sizeof(death_msg), "%s matou %s com %s", GetPlayerNameRet(playerid), GetPlayerNameRet(killerid), GetWeaponNameRet(reason));
			}
			// Brinquedinhos safadinhos
			case WEAPON_DILDO .. WEAPON_VIBRATOR2:
			{
				format(death_msg, sizeof(death_msg), "%s teve %s enfiado no traseiro por %s", GetPlayerNameRet(playerid), GetWeaponNameRet(reason), GetPlayerNameRet(killerid));
			}
			// Lança-chamas (ou fogo causado por outro jogador)
			case WEAPON_FLAMETHROWER:
			{
				format(death_msg, sizeof(death_msg), "%s andou no fogo enquanto lutava com %s", GetPlayerNameRet(playerid), GetPlayerNameRet(killerid));
			}
			// Explosivos
			case WEAPON_GRENADE, WEAPON_MOLTOV, WEAPON_ROCKETLAUNCHER, WEAPON_HEATSEEKER, WEAPON_SATCHEL, REASON_EXPLOSION:
			{
				format(death_msg, sizeof(death_msg), "%s explodiu %s", GetPlayerNameRet(killerid), GetPlayerNameRet(playerid));
			}
			// Armas de fogo
			case WEAPON_COLT45 .. WEAPON_SNIPER:
			{
				format(death_msg, sizeof(death_msg), "%s atingiu %s com %s", GetPlayerNameRet(killerid), GetPlayerNameRet(playerid), GetWeaponNameRet(reason));
			}
			// Minigun
			case WEAPON_MINIGUN:
			{
				format(death_msg, sizeof(death_msg), "%s atingiu %s com %s", GetPlayerNameRet(killerid), GetPlayerNameRet(playerid), GetWeaponNameRet(reason));
			}
			// Gás
			case WEAPON_TEARGAS, WEAPON_SPRAYCAN, WEAPON_FIREEXTINGUISHER:
			{
				format(death_msg, sizeof(death_msg), "%s sufocou-se enquanto lutava com %s", GetPlayerNameRet(playerid), GetPlayerNameRet(killerid));
			}
			// Mensagem genérica para morte com matador
			default:
			{
				format(death_msg, sizeof(death_msg), "%s matou %s", GetPlayerNameRet(killerid), GetPlayerNameRet(playerid));
			}
		}
	}
	// Caso tenha morrido sozinho...
	else
	{
		// Mensagem genérica para morte sem matador
		format(death_msg, sizeof(death_msg), "%s morreu", GetPlayerNameRet(playerid));
	}
	SendClientMessageToAll(color, death_msg);
}
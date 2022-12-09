/*
 *  Arquivo:				of_utils.inc
 *  Tipo:					Biblioteca de funções úteis
 *  Autor:					Vico
 *  Licença:				MIT
*/

/* ------------------------------- BIBLIOTECAS ------------------------------- */
#include <a_samp>											// Biblioteca padrão
#include "../includes/sscanf.inc"							// Biblioteca sscanf

/* ------------------------------- DEFINIÇÕES -------------------------------- */
// DCMD
#define dcmd(%1,%2,%3) if ((strcmp((%3)[1], #%1, true, (%2)) == 0) && ((((%3)[(%2) + 1] == 0) && (dcmd_%1(playerid, "")))||(((%3)[(%2) + 1] == 32) && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1

#define MAX_STRING 1024										// Tamanho máximo de string
#define MAX_TEXT_OUTPUT 144									// Tamanho máximo de string em SendClientMessage

/* ---------------------------- VARIÁVEIS GLOBAIS ---------------------------- */

/* ---------------------- CABEÇALHO DE FUNÇÕES PÚBLICAS ---------------------- */

/* ------------------------ CORPO DE FUNÇÕES PÚBLICAS ------------------------ */

/* ---------------------------- FUNÇÕES (STOCKS) ----------------------------- */
//
//	Verifica se a ID de skin passada é válida
//
stock IsValidSkin(skinid)
{
    if (skinid == 74 || skinid > 311 || skinid < 0)
	{
        return 0;
	}	
    return 1;
}

//
//	Retorna o nível do usuário (armazenado na variável de jogador)
//
stock GetPlayerPermissionLevel(playerid)
{
	return GetPVarInt(playerid, "perm_level");
}

//
// Variação do GetPlayerName que RETORNA a string do nome
//
stock GetPlayerNameEx(playerid)
{
	new playername[MAX_PLAYER_NAME + 1];
	GetPlayerName(playerid, playername, sizeof(playername));
	
	return playername;
}

//
// Variação do GetWeaponName que RETORNA a string da arma
//
stock GetWeaponNameEx(weaponid)
{
	new weaponname[MAX_STRING];
	GetWeaponName(weaponid, weaponname, sizeof(weaponname));
	
	return weaponname;
}

//
//	Adiciona as classes necessárias em ordem aleatória (vai no evento OnGameModeInit)
//
stock inicializar_skins()
{
	// Faz com que todos tenham o andar do CJ
	UsePlayerPedAnims();
	
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
		if (IsValidSkin(skins[i]))
		{
			// LOCAL: ARMÁRIO DO CJ (Interior 14)
			AddPlayerClass(skins[i], 259.104156, -41.613594, 1002.023437, 99.760757, 0, 0, 0, 0, 0, 0);
		}
	}
	
	return 1;
}
//
// Segunda parte da inicialização de skins (essa vai no evento OnPlayerRequestClass)
//
stock inicializar_skins2(playerid)
{
	// LOCAL: ARMÁRIO DO CJ (Interior 14)
	SetPlayerInterior(playerid, 14);
	SetPlayerPos(playerid, 259.104156, -41.613594, 1002.023437);
	SetPlayerFacingAngle(playerid, 99.760757);
	SetPlayerCameraLookAt(playerid, 259.104156, -41.613594, 1002.023437);
	SetPlayerCameraPos(playerid, 259.104156 + (5 * floatsin(-99.760757, degrees)), -41.613594 + (5 * floatcos(-99.760757, degrees)), 1002.023437);
	
	return 1;
}

//
//	Envia as "fatalidades" no chat (baseado nas mensagens de morte do Minecraft)
//
stock SendDeathToChat(playerid, killerid, reason, color)
{
	new death_msg[144];
	if(killerid != INVALID_PLAYER_ID)
	{
		switch (reason)
		{
			// Soco ou soqueira
			case 0, 1:
			{
				format(death_msg, sizeof(death_msg), "%s agrediu %s", GetPlayerNameEx(killerid), GetPlayerNameEx(playerid));
			}
			// Armas de corte
			case 4, 8:
			{
				format(death_msg, sizeof(death_msg), "%s atravessou %s", GetPlayerNameEx(killerid), GetPlayerNameEx(playerid));
			}
			// Outras armas brancas
			case 2, 3, 5, 6, 7, 14, 15:
			{
				format(death_msg, sizeof(death_msg), "%s matou %s com %s", GetPlayerNameEx(playerid), GetPlayerNameEx(killerid), GetWeaponNameEx(reason));
			}
			// Brinquedinhos safadinhos
			case 10 .. 13:
			{
				format(death_msg, sizeof(death_msg), "%s teve %s enfiado no traseiro por %s", GetPlayerNameEx(playerid), GetWeaponNameEx(reason), GetPlayerNameEx(killerid));
			}
			// Lança-chamas (ou fogo causado por outro jogador)
			case 37:
			{
				format(death_msg, sizeof(death_msg), "%s andou no fogo enquanto lutava com %s", GetPlayerNameEx(playerid), GetPlayerNameEx(killerid));
			}
			// Explosivos
			case 16, 18, 35, 36, 39, 51:
			{
				format(death_msg, sizeof(death_msg), "%s explodiu %s", GetPlayerNameEx(killerid), GetPlayerNameEx(playerid));
			}
			// Armas de fogo
			case 22 .. 34:
			{
				format(death_msg, sizeof(death_msg), "%s atingiu %s com %s", GetPlayerNameEx(killerid), GetPlayerNameEx(playerid), GetWeaponNameEx(reason));
			}
			// Minigun
			case 38:
			{
				format(death_msg, sizeof(death_msg), "%s atingiu %s com %s", GetPlayerNameEx(killerid), GetPlayerNameEx(playerid), GetWeaponNameEx(reason));
			}
			// Gás
			case 17, 41, 42:
			{
				format(death_msg, sizeof(death_msg), "%s sufocou-se enquanto lutava com %s", GetPlayerNameEx(playerid), GetPlayerNameEx(killerid));
			}
			// Mensagem genérica para morte com matador
			default:
			{
				format(death_msg, sizeof(death_msg), "%s matou %s", GetPlayerNameEx(killerid), GetPlayerNameEx(playerid));
			}
		}
	}
	// Caso tenha morrido sozinho...
	else
	{
		// Mensagem genérica para morte sem matador
		format(death_msg, sizeof(death_msg), "%s morreu", GetPlayerNameEx(playerid));
	}
	SendClientMessageToAll(color, death_msg);
}
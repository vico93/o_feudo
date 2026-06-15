/*
 *  Arquivo:				of_playerdata.inc
 *  Tipo:					Biblioteca para gerenciamento dos dados do jogador e banco de dados
 *  Autor:					Vico
 *  Licença:				MIT
*/

/* ------------------------------- BIBLIOTECAS ------------------------------- */

/* ------------------------------- DEFINIÇÕES -------------------------------- */

/* ---------------------------- VARIÁVEIS GLOBAIS ---------------------------- */

/* ------------------------- FUNÇÕES DE BANCO DE DADOS ----------------------- */

/* -------------------------------- FUNÇÕES ---------------------------------- */
//
//	Retorna o nivel do jogador (armazenado na variavel de jogador)
//
stock GetPlayerPermissionLevel(playerid)
{
	return GetPVarInt(playerid, "perm_level");
}

//
//	Salva o nivel do jogador (armazenado na variavel de jogador)
//
stock SetPlayerPermissionLevel(playerid, level)
{
	return SetPVarInt(playerid, "perm_level", level);
}

//
//	Retorna true se o jogador é administrador do servidor ou operador (nivel >= 3) - Coloquei "Ademir" em vez de Admin pois a
//  função IsPlayerAdmin() já existe e não pode ser sobrescrita.
//
stock bool:IsPlayerAdemir(playerid)
{
	return bool:(IsPlayerAdmin(playerid) || GetPlayerPermissionLevel(playerid) >= 3);
}
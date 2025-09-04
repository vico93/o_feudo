/*
 *  Arquivo:				of_b_playerdata.inc
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
//	Retorna o nível do usuário (armazenado na variável de jogador)
//
stock GetPlayerPermissionLevel(playerid)
{
	return GetPVarInt(playerid, "perm_level");
}
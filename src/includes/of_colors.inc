/*
 *  Arquivo:				of_colors.inc
 *  Tipo:					Biblioteca de Cores
 *  Autor:					Vico
 *  Licença:				MIT
*/

/* ------------------------------- DEFINIÇÕES -------------------------------- */
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
#define MC_YELLOW					RGBAToInt(255, 255, 255, 255)
#define MC_WHITE					RGBAToInt(255, 255, 255, 255)
#define MC_MINECOIN_GOLD			RGBAToInt(221, 214, 5, 255)
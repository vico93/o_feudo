/*
 *  Arquivo:				of_playerdata.inc
 *  Tipo:					Biblioteca para acesso ao banco de dados
 *  Autor:					Vico
 *  Licen�a:				MIT
*/

/* ------------------------------- BIBLIOTECAS ------------------------------- */
#include <a_sampdb>

/* ------------------------------- DEFINI��ES -------------------------------- */
#define DB_NAME "playerdata.db"					// Nome do arquivo de Banco de Dados

/* ---------------------------- VARI�VEIS GLOBAIS ---------------------------- */
new DB:playerdata;								// Armazenar� a conex�o com o Banco
new bool:requires_create = false;				// Flag pra verificar se banco de dados precisa receber o comando CREATE

/* -------------------------------- FUN��ES ---------------------------------- */
//
// Inicia a conex�o com o Banco de Dados
//
stock InitDatabase()
{
	// Verifica se o arquivo de DB n�o existe previamente...
	if(!fexist(DB_NAME))
	{
		// Altera a flag de verifica��o para posterior processamento adicional...
		requires_create = true;
	}

	// Tenta se conectar ao banco de dados...
	if((playerdata = db_open(DB_NAME)) == DB:0)
	{
		// ...caso n�o consiga...
		printf("[ERROR] N�o consegui conectar com o banco de dados %s. Fechando o servidor...", DB_NAME);
		SendRconCommand("exit");
	}
	else
	{
		// ...caso consiga...
		printf("Conectado com sucesso ao banco de dados %s!", DB_NAME);
		
		// Caso necessite, cria as tabelas via SQL
		if (requires_create)
		{
			// Aviso
			print("Realizando primeira inicializa��o do banco de dados...");
			// CREATE table...
			// db_free_result(db_query(playerdata, ""));
		}
	}
	return 1;
}

//
// Fecha a conex�o com o Banco de Dados
//
stock CloseDatabase()
{
	// Fechando a conex�o...
	db_close(playerdata);
	// Avisa que fechou com sucesso
	printf("Desconectado do banco de dados %s!", DB_NAME);
	
	return 1;
}
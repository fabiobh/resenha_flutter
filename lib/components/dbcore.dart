class DBCore {

  static String scriptCreateTableDataAtualizacaoTabAux() {
    var sbCreateTable = "";
    sbCreateTable += ("CREATE TABLE IF NOT EXISTS ");
    sbCreateTable += ("DATA_ATUALIZACAO_TAB_AUX ");
    sbCreateTable += ("(id INTEGER PRIMARY KEY, ");
    sbCreateTable += ("ultimaAtualizRacas TEXT, ");
    sbCreateTable += ("ultimaAtualizPelagens TEXT, ");
    sbCreateTable += ("ultimaAtualizSubtipoPelagens TEXT, ");
    sbCreateTable += ("ultimaAtualizComposicaoPelagens TEXT);");
    return sbCreateTable;
  }


  static String scriptCreateTableUsuario()  {
      var sbCreateTable = "";
      sbCreateTable += ("CREATE TABLE IF NOT EXISTS ");
      sbCreateTable += ("USUARIO ");
      sbCreateTable += ("(id INTEGER PRIMARY KEY AUTOINCREMENT, ");
      sbCreateTable += ("cpf TEXT, ");
      sbCreateTable += ("nome TEXT, ");
      sbCreateTable += ("senha TEXT, ");
      sbCreateTable += ("token TEXT);");
      return sbCreateTable;
  }

  static String scriptCreateTableGtaEmitida() {
      var sbCreateTable = "";
      sbCreateTable += ("CREATE TABLE IF NOT EXISTS ");
      sbCreateTable += ("GTA_EMITIDA ");
      sbCreateTable += ("(id INTEGER PRIMARY KEY AUTOINCREMENT, ");
      sbCreateTable += ("numeroCadastro TEXT, ");
      sbCreateTable += ("origem TEXT, ");
      sbCreateTable += ("destino TEXT, ");
      sbCreateTable += ("idDARE TEXT, ");
      sbCreateTable += ("codigoBarrasDARE TEXT, ");
      sbCreateTable += ("numeroDARE TEXT);");
      return sbCreateTable;
  }

  static  String scriptCreateTableDestinoTop10() {
      var sbCreateTable = "";
      sbCreateTable += ("CREATE TABLE IF NOT EXISTS ");
      sbCreateTable += ("DESTINO_TOP10 ");
      sbCreateTable += ("(id INTEGER PRIMARY KEY AUTOINCREMENT ");
      sbCreateTable += (",cpfcnpj TEXT ");
      sbCreateTable += (",nome TEXT); ");
      return sbCreateTable;
  }

  static String scriptCreateTableResUsuario() {
      var sbCreateTable = "";
      sbCreateTable += ("CREATE TABLE IF NOT EXISTS ");
      sbCreateTable += ("RES_USUARIO ");
      sbCreateTable += ("(id INTEGER PRIMARY KEY AUTOINCREMENT ");
      sbCreateTable += (",cpf TEXT ");
      sbCreateTable += (",crmv TEXT ");
      sbCreateTable += (",valido TEXT); ");
      return sbCreateTable;
  }

  static String scriptCreateTableResRaca() {
      //Log.i("Script", "Cria tab Raça");
      var sbCreateTable = "";
      sbCreateTable += ("CREATE TABLE IF NOT EXISTS ");
      sbCreateTable += ("RES_RACA ");
      sbCreateTable += ("(idEspecie INTEGER NOT NULL ");
      sbCreateTable += (",idRaca INTEGER NOT NULL ");
      sbCreateTable += (",nome TEXT ");
      sbCreateTable += (",idEspGedave INTEGER NOT NULL ");
      sbCreateTable += (",PRIMARY KEY (idEspecie, idRaca) ); ");
      return sbCreateTable;
  }

  static String scriptCreateTableResPelagem() {
      var sbCreateTable = "";
      sbCreateTable += ("CREATE TABLE IF NOT EXISTS ");
      sbCreateTable += ("RES_PELAGEM ");
      sbCreateTable += ("(idPelagem INTEGER NOT NULL ");
      sbCreateTable += (",nome TEXT ");
      sbCreateTable += (",PRIMARY KEY (idPelagem) ); ");
      return sbCreateTable;
  }

  static String scriptCreateTableResRacaPelagem() {
      var sbCreateTable = "";
      sbCreateTable += ("CREATE TABLE IF NOT EXISTS ");
      sbCreateTable += ("RES_RACA_PELAGEM ");
      sbCreateTable += ("(idRaca INTEGER NOT NULL ");
      sbCreateTable += (",idPelagem INTEGER NOT NULL ");
      sbCreateTable += (",PRIMARY KEY (idRaca, idPelagem) ); ");
      return sbCreateTable;
  }

  static String scriptCreateTableResStPelagem() {
      var sbCreateTable = "";
      sbCreateTable += ("CREATE TABLE IF NOT EXISTS ");
      sbCreateTable += ("RES_SUBTP_PELAGEM ");
      sbCreateTable += ("(idStPelagem INTEGER NOT NULL ");
      sbCreateTable += (",nome TEXT ");
      sbCreateTable += (",PRIMARY KEY (idStPelagem) ); ");
      return sbCreateTable;
  }

  static String scriptCreateTableResComposicaoPelagem() {
      var sbCreateTable = "";
      sbCreateTable += ("CREATE TABLE IF NOT EXISTS ");
      sbCreateTable += ("RES_COMP_PELAGEM ");
      sbCreateTable += ("(idComp INTEGER NOT NULL ");
      sbCreateTable += (",idEspecie INTEGER ");
      sbCreateTable += (",idPelagem INTEGER ");
      sbCreateTable += (",idStPelagem INTEGER ");
      sbCreateTable += (",PRIMARY KEY (idComp) ); ");
      return sbCreateTable;
  }

  static String scriptCreateTableResDados() {
      var sbCreateTable = "";
      sbCreateTable += ("CREATE TABLE IF NOT EXISTS ");
      sbCreateTable += ("RES_DADO ");
      sbCreateTable += ("(id INTEGER PRIMARY KEY NOT NULL");
      sbCreateTable += (",CpfVeterinario TEXT DEFAULT ''");
      sbCreateTable += (",CpfCnpjProdutor TEXT DEFAULT ''");
      sbCreateTable += (",CoordGeoLat TEXT DEFAULT ''");
      sbCreateTable += (",nomeAnimal TEXT DEFAULT ''");
      sbCreateTable += (",microChipAnimal TEXT DEFAULT ''");
      sbCreateTable += (",dataNascimentoAnimal TEXT DEFAULT ''");
      sbCreateTable += (",status TEXT DEFAULT ''");
      sbCreateTable += (",numeroAssocRaca TEXT DEFAULT ''");
      sbCreateTable += (",numeroPassaporte TEXT DEFAULT ''");
      sbCreateTable += (",microchipMae TEXT DEFAULT ''");
      sbCreateTable += (",idEspecie TEXT DEFAULT ''");
      sbCreateTable += (",nomeEspecie TEXT DEFAULT ''");
      sbCreateTable += (",idRaca TEXT DEFAULT ''");
      sbCreateTable += (",nomeRaca TEXT DEFAULT ''");
      sbCreateTable += (",idPelagem TEXT DEFAULT ''");
      sbCreateTable += (",nomePelagem TEXT DEFAULT ''");
      sbCreateTable += (",idSubTipo TEXT DEFAULT ''");
      sbCreateTable += (",nomeSubtipo TEXT DEFAULT ''");
      sbCreateTable += (",outrasCaracteristicas TEXT DEFAULT ''");
      sbCreateTable += (",idSexo TEXT DEFAULT ''");
      sbCreateTable += (",nomeSexo TEXT DEFAULT ''");
      sbCreateTable += (",machoCastrado TEXT DEFAULT ''");
      sbCreateTable += (",idCorOlhoDir TEXT DEFAULT ''");
      sbCreateTable += (",nomeCorOlhoDir TEXT DEFAULT ''");
      sbCreateTable += (",idCorOlhoEsq TEXT DEFAULT ''");
      sbCreateTable += (",nomeCorOlhoEsq TEXT DEFAULT ''");
      sbCreateTable += (",CoordGeoLong TEXT DEFAULT ''");
      sbCreateTable += (",QuantAnimaisEq TEXT DEFAULT ''");
      sbCreateTable += (",QuantAnimaisAs TEXT DEFAULT ''");
      sbCreateTable += (",QuantAnimaisMu TEXT DEFAULT ''");
      sbCreateTable += (",dataAtualizacao TEXT DEFAULT ''");
      sbCreateTable += (",codAP TEXT DEFAULT ''");
      sbCreateTable += (",idGedave TEXT DEFAULT ''");
      sbCreateTable += (",EhRetificadora TEXT DEFAULT '');");
      return sbCreateTable;
  }

  static String scriptCreateTableResFotos() {
      var sbCreateTable = "";
      sbCreateTable += ("CREATE TABLE IF NOT EXISTS ");
      sbCreateTable += ("RES_FOTO ");
      sbCreateTable += ("(id INTEGER NOT NULL ");
      sbCreateTable += (",posicao INTEGER NOT NULL ");
      sbCreateTable += (",nomeArquivo TEXT ");
      sbCreateTable += (",statusEnviada TEXT ");
      sbCreateTable += (",PRIMARY KEY (id, posicao) ); ");
      return sbCreateTable;
  }

  static String scriptCreateTableResMarcas() {
      var sbCreateTable = "";
      sbCreateTable += ("CREATE TABLE IF NOT EXISTS ");
      sbCreateTable += ("RES_MARCA ");
      sbCreateTable += ("(idResenha INTEGER NOT NULL ");
      sbCreateTable += (",id INTEGER NOT NULL ");
      sbCreateTable += (",parte TEXT ");
      sbCreateTable += (",eixoX REAL ");
      sbCreateTable += (",eixoY REAL ");
      sbCreateTable += (",widthImg TEXT ");
      sbCreateTable += (",heightImg TEXT ");
      sbCreateTable += (",nomeImg TEXT ");
      sbCreateTable += (",descricao TEXT ");
      sbCreateTable += (",tag TEXT ");
      sbCreateTable += (",rotateX REAL ");
      sbCreateTable += (",rotateY REAL ");
      sbCreateTable += (",tipo TEXT ");
      sbCreateTable += (",fixa TEXT ");
      sbCreateTable += (",sobrepoe TEXT ");
      sbCreateTable += (",statusEnviada TEXT ");
      sbCreateTable += (",PRIMARY KEY (idResenha, parte, id) ); ");
      return sbCreateTable;
  }

}
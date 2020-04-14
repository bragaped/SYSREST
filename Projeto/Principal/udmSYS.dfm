object dmSYS: TdmSYS
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 198
  Top = 93
  Height = 551
  Width = 704
  object ibdSYS_DATABASE: TIBDatabase
    DatabaseName = '..\SYSREST\Banco\DADOS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    DefaultTransaction = ibtSYS_DATABASE
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 146
    Top = 8
  end
  object ibtSYS_DATABASE: TIBTransaction
    Active = False
    DefaultDatabase = ibdSYS_DATABASE
    DefaultAction = TACommitRetaining
    AutoStopAction = saNone
    Left = 40
    Top = 8
  end
  object ibtCliente: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CLI_COD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CID_COD'
        DataType = ftInteger
      end
      item
        Name = 'CLI_NOM'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CLI_CPFCNPJ'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'CLI_RGIE'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'CLI_TEL'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'CLI_SIT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CLI_END'
        DataType = ftString
        Size = 75
      end
      item
        Name = 'CLI_TIP'
        DataType = ftInteger
      end
      item
        Name = 'CLI_SEX'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CLI_BAI'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CLI_CEP'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'CLI_EMAIL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CLI_COM'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CLI_OBS'
        DataType = ftBlob
        Size = 8
      end>
    IndexDefs = <
      item
        Name = 'XPKCLIENTE'
        Fields = 'CLI_COD'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY4'
        Fields = 'CLI_COD'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN23'
        Fields = 'CID_COD'
      end>
    StoreDefs = True
    TableName = 'CLIENTE'
    Left = 40
    Top = 57
    object ibtClienteCLI_COD: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CLI_COD'
    end
    object ibtClienteCID_COD: TIntegerField
      DisplayLabel = 'Cod_Cidade'
      FieldName = 'CID_COD'
    end
    object ibtClienteCLI_NOM: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'CLI_NOM'
      Size = 60
    end
    object ibtClienteCLI_CPFCNPJ: TIBStringField
      DisplayLabel = 'CPFCNPJ'
      FieldName = 'CLI_CPFCNPJ'
      Size = 18
    end
    object ibtClienteCLI_RGIE: TIBStringField
      DisplayLabel = 'RGIE'
      FieldName = 'CLI_RGIE'
      Size = 18
    end
    object ibtClienteCLI_TEL: TIBStringField
      DisplayLabel = 'Telefone'
      FieldName = 'CLI_TEL'
      EditMask = '!\(99\)9999-9999;1; '
      Size = 13
    end
    object ibtClienteCLI_SIT: TIBStringField
      DisplayLabel = 'Estatus'
      FieldName = 'CLI_SIT'
      Size = 1
    end
    object ibtClienteCLI_END: TIBStringField
      DisplayLabel = 'Endereco'
      FieldName = 'CLI_END'
      Size = 75
    end
    object ibtClienteCLI_TIP: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo'
      FieldName = 'CLI_TIP'
    end
    object ibtClienteCLI_SEX: TIBStringField
      DisplayLabel = 'Sexo'
      FieldName = 'CLI_SEX'
      Size = 1
    end
    object ibtClienteCLI_BAI: TIBStringField
      DisplayLabel = 'Bairro'
      FieldName = 'CLI_BAI'
      Size = 30
    end
    object ibtClienteCLI_CEP: TIBStringField
      FieldName = 'CLI_CEP'
      EditMask = '99999\-999;1; '
      Size = 9
    end
    object ibtClienteCLI_EMAIL: TIBStringField
      DisplayLabel = 'EMAIL'
      FieldName = 'CLI_EMAIL'
      Size = 30
    end
    object ibtClienteCLI_COM: TIBStringField
      DisplayLabel = 'Complemento'
      FieldName = 'CLI_COM'
      Size = 10
    end
    object ibtClienteCLI_OBS: TBlobField
      FieldName = 'CLI_OBS'
      Size = 8
    end
  end
  object ibtCidade: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CIDADE'
    Left = 40
    Top = 107
    object ibtCidadeCID_COD: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CID_COD'
    end
    object ibtCidadeCID_NOM: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'CID_NOM'
      Size = 25
    end
    object ibtCidadeEST_SIG: TIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'EST_SIG'
      Size = 2
    end
  end
  object ibtFornecedor: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'FORNECEDOR'
    Left = 40
    Top = 160
    object ibtFornecedorFOR_COD: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'FOR_COD'
    end
    object ibtFornecedorFAR_RAZ_SOC: TIBStringField
      DisplayLabel = 'Razao_Social'
      FieldName = 'FOR_RAZ_SOC'
      Size = 60
    end
    object ibtFornecedorFOR_NOM_FANT: TIBStringField
      DisplayLabel = 'Nome_Fantazia'
      FieldName = 'FOR_NOM_FANT'
      Size = 70
    end
    object ibtFornecedorCID_COD: TIntegerField
      DisplayLabel = 'Cod_Cidade'
      FieldName = 'CID_COD'
    end
    object ibtFornecedorFOR_TEL: TIBStringField
      DisplayLabel = 'Telefone'
      FieldName = 'FOR_TEL'
      EditMask = '!\(99\)9999-9999;1; '
      Size = 13
    end
    object ibtFornecedorFOR_END: TIBStringField
      DisplayLabel = 'Endereco'
      FieldName = 'FOR_END'
      Size = 75
    end
    object ibtFornecedorFOR_BAI: TIBStringField
      DisplayLabel = 'Bairro'
      FieldName = 'FOR_BAI'
      Size = 30
    end
    object ibtFornecedorFOR_EMAIL: TIBStringField
      DisplayLabel = 'EMAIL'
      FieldName = 'FOR_EMAIL'
      Size = 30
    end
    object ibtFornecedorFOR_CNPJCPF: TIBStringField
      DisplayLabel = 'CNPJCPF'
      FieldName = 'FOR_CNPJCPF'
      Size = 18
    end
    object ibtFornecedorFOR_CEP: TIBStringField
      FieldName = 'FOR_CEP'
      EditMask = '99999\-999;1; '
      Size = 9
    end
    object ibtFornecedorFOR_IERG: TIBStringField
      DisplayLabel = 'IERG'
      FieldName = 'FOR_IERG'
      Size = 18
    end
    object ibtFornecedorFOR_TIP: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Tipo'
      FieldName = 'FOR_TIP'
    end
    object ibtFornecedorFOR_SIT: TIBStringField
      DisplayLabel = 'Estatus'
      FieldName = 'FOR_SIT'
      Size = 1
    end
    object ibtFornecedorFOR_OBS: TBlobField
      FieldName = 'FOR_OBS'
    end
  end
  object ibtFuncionario: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'FUN_COD'
        DataType = ftInteger
      end
      item
        Name = 'CID_COD'
        DataType = ftInteger
      end
      item
        Name = 'FUN_NOM'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'FUN_FUNC'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'FUN_TEL'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'FUN_CPF'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'FUN_RG'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'FUN_SEX'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FUN_SIT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FUN_DTAADM'
        DataType = ftDate
      end
      item
        Name = 'FUN_END'
        DataType = ftString
        Size = 75
      end
      item
        Name = 'FUN_BAI'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FUN_CEP'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'FUN_EMAIL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FUN_OBS'
        DataType = ftBlob
      end
      item
        Name = 'FUN_COM'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'COMISSAO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'XPKFUNCIONARIO'
        Fields = 'FUN_COD'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY9'
        Fields = 'FUN_COD'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN26'
        Fields = 'CID_COD'
      end>
    StoreDefs = True
    TableName = 'FUNCIONARIO'
    Left = 40
    Top = 210
    object ibtFuncionarioFUN_COD: TIntegerField
      FieldName = 'FUN_COD'
    end
    object ibtFuncionarioCID_COD: TIntegerField
      FieldName = 'CID_COD'
    end
    object ibtFuncionarioFUN_NOM: TIBStringField
      FieldName = 'FUN_NOM'
      Size = 60
    end
    object ibtFuncionarioFUN_TEL: TIBStringField
      FieldName = 'FUN_TEL'
      EditMask = '!\(99\)9999-9999;1; '
      Size = 13
    end
    object ibtFuncionarioFUN_CPF: TIBStringField
      FieldName = 'FUN_CPF'
      EditMask = '999.999.999-99;1; '
      Size = 18
    end
    object ibtFuncionarioFUN_RG: TIBStringField
      FieldName = 'FUN_RG'
      Size = 18
    end
    object ibtFuncionarioFUN_SIT: TIBStringField
      FieldName = 'FUN_SIT'
      Size = 1
    end
    object ibtFuncionarioFUN_DTAADM: TDateField
      FieldName = 'FUN_DTAADM'
    end
    object ibtFuncionarioFUN_END: TIBStringField
      FieldName = 'FUN_END'
      Size = 75
    end
    object ibtFuncionarioFUN_BAI: TIBStringField
      FieldName = 'FUN_BAI'
      Size = 30
    end
    object ibtFuncionarioFUN_CEP: TIBStringField
      FieldName = 'FUN_CEP'
      EditMask = '99999\-999;1; '
      Size = 9
    end
    object ibtFuncionarioFUN_EMAIL: TIBStringField
      FieldName = 'FUN_EMAIL'
      Size = 30
    end
    object ibtFuncionarioFUN_FUNC: TIBStringField
      FieldName = 'FUN_FUNC'
      Size = 25
    end
    object ibtFuncionarioFUN_SEX: TIBStringField
      FieldName = 'FUN_SEX'
      Size = 1
    end
    object ibtFuncionarioFUN_COM: TIBStringField
      FieldName = 'FUN_COM'
      Size = 10
    end
    object ibtFuncionarioFUN_OBS: TBlobField
      FieldName = 'FUN_OBS'
    end
    object ibtFuncionarioCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object dsCliente: TDataSource
    DataSet = ibtCliente
    Left = 146
    Top = 57
  end
  object dsCidade: TDataSource
    DataSet = ibtCidade
    Left = 146
    Top = 107
  end
  object dsFuncionario: TDataSource
    DataSet = ibtFuncionario
    Left = 146
    Top = 210
  end
  object dsFornecedor: TDataSource
    DataSet = ibtFornecedor
    Left = 146
    Top = 160
  end
  object ibtUsuario: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'USE_COD'
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'SENHA'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'USE_DESC'
        DataType = ftBlob
      end>
    IndexDefs = <
      item
        Name = 'XPKUSUARIO'
        Fields = 'USE_COD'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY18'
        Fields = 'USE_COD'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'USUARIO'
    Left = 246
    Top = 8
    object ibtUsuarioUSE_COD: TIntegerField
      FieldName = 'USE_COD'
    end
    object ibtUsuarioNOME: TIBStringField
      FieldName = 'NOME'
      Size = 8
    end
    object ibtUsuarioSENHA: TIBStringField
      FieldName = 'SENHA'
      Size = 8
    end
    object ibtUsuarioUSE_DESC: TBlobField
      FieldName = 'USE_DESC'
    end
  end
  object dsUsuario: TDataSource
    DataSet = ibtUsuario
    Left = 333
    Top = 8
  end
  object ibtGrupPro: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'GRU_COD'
        DataType = ftInteger
      end
      item
        Name = 'GRU_NOM'
        DataType = ftString
        Size = 45
      end>
    IndexDefs = <
      item
        Name = 'XPKGRUPO'
        Fields = 'GRU_COD'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY10'
        Fields = 'GRU_COD'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'GRUPO'
    Left = 40
    Top = 259
    object ibtGrupProGRU_COD: TIntegerField
      FieldName = 'GRU_COD'
    end
    object ibtGrupProGRU_NOM: TIBStringField
      FieldName = 'GRU_NOM'
      Size = 45
    end
  end
  object dsGrupPro: TDataSource
    DataSet = ibtGrupPro
    Left = 146
    Top = 259
  end
  object ibtProduto: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'PRO_COD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PRO_NOM'
        Attributes = [faRequired]
        DataType = ftString
        Size = 45
      end
      item
        Name = 'GRU_COD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PRO_PRE'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'PRO_TIP'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PRO_ICM'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PRO_UNI'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'PRO_QTD'
        DataType = ftFloat
      end
      item
        Name = 'PRO_ESTMIN'
        DataType = ftFloat
      end
      item
        Name = 'PRO_SIT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PRO_CODTRIBUT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'XPKPRODUTO'
        Fields = 'PRO_COD'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY19'
        Fields = 'PRO_COD'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN43'
        Fields = 'GRU_COD'
      end>
    StoreDefs = True
    TableName = 'PRODUTO'
    Left = 40
    Top = 310
    object ibtProdutoPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object ibtProdutoGRU_COD: TIntegerField
      FieldName = 'GRU_COD'
    end
    object ibtProdutoPRO_NOM: TIBStringField
      FieldName = 'PRO_NOM'
      Size = 45
    end
    object ibtProdutoPRO_PRE: TFloatField
      FieldName = 'PRO_PRE'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ibtProdutoPRO_TIP: TIBStringField
      FieldName = 'PRO_TIP'
      Size = 1
    end
    object ibtProdutoPRO_UNI: TIBStringField
      FieldName = 'PRO_UNI'
      Size = 2
    end
    object ibtProdutoPRO_ESTMIN: TFloatField
      FieldName = 'PRO_ESTMIN'
      DisplayFormat = '#,##0.###'
      EditFormat = '#,###0.###'
    end
    object ibtProdutoPRO_SIT: TIBStringField
      FieldName = 'PRO_SIT'
      Size = 1
    end
    object ibtProdutoPRO_ICM: TIntegerField
      FieldName = 'PRO_ICM'
    end
    object ibtProdutoPRO_QTD: TFloatField
      FieldName = 'PRO_QTD'
    end
    object ibtProdutoPRO_CODTRIBUT: TIBStringField
      FieldName = 'PRO_CODTRIBUT'
      FixedChar = True
      Size = 1
    end
  end
  object ibtProd_Comp: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BeforePost = ibtProd_CompBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COMP_PRO_COD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PRO_COD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'COMP_QTD'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'XPKCOMPOSICAO'
        Fields = 'COMP_PRO_COD;PRO_COD'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY6'
        Fields = 'COMP_PRO_COD;PRO_COD'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN25'
        Fields = 'PRO_COD'
      end>
    IndexFieldNames = 'PRO_COD'
    MasterFields = 'PRO_COD'
    MasterSource = dsProduto
    StoreDefs = True
    TableName = 'COMPOSICAO'
    Left = 40
    Top = 420
    object ibtProd_CompCOMP_PRO_COD: TIntegerField
      FieldName = 'COMP_PRO_COD'
      OnValidate = ibtProd_CompCOMP_PRO_CODValidate
    end
    object ibtProd_CompPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object ibtProd_CompCOMP_QTD: TFloatField
      FieldName = 'COMP_QTD'
      OnValidate = ibtProd_CompCOMP_QTDValidate
      DisplayFormat = '#,###0.000'
      EditFormat = '#,###0.000'
    end
    object ibtProd_CompNomeComp: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeComp'
      LookupDataSet = ibtLookProduto
      LookupKeyFields = 'PRO_COD'
      LookupResultField = 'PRO_NOM'
      KeyFields = 'COMP_PRO_COD'
      Size = 50
      Lookup = True
    end
  end
  object dsProduto: TDataSource
    DataSet = ibtProduto
    Left = 146
    Top = 310
  end
  object dsProd_Comp: TDataSource
    DataSet = ibtProd_Comp
    Left = 146
    Top = 420
  end
  object ibtSetor: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    StoreDefs = True
    TableName = 'SETOR'
    Left = 246
    Top = 57
    object ibtSetorSET_COD: TIntegerField
      FieldName = 'SET_COD'
    end
    object ibtSetorSET_NOM: TIBStringField
      FieldName = 'SET_NOM'
    end
    object ibtSetorSET_DESC: TIBStringField
      FieldName = 'SET_DESC'
    end
  end
  object ibtMesa: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'MESA_COD'
        DataType = ftInteger
      end
      item
        Name = 'SET_COD'
        DataType = ftInteger
      end
      item
        Name = 'MESA_LUG'
        DataType = ftInteger
      end
      item
        Name = 'MESA_SIT'
        DataType = ftString
        Size = 1
      end>
    StoreDefs = True
    TableName = 'MESA'
    Left = 462
    Top = 256
    object ibtMesaMESA_COD: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'MESA_COD'
    end
    object ibtMesaSET_COD: TIntegerField
      DisplayLabel = 'Cod_Setor'
      FieldName = 'SET_COD'
    end
    object ibtMesaMESA_LUG: TIntegerField
      DisplayLabel = 'Qtde_Lug'
      FieldName = 'MESA_LUG'
    end
    object ibtMesaMESA_SIT: TIBStringField
      DisplayLabel = 'Situacao'
      FieldName = 'MESA_SIT'
      Size = 1
    end
  end
  object ibtJunta_Mesa: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'MESA_COD;MESA_FIL'
    MasterFields = 'MESA_COD'
    MasterSource = dsMesa
    TableName = 'JUNTA_MESA'
    Left = 462
    Top = 304
    object ibtJunta_MesaMESA_COD: TIntegerField
      FieldName = 'MESA_COD'
    end
    object ibtJunta_MesaMESA_FIL: TIntegerField
      FieldName = 'MESA_FIL'
    end
  end
  object dsSetor: TDataSource
    DataSet = ibtSetor
    Left = 333
    Top = 57
  end
  object dsJunta_Mesa: TDataSource
    DataSet = ibtJunta_Mesa
    Left = 549
    Top = 304
  end
  object dsMesa: TDataSource
    DataSet = ibtMesa
    Left = 549
    Top = 256
  end
  object ibtCompra: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COM_NRODOC'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'FOR_COD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'COM_DATENT'
        DataType = ftDate
      end
      item
        Name = 'COM_DATEMI'
        DataType = ftDate
      end
      item
        Name = 'COM_VALNOT'
        DataType = ftFloat
      end
      item
        Name = 'COM_PERDEC'
        DataType = ftFloat
      end
      item
        Name = 'COM_ICM'
        DataType = ftFloat
      end
      item
        Name = 'COM_IPI'
        DataType = ftFloat
      end
      item
        Name = 'COM_VALFRETE'
        DataType = ftFloat
      end
      item
        Name = 'COM_OBS'
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'FISC_COD'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'XPKCOMPRAS'
        Fields = 'COM_NRODOC;FOR_COD'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY7'
        Fields = 'COM_NRODOC;FOR_COD'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN26'
        Fields = 'FISC_COD'
      end
      item
        Name = 'RDB$FOREIGN27'
        Fields = 'FOR_COD'
      end>
    StoreDefs = True
    TableName = 'COMPRAS'
    Left = 242
    Top = 366
    object ibtCompraCOM_NRODOC: TIntegerField
      FieldName = 'COM_NRODOC'
    end
    object ibtCompraFOR_COD: TIntegerField
      FieldName = 'FOR_COD'
    end
    object ibtCompraCOM_DATENT: TDateField
      FieldName = 'COM_DATENT'
    end
    object ibtCompraCOM_DATEMI: TDateField
      FieldName = 'COM_DATEMI'
    end
    object ibtCompraCOM_VALNOT: TFloatField
      FieldName = 'COM_VALNOT'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ibtCompraCOM_PERDEC: TFloatField
      FieldName = 'COM_PERDEC'
    end
    object ibtCompraCOM_ICM: TFloatField
      FieldName = 'COM_ICM'
    end
    object ibtCompraCOM_IPI: TFloatField
      FieldName = 'COM_IPI'
    end
    object ibtCompraCOM_VALFRETE: TFloatField
      FieldName = 'COM_VALFRETE'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ibtCompraFISC_COD: TIntegerField
      FieldName = 'FISC_COD'
    end
    object ibtCompraCOM_OBS: TBlobField
      FieldName = 'COM_OBS'
      Size = 8
    end
  end
  object ibtItens_Compra: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    AfterPost = ibtItens_CompraAfterPost
    BeforePost = ibtItens_CompraBeforePost
    OnCalcFields = ibtItens_CompraCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COM_NRODOC'
        DataType = ftInteger
      end
      item
        Name = 'FOR_COD'
        DataType = ftInteger
      end
      item
        Name = 'PRO_COD'
        DataType = ftInteger
      end
      item
        Name = 'ITCOM_QTD'
        DataType = ftFloat
      end
      item
        Name = 'ITCOM_VAL'
        DataType = ftFloat
      end
      item
        Name = 'ITCOM_PERDESC'
        DataType = ftFloat
      end
      item
        Name = 'ITCOM_ICM'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY13'
        Fields = 'COM_NRODOC;FOR_COD;PRO_COD'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'XPKITEM_COMPRA'
        Fields = 'COM_NRODOC;FOR_COD;PRO_COD'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$FOREIGN32'
        Fields = 'PRO_COD'
      end
      item
        Name = 'RDB$FOREIGN33'
        Fields = 'COM_NRODOC;FOR_COD'
      end>
    IndexFieldNames = 'COM_NRODOC;FOR_COD'
    MasterFields = 'COM_NRODOC;FOR_COD'
    MasterSource = dsCompra
    StoreDefs = True
    TableName = 'ITEM_COMPRA'
    Left = 242
    Top = 421
    object ibtItens_CompraCOM_NRODOC: TIntegerField
      FieldName = 'COM_NRODOC'
    end
    object ibtItens_CompraFOR_COD: TIntegerField
      FieldName = 'FOR_COD'
    end
    object ibtItens_CompraPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
      OnValidate = ibtItens_CompraPRO_CODValidate
    end
    object ibtItens_CompraITCOM_QTD: TFloatField
      FieldName = 'ITCOM_QTD'
      OnValidate = ibtItens_CompraITCOM_QTDValidate
      DisplayFormat = '#,###0.###'
      EditFormat = '#,###0.###'
    end
    object ibtItens_CompraITCOM_VAL: TFloatField
      FieldName = 'ITCOM_VAL'
      OnValidate = ibtItens_CompraITCOM_VALValidate
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
      currency = True
    end
    object ibtItens_CompraITCOM_PERDESC: TFloatField
      FieldName = 'ITCOM_PERDESC'
    end
    object ibtItens_CompraITCOM_ICM: TIntegerField
      FieldName = 'ITCOM_ICM'
    end
    object ibtItens_CompraNomeProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeProduto'
      LookupDataSet = ibtLookProduto
      LookupKeyFields = 'PRO_COD'
      LookupResultField = 'PRO_NOM'
      KeyFields = 'PRO_COD'
      Size = 50
      Lookup = True
    end
    object ibtItens_CompraValTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ValTotal'
      DisplayFormat = 'R$ ,0.00'
      EditFormat = 'R$ ,0.00'
      currency = True
      Calculated = True
    end
  end
  object ibtContas_Pagar: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BeforePost = ibtContas_PagarBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'FOR_COD'
        DataType = ftInteger
      end
      item
        Name = 'CONT_NRODOC'
        DataType = ftInteger
      end
      item
        Name = 'CONT_PARC'
        DataType = ftInteger
      end
      item
        Name = 'CONT_VALPAGAR'
        DataType = ftFloat
      end
      item
        Name = 'CONT_VALPAGO'
        DataType = ftFloat
      end
      item
        Name = 'CONT_DATPAG'
        DataType = ftDate
      end
      item
        Name = 'CONT_DATVENC'
        DataType = ftDate
      end
      item
        Name = 'CONT_OBS'
        DataType = ftBlob
      end>
    IndexDefs = <
      item
        Name = 'XPKCONTAS_PAGAR'
        Fields = 'FOR_COD;CONT_NRODOC;CONT_PARC'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY8'
        Fields = 'FOR_COD;CONT_NRODOC;CONT_PARC'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN28'
        Fields = 'FOR_COD'
      end
      item
        Name = 'COMPRAS'
        Fields = 'CONT_PARC;FOR_COD;CONT_NRODOC'
      end>
    StoreDefs = True
    TableName = 'CONTAS_PAGAR'
    Left = 246
    Top = 259
    object ibtContas_PagarCONT_VALPAGAR: TFloatField
      FieldName = 'CONT_VALPAGAR'
      Required = True
      OnValidate = ibtContas_PagarCONT_VALPAGARValidate
      DisplayFormat = 'R$ ,0.00'
      EditFormat = 'R$ ,0.00'
    end
    object ibtContas_PagarCONT_DATVENC: TDateField
      FieldName = 'CONT_DATVENC'
      Required = True
      OnSetText = ibtContas_PagarCONT_DATVENCSetText
      EditMask = '!99/99/9999;1;_'
    end
    object ibtContas_PagarCONT_VALPAGO: TFloatField
      FieldName = 'CONT_VALPAGO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ibtContas_PagarCONT_DATPAG: TDateField
      FieldName = 'CONT_DATPAG'
      OnSetText = ibtContas_PagarCONT_DATPAGSetText
      EditMask = '!99/99/9999;1;_'
    end
    object ibtContas_PagarCONT_OBS: TBlobField
      FieldName = 'CONT_OBS'
      OnGetText = ibtContas_PagarCONT_OBSGetText
      Size = 8
    end
    object ibtContas_PagarCONT_PARC: TIntegerField
      FieldName = 'CONT_PARC'
      Required = True
      OnValidate = ibtContas_PagarCONT_PARCValidate
    end
    object ibtContas_PagarFOR_COD: TIntegerField
      FieldName = 'FOR_COD'
      Required = True
    end
    object ibtContas_PagarCONT_NRODOC: TIntegerField
      FieldName = 'CONT_NRODOC'
      Required = True
    end
  end
  object dsContas_Pagar: TDataSource
    DataSet = ibtContas_Pagar
    Left = 333
    Top = 259
  end
  object dsItens_Compra: TDataSource
    DataSet = ibtItens_Compra
    Left = 329
    Top = 421
  end
  object ibtCod_Fiscal: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CODIGO_FISCAL'
    Left = 246
    Top = 210
    object ibtCod_FiscalFISC_COD: TIntegerField
      FieldName = 'FISC_COD'
    end
    object ibtCod_FiscalCFOP1: TIntegerField
      FieldName = 'CFOP1'
    end
    object ibtCod_FiscalCFOP2: TIntegerField
      FieldName = 'CFOP2'
    end
    object ibtCod_FiscalCFOP3: TIntegerField
      FieldName = 'CFOP3'
    end
    object ibtCod_FiscalFISC_DESC: TBlobField
      FieldName = 'FISC_DESC'
    end
    object ibtCod_FiscalFISC_NATOPR: TIBStringField
      FieldName = 'FISC_NATOPR'
      Size = 50
    end
    object ibtCod_FiscalFISC_TIPO: TIBStringField
      FieldName = 'FISC_TIPO'
      Size = 1
    end
    object ibtCod_FiscalFISC_CODCONTABIL: TIntegerField
      FieldName = 'FISC_CODCONTABIL'
    end
    object ibtCod_FiscalFISC_GRCONT: TIBStringField
      FieldName = 'FISC_GRCONT'
      Size = 1
    end
    object ibtCod_FiscalFISC_TIPOICM: TIBStringField
      FieldName = 'FISC_TIPOICM'
      Size = 1
    end
    object ibtCod_FiscalFISC_TIPOIPI: TIBStringField
      FieldName = 'FISC_TIPOIPI'
      Size = 1
    end
  end
  object dsCod_Fiscal: TDataSource
    DataSet = ibtCod_Fiscal
    Left = 333
    Top = 210
  end
  object ibtCheque: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CHE_AGEN'
        DataType = ftInteger
      end
      item
        Name = 'CHE_BANCO'
        DataType = ftInteger
      end
      item
        Name = 'CHE_NUM'
        DataType = ftInteger
      end
      item
        Name = 'CHE_CONTA'
        DataType = ftInteger
      end
      item
        Name = 'CLI_COD'
        DataType = ftInteger
      end
      item
        Name = 'CHE_NOME'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'PED_COD'
        DataType = ftInteger
      end
      item
        Name = 'CHE_VALOR'
        DataType = ftFloat
      end
      item
        Name = 'CHE_DTAEMI'
        DataType = ftDate
      end
      item
        Name = 'CHE_DATENT'
        DataType = ftDate
      end
      item
        Name = 'CHE_DATPDEP'
        DataType = ftDate
      end
      item
        Name = 'CHE_TIP'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CHE_OBS'
        DataType = ftBlob
      end>
    IndexDefs = <
      item
        Name = 'XPKCHEQUE'
        Fields = 'CHE_AGEN;CLI_COD;CHE_BANCO;CHE_NUM;CHE_CONTA'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY2'
        Fields = 'CHE_AGEN;CLI_COD;CHE_BANCO;CHE_NUM;CHE_CONTA'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN22'
        Fields = 'PED_COD'
      end
      item
        Name = 'RDB$FOREIGN23'
        Fields = 'CLI_COD'
      end>
    StoreDefs = True
    TableName = 'CHEQUE'
    Left = 246
    Top = 104
    object ibtChequeCLI_COD: TIntegerField
      FieldName = 'CLI_COD'
      Required = True
    end
    object ibtChequeCHE_AGEN: TIntegerField
      FieldName = 'CHE_AGEN'
      Required = True
      DisplayFormat = '0000'
      EditFormat = '0000'
    end
    object ibtChequeCHE_BANCO: TIntegerField
      FieldName = 'CHE_BANCO'
      Required = True
      DisplayFormat = '000'
      EditFormat = '000'
    end
    object ibtChequeCHE_CONTA: TIntegerField
      FieldName = 'CHE_CONTA'
      Required = True
      DisplayFormat = '00000000-0'
      EditFormat = '00000000-0'
    end
    object ibtChequeCHE_NUM: TIntegerField
      FieldName = 'CHE_NUM'
      Required = True
      OnValidate = ibtChequeCHE_NUMValidate
      DisplayFormat = '000000'
      EditFormat = '000000'
    end
    object ibtChequeCHE_NOME: TIBStringField
      FieldName = 'CHE_NOM_EMIT'
      Size = 45
    end
    object ibtChequePED_COD: TIntegerField
      FieldName = 'PED_COD'
    end
    object ibtChequeCHE_VALOR: TFloatField
      FieldName = 'CHE_VALOR'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ibtChequeCHE_DATENT: TDateField
      FieldName = 'CHE_DATENT'
    end
    object ibtChequeCHE_DTAEMI: TDateField
      FieldName = 'CHE_DTAEMI'
    end
    object ibtChequeCHE_DATPDEP: TDateField
      FieldName = 'CHE_DATPDEP'
    end
    object ibtChequeCHE_TIP: TIBStringField
      FieldName = 'CHE_TIP'
      FixedChar = True
      Size = 1
    end
    object ibtChequeCHE_OBS: TBlobField
      FieldName = 'CHE_OBS'
      Size = 8
    end
  end
  object ibtCaixa: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    AfterInsert = ibtCaixaAfterInsert
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CAI_NUM'
        DataType = ftInteger
      end
      item
        Name = 'CAI_DATAABT'
        DataType = ftDate
      end
      item
        Name = 'CAI_HORAABT'
        DataType = ftTime
      end
      item
        Name = 'CAI_VALINI'
        DataType = ftFloat
      end
      item
        Name = 'CAI_DATAFCH'
        DataType = ftDate
      end
      item
        Name = 'CAI_HORAFCH'
        DataType = ftTime
      end
      item
        Name = 'CAI_VALDIN'
        DataType = ftFloat
      end
      item
        Name = 'CAI_VALCHE'
        DataType = ftFloat
      end
      item
        Name = 'CAI_VALCART'
        DataType = ftFloat
      end
      item
        Name = 'CAI_VALFECDIN'
        DataType = ftFloat
      end
      item
        Name = 'CAI_VALFECCHE'
        DataType = ftFloat
      end
      item
        Name = 'CAI_VALFECCART'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'XPKCAIXA'
        Fields = 'CAI_NUM'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'CAI_NUM'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'CAIXA'
    Left = 398
    Top = 9
    object ibtCaixaCAI_NUM: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CAI_NUM'
      MinValue = 1
    end
    object ibtCaixaCAI_DATAABT: TDateField
      FieldName = 'CAI_DATAABT'
    end
    object ibtCaixaCAI_HORAABT: TTimeField
      FieldName = 'CAI_HORAABT'
    end
    object ibtCaixaCAI_VALINI: TFloatField
      FieldName = 'CAI_VALINI'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ibtCaixaCAI_DATAFCH: TDateField
      FieldName = 'CAI_DATAFCH'
    end
    object ibtCaixaCAI_HORAFCH: TTimeField
      FieldName = 'CAI_HORAFCH'
    end
    object ibtCaixaCAI_VALDIN: TFloatField
      FieldName = 'CAI_VALDIN'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ibtCaixaCAI_VALCHE: TFloatField
      FieldName = 'CAI_VALCHE'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ibtCaixaCAI_VALCART: TFloatField
      FieldName = 'CAI_VALCART'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ibtCaixaCAI_VALFECDIN: TFloatField
      FieldName = 'CAI_VALFECDIN'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ibtCaixaCAI_VALFECCHE: TFloatField
      FieldName = 'CAI_VALFECCHE'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ibtCaixaCAI_VALFECCART: TFloatField
      FieldName = 'CAI_VALFECCART'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object ibtMov_Caixa: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'MOVIMENTACAO_CAIXA'
    Left = 398
    Top = 64
    object ibtMov_CaixaCAI_NUM: TIntegerField
      FieldName = 'CAI_NUM'
    end
    object ibtMov_CaixaMOV_COD: TIntegerField
      FieldName = 'MOV_COD'
    end
    object ibtMov_CaixaUSE_COD: TIntegerField
      FieldName = 'USE_COD'
    end
    object ibtMov_CaixaMOV_TIP: TIBStringField
      FieldName = 'MOV_TIP'
      Size = 1
    end
    object ibtMov_CaixaMOV_TIP_VAL: TIBStringField
      FieldName = 'MOV_TIP_VAL'
      Size = 3
    end
    object ibtMov_CaixaMOV_VAL: TFloatField
      FieldName = 'MOV_VAL'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ibtMov_CaixaMOV_MOT: TBlobField
      FieldName = 'MOV_MOT'
    end
  end
  object ibtPedido: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PEDIDO'
    Left = 462
    Top = 155
    object ibtPedidoPED_COD: TIntegerField
      FieldName = 'PED_COD'
    end
    object ibtPedidoMESA_COD: TIntegerField
      FieldName = 'MESA_COD'
    end
    object ibtPedidoCAI_NUM: TIntegerField
      FieldName = 'CAI_NUM'
    end
    object ibtPedidoFUN_COD: TIntegerField
      FieldName = 'FUN_COD'
    end
    object ibtPedidoPED_VALTOTAL: TFloatField
      FieldName = 'PED_VALTOTAL'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ibtPedidoPED_DAT: TDateField
      FieldName = 'PED_DAT'
    end
    object ibtPedidoPED_SIT: TIBStringField
      FieldName = 'PED_SIT'
      Size = 1
    end
    object ibtPedidoPGT_DIN: TFloatField
      FieldName = 'PGT_DIN'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ibtPedidoPGT_CART: TFloatField
      FieldName = 'PGT_CART'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ibtPedidoPGT_CHE: TFloatField
      FieldName = 'PGT_CHE'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object ibtItem_Pedido: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    AfterPost = ibtItem_PedidoAfterPost
    BeforePost = ibtItem_PedidoBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'PED_COD'
        DataType = ftInteger
      end
      item
        Name = 'PRO_COD'
        DataType = ftInteger
      end
      item
        Name = 'ITPED_QTD'
        DataType = ftInteger
      end
      item
        Name = 'ITPED_QTDTOTAL'
        DataType = ftInteger
      end
      item
        Name = 'ITPED_VAL'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'INTEG_51'
        Fields = 'PED_COD;PRO_COD'
        Options = [ixUnique]
      end
      item
        Name = 'XPKITEM_PEDIDO'
        Fields = 'PED_COD;PRO_COD'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$FOREIGN34'
        Fields = 'PED_COD'
      end
      item
        Name = 'RDB$FOREIGN35'
        Fields = 'PRO_COD'
      end>
    IndexFieldNames = 'PED_COD;PRO_COD'
    MasterFields = 'PED_COD'
    MasterSource = dsPedido
    StoreDefs = True
    TableName = 'ITEM_PEDIDO'
    Left = 462
    Top = 203
    object ibtItem_PedidoPED_COD: TIntegerField
      FieldName = 'PED_COD'
    end
    object ibtItem_PedidoPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
      OnValidate = ibtItem_PedidoPRO_CODValidate
    end
    object ibtItem_PedidoITPED_QTD: TIntegerField
      FieldName = 'ITPED_QTD'
    end
    object ibtItem_PedidoITPED_QTDTOTAL: TIntegerField
      FieldName = 'ITPED_QTDTOTAL'
    end
    object ibtItem_PedidoITPED_VAL: TFloatField
      FieldName = 'ITPED_VAL'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ibtItem_PedidoNome: TStringField
      FieldKind = fkLookup
      FieldName = 'Nome'
      LookupDataSet = ibtLookProduto
      LookupKeyFields = 'PRO_COD'
      LookupResultField = 'PRO_NOM'
      KeyFields = 'PRO_COD'
      Size = 60
      Lookup = True
    end
    object ibtItem_PedidoValor_Item: TFloatField
      FieldKind = fkLookup
      FieldName = 'Valor_Item'
      LookupDataSet = ibtLookProduto
      LookupKeyFields = 'PRO_COD'
      LookupResultField = 'PRO_PRE'
      KeyFields = 'PRO_COD'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
      Lookup = True
    end
  end
  object dsCaixa: TDataSource
    DataSet = ibtCaixa
    Left = 486
    Top = 9
  end
  object dsMov_Caixa: TDataSource
    DataSet = ibtMov_Caixa
    Left = 486
    Top = 64
  end
  object dsPedido: TDataSource
    DataSet = ibtPedido
    Left = 549
    Top = 155
  end
  object dsItem_Pedido: TDataSource
    DataSet = ibtItem_Pedido
    Left = 549
    Top = 203
  end
  object dsCheque: TDataSource
    DataSet = ibtCheque
    Left = 334
    Top = 104
  end
  object ibtLookProduto: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'PRO_COD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PRO_NOM'
        Attributes = [faRequired]
        DataType = ftString
        Size = 45
      end
      item
        Name = 'GRU_COD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PRO_PRE'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'PRO_TIP'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PRO_ICM'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PRO_UNI'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'PRO_QTD'
        DataType = ftFloat
      end
      item
        Name = 'PRO_ESTMIN'
        DataType = ftFloat
      end
      item
        Name = 'PRO_SIT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PRO_CODTRIBUT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'XPKPRODUTO'
        Fields = 'PRO_COD'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY19'
        Fields = 'PRO_COD'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN43'
        Fields = 'GRU_COD'
      end>
    StoreDefs = True
    TableName = 'PRODUTO'
    Left = 40
    Top = 365
  end
  object dsLookProduto: TDataSource
    DataSet = ibtLookProduto
    Left = 146
    Top = 365
  end
  object qryValidacao: TIBQuery
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      '')
    Left = 463
    Top = 411
  end
  object ibtDep_Cheque: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BeforePost = ibtDep_ChequeBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'CHE_AGEN;CLI_COD;CHE_BANCO;CHE_NUM;CHE_CONTA;DEP_NUM'
    MasterFields = 'CHE_AGEN;CLI_COD;CHE_BANCO;CHE_NUM;CHE_CONTA'
    MasterSource = dsCheque
    TableName = 'DEP_CHEQUE'
    Left = 246
    Top = 160
    object ibtDep_ChequeCHE_AGEN: TIntegerField
      FieldName = 'CHE_AGEN'
    end
    object ibtDep_ChequeCLI_COD: TIntegerField
      FieldName = 'CLI_COD'
    end
    object ibtDep_ChequeCHE_BANCO: TIntegerField
      FieldName = 'CHE_BANCO'
    end
    object ibtDep_ChequeCHE_NUM: TIntegerField
      FieldName = 'CHE_NUM'
    end
    object ibtDep_ChequeCHE_CONTA: TIntegerField
      FieldName = 'CHE_CONTA'
    end
    object ibtDep_ChequeDEP_NUM: TIntegerField
      FieldName = 'DEP_NUM'
    end
    object ibtDep_ChequeDEP_SIT: TIBStringField
      FieldName = 'DEP_SIT'
      OnGetText = evRetornaSituacaoCompleta
      OnSetText = evATribuirSituacaoReduzida
      Size = 1
    end
    object ibtDep_ChequeDEP_LANC: TDateField
      FieldName = 'DEP_LANC'
      Required = True
      OnSetText = ibtDep_ChequeDEP_LANCSetText
      EditMask = '!99/99/9999;1;_'
    end
    object ibtDep_ChequeDEP_DEP: TDateField
      FieldName = 'DEP_DEP'
      OnSetText = ibtDep_ChequeDEP_DEPSetText
      EditMask = '!99/99/9999;1;_'
    end
    object ibtDep_ChequeDEP_OBS: TIBStringField
      FieldName = 'DEP_OBS'
      Size = 40
    end
  end
  object dsDep_Cheque: TDataSource
    DataSet = ibtDep_Cheque
    Left = 334
    Top = 160
  end
  object ibspFaturar: TIBStoredProc
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    StoredProcName = 'FATURAR'
    Left = 608
    Top = 155
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PEDCOD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'USECOD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TROCO'
        ParamType = ptInput
      end>
  end
  object ibtLookMesa: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'MESA'
    Left = 462
    Top = 357
    object ibtLookMesaMESA_COD: TIntegerField
      FieldName = 'MESA_COD'
    end
    object ibtLookMesaSET_COD: TIntegerField
      FieldName = 'SET_COD'
    end
    object ibtLookMesaMESA_LUG: TIntegerField
      FieldName = 'MESA_LUG'
    end
    object ibtLookMesaMESA_SIT: TIBStringField
      FieldName = 'MESA_SIT'
      Size = 1
    end
  end
  object dsLookMesa: TDataSource
    DataSet = ibtLookMesa
    Left = 549
    Top = 357
  end
  object dsCompra: TDataSource
    DataSet = ibtCompra
    Left = 330
    Top = 366
  end
  object ibtContas_Pagar_Compras: TIBTable
    Database = ibdSYS_DATABASE
    Transaction = ibtSYS_DATABASE
    ForcedRefresh = True
    BeforePost = ibtContas_PagarBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'FOR_COD'
        DataType = ftInteger
      end
      item
        Name = 'CONT_NRODOC'
        DataType = ftInteger
      end
      item
        Name = 'CONT_PARC'
        DataType = ftInteger
      end
      item
        Name = 'CONT_VALPAGAR'
        DataType = ftFloat
      end
      item
        Name = 'CONT_VALPAGO'
        DataType = ftFloat
      end
      item
        Name = 'CONT_DATPAG'
        DataType = ftDate
      end
      item
        Name = 'CONT_DATVENC'
        DataType = ftDate
      end
      item
        Name = 'CONT_OBS'
        DataType = ftBlob
      end>
    IndexDefs = <
      item
        Name = 'XPKCONTAS_PAGAR'
        Fields = 'FOR_COD;CONT_NRODOC;CONT_PARC'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY8'
        Fields = 'FOR_COD;CONT_NRODOC;CONT_PARC'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN28'
        Fields = 'FOR_COD'
      end
      item
        Name = 'COMPRAS'
        Fields = 'CONT_PARC;FOR_COD;CONT_NRODOC'
      end>
    IndexFieldNames = 'FOR_COD;CONT_NRODOC'
    MasterFields = 'FOR_COD;COM_NRODOC'
    MasterSource = dsCompra
    StoreDefs = True
    TableName = 'CONTAS_PAGAR'
    Left = 246
    Top = 308
    object FloatField1: TFloatField
      FieldName = 'CONT_VALPAGAR'
      Required = True
      OnValidate = ibtContas_PagarCONT_VALPAGARValidate
      DisplayFormat = 'R$ ,0.00'
      EditFormat = 'R$ ,0.00'
    end
    object DateField1: TDateField
      FieldName = 'CONT_DATVENC'
      Required = True
      OnSetText = ibtContas_PagarCONT_DATVENCSetText
      EditMask = '!99/99/9999;1;_'
    end
    object FloatField2: TFloatField
      FieldName = 'CONT_VALPAGO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object DateField2: TDateField
      FieldName = 'CONT_DATPAG'
      OnSetText = ibtContas_PagarCONT_DATPAGSetText
      EditMask = '!99/99/9999;1;_'
    end
    object BlobField1: TBlobField
      FieldName = 'CONT_OBS'
      OnGetText = ibtContas_PagarCONT_OBSGetText
      Size = 8
    end
    object IntegerField1: TIntegerField
      FieldName = 'CONT_PARC'
      Required = True
      OnValidate = ibtContas_PagarCONT_PARCValidate
    end
    object IntegerField2: TIntegerField
      FieldName = 'FOR_COD'
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'CONT_NRODOC'
      Required = True
    end
  end
  object dsContas_Pagar_Compras: TDataSource
    DataSet = ibtContas_Pagar_Compras
    Left = 333
    Top = 308
  end
end

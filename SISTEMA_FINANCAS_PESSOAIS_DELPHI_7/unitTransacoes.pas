unit unitTransacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, CheckLst;

type
  TformCadTransacao = class(TForm)
    cbCategoria: TComboBox;
    cbSubcategoria: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cbConta: TComboBox;
    Label3: TLabel;
    cbPagoRecebido: TComboBox;
    Label4: TLabel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    stringGridTransacoes: TStringGrid;
    btnPesquisarPorData: TBitBtn;
    mskDataInicio: TMaskEdit;
    mskDataFinal: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    rdCcr: TRadioButton;
    rdDespesaFixa: TRadioButton;
    txtParcelas: TLabeledEdit;
    rdNormal: TRadioButton;
    labelMsgCcr: TStaticText;
    btnHoje: TBitBtn;
    btnMesAnterior: TBitBtn;
    btnMesPosterior: TBitBtn;
    labelDataPesquisa: TLabel;
    Bevel2: TBevel;
    btnAddConta: TBitBtn;
    btnAddCategoria: TBitBtn;
    btnAddsubcategoria: TBitBtn;
    btnCancelarAlteracao: TBitBtn;
    btnAlterar: TBitBtn;
    txtId: TLabeledEdit;
    btnDeletar: TBitBtn;
    labelContagemRegistrosStringGrid: TLabel;
    cbTransacoesExclusao: TComboBox;
    ckNormal: TCheckBox;
    ckFixa: TCheckBox;
    ckCcr: TCheckBox;
    txtData: TMaskEdit;
    StaticText2: TStaticText;
    Label7: TLabel;
    txtValor: TMaskEdit;
    cbDescricao: TComboBox;
    stringGridTotalCategoriaMes: TStringGrid;
    stringGridTotalSubCategoriaMes: TStringGrid;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    labelSomaValoresClicados: TLabel;
    txtDescricao: TLabeledEdit;
    txtCampoPesquisa: TLabeledEdit;
    BitBtn2: TBitBtn;
    labelValorFormatado: TLabel;
    Bevel3: TBevel;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisarPorDataClick(Sender: TObject);

    procedure insereDespesaBd(dataPr : string; contaPr : String; descricaoPr : string;
      valorPr : Double; categoriaPr : String; subcategoriaPr : String; pagoRecebidoPr : String);

    procedure insereDespesaBdCcr(dataPr : string; contaPr : String; descricaoPr : string;
      valorPr : Double; categoriaPr : String; subcategoriaPr : String; pagoRecebidoPr : String; numParcelasCcrPr : Integer);

    procedure insereDespesaBdFixa(dataPr : string; contaPr : String; descricaoPr : string;
      valorPr : Double; categoriaPr : String; subcategoriaPr : String; pagoRecebidoPr : String);

    procedure rdCcrClick(Sender: TObject);
    procedure rdDespesaFixaClick(Sender: TObject);
    procedure rdNormalClick(Sender: TObject);

    procedure stringGridTransacoesDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);

    procedure iniciaMesPesquisa();
    procedure btnMesPosteriorClick(Sender: TObject);
    procedure btnMesAnteriorClick(Sender: TObject);
    procedure btnHojeClick(Sender: TObject);

    procedure stringGridTransacoesMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure pesquisaBdCliqueStringGrid(X, Y : Integer);
    procedure mudaCoresLinhasStringgrid(ACol, ARow : Integer; rect : TRect; color : COLORREF; prStringGrid : TStringGrid);
    procedure btnCancelarAlteracaoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);

    procedure alteraDespesaBd(dataPr : string; contaPr : String; descricaoPr : string;
      valorPr : Double; categoriaPr : String; subcategoriaPr : String; pagoRecebidoPr : String);

    procedure btnAddCategoriaClick(Sender: TObject);
    procedure deletaDespesaBd();
    procedure btnDeletarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cancelarAlteracao();
    procedure deletaDespesaBdCcr();
    procedure deletaDespesaBdFixa();
    //procedure identificaCamposNaoPreenchidos();
    //procedure limpaListaCamposNaoPreenchidos();
    procedure verificaTipoTransacoesExclusao();
    procedure txtValorKeyPress(Sender: TObject; var Key: Char);
    procedure inabilitaAlteracao();
    procedure habilitaAlteracao();

    procedure txtDescricaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure carregaIntervaloDatasIniciar();
    procedure setEstadoComponentesAoIniciar();
    function sqlGeral(prMskDataInicio, prMskDataFinal : TMaskEdit) : string;
    function sqlTotalPorCategoria(prMskDataInicio, prMskDataFinal : TMaskEdit) : string;
    function sqlTotalPorSubCategoria(prMskDataInicio, prMskDataFinal : TMaskEdit) : string;

    procedure stringGridTotalCategoriaMesDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);

    procedure stringGridTotalSubCategoriaMesDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);

    procedure btnMudaGridClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure stringGridTotalCategoriaMesDblClick(Sender: TObject);
    function sqlTotalPorCategoriaWhereCategoria(prMskDataInicio, prMskDataFinal : TMaskEdit) : string;
    function sqlTotalPorSubCategoriaWhereSubcategoria(prMskDataInicio, prMskDataFinal : TMaskEdit) : string;
    procedure cbCategoriaChange(Sender: TObject);
    procedure cbSubcategoriaChange(Sender: TObject);
    procedure cbDescricaoChange(Sender: TObject);
    procedure cbDescricaoExit(Sender: TObject);
    procedure mskDataInicioChange(Sender: TObject);
    procedure mskDataFinalChange(Sender: TObject);

    procedure txtCampoPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    function sqlTotalPorCategoriaWhereDescricao(prMskDataInicio,
      prMskDataFinal : TMaskEdit) : string;

    function sqlTotalPorCategoriaWhereValor(prMskDataInicio,
      prMskDataFinal : TMaskEdit) : string;

    function sqlTotalPorCategoriaWhereCategoria2(prMskDataInicio,
      prMskDataFinal : TMaskEdit) : string;

    function sqlTotalPorCategoriaWhereSubcategoria2(prMskDataInicio,
      prMskDataFinal : TMaskEdit) : string;

    function sqlTotalPorCategoriaWherePagoRecebido(prMskDataInicio,
      prMskDataFinal : TMaskEdit) : string;

    function sqlTotalPorCategoriaWhereData(prMskDataInicio,
      prMskDataFinal : TMaskEdit) : string;

    function sqlTotalPorCategoriaWhereConta(prMskDataInicio,
      prMskDataFinal : TMaskEdit) : string;
    procedure txtCampoPesquisaExit(Sender: TObject);
    procedure btnAddContaClick(Sender: TObject);
    procedure btnAddsubcategoriaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure txtValorChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadTransacao: TformCadTransacao;
  slExclusao, ultimoDiaMesPesquisa : Integer;
  tipoTransacoesExclusao, sql : String;
  strConvertidaFloat : Double;

implementation

uses dataModule, DB, ADODB, StrUtils, DateUtils, unitPrincipal,
  unitOrcamento, UnitCalculadora, UnitGlobal, unitCadastroConta,
  unitCadastroSubcategoria, unitReceita, unitCarregamento;

{$R *.dfm}

//Insere transacoes no banco de dados ===========================================
procedure TformCadTransacao.insereDespesaBd(dataPr : string; contaPr : String; descricaoPr : string; valorPr : Double; categoriaPr : String; subcategoriaPr : String; pagoRecebidoPr : String);
begin
  BDState := stBdInsert;
  with dmDados.query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO DADOS_INTEGRADOS (DATA, CONTA, DESCRICAO, VALOR, CATEGORIA, SUBCATEGORIA, PAGO_RECEBIDO) VALUES (:dataPr,:contaPr,:descricaoPr,:valorPr,:categoriaPr,:subcategoriaPr,:pagoRecebidoPr)');
    Parameters.ParamByName('dataPr').Value := dataPr;
    Parameters.ParamByName('contaPr').Value := contaPr;
    Parameters.ParamByName('descricaoPr').Value := descricaoPr;
    Parameters.ParamByName('valorPr').Value := -valorPr;
    Parameters.ParamByName('categoriaPr').Value := categoriaPr;
    Parameters.ParamByName('subcategoriaPr').Value := subcategoriaPr;
    Parameters.ParamByName('pagoRecebidoPr').Value := pagoRecebidoPr;
    ExecSQL;
  end;
  ShowMessage('Dados inseridos com sucesso!');
  //alimentaStringGrid();

  alimentaStringGridDinamica(stringGridTransacoes, sqlGeral(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalCategoriaMes, sqlTotalPorCategoria(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalSubCategoriaMes, sqlTotalPorSubCategoria(mskDataInicio, mskDataFinal));

  BDState := stBdNormal;
end;
//==============================================================================

//Altera transacoes no banco de dados ==========================================
procedure TformCadTransacao.alteraDespesaBd(dataPr : string; contaPr : String; descricaoPr : string; valorPr : Double; categoriaPr : String; subcategoriaPr : String; pagoRecebidoPr : String);
begin
  BDState := stBdUpdate;
  with dmDados.query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE DADOS_INTEGRADOS SET DATA = :dataPr, CONTA = :contaPr, DESCRICAO = :descricaoPr, VALOR = :valorPr, CATEGORIA = :categoriaPr, SUBCATEGORIA = :subcategoriaPr, PAGO_RECEBIDO = :pagoRecebidoPr WHERE IDENTIFICA��O = ' + cbTransacoesExclusao.Items[0]);
    Parameters.ParamByName('dataPr').Value := dataPr;
    Parameters.ParamByName('contaPr').Value := contaPr;
    Parameters.ParamByName('descricaoPr').Value := descricaoPr;
    Parameters.ParamByName('valorPr').Value := -valorPr;
    Parameters.ParamByName('categoriaPr').Value := categoriaPr;
    Parameters.ParamByName('subcategoriaPr').Value := subcategoriaPr;
    Parameters.ParamByName('pagoRecebidoPr').Value := pagoRecebidoPr;
    ExecSQL;
  end;
  ShowMessage('Dados alterados com sucesso!');
  //alimentaStringGrid();

  alimentaStringGridDinamica(stringGridTransacoes, sqlGeral(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalCategoriaMes, sqlTotalPorCategoria(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalSubCategoriaMes, sqlTotalPorSubCategoriaWhereSubcategoria(mskDataInicio, mskDataFinal));

  BDState := stBdNormal;
end;
//==============================================================================

//Deleta transacoes no banco de dados ==========================================
procedure TformCadTransacao.deletaDespesaBd();
var
  i : Integer;
begin
  BDState := stBdDelete;
  with dmDados.query do
  begin
    Close;
    SQL.Clear;

    if slExclusao > 1 then
    begin
      if ckFixa.Checked then
        deletaDespesaBdFixa;
      if ckCcr.Checked then
        deletaDespesaBdCcr;

      for i := 0 to slExclusao - 1 do
      begin
        SQL.Clear;
        SQL.Add('DELETE FROM DADOS_INTEGRADOS WHERE IDENTIFICA��O = ' + cbTransacoesExclusao.Items[i]);
        ExecSQL;
      end;
    end
    else
    begin
      SQL.Add('DELETE FROM DADOS_INTEGRADOS WHERE IDENTIFICA��O = ' + cbTransacoesExclusao.Items[0]);
      ExecSQL;
    end
  end;
  //ShowMessage('Dados deletados com sucesso!');
  //alimentaStringGrid();

  alimentaStringGridDinamica(stringGridTransacoes, sqlGeral(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalCategoriaMes, sqlTotalPorCategoria(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalSubCategoriaMes, sqlTotalPorSubCategoria(mskDataInicio, mskDataFinal));

  BDState := stBdNormal;
end;
//==============================================================================

//Insere transacoes com cart�o de cr�dito no banco de dados ===========================================
procedure TformCadTransacao.insereDespesaBdCcr(dataPr : string; contaPr : String; descricaoPr : string; valorPr : Double; categoriaPr : String; subcategoriaPr : String; pagoRecebidoPr : String; numParcelasCcrPr : Integer);
var
  i, mesData, anodata, idCcr : integer;
  diaData, dataSequencia : String;
begin
  BDState := stBdInsert;
  diaData := LeftStr(dataPr,2);
  mesData := StrToInt(LeftStr(RightStr(dataPr,7),2));
  anoData := StrToInt(RightStr(dataPr,4));
  with dmDados.query do
  begin
    dmDados.dataSet.CommandText := 'SELECT LAST(ID_CCR) AS ID_CCR FROM IDS';
    dmDados.dataSet.Open;
    idCcr := dmDados.dataSet.FieldByName('ID_CCR').AsInteger;
    dmDados.dataSet.Close;

    idCcr := idCcr + 1;

    dmDados.query.Close;
    dmDados.query.SQL.Clear;
    dmDados.query.SQL.Add('INSERT INTO IDS (ID_CCR) VALUES ('+ IntToStr(idCcr) + ')');
    dmDados.query.ExecSQL;

    for i := 1 to numParcelasCcrPr do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO '+
                'DADOS_INTEGRADOS '+
                  '(DATA, '+
                  'CONTA, '+
                  'DESCRICAO, '+
                  'VALOR, '+
                  'CATEGORIA, '+
                  'SUBCATEGORIA,' +
                  'PAGO_RECEBIDO, '+
                  'TIPO_TRANSACAO, '+
                  'NUM_PARCELAS_CCR, '+
                  'ID_CCR)' +
                'VALUES ( '+
                  ':dataPr, '+
                  ':contaPr, '+
                  ':descricaoPr, '+
                  ':valorPr, '+
                  ':categoriaPr, ' +
                  ':subcategoriaPr, '+
                  ':pagoRecebidoPr, '+
                  '"CCR", '+
                  ':numParcelasCcrPr, '+
                  IntToStr(idCcr) +');');

      dataSequencia := diaData + '/' + IntToStr(mesData) + '/' + IntToStr(anoData);
      Parameters.ParamByName('dataPr').Value := dataSequencia;
      Parameters.ParamByName('contaPr').Value := contaPr;
      Parameters.ParamByName('descricaoPr').Value := descricaoPr + ' (' + IntToStr(i) + ' de' + ' ' + IntToStr(numParcelasCcrPr) + ')';
      Parameters.ParamByName('valorPr').Value := -valorPr;
      Parameters.ParamByName('categoriaPr').Value := categoriaPr;
      Parameters.ParamByName('subcategoriaPr').Value := subcategoriaPr;
      Parameters.ParamByName('pagoRecebidoPr').Value := pagoRecebidoPr;
      Parameters.ParamByName('NumParcelasCcrPr').Value := numParcelasCcrPr;

      {Se o m�s da parcela que est� sendo inserida no momento for menor que 12,
      ou seja, menor que dezembro, o m�s � incrementado.}
      if mesData < 12 then
      begin
        mesData := mesData + 1;
      end
      {Caso contr�rio, se o m�s for igual a 12 (dezembro) ent�o a vari�vel recebe 1
      novamente. Isso acontece para n�o deixar passar valores maiores que 12, o que
      causaria erro, pois n�o h� nenhum m�s ap�s dezembro}
      else
      begin
        mesData := 1;
        anoData := anoData + 1;
      end;

      ExecSQL;
    end;
  end;
  ShowMessage('Dados inseridos com sucesso!');
  rdNormal.Checked := True;
  txtParcelas.Visible := False;
  txtParcelas.Text := '';
  //alimentaStringGrid();

  alimentaStringGridDinamica(stringGridTransacoes, sqlGeral(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalCategoriaMes, sqlTotalPorCategoria(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalSubCategoriaMes, sqlTotalPorSubCategoria(mskDataInicio, mskDataFinal));

  BDState := stBdNormal;
end;
//==============================================================================

//Deleta transacoes de cart�o de cr�dito do banco de dados ===========================================
procedure TformCadTransacao.deletaDespesaBdCcr();
var
  i, idCcr : Integer;
begin
  BDState := stBdDelete;
  with dmDados.query do
  begin
    Close;
    SQL.Clear;

    if slExclusao > 1 then
    begin
      for i := 0 to slExclusao - 1 do
      begin
        dmDados.dataSet.CommandText := 'SELECT ID_CCR FROM DADOS_INTEGRADOS WHERE IDENTIFICA��O = ' + cbTransacoesExclusao.Items[i];
        dmDados.dataSet.Open;
        idCcr := dmDados.dataSet.FieldByName('ID_CCR').AsInteger;
        dmDados.dataSet.Close;

        if idCcr > 0 then
        begin
          SQL.Clear;
          SQL.Add('DELETE FROM DADOS_INTEGRADOS WHERE ID_CCR = ' + IntToStr(idCcr));
          ExecSQL;

          SQL.Clear;
          SQL.Add('DELETE FROM IDS WHERE ID_CCR = ' + IntToStr(idCcr));
          ExecSQL;
        end;
      end;
    end
    else
    begin
      dmDados.dataSet.CommandText := 'SELECT ID_CCR AS ID_CCR FROM DADOS_INTEGRADOS WHERE IDENTIFICA��O = ' + cbTransacoesExclusao.Items[0];
      dmDados.dataSet.Open;
      idCcr := dmDados.dataSet.FieldByName('ID_CCR').AsInteger;
      dmDados.dataSet.Close;

      SQL.Clear;
      SQL.Add('DELETE FROM DADOS_INTEGRADOS WHERE ID_CCR = ' + IntToStr(idCcr));
      ExecSQL;
      SQL.Clear;
      SQL.Add('DELETE FROM IDS WHERE ID_CCR = ' + IntToStr(idCcr));
      ExecSQL;
    end
  end;
  //ShowMessage('Dados deletados com sucesso!');
  //cbTransacoesExclusao.Clear();
  //alimentaStringGrid();

  alimentaStringGridDinamica(stringGridTransacoes, sqlGeral(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalCategoriaMes, sqlTotalPorCategoria(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalSubCategoriaMes, sqlTotalPorSubCategoria(mskDataInicio, mskDataFinal));

  BDState := stBdNormal;
end;
//==============================================================================

//Insere transacoes fixas no banco de dados ===========================================
procedure TformCadTransacao.insereDespesaBdFixa(dataPr : string; contaPr : String; descricaoPr : string; valorPr : Double; categoriaPr : String; subcategoriaPr : String; pagoRecebidoPr : String);
var
  i, mesData, anoData, idFixa : integer;
  diaData, dataSequencia : String;
begin
  BDState := stBdInsert;
  diaData := LeftStr(dataPr,2);
  mesData := StrToInt(LeftStr(RightStr(DateToStr(now),7),2));
  anoData := StrToInt(RightStr(dataPr,4));

  with dmDados.query do
  begin
    dmDados.dataSet.CommandText := 'SELECT LAST(ID_FIXA) AS ID_FIXA FROM IDS';
    dmDados.dataSet.Open;
    idFixa := dmDados.dataSet.FieldByName('ID_FIXA').AsInteger;
    dmDados.dataSet.Close;

    idFixa := idFixa + 1;

    dmDados.query.Close;
    dmDados.query.SQL.Clear;
    dmDados.query.SQL.Add('INSERT INTO IDS (ID_FIXA) VALUES ('+ IntToStr(idFixa) + ')');
    dmDados.query.ExecSQL;

    for i := 1 to 13 - mesData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO DADOS_INTEGRADOS (DATA,' +
      'CONTA, DESCRICAO, VALOR, CATEGORIA, SUBCATEGORIA,' +
      'PAGO_RECEBIDO, TIPO_TRANSACAO, ID_FIXA) VALUES (:dataPr,:contaPr,:descricaoPr,' +
      ':valorPr,:categoriaPr,:subcategoriaPr,:pagoRecebidoPr,"FIXA '+ IntToStr(i) +'",'+ IntToStr(idFixa) +')');
      dataSequencia := diaData + '/' + IntToStr(mesData) + '/' + IntToStr(anoData);
      Parameters.ParamByName('dataPr').Value := dataSequencia;
      Parameters.ParamByName('contaPr').Value := contaPr;
      Parameters.ParamByName('descricaoPr').Value := descricaoPr + ' (FIXA)';
      Parameters.ParamByName('valorPr').Value := -valorPr;
      Parameters.ParamByName('categoriaPr').Value := categoriaPr;
      Parameters.ParamByName('subcategoriaPr').Value := subcategoriaPr;
      Parameters.ParamByName('pagoRecebidoPr').Value := pagoRecebidoPr;

      if mesData < 12 then
      begin
        mesData := mesData + 1;
      end
      else
      begin
        mesData := 1;
        anoData := anoData + 1;
      end;

      ExecSQL;
    end;
  end;
  ShowMessage('Dados inseridos com sucesso!');
  //alimentaStringGrid();

  alimentaStringGridDinamica(stringGridTransacoes, sqlGeral(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalCategoriaMes, sqlTotalPorCategoria(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalSubCategoriaMes, sqlTotalPorSubCategoria(mskDataInicio, mskDataFinal));

  rdNormal.Checked := True;

  BDState := stBdNormal;
end;
//==============================================================================

//Deleta transacoes fixas do banco de dados ===========================================
procedure TformCadTransacao.deletaDespesaBdFixa();
var
  i, idFixa : Integer;
begin
  BDState := stBdDelete;
  with dmDados.query do
  begin
    Close;
    SQL.Clear;

    if slExclusao > 1 then
    begin
      for i := 0 to slExclusao - 1 do
      begin
        dmDados.dataSet.CommandText := 'SELECT ID_FIXA FROM DADOS_INTEGRADOS WHERE IDENTIFICA��O = ' + cbTransacoesExclusao.Items[i];
        dmDados.dataSet.Open;
        idFixa := dmDados.dataSet.FieldByName('ID_FIXA').AsInteger;
        dmDados.dataSet.Close;

        if idFixa > 0 then
        begin
          SQL.Clear;
          SQL.Add('DELETE FROM DADOS_INTEGRADOS WHERE ID_FIXA = ' + IntToStr(idFixa));
          ExecSQL;

          SQL.Clear;
          SQL.Add('DELETE FROM IDS WHERE ID_FIXA = ' + IntToStr(idFixa));
          ExecSQL;
        end
      end;
    end
    else
    begin
      dmDados.dataSet.CommandText := 'SELECT ID_FIXA FROM DADOS_INTEGRADOS WHERE IDENTIFICA��O = ' + cbTransacoesExclusao.Items[0];
      dmDados.dataSet.Open;
      idFixa := dmDados.dataSet.FieldByName('ID_FIXA').AsInteger;
      dmDados.dataSet.Close;

      SQL.Clear;
      SQL.Add('DELETE FROM DADOS_INTEGRADOS WHERE ID_FIXA = ' + IntToStr(idFixa));
      ExecSQL;
      SQL.Clear;
      SQL.Add('DELETE FROM IDS WHERE ID_FIXA = ' + IntToStr(idFixa));
      ExecSQL;
    end
  end;
  //ShowMessage('Dados deletados com sucesso!');
  //cbTransacoesExclusao.Clear();
  //alimentaStringGrid();

  alimentaStringGridDinamica(stringGridTransacoes, sqlGeral(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalCategoriaMes, sqlTotalPorCategoria(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalSubCategoriaMes, sqlTotalPorSubCategoria(mskDataInicio, mskDataFinal));

  BDState := stBdNormal;
end;
//==============================================================================

//Inicia o m�s da pesquisa =====================================================
procedure TformCadTransacao.iniciaMesPesquisa();
var
linha : integer;
begin
  BDState := stBdNormal;
  mesInicioPesquisa := StrToInt(LeftStr(RightStr(DateToStr(now),7),2));;
  anoInicioPesquisa := StrToInt(RightStr(DateToStr(now),4));
  mesPesquisa := mesInicioPesquisa;
  anoPesquisa := anoInicioPesquisa;
  labelDataPesquisa.Caption := nomesMesesPesquisa[mesInicioPesquisa] + ' ' + IntToStr(anoInicioPesquisa);

  mesPesquisaStr := IntToStr(mesInicioPesquisa);
  mskDataInicio.Text := '01/' + mesPesquisaStr + '/'+ IntToStr(anoPesquisa);
  mskDataFinal.Text := DateToStr(EndOfTheMonth(StrToDate(mskDataInicio.Text)));

  alimentaStringGridDinamica(stringGridTransacoes, sqlGeral(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalCategoriaMes, sqlTotalPorCategoriaWhereCategoria(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalSubCategoriaMes, sqlTotalPorSubCategoriaWhereSubcategoria(mskDataInicio, mskDataFinal));

  labelContagemRegistrosStringGrid.Caption := totalRetornoRegistro;
end;
//==============================================================================

//Eventos **********************************************************************
procedure TformCadTransacao.FormShow(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  formAberto := nmFORM_DESPESA;

  Color := rgb(204,209,209);

  carregaIntervaloDatasIniciar();

  setEstadoComponentesAoIniciar();

  alimentaCombo('SELECT NOME_CATEGORIA FROM CATEGORIA WHERE TIPO_CATEGORIA = "DESPESA" OR TIPO_CATEGORIA = "AMBOS" ORDER BY C�DIGO', cbCategoria);
  alimentaCombo('SELECT NOME_SUBCATEGORIA FROM SUBCATEGORIA WHERE TIPO_CATEGORIA = "DESPESA" OR TIPO_CATEGORIA = "AMBOS" ORDER BY C�DIGO', cbSubcategoria);
  alimentaCombo('SELECT NOME_CONTA FROM CONTA', cbConta);
  alimentaCombo('SELECT STATUS FROM PAGO_RECEBIDO', cbPagoRecebido);

  iniciaMesPesquisa;
  Screen.Cursor := crDefault;
end;

procedure TformCadTransacao.btnOkClick(Sender: TObject);
begin
  if identificaCamposNaoPreenchidos(formCadTransacao) then
    Exit;

  if rdNormal.Checked then
  begin
    insereDespesaBd(txtData.Text, cbConta.Text, txtDescricao.Text, StrToFloat(txtValor.Text), cbCategoria.Text, cbSubcategoria.Text, cbPagoRecebido.Text);
  end
  else if rdCcr.Checked then
  begin
    insereDespesaBdCcr(txtData.Text, cbConta.Text, txtDescricao.Text, StrToFloat(txtValor.Text), cbCategoria.Text, cbSubcategoria.Text, cbPagoRecebido.Text, StrToInt(txtParcelas.Text));
  end
  else
    insereDespesaBdFixa(txtData.Text, cbConta.Text, txtDescricao.Text, StrToFloat(txtValor.Text), cbCategoria.Text, cbSubcategoria.Text, cbPagoRecebido.Text);

  setEstadoComponentesAoIniciar;
  stringGridTransacoes.RowCount := stringGridTransacoes.RowCount + 1;
  alimentaStringGridDinamica(stringGridTransacoes, sqlGeral(mskDataInicio, mskDataFinal));

  labelContagemRegistrosStringGrid.Caption := totalRetornoRegistro;
end;

procedure TformCadTransacao.btnCancelarClick(Sender: TObject);
begin
  txtData.Text := '';
  txtDescricao.Text := '';
  txtParcelas.Text := '';
  txtValor.Text := '';
  txtId.Text := '';
  txtId.Visible := False;
  cbConta.Text := '';
  cbCategoria.Text := '';
  cbSubcategoria.Text := '';
  cbPagoRecebido.Text := '';
  rdNormal.Checked := True;
  btnOk.Visible := True;
  btnDeletar.Visible := False;
  formCadTransacao.Close;
  habilitaAlteracao;
end;

procedure TformCadTransacao.btnPesquisarPorDataClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  alimentaStringGridDinamica(stringGridTransacoes, sqlGeral(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalCategoriaMes, sqlTotalPorCategoria(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalSubCategoriaMes, sqlTotalPorSubCategoria(mskDataInicio, mskDataFinal));

  labelContagemRegistrosStringGrid.Caption := totalRetornoRegistro;
  Screen.Cursor := crDefault;
end;

procedure TformCadTransacao.rdCcrClick(Sender: TObject);
begin
  txtParcelas.Visible := True;
  labelMsgCcr.Visible := True;
  cbPagoRecebido.Text := 'N�O';
  cbPagoRecebido.Enabled := False;
end;

procedure TformCadTransacao.rdDespesaFixaClick(Sender: TObject);
begin
  txtParcelas.Visible := False;
  txtParcelas.Text := '';
  labelMsgCcr.Visible := False;
  cbPagoRecebido.Enabled := True;
end;

procedure TformCadTransacao.rdNormalClick(Sender: TObject);
begin
  txtParcelas.Visible := False;
  txtParcelas.Text := '';
  labelMsgCcr.Visible := False;
  cbPagoRecebido.Enabled := True;
end;

procedure TformCadTransacao.stringGridTransacoesDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var s : String;
begin
  if ARow = 0 then
  begin
    s := stringGridTransacoes.Cells[ACol, ARow];
    stringGridTransacoes.Canvas.Brush.Color := clGray;
    stringGridTransacoes.Canvas.FillRect(Rect);
    stringGridTransacoes.Canvas.Font.Color := clBlack;
    stringGridTransacoes.Canvas.Font.Style := [fsBold];
    stringGridTransacoes.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, s);
  end
  else if stringGridTransacoes.Cells[4,ARow] <> '' then
  begin
    s := stringGridTransacoes.Cells[ACol, ARow];
    stringGridTransacoes.Canvas.Brush.Color := rgb(RGB_VERMELHO_1.R, RGB_VERMELHO_1.G, RGB_VERMELHO_1.B);
    stringGridTransacoes.Canvas.FillRect(Rect);
    stringGridTransacoes.Canvas.Font.Color := clBlack;
    stringGridTransacoes.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, s);
  end;
  mudaCoresLinhasStringgrid(ARow, ACol, Rect, clBlack, stringGridTransacoes);
end;

procedure TformCadTransacao.btnMesPosteriorClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  UnitGlobal.somaValoresClicados := 0;
  labelSomaValoresClicados.Caption := '';

  cancelarAlteracao;

  proximoMesPesquisa(mskDataInicio, mskDataFinal, labelDataPesquisa);

  stringGridTotalCategoriaMes.RowCount := 0;
  stringGridTotalSubCategoriaMes.RowCount := 0;

  alimentaStringGridDinamica(stringGridTransacoes, sqlGeral(mskDataInicio, mskDataFinal));

  labelContagemRegistrosStringGrid.Caption := totalRetornoRegistro;

  setEstadoComponentesAoIniciar;
  Screen.Cursor := crDefault;
end;

procedure TformCadTransacao.btnMesAnteriorClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  UnitGlobal.somaValoresClicados := 0;
  labelSomaValoresClicados.Caption := '';

  cancelarAlteracao;

  mesAnteriorPesquisa(mskDataInicio, mskDataFinal, labelDataPesquisa);

  stringGridTotalCategoriaMes.RowCount := 0;
  stringGridTotalSubCategoriaMes.RowCount := 0;

  alimentaStringGridDinamica(stringGridTransacoes, sqlGeral(mskDataInicio, mskDataFinal));

  labelContagemRegistrosStringGrid.Caption := totalRetornoRegistro;

  setEstadoComponentesAoIniciar;
  Screen.Cursor := crDefault;
end;

procedure TformCadTransacao.btnHojeClick(Sender: TObject);
begin
  txtData.Text := DateToStr(now);
end;

procedure TformCadTransacao.stringGridTransacoesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  btnAlterar.Visible := True;
  btnCancelarAlteracao.Visible := True;
  //btnCancelar.Visible := True;
  btnOk.Visible := False;
  //txtId.Visible := True;

  pesquisaBdCliqueStringGrid(X, Y);

  alimentaStringGridDinamica(stringGridTotalCategoriaMes, sqlTotalPorCategoriaWhereCategoria(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalSubCategoriaMes, sqlTotalPorSubCategoriaWhereSubcategoria(mskDataInicio, mskDataFinal));
end;

procedure TformCadTransacao.verificaTipoTransacoesExclusao();
begin
  if (ckNormal.Checked) and (ckCcr.Checked) and (ckFixa.Checked) then
    tipoTransacoesExclusao := deletandoNormalAcompanhada;

  if (ckNormal.Checked) and (ckCcr.Checked) and (not ckFixa.Checked) then
    tipoTransacoesExclusao := deletandoNormalAcompanhada;

  if (ckNormal.Checked) and (not ckCcr.Checked) and (ckFixa.Checked) then
    tipoTransacoesExclusao := deletandoNormalAcompanhada;

  if (ckNormal.Checked) and (not ckCcr.Checked) and (not ckFixa.Checked) then
    tipoTransacoesExclusao := deletandoApenasNormal;
end;

//Pesquisa no banco de dados com base no clique na StringGrid ==================
procedure TformCadTransacao.pesquisaBdCliqueStringGrid(X, Y : Integer);
var
  Column, Row: Longint;
  id, i, contNormal, contCcr, contFixa: Integer;
  tipoTransacao, valorClicadoSemSimbolos : String;
begin
  stringGridTransacoes.MouseToCell(X, Y, Column, Row);

  {Remove a formata��o de moeda da coluna 4 da grid, adim de n�o dar nenhum
  erro de convers�o ao realizar os procedimentos abaixo}
  removeConcStringNaStringGrid(stringGridTransacoes, 4);

  {Caso a linha clicada na grid n�o seja o cabe�alho}
  if Row > 0 then
  begin
    {Caso a linha clicada n�o esteja selecionada, adiciona o X no s�mbolo de
    check "[ X ]"}
    if stringGridTransacoes.Cells[0,Row] <> '[  X  ]' then
    begin
      stringGridTransacoes.Cells[0,Row] := '[  X  ]';

      {Adiciona o id do �tem da linha selecionada na combo box de transa��es
      para deletar}
      cbTransacoesExclusao.Items.Add(stringGridTransacoes.Cells[1,Row]);
      valorClicadoSemSimbolos := StringReplace(stringGridTransacoes.Cells[4, Row], 'R$', '', [rfReplaceAll, rfIgnoreCase]);
      UnitGlobal.somaValoresClicados := UnitGlobal.somaValoresClicados + StrToFloat(valorClicadoSemSimbolos);
      labelSomaValoresClicados.Caption := 'R$ ' + FormatFloat('#,0.00', UnitGlobal.somaValoresClicados);
    end
    {Caso a linha clicada j� esteja selecionada, retira o X no s�mbolo
    de check "[ X ]"}
    else
    begin
      stringGridTransacoes.Cells[0,Row] := '[    ]';

      {Remove o id do �tem da linha selecionada da combo box de transa��es
      para deletar}
      cbTransacoesExclusao.Items.Delete(cbTransacoesExclusao.Items.IndexOf(stringGridTransacoes.Cells[1,Row]));
      valorClicadoSemSimbolos := StringReplace(stringGridTransacoes.Cells[4, Row], 'R$', '', [rfReplaceAll, rfIgnoreCase]);
      UnitGlobal.somaValoresClicados := UnitGlobal.somaValoresClicados - StrToFloat(valorClicadoSemSimbolos);
      labelSomaValoresClicados.Caption := 'R$ ' + FormatFloat('#,0.00', UnitGlobal.somaValoresClicados);
    end;
  end;

  {Inicializa a vari�vel contadora de �tens para exclus�o}
  slExclusao := 0;
  for i := 0 to stringGridTransacoes.RowCount - 1 do
  begin
    {Para cada linha clicada na grid soma 1 na vari�vel contadora de �tens para
    xclus�o}
    if stringGridTransacoes.Cells[0, i] = '[  X  ]' then
      slExclusao := slExclusao + 1;
  end;

  {Caso exista �tens selecionados na grid}
  if slExclusao > 0 then
  begin
    {Altera o nome do bot�o deletar de acordo com o n�mero de �tens}
    {Se estiver marcado 1 �tem o nome ser�: Deletar 1 transa��o}
    {Se estiver marcado 2 �tens o nome ser�: Deletar 2 transa��es}
    {E assim por diante}
    if slExclusao = 1 then
      btnDeletar.Caption := 'Deletar ' + '(' + IntToStr(slExclusao) + ' transa��o)'
    else
      btnDeletar.Caption := 'Deletar ' + '(' + IntToStr(slExclusao) + ' transa��es)'
  end
  else
  begin
    {Caso n�o exista nenhum �tem selecionado na grid}
    {Mant�m apenas "Deletar" como nome do bot�o deletar}
    btnDeletar.Caption := 'Deletar';

    {Zera a soma de valores clicados, bem como atuaiza o caption da label que
    mostra esse valor}
    UnitGlobal.somaValoresClicados := 0;
    labelSomaValoresClicados.Caption := '';
  end;

  {Manda o codigo da linha selecionada "ID" para a vari�vel id}
  if slExclusao > 0 then
    id := StrToInt(stringGridTransacoes.Cells[1,row])
  else
    cancelarAlteracao();

  {Caso haja mais de 1 �tem selecionado na grid desabilita a op��o de altera�ao,
  pois permite-se apenas a altera��o de uma �nica transa��o por vez}
  {Em casos onde existe mais de um valor selecionado na grid, admite-se apenas
  a exclus�o dos mesmos}
  if slExclusao > 1 then
    inabilitaAlteracao
  else
    habilitaAlteracao;

  contNormal := 0;
  contCcr := 0;
  contFixa := 0;
  for i := 0 to cbTransacoesExclusao.Items.Count do
  begin
    {Caso o �tem na posi��o "i" da combo box de �tens para exclus�o for
    diferente de vazio}
    if cbTransacoesExclusao.Items[i] <> '' then
    begin
      {Seleciona o tipo da transa��o do item atual}
      {O tipo de transa��o diferencia as transa��es Normais, Fixas e de Cart�o
      de cr�dito}
      dmDados.dataSet.CommandText := 'SELECT TIPO_TRANSACAO FROM DADOS_INTEGRADOS WHERE IDENTIFICA��O = '+ cbTransacoesExclusao.Items[i];
      dmDados.dataSet.Open;
      tipoTransacao := dmDados.dataSet.FieldByName('TIPO_TRANSACAO').AsString;
      dmDados.dataSet.Close;
    end
    else
      tipoTransacao := 'a';

    if tipoTransacao = '' then
      contNormal := contNormal + 1;

    if tipoTransacao = 'CCR' then
      contCcr := contCcr + 1;

    if LeftStr(tipoTransacao,4) = 'FIXA' then
      contFixa := contFixa + 1;

    if contNormal > 0 then
      ckNormal.Checked := True
    else
      ckNormal.Checked := False;

    if contCcr > 0 then
      ckCcr.Checked := True
    else
      ckCcr.Checked := False;

    if contFixa > 0 then
      ckFixa.Checked := True
    else
      ckFixa.Checked := False;
  end;

  if slExclusao = 0 then
  begin
    btnOk.Visible := True;
    btnDeletar.Visible := False;
  end
  else if slExclusao = 1 then
  begin
    btnCancelarAlteracao.Caption := '&Cancelar alter.';
    btnDeletar.Visible := True;
  end
  else if slExclusao > 1 then
  begin
    //btnOk.Visible := false;
    btnAlterar.Visible := false;
    btnCancelarAlteracao.Caption := '&Desmarcar todos (' + IntToStr(slExclusao) + ')';
  end;

  {Se a combobox de transa��es para exclus�o n�o estiver vazia}
  if cbTransacoesExclusao.Items.Count > 0 then
  begin
    with dmDados.query do
    begin
      Close;
      SQL.Clear;

      {Seleciona a transa��o que est� na primeira posi��o da combobox (posi��o zero)}
      dmDados.dataSet.CommandText := 'SELECT * FROM DADOS_INTEGRADOS WHERE IDENTIFICA��O = ' + cbTransacoesExclusao.Items[0];
      dmDados.dataSet.Open;
      while not dmDados.dataSet.Eof do
      begin
        {Preenche os campos do formul�rio com os dados retornados na consulta}
        txtId.Text := dmDados.dataSet.FieldByName('IDENTIFICA��O').AsString;
        txtData.Text := dmDados.dataSet.FieldByName('DATA').AsString;
        txtDescricao.Text := dmDados.dataSet.FieldByName('DESCRICAO').AsString;
        cbConta.Text := dmDados.dataSet.FieldByName('CONTA').AsString;
        cbCategoria.Text := dmDados.dataSet.FieldByName('CATEGORIA').AsString;
        cbSubcategoria.Text := dmDados.dataSet.FieldByName('SUBCATEGORIA').AsString;
        cbPagoRecebido.Text := dmDados.dataSet.FieldByName('PAGO_RECEBIDO').AsString;
        txtValor.Text := -dmDados.dataSet.FieldByName('VALOR').AsVariant;
        tipoTransacao := dmDados.dataSet.FieldByName('TIPO_TRANSACAO').AsString;
        dmDados.dataSet.Next;
      end;

      if LeftStr(tipoTransacao,4) = 'FIXA' then
      begin
        rdDespesaFixa.Checked := True;
      end
      else if tipoTransacao = 'CCR' then
      begin
        rdCcr.Checked := True;
        {Caso a transa��o for de cart�o de cr�dito recupera tamb�m o n�mero de
        parcelas}
        txtParcelas.Text := dmDados.dataSet.FieldByName('NUM_PARCELAS_CCR').AsString;
      end
      else
        rdNormal.Checked := True;

      dmDados.dataSet.Close;
    end;
  end;

  concatenaStringNaStringGrid(stringGridTransacoes, 4);
end;
//==============================================================================

procedure TformCadTransacao.mudaCoresLinhasStringgrid(ACol, ARow : Integer; rect : TRect; color : COLORREF; prStringGrid : TStringGrid);
begin
  prStringGrid.Canvas.Pen.Color := color;
  prStringGrid.Canvas.Brush.Style := bsClear;
  // Paint the gridlines
  prStringGrid.Canvas.Rectangle(Rect.Left - 1,Rect.Top - 1,Rect.Right +
  1,Rect.Bottom + 1);
  prStringGrid.Canvas.Brush.Style := bsSolid;
end;

procedure TformCadTransacao.btnCancelarAlteracaoClick(Sender: TObject);
begin
  UnitGlobal.somaValoresClicados := 0;
  labelSomaValoresClicados.Caption := '';
  cancelarAlteracao();
  habilitaAlteracao();
  alimentaStringGridDinamica(stringGridTotalCategoriaMes, sqlTotalPorCategoriaWhereCategoria(mskDataInicio, mskDataFinal));
end;

procedure TformCadTransacao.inabilitaAlteracao();
var
  i : Integer;
begin
  btnDeletar.Caption := '&Deletar';
  //btnCancelarAlteracao.Enabled := False;
  btnAlterar.Enabled := False;
  btnDeletar.Enabled := True;
  btnOk.Enabled := True;
  btnAddConta.Enabled := False;
  btnAddCategoria.Enabled := False;
  btnAddsubcategoria.Enabled := False;
  btnHoje.Enabled := False;
  txtData.Enabled := False;
  txtDescricao.Text := '';
  txtParcelas.Text := '';
  txtValor.Text := '';
  txtId.Text := '';
  txtId.Enabled := False;
  txtDescricao.Enabled := False;
  txtValor.Enabled := False;
  mskDataInicio.Enabled := False;
  mskDataFinal.Enabled := False;
  cbConta.Text := '';
  cbCategoria.Text := '';
  cbSubcategoria.Text := '';
  cbPagoRecebido.Text := '';
  //cbTransacoesExclusao.Clear();
  rdNormal.Enabled := False;
  rdDespesaFixa.Enabled := False;
  rdCcr.Enabled := False;
  labelMsgCcr.Enabled := False;
  //ckNormal.Enabled := False;
  //ckCcr.Enabled := False;
  //ckFixa.Enabled := False;
  cbConta.Enabled := False;
  cbCategoria.Enabled := False;
  cbSubcategoria.Enabled := False;
  cbPagoRecebido.Enabled := False;
end;

procedure TformCadTransacao.habilitaAlteracao();
var
  i : Integer;
begin
  btnDeletar.Caption := '&Deletar';
  btnCancelarAlteracao.Enabled := True;
  btnAlterar.Enabled := True;
  btnDeletar.Enabled := True;
  btnOk.Enabled := True;
  btnAddConta.Enabled := True;
  btnAddCategoria.Enabled := True;
  btnAddsubcategoria.Enabled := True;
  btnHoje.Enabled := True;
  txtData.Enabled := True;
  txtDescricao.Text := '';
  txtParcelas.Text := '';
  txtValor.Text := '';
  txtId.Text := '';
  txtId.Enabled := True;
  txtDescricao.Enabled := True;
  txtValor.Enabled := True;
  mskDataInicio.Enabled := True;
  mskDataFinal.Enabled := True;
  cbConta.Text := '';
  cbCategoria.Text := '';
  cbSubcategoria.Text := '';
  cbPagoRecebido.Text := '';
  //cbTransacoesExclusao.Clear();
  rdNormal.Enabled := True;
  rdDespesaFixa.Enabled := True;
  rdCcr.Enabled := True;
  labelMsgCcr.Enabled := True;
  //ckNormal.Enabled := True;
  //ckCcr.Enabled := True;
  //ckFixa.Enabled := True;
  cbConta.Enabled := True;
  cbCategoria.Enabled := True;
  cbSubcategoria.Enabled := True;
  cbPagoRecebido.Enabled := True;
end;

procedure TformCadTransacao.cancelarAlteracao();
var
  i : Integer;
begin
  for i := 1 to stringGridTransacoes.RowCount do
    stringGridTransacoes.Cells[0, i] := '[    ]';

  btnDeletar.Caption := 'Deletar';
  btnCancelarAlteracao.Visible := False;
  btnAlterar.Visible := False;
  btnDeletar.Visible := False;
  btnOk.Visible := True;
  txtData.Text := '';
  txtDescricao.Text := '';
  txtParcelas.Text := '';
  txtValor.Text := '';
  //txtId.Text := '';
  //txtId.Visible := False;
  cbConta.Text := '';
  cbCategoria.Text := '';
  cbSubcategoria.Text := '';
  cbPagoRecebido.Text := '';
  cbTransacoesExclusao.Clear();
  rdNormal.Checked := True;
  rdDespesaFixa.Checked := False;
  rdCcr.Checked := False;
  labelMsgCcr.Visible := False;
  ckNormal.Checked := False;
  ckCcr.Checked := False;
  ckFixa.Checked := False;
end;

procedure TformCadTransacao.btnAlterarClick(Sender: TObject);
begin
  if identificaCamposNaoPreenchidos(formCadTransacao) then
    Exit;

  try
    if ckNormal.Checked then
      alteraDespesaBd(txtData.Text, cbConta.Text, txtDescricao.Text, StrToFloat(txtValor.Text), cbCategoria.Text, cbSubcategoria.Text, cbPagoRecebido.Text);

    if ckCcr.Checked then
      ShowMessage('Ainda n�o foi criado a fun��o de alterar despesas de cart�o de cr�dito');
      //insereDespesaBdCcr(txtData.Text, cbConta.Text, txtDescricao.Text, StrToFloat(txtValor.Text), cbCategoria.Text, cbSubcategoria.Text, cbPagoRecebido.Text, StrToInt(txtParcelas.Text));

    if ckFixa.Checked then
      ShowMessage('Ainda n�o foi criado a fun��o de alterar despesas fixas');
      //insereDespesaBdFixa(txtData.Text, cbConta.Text, txtDescricao.Text, StrToFloat(txtValor.Text), cbCategoria.Text, cbSubcategoria.Text, cbPagoRecebido.Text);

    setEstadoComponentesAoIniciar;

    stringGridTransacoes.RowCount := stringGridTransacoes.RowCount + 1;
    alimentaStringGridDinamica(stringGridTransacoes, sqlGeral(mskDataInicio, mskDataFinal));
    stringGridTotalCategoriaMes.RowCount := 1;
    stringGridTotalSubCategoriaMes.RowCount := 1;
  except on e : Exception do
    ShowMessage(e.Message)
  end;

  labelContagemRegistrosStringGrid.Caption := totalRetornoRegistro;

end;

procedure TformCadTransacao.btnAddCategoriaClick(Sender: TObject);
begin
  formCadCategoria.ShowModal;
end;

procedure TformCadTransacao.btnDeletarClick(Sender: TObject);
var
  msgConfirmacao : string;
  i : Integer;
begin
  verificaTipoTransacoesExclusao();

  if cbTransacoesExclusao.Items.Count = 1 then
    msgConfirmacao := 'Deseja mesmo deletar este registro?'
  else
    msgConfirmacao := 'Deseja mesmo deletar estes '+ IntToStr(slExclusao) +' registros?';

  if Dialogs.MessageDlg(msgConfirmacao,
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if ckNormal.Checked then
      deletaDespesaBd();

    if ckCcr.Checked then
      deletaDespesaBdCcr();

    if ckFixa.Checked then
      deletaDespesaBdFixa();

    setEstadoComponentesAoIniciar;
    
    ShowMessage('Dados deletados com sucesso!');
    UnitGlobal.somaValoresClicados := 0;
    labelSomaValoresClicados.Caption := '';
  end;

  labelContagemRegistrosStringGrid.Caption := totalRetornoRegistro;

end;

procedure TformCadTransacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  UnitGlobal.somaValoresClicados := 0;
  labelSomaValoresClicados.Caption := '';
  cbTransacoesExclusao.Clear;
  btnDeletar.Visible := False;
end;

procedure TformCadTransacao.txtValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '0'..'9', DecimalSeparator]) then
  begin
     ShowMessage('Valor inv�lido: ' + Key);
     Key := #0;
  end
end;

procedure TformCadTransacao.txtDescricaoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  cbDescricao.Items.Delete(0);

  alimentaCombo('SELECT TOP 5 DESCRICAO FROM DADOS_INTEGRADOS WHERE VALOR < 0 AND DESCRICAO LIKE "%' + txtDescricao.Text + '%" ORDER BY identifica��o DESC',cbDescricao);
  cbDescricao.ItemIndex := -1;
end;

procedure TformCadTransacao.carregaIntervaloDatasIniciar();
begin
  mesInicioPesquisa := StrToInt(LeftStr(RightStr(DateToStr(now),7),2));;
  anoInicioPesquisa := StrToInt(RightStr(DateToStr(now),4));
  mesPesquisa := mesInicioPesquisa;
  anoPesquisa := anoInicioPesquisa;
  labelDataPesquisa.Caption := nomesMesesPesquisa[mesInicioPesquisa] + ' ' + IntToStr(anoInicioPesquisa);

  mesPesquisaStr := IntToStr(mesInicioPesquisa);
  mskDataInicio.Text := '01/' + mesPesquisaStr + '/'+ IntToStr(anoPesquisa);
  mskDataFinal.Text := DateToStr(EndOfTheMonth(StrToDate(mskDataInicio.Text)));
end;

procedure TformCadTransacao.setEstadoComponentesAoIniciar();
begin
  txtData.Enabled := True;
  txtDescricao.Enabled := True;
  txtValor.Enabled := True;
  //txtId.Visible := False;
  txtData.Text := '';
  txtDescricao.Text := '';
  txtValor.Text := '';
  txtCampoPesquisa.Text := '';
  txtData.SetFocus;
  txtId.Text := '';

  cbConta.Enabled := True;
  cbCategoria.Enabled := True;
  cbSubcategoria.Enabled := True;
  cbPagoRecebido.Enabled := True;
  cbConta.Text := '';
  cbCategoria.Text := '';
  cbSubcategoria.Text := '';
  cbPagoRecebido.Text := '';
  cbTransacoesExclusao.Clear;

  btnOk.Enabled := True;
  btnAlterar.Enabled := True;
  btnCancelarAlteracao.Enabled := True;
  btnDeletar.Visible := False;
  btnCancelar.Enabled := True;
  btnHoje.Enabled := True;
  btnAddConta.Enabled := True;
  btnAddCategoria.Enabled := True;
  btnAddsubcategoria.Enabled := True;
  btnOk.Visible := True;
  btnAlterar.Visible := False;
  btnCancelarAlteracao.Visible := False;

  rdNormal.Enabled := True;
  rdDespesaFixa.Enabled := True;
  rdCcr.Enabled := True;
  rdNormal.Checked := True;

  ckNormal.Checked := False;
  ckFixa.Checked := False;
  ckCcr.Checked := False;

  mskDataInicio.Enabled := True;
  mskDataFinal.Enabled := True;

  somaValoresClicados := 0;
  labelSomaValoresClicados.Caption := '';
end;

function TformCadTransacao.sqlGeral(prMskDataInicio, prMskDataFinal : TMaskEdit) : string;
var
  sql : String;
begin
  sql :=  'SELECT '+
            'CHECK, '+
            'IDENTIFICA��O, '+
            'CONTA, '+
            'DESCRICAO AS DESCRI��O, '+
            'VALOR AS VALOR, '+
            'CATEGORIA, '+
            'SUBCATEGORIA, '+
            'PAGO_RECEBIDO, '+
            'DATA '+
          'FROM '+
            'DADOS_INTEGRADOS '+
          'WHERE '+
            'DATA BETWEEN '+
            'FORMAT(#'+ prMskDataInicio.Text +'#,"mm/dd/yyyy") AND FORMAT(#'+ prMskDataFinal.Text +'#,"mm/dd/yyyy") AND VALOR < 0 ORDER BY DATA';

  Result := sql;
end;

function TformCadTransacao.sqlTotalPorCategoria(prMskDataInicio, prMskDataFinal : TMaskEdit) : string;
var
  sql : String;
begin
  sql := 'SELECT '+
            //'O.C�DIGO AS ID, '+
            'O.CATEGORIA, '+
            'O.VALOR AS PERMITIDO, '+


            'IIF(ABS((SELECT '+
                        'SUM(VALOR) '+
                      'FROM '+
                        'DADOS_INTEGRADOS '+
                      'WHERE '+
                        'CATEGORIA = O.CATEGORIA AND '+
                        'DATA >= FORMAT(#'+ mskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
                        'DATA <= FORMAT(#'+ mskDataFinal.Text +'#,"mm/dd/yyyy"))) IS NOT NULL, '+
            'ABS((SELECT '+
                    'SUM(VALOR) '+
                  'FROM '+
                    'DADOS_INTEGRADOS '+
                  'WHERE '+
                    'CATEGORIA = O.CATEGORIA AND '+
                    'DATA >= FORMAT(#'+ mskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
                    'DATA <= FORMAT(#'+ mskDataFinal.Text +'#,"mm/dd/yyyy"))), 0) AS GASTO, '+


            'IIF(IIF(O.VALOR - ABS((-(SELECT '+
                                    'SUM(VALOR) '+
                                  'FROM '+
                                    'DADOS_INTEGRADOS '+
                                  'WHERE '+
                                    'CATEGORIA = O.CATEGORIA AND '+
                                    'DATA>= FORMAT(#'+ mskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
                                    'DATA <= FORMAT(#'+ mskDataFinal.Text +'#,"mm/dd/yyyy")))) < 0, 0, '+
            'O.VALOR - ABS((-(SELECT '+
                                'SUM(VALOR) '+
                              'FROM '+
                                'DADOS_INTEGRADOS '+
                              'WHERE '+
                                'CATEGORIA = O.CATEGORIA AND '+
                                'DATA>= FORMAT(#'+ mskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
                                'DATA <= FORMAT(#'+ mskDataFinal.Text +'#,"mm/dd/yyyy"))))) IS NOT NULL, IIF(O.VALOR - ABS((-(SELECT '+
                                    'SUM(VALOR) '+
                                  'FROM '+
                                    'DADOS_INTEGRADOS '+
                                  'WHERE '+
                                    'CATEGORIA = O.CATEGORIA AND '+
                                    'DATA>= FORMAT(#'+ mskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
                                    'DATA <= FORMAT(#'+ mskDataFinal.Text +'#,"mm/dd/yyyy")))) < 0, 0, '+
            'O.VALOR - ABS((-(SELECT '+
                                'SUM(VALOR) '+
                              'FROM '+
                                'DADOS_INTEGRADOS '+
                              'WHERE '+
                                'CATEGORIA = O.CATEGORIA AND '+
                                'DATA>= FORMAT(#'+ mskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
                                'DATA <= FORMAT(#'+ mskDataFinal.Text +'#,"mm/dd/yyyy"))))), 0) AS RESTANTE, '+


            'IIF(O.VALOR = 0,0,ROUND(((ABS((SELECT '+
                                              'SUM(VALOR) '+
                                            'FROM '+
                                              'DADOS_INTEGRADOS '+
                                            'WHERE '+
                                              'CATEGORIA = O.CATEGORIA AND '+
                                              'DATA >= FORMAT(#'+ mskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
                                              'DATA <= FORMAT(#'+ mskDataFinal.Text +'#,"mm/dd/yyyy")))/O.VALOR)*100),2))&"%"AS "(%)" '+


         'FROM '+
            'ORCAMENTO AS O, '+
            'DADOS_INTEGRADOS AS DI '+
         'WHERE '+
            'DI.CATEGORIA = O.CATEGORIA AND '+
            'O.VALOR > 0 AND '+
            'O.DATA_INICIO >= FORMAT(#'+ mskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
            'O.DATA_FIM <= FORMAT(#'+ mskDataFinal.Text +'#,"mm/dd/yyyy") AND '+
            'O.CATEGORIA = "'+ cbCategoria.Text + '" ' +
         'GROUP BY '+
            'O.C�DIGO, '+
            'O.CATEGORIA, '+
            'O.VALOR, '+
            'O.DATA_INICIO, '+
            'O.DATA_FIM';

  Result := sql;
end;

function TformCadTransacao.sqlTotalPorCategoriaWhereCategoria(prMskDataInicio, prMskDataFinal : TMaskEdit) : string;
var
  sql : String;
begin
  sql := 'SELECT '+
            //'O.C�DIGO AS ID, '+
            'O.CATEGORIA, '+
            'O.VALOR AS PERMITIDO, '+


            'IIF(ABS((SELECT '+
                        'SUM(VALOR) '+
                      'FROM '+
                        'DADOS_INTEGRADOS '+
                      'WHERE '+
                        'CATEGORIA = O.CATEGORIA AND '+
                        'DATA >= FORMAT(#'+ mskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
                        'DATA <= FORMAT(#'+ mskDataFinal.Text +'#,"mm/dd/yyyy"))) IS NOT NULL, '+
            'ABS((SELECT '+
                    'SUM(VALOR) '+
                  'FROM '+
                    'DADOS_INTEGRADOS '+
                  'WHERE '+
                    'CATEGORIA = O.CATEGORIA AND '+
                    'DATA >= FORMAT(#'+ mskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
                    'DATA <= FORMAT(#'+ mskDataFinal.Text +'#,"mm/dd/yyyy"))), 0) AS GASTO, '+


            'IIF(IIF(O.VALOR - ABS((-(SELECT '+
                                    'SUM(VALOR) '+
                                  'FROM '+
                                    'DADOS_INTEGRADOS '+
                                  'WHERE '+
                                    'CATEGORIA = O.CATEGORIA AND '+
                                    'DATA>= FORMAT(#'+ mskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
                                    'DATA <= FORMAT(#'+ mskDataFinal.Text +'#,"mm/dd/yyyy")))) < 0, 0, '+
            'O.VALOR - ABS((-(SELECT '+
                                'SUM(VALOR) '+
                              'FROM '+
                                'DADOS_INTEGRADOS '+
                              'WHERE '+
                                'CATEGORIA = O.CATEGORIA AND '+
                                'DATA>= FORMAT(#'+ mskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
                                'DATA <= FORMAT(#'+ mskDataFinal.Text +'#,"mm/dd/yyyy"))))) IS NOT NULL, IIF(O.VALOR - ABS((-(SELECT '+
                                    'SUM(VALOR) '+
                                  'FROM '+
                                    'DADOS_INTEGRADOS '+
                                  'WHERE '+
                                    'CATEGORIA = O.CATEGORIA AND '+
                                    'DATA>= FORMAT(#'+ mskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
                                    'DATA <= FORMAT(#'+ mskDataFinal.Text +'#,"mm/dd/yyyy")))) < 0, 0, '+
            'O.VALOR - ABS((-(SELECT '+
                                'SUM(VALOR) '+
                              'FROM '+
                                'DADOS_INTEGRADOS '+
                              'WHERE '+
                                'CATEGORIA = O.CATEGORIA AND '+
                                'DATA>= FORMAT(#'+ mskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
                                'DATA <= FORMAT(#'+ mskDataFinal.Text +'#,"mm/dd/yyyy"))))), 0) AS RESTANTE, '+


            'IIF(O.VALOR = 0,0,ROUND(((ABS((SELECT '+
                                              'SUM(VALOR) '+
                                            'FROM '+
                                              'DADOS_INTEGRADOS '+
                                            'WHERE '+
                                              'CATEGORIA = O.CATEGORIA AND '+
                                              'DATA >= FORMAT(#'+ mskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
                                              'DATA <= FORMAT(#'+ mskDataFinal.Text +'#,"mm/dd/yyyy")))/O.VALOR)*100),2))&"%"AS "(%)", '+

            'MONTH(O.DATA_INICIO) AS M�S '+
         'FROM '+
            'ORCAMENTO AS O, '+
            'DADOS_INTEGRADOS AS DI '+
         'WHERE '+
            'DI.CATEGORIA = O.CATEGORIA AND '+
            'O.VALOR > 0 AND '+
            'O.DATA_INICIO >= FORMAT(#'+ mskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
            'O.DATA_FIM <= FORMAT(#'+ mskDataFinal.Text +'#,"mm/dd/yyyy") AND '+
            'O.CATEGORIA = "'+ cbCategoria.Text + '" ' +
         'GROUP BY '+
            'O.C�DIGO, '+
            'O.CATEGORIA, '+
            'O.VALOR, '+
            'O.DATA_INICIO, '+
            'O.DATA_FIM';

  Result := sql;
end;

function TformCadTransacao.sqlTotalPorSubCategoria(prMskDataInicio, prMskDataFinal : TMaskEdit) : string;
var
  sql : String;
begin
  sql :=  'SELECT '+
            'SUBCATEGORIA, '+
            'SUM(VALOR) AS TOTAL '+
          'FROM '+
            'DADOS_INTEGRADOS '+
          'WHERE '+
            'VALOR < 0 AND '+
            'DATA BETWEEN FORMAT(#'+ prMskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
            'FORMAT(#'+ prMskDataFinal.Text +'#,"mm/dd/yyyy") '+
          'GROUP BY '+
            'SUBCATEGORIA';

  Result := sql;
end;

function TformCadTransacao.sqlTotalPorSubCategoriaWhereSubcategoria(prMskDataInicio, prMskDataFinal : TMaskEdit) : string;
var
  sql : String;
begin
  sql :=  'SELECT '+
            'TOP 1 '+
            'SUBCATEGORIA, '+
            //'"R$ "&sum(VALOR)&"" AS TOTAL, '+

              '(SELECT '+
                'SUM(VALOR) '+
              'FROM '+
                'DADOS_INTEGRADOS '+
              'WHERE '+
                'SUBCATEGORIA = DI.SUBCATEGORIA AND '+
                'VALOR < 0 AND '+
                'DATA BETWEEN FORMAT(#'+ prMskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
                'FORMAT(#'+ prMskDataFinal.Text +'#,"mm/dd/yyyy")) AS TOTAL, '+

            'MONTH(DATA) AS M�S '+
          'FROM '+
            'DADOS_INTEGRADOS AS DI '+
          'WHERE '+
            'VALOR < 0 AND '+
            'DATA BETWEEN FORMAT(#'+ prMskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
            'FORMAT(#'+ prMskDataFinal.Text +'#,"mm/dd/yyyy") AND '+
            'SUBCATEGORIA = "'+ cbSubcategoria.Text +'" ' +
          'GROUP BY '+
            'SUBCATEGORIA, '+
            'DATA';

  Result := sql;
end;

function TformCadTransacao.sqlTotalPorCategoriaWhereDescricao(prMskDataInicio, prMskDataFinal : TMaskEdit) : string;
var
  sql : String;
begin
  sql :=  'SELECT '+
            'CHECK, '+
            'IDENTIFICA��O, CONTA, DESCRICAO AS DESCRI��O, '+
            'VALOR AS VALOR, '+
            'CATEGORIA, '+
            'SUBCATEGORIA, '+
            'PAGO_RECEBIDO, '+
            'DATA '+
          'FROM '+
            'DADOS_INTEGRADOS '+
          'WHERE '+
            'DESCRICAO LIKE "'+ txtCampoPesquisa.Text +'%" AND '+
            'VALOR < 0 AND '+
            'DATA BETWEEN FORMAT(#'+ prMskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
            'FORMAT(#'+ prMskDataFinal.Text +'#,"mm/dd/yyyy") '+
          'ORDER BY '+
            'DATA';

  Result := sql;
end;

function TformCadTransacao.sqlTotalPorCategoriaWhereValor(prMskDataInicio, prMskDataFinal : TMaskEdit) : string;
var
  sql, valorSemDivisaoPorZero : String;
begin

  if (AnsiContainsStr(txtCampoPesquisa.Text, '/0'))
    or (AnsiContainsStr(txtCampoPesquisa.Text, '/10'))
      or (AnsiContainsStr(txtCampoPesquisa.Text, '/11'))
        or (AnsiContainsStr(txtCampoPesquisa.Text, '/12')) then
    Exit;

  sql :=  'SELECT TOP 1 '+
            'CHECK, '+
            'IDENTIFICA��O, CONTA, DESCRICAO AS DESCRI��O, '+
            'VALOR AS VALOR, '+
            'CATEGORIA, '+
            'SUBCATEGORIA, '+
            'PAGO_RECEBIDO, '+
            'DATA '+
          'FROM '+
            'DADOS_INTEGRADOS '+
          'WHERE '+
            'VALOR <= -'+ txtCampoPesquisa.Text + ' AND '+
            'DATA BETWEEN FORMAT(#'+ prMskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
            'FORMAT(#'+ prMskDataFinal.Text +'#,"mm/dd/yyyy") '+
          'ORDER BY '+
            'VALOR DESC';

  Result := sql;
end;

function TformCadTransacao.sqlTotalPorCategoriaWhereCategoria2(prMskDataInicio, prMskDataFinal : TMaskEdit) : string;
var
  sql : String;
begin
  sql :=  'SELECT '+
            'CHECK, '+
            'IDENTIFICA��O, CONTA, DESCRICAO AS DESCRI��O, '+
            'VALOR AS VALOR, '+
            'CATEGORIA, '+
            'SUBCATEGORIA, '+
            'PAGO_RECEBIDO, '+
            'DATA '+
          'FROM '+
            'DADOS_INTEGRADOS '+
          'WHERE '+
            'CATEGORIA LIKE "'+ txtCampoPesquisa.Text +'%" AND '+
            'VALOR < 0 AND '+
            'DATA BETWEEN FORMAT(#'+ prMskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
            'FORMAT(#'+ prMskDataFinal.Text +'#,"mm/dd/yyyy") '+
          'ORDER BY '+
            'DATA';

  Result := sql;
end;

function TformCadTransacao.sqlTotalPorCategoriaWhereSubcategoria2(prMskDataInicio, prMskDataFinal : TMaskEdit) : string;
var
  sql : String;
begin
  sql :=  'SELECT '+
            'CHECK, '+
            'IDENTIFICA��O, CONTA, DESCRICAO AS DESCRI��O, '+
            'VALOR AS VALOR, '+
            'CATEGORIA, '+
            'SUBCATEGORIA, '+
            'PAGO_RECEBIDO, '+
            'DATA '+
          'FROM '+
            'DADOS_INTEGRADOS '+
          'WHERE '+
            'SUBCATEGORIA LIKE "'+ txtCampoPesquisa.Text +'%" AND '+
            'VALOR < 0 AND '+
            'DATA BETWEEN FORMAT(#'+ prMskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
            'FORMAT(#'+ prMskDataFinal.Text +'#,"mm/dd/yyyy") '+
          'ORDER BY '+
            'DATA';

  Result := sql;
end;

function TformCadTransacao.sqlTotalPorCategoriaWherePagoRecebido(prMskDataInicio, prMskDataFinal : TMaskEdit) : string;
var
  sql : String;
begin
  sql :=  'SELECT '+
            'CHECK, '+
            'IDENTIFICA��O, CONTA, DESCRICAO AS DESCRI��O, '+
            'VALOR AS VALOR, '+
            'CATEGORIA, '+
            'SUBCATEGORIA, '+
            'PAGO_RECEBIDO, '+
            'DATA '+
          'FROM '+
            'DADOS_INTEGRADOS '+
          'WHERE '+
            'PAGO_RECEBIDO LIKE "'+ txtCampoPesquisa.Text +'%" AND '+
            'VALOR < 0 AND '+
            'DATA BETWEEN FORMAT(#'+ prMskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
            'FORMAT(#'+ prMskDataFinal.Text +'#,"mm/dd/yyyy") '+
          'ORDER BY '+
            'DATA';

  Result := sql;
end;

function TformCadTransacao.sqlTotalPorCategoriaWhereData(prMskDataInicio, prMskDataFinal : TMaskEdit) : string;
var
  sql : String;
begin
  sql :=  'SELECT '+
            'CHECK, '+
            'IDENTIFICA��O, CONTA, DESCRICAO AS DESCRI��O, '+
            'VALOR AS VALOR, '+
            'CATEGORIA, '+
            'SUBCATEGORIA, '+
            'PAGO_RECEBIDO, '+
            'DATA '+
          'FROM '+
            'DADOS_INTEGRADOS '+
          'WHERE '+
            'DATA LIKE "'+ txtCampoPesquisa.Text +'%" AND '+
            'VALOR < 0 AND '+
            'DATA BETWEEN FORMAT(#'+ prMskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
            'FORMAT(#'+ prMskDataFinal.Text +'#,"mm/dd/yyyy") '+
          'ORDER BY '+
            'DATA';

  Result := sql;
end;

function TformCadTransacao.sqlTotalPorCategoriaWhereConta(prMskDataInicio, prMskDataFinal : TMaskEdit) : string;
var
  sql : String;
begin
  sql :=  'SELECT '+
            'CHECK, '+
            'IDENTIFICA��O, CONTA, DESCRICAO AS DESCRI��O, '+
            'VALOR AS VALOR, '+
            'CATEGORIA, '+
            'SUBCATEGORIA, '+
            'PAGO_RECEBIDO, '+
            'DATA '+
          'FROM '+
            'DADOS_INTEGRADOS '+
          'WHERE '+
            'CONTA LIKE "'+ txtCampoPesquisa.Text +'%" AND '+
            'VALOR < 0 AND '+
            'DATA BETWEEN FORMAT(#'+ prMskDataInicio.Text +'#,"mm/dd/yyyy") AND '+
            'FORMAT(#'+ prMskDataFinal.Text +'#,"mm/dd/yyyy") '+
          'ORDER BY '+
            'DATA';

  Result := sql;
end;

procedure TformCadTransacao.stringGridTotalCategoriaMesDrawCell(
  Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
var
  s, valorGastoNum, valorPermitidoNum: String;
  valorGasto, valorPermitido : Double;
begin
  if ARow = 0 then
  begin
    s := stringGridTotalCategoriaMes.Cells[ACol, ARow];
    stringGridTotalCategoriaMes.Canvas.Brush.Color := clGray;
    stringGridTotalCategoriaMes.Canvas.FillRect(Rect);
    stringGridTotalCategoriaMes.Canvas.Font.Color := clBlack;
    stringGridTotalCategoriaMes.Canvas.Font.Style := [fsBold];
    stringGridTotalCategoriaMes.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, s);
  end
  else if stringGridTotalCategoriaMes.Cells[2,ARow] <> '' then
  begin
    valorGastoNum := StringReplace(stringGridTotalCategoriaMes.Cells[2,ARow], '.', '', [rfReplaceAll, rfIgnoreCase]);
    valorPermitidoNum := StringReplace(stringGridTotalCategoriaMes.Cells[1,ARow], '.', '', [rfReplaceAll, rfIgnoreCase]);

    valorGasto := StrToFloat(valorGastoNum); //StrToFloat(stringGridTotalCategoriaMes.Cells[2,ARow]);
    valorPermitido := StrToFloat(valorPermitidoNum); //StrToFloat(stringGridTotalCategoriaMes.Cells[1,ARow]);

    if valorGasto > valorPermitido then
    begin
      s := stringGridTotalCategoriaMes.Cells[ACol, ARow];
      stringGridTotalCategoriaMes.Canvas.Brush.Color := rgb(RGB_VERMELHO_1.R, RGB_VERMELHO_1.G, RGB_VERMELHO_1.B);
      stringGridTotalCategoriaMes.Canvas.FillRect(Rect);
      stringGridTotalCategoriaMes.Canvas.Font.Color := clBlack;
      stringGridTotalCategoriaMes.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, s);
    end
    else
    begin
      s := stringGridTotalCategoriaMes.Cells[ACol, ARow];
      stringGridTotalCategoriaMes.Canvas.Brush.Color := rgb(RGB_VERDE_1.R, RGB_VERDE_1.G, RGB_VERDE_1.B);
      stringGridTotalCategoriaMes.Canvas.FillRect(Rect);
      stringGridTotalCategoriaMes.Canvas.Font.Color := clBlack;
      stringGridTotalCategoriaMes.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, s);
    end;
  end;
  mudaCoresLinhasStringgrid(ARow, ACol, Rect, clBlack, stringGridTotalCategoriaMes);
end;

procedure TformCadTransacao.stringGridTotalSubCategoriaMesDrawCell(
  Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
var
  s : String;
begin
  if ARow = 0 then
  begin
    s := stringGridTotalSubCategoriaMes.Cells[ACol, ARow];
    stringGridTotalSubCategoriaMes.Canvas.Brush.Color := clGray;
    stringGridTotalSubCategoriaMes.Canvas.FillRect(Rect);
    stringGridTotalSubCategoriaMes.Canvas.Font.Color := clBlack;
    stringGridTotalSubCategoriaMes.Canvas.Font.Style := [fsBold];
    stringGridTotalSubCategoriaMes.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, s);
  end
  else if stringGridTotalSubCategoriaMes.Cells[1,ARow] <> '' then
  begin
    if StrToFloat(StringReplace(stringGridTotalSubCategoriaMes.Cells[1,ARow],'.','',[rfReplaceAll, rfIgnoreCase])) < 0 then
    begin
      s := stringGridTotalSubCategoriaMes.Cells[ACol, ARow];
      stringGridTotalSubCategoriaMes.Canvas.Brush.Color := rgb(231,76,60);;
      stringGridTotalSubCategoriaMes.Canvas.FillRect(Rect);
      stringGridTotalSubCategoriaMes.Canvas.Font.Color := clBlack;
      stringGridTotalSubCategoriaMes.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, s);
    end
    else
    begin
      s := stringGridTotalSubCategoriaMes.Cells[ACol, ARow];
      stringGridTotalSubCategoriaMes.Canvas.Brush.Color := $a9dfbf;
      stringGridTotalSubCategoriaMes.Canvas.FillRect(Rect);
      stringGridTotalSubCategoriaMes.Canvas.Font.Color := clBlack;
      stringGridTotalSubCategoriaMes.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, s);
    end;
  end;
  mudaCoresLinhasStringgrid(ARow, ACol, Rect, clBlack, stringGridTotalSubCategoriaMes);
end;

procedure TformCadTransacao.btnMudaGridClick(Sender: TObject);
begin
  alimentaStringGridDinamica(stringGridTotalCategoriaMes,sqlTotalPorCategoria(mskDataInicio, mskDataFinal));
end;

procedure TformCadTransacao.BitBtn1Click(Sender: TObject);
begin
   formCalculadora.ShowModal;
end;

procedure TformCadTransacao.stringGridTotalCategoriaMesDblClick(
  Sender: TObject);
begin
  formOrcamento.Show;    
end;

procedure TformCadTransacao.cbCategoriaChange(Sender: TObject);
begin
  alimentaStringGridDinamica(stringGridTotalCategoriaMes, sqlTotalPorCategoriaWhereCategoria(mskDataInicio, mskDataFinal));
end;

procedure TformCadTransacao.cbSubcategoriaChange(Sender: TObject);
begin
  alimentaStringGridDinamica(stringGridTotalSubCategoriaMes, sqlTotalPorSubCategoriaWhereSubcategoria(mskDataInicio, mskDataFinal));
end;

procedure TformCadTransacao.cbDescricaoChange(Sender: TObject);
begin
  if cbDescricao.Text <> '' then
  begin
    cbConta.Text := UnitGlobal.retornaUmRegistroSQL('SELECT TOP 1 CONTA FROM DADOS_INTEGRADOS WHERE DESCRICAO LIKE "%'+ cbDescricao.Text +'%" ORDER BY identifica��o DESC','CONTA');
    cbCategoria.Text := UnitGlobal.retornaUmRegistroSQL('SELECT TOP 1 CATEGORIA FROM DADOS_INTEGRADOS WHERE DESCRICAO LIKE "%'+ cbDescricao.Text +'%" ORDER BY identifica��o DESC','CATEGORIA');
    cbSubcategoria.Text := UnitGlobal.retornaUmRegistroSQL('SELECT TOP 1  SUBCATEGORIA FROM DADOS_INTEGRADOS WHERE DESCRICAO LIKE "%'+ cbDescricao.Text +'%" ORDER BY identifica��o DESC','SUBCATEGORIA');
  end
  else
  begin
    cbConta.Text := '';
    cbCategoria.Text := '';
    cbSubcategoria.Text := '';
  end;

  alimentaStringGridDinamica(stringGridTotalCategoriaMes, sqlTotalPorCategoriaWhereCategoria(mskDataInicio, mskDataFinal));
  alimentaStringGridDinamica(stringGridTotalSubCategoriaMes, sqlTotalPorSubCategoriaWhereSubcategoria(mskDataInicio, mskDataFinal));
end;

procedure TformCadTransacao.cbDescricaoExit(Sender: TObject);
begin
  if cbDescricao.Text <> '' then
    txtDescricao.Text := cbDescricao.Text
  else
  begin
    cbConta.Text := '';
    cbCategoria.Text := '';
    cbSubcategoria.Text := '';
  end;
end;

procedure TformCadTransacao.mskDataInicioChange(Sender: TObject);
begin
  dataInicio := mskDataInicio.Text;
  dataFinal := mskDataFinal.Text;
end;

procedure TformCadTransacao.mskDataFinalChange(Sender: TObject);
begin
  dataInicio := mskDataInicio.Text;
  dataFinal := mskDataFinal.Text;
end;

procedure TformCadTransacao.txtCampoPesquisaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if AnsiContainsStr(txtCampoPesquisa.Text, ',') then
  begin
    txtCampoPesquisa.Text := StringReplace(txtCampoPesquisa.Text,  ',', '.', [rfReplaceAll, rfIgnoreCase]);
    txtCampoPesquisa.SelStart := high(Integer);
  end;

  txtCampoPesquisa.EditLabel.Caption := 'Pesquisando por valor';

  try
    alimentaStringGridDinamica(stringGridTransacoes, sqlTotalPorCategoriaWhereValor(mskDataInicio, mskDataFinal));
    labelContagemRegistrosStringGrid.Caption := totalRetornoRegistro;
  except on E : Exception do
    begin
      stringGridTransacoes.RowCount := 0;
    end;
  end;

  if stringGridTransacoes.RowCount > 1 then
    exit;

  txtCampoPesquisa.EditLabel.Caption := 'Pesquisando por descri��o';
  alimentaStringGridDinamica(stringGridTransacoes, sqlTotalPorCategoriaWhereDescricao(mskDataInicio, mskDataFinal));
  labelContagemRegistrosStringGrid.Caption := totalRetornoRegistro;

  if stringGridTransacoes.RowCount > 1 then
    exit;

  txtCampoPesquisa.EditLabel.Caption := 'Pesquisando por conta';
  alimentaStringGridDinamica(stringGridTransacoes, sqlTotalPorCategoriaWhereConta(mskDataInicio, mskDataFinal));
  labelContagemRegistrosStringGrid.Caption := totalRetornoRegistro;

  if stringGridTransacoes.RowCount > 1 then
    exit;

  txtCampoPesquisa.EditLabel.Caption := 'Pesquisando por categoria';
  alimentaStringGridDinamica(stringGridTransacoes, sqlTotalPorCategoriaWhereCategoria2(mskDataInicio, mskDataFinal));
  labelContagemRegistrosStringGrid.Caption := totalRetornoRegistro;

  if stringGridTransacoes.RowCount > 1 then
    exit;

  txtCampoPesquisa.EditLabel.Caption := 'Pesquisando por subcategoria';
  alimentaStringGridDinamica(stringGridTransacoes, sqlTotalPorCategoriaWhereSubcategoria2(mskDataInicio, mskDataFinal));
  labelContagemRegistrosStringGrid.Caption := totalRetornoRegistro;

  if stringGridTransacoes.RowCount > 1 then
  exit;

  txtCampoPesquisa.EditLabel.Caption := 'Pesquisando por situa��o';
  alimentaStringGridDinamica(stringGridTransacoes, sqlTotalPorCategoriaWherePagoRecebido(mskDataInicio, mskDataFinal));
  labelContagemRegistrosStringGrid.Caption := totalRetornoRegistro;

  if stringGridTransacoes.RowCount > 1 then
    exit;

  txtCampoPesquisa.EditLabel.Caption := 'Pesquisando por data';
  alimentaStringGridDinamica(stringGridTransacoes, sqlTotalPorCategoriaWhereData(mskDataInicio, mskDataFinal));
  labelContagemRegistrosStringGrid.Caption := totalRetornoRegistro;
end;

procedure TformCadTransacao.txtCampoPesquisaExit(Sender: TObject);
begin
  txtCampoPesquisa.EditLabel.Caption := 'Pesquisa';
end;

procedure TformCadTransacao.btnAddContaClick(Sender: TObject);
begin
  formCadConta.ShowModal;
end;

procedure TformCadTransacao.btnAddsubcategoriaClick(Sender: TObject);
begin
  formCadSubcategoria.ShowModal;
end;

procedure TformCadTransacao.BitBtn2Click(Sender: TObject);
begin
  formCadReceita.Show;
  Close;
end;

procedure TformCadTransacao.txtValorChange(Sender: TObject);
begin
  txtValor.Text := AnsiReplaceStr(txtValor.Text, '.', '');

  if txtValor.Text <> '' then
    labelValorFormatado.Caption := '(R$ ' + FormatFloat('#,0.00', StrToFloat(txtValor.Text)) + ')'
  else
    labelValorFormatado.Caption := '(R$)';

  //txtValor.Text := FormatFloat('#,0.00', StrToFloat(txtValor.Text));
end;

procedure TformCadTransacao.FormCreate(Sender: TObject);
begin
  BorderIcons := BorderIcons - [biMinimize];
end;

end.

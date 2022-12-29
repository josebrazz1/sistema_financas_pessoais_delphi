unit unitInicial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, TeeProcs, TeEngine,
  Chart, DbChart, Series, TeeFunci, ComCtrls, Menus;

type
  TformInicial = class(TForm)
    btnInserirTransacao: TBitBtn;
    btnInserirCategoria: TBitBtn;
    labelMensagemBd: TLabel;
    labelMensagemDiretorio: TLabel;
    btnInserirReceita: TBitBtn;
    btnAbreSlcBD: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    labelDespesas: TLabel;
    labelReceitas: TLabel;
    cbMeses: TComboBox;
    cbAnos: TComboBox;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label3: TLabel;
    labelPendentes: TLabel;
    labelBalanco: TLabel;
    Label5: TLabel;
    chatDespesaCategoria: TDBChart;
    Series1: TBarSeries;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure btnInserirTransacaoClick(Sender: TObject);
    //procedure conectaDb();
    procedure btnInserirCategoriaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure atualizaTransacoesFixasAno();
    function checaNumeroAcessosAno() : Integer;
    procedure incrementaAcessosAno();
    procedure btnInserirReceitaClick(Sender: TObject);
    procedure btnAbreSlcBDClick(Sender: TObject);
    procedure identificaDataAtual();
    function converteNumeroMesEmNomeMes(numeroMes : Integer) : String;
    procedure mudaData();
    function converteNomeMesEmNumeroMes(nomeMes : string) : Integer;
    procedure inicializaStructMeses();
    procedure cbMesesChange(Sender: TObject);
    function retornaValorTotalReceitaOuDespesaMesOuAnoSelecionado(tipoTransacao : String; dataInicio, dataFim : String) : Double;
    function retornaValorPendenteMesOuAnoSelecionado(prDataInicio, prDataFim : String) : Double;
    procedure cbAnosChange(Sender: TObject);
    procedure alimentaTdbChartDespesaPorCategoria();
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    {Variável que checa se o usuário deseja mudar o alias do banco de dados,
    ou seja, se foi clicado no botão "Alterar Base"}
    alteraAlias : Boolean;
  end;

var
  formInicial: TformInicial;

implementation

uses unitTransacoes, unitPrincipal, dataModule, DateUtils, StrUtils, ADODB,
  DB, unitOrcamento, unitReceita, UnitSelecionaBaseDados, UnitGlobal,
  UnitSelecionaBaseDadosNaoPrincipal, UnitSenha, unitCarregamento,
  UnitBalanco;

{$R *.dfm}

//Atualiza transações fixas no primeiro acesso do ano ==========================
procedure TformInicial.atualizaTransacoesFixasAno();
var dataPr : string;
    contaPr : string;
    descricaoPr : string;
    valorPr : Double;
    categoriaPr : string;
    subcategoriaPr : string;
    pagoRecebidoPr : string;
    i : Integer;
    mes : Integer;
begin
  with dmDados.query do
  begin
    dmDados.dataSet.Close;
    dmDados.query.SQL.Clear;
    dmDados.dataSet.CommandText := 'SELECT * FROM DADOS_INTEGRADOS WHERE TIPO_TRANSACAO = "FIXA 1"';
    dmDados.dataSet.Open;
    i := 1;
    if dmDados.dataSet.RecordCount > 0 then
    begin
      while not dmDados.dataSet.Eof do
      begin
        for mes := 1 to 12 do
        begin
          dataPr := dmDados.dataSet.FieldByName('DATA').Value;
          dataPr := LeftStr(dataPr,2)+'/'+IntToStr(mes)+'/'+IntToStr(anoAtual);
          contaPr := dmDados.dataSet.FieldByName('CONTA').Value;
          descricaoPr := dmDados.dataSet.FieldByName('DESCRICAO').Value;
          valorPr := dmDados.dataSet.FieldByName('VALOR').Value;
          categoriaPr := dmDados.dataSet.FieldByName('CATEGORIA').Value;
          subcategoriaPr := dmDados.dataSet.FieldByName('SUBCATEGORIA').Value;
          pagoRecebidoPr := dmDados.dataSet.FieldByName('PAGO_RECEBIDO').Value;
          dmDados.query.SQL.Clear;
          SQL.Add('INSERT INTO DADOS_INTEGRADOS (DATA, CONTA, DESCRICAO, VALOR, CATEGORIA, SUBCATEGORIA, PAGO_RECEBIDO, TIPO_TRANSACAO) VALUES (:dataPr, :contaPr, :descricaoPr, :valorPr, :categoriaPr, :subcategoriaPr, :pagoRecebidoPr, "FIXA '+ IntToStr(i) +'")');
          dmDados.query.Parameters.ParamByName('dataPr').Value := dataPr;
          dmDados.query.Parameters.ParamByName('contaPr').Value := contaPr;
          dmDados.query.Parameters.ParamByName('descricaoPr').Value := descricaoPr;
          dmDados.query.Parameters.ParamByName('valorPr').Value := valorPr;
          dmDados.query.Parameters.ParamByName('categoriaPr').Value := categoriaPr;
          dmDados.query.Parameters.ParamByName('subcategoriaPr').Value := subcategoriaPr;
          dmDados.query.Parameters.ParamByName('pagoRecebidoPr').Value := pagoRecebidoPr;
          dmDados.query.ExecSQL;
          i := i + 1;
        end;
        dmDados.dataSet.Next;
        i := 1;
      end;
    end;
    dmDados.dataSet.Close;
  end;
end;
//==============================================================================

//Incrementa acessos do ano ====================================================
procedure TformInicial.incrementaAcessosAno();
var acessosPr : Integer;
begin
  with dmDados.query do
  begin
    dmDados.dataSet.Close;
    dmDados.query.SQL.Clear;
    dmDados.dataSet.CommandText := 'SELECT * FROM ACESSOS WHERE ANO = '+ IntToStr(anoAtual) +'';
    dmDados.dataSet.Open;
    acessosPr := dmDados.dataSet.FieldByName('qtde_acessos').Value;
    acessosPr := acessosPr + 1;
    dmDados.query.SQL.Clear;
    SQL.Add('UPDATE ACESSOS SET QTDE_ACESSOS = :acessosPr WHERE ANO = '+ IntToStr(anoAtual) +'');
    dmDados.query.Parameters.ParamByName('acessosPr').Value := acessosPr;
    dmDados.query.ExecSQL;
    dmDados.dataSet.Next;
    dmDados.dataSet.Close;
  end;
end;
//==============================================================================

//Checa quantos acessos o sistema teve no ano ==================================
function TformInicial.checaNumeroAcessosAno() : integer;
begin
  dmDados.dataSet.Close();
  dmDados.query.SQL.Clear();
  dmDados.dataSet.CommandText := 'SELECT * FROM ACESSOS WHERE ANO = '+IntToStr(anoAtual) +'';
  dmDados.dataSet.Open();

  while not dmDados.dataSet.Eof do
  begin
    Result := dmDados.dataSet.FieldByName('QTDE_ACESSOS').Value;
    dmDados.dataSet.Next();
  end;
  dmDados.dataSet.Close();
end;
//==============================================================================

procedure TformInicial.btnInserirTransacaoClick(Sender: TObject);
begin
  formCadTransacao.Show;
end;

procedure TformInicial.btnInserirCategoriaClick(Sender: TObject);
begin
  formOrcamento.Show;
end;

procedure TformInicial.alimentaTdbChartDespesaPorCategoria();
begin
  Series1.Clear;
  dmDados.dataSet.CommandText :=
  'SELECT '+
    'CATEGORIA, '+
    'SUM(-VALOR)'+
  'FROM '+
    'DADOS_INTEGRADOS '+
  'WHERE '+
    'DATA BETWEEN FORMAT (#'+ dataInicio +'#,"mm/dd/yyyy") AND FORMAT (#'+ dataFinal +'#,"mm/dd/yyyy") AND '+
    'VALOR < 0 '+
    'GROUP BY CATEGORIA '+
    'ORDER BY SUM(-VALOR)';

  dmDados.dataSet.Open;

  while not dmDados.dataSet.Eof do
  begin
    Series1.Add(dmDados.dataSet.Fields[1].AsFloat, dmDados.dataSet.Fields[0].AsString);
    dmDados.dataSet.Next;
  end;

  dmDados.dataSet.Close;
end;

procedure TformInicial.FormShow(Sender: TObject);
begin
  formSelecaoBaseDados.ShowModal;

  if usuarioOuSenhaIncorretos then
  begin
    usuarioOuSenhaIncorretos := False;
    OnShow(Self);
  end;

  if not terminarApNoInicio then
  begin
    if bdAlias = '' then
    begin
      OnShow(Self);
    end;

    formSelecaoBaseDados.Hide;
    formLogin.Hide;

    identificaDataAtual;

    alimentaTdbChartDespesaPorCategoria;

    inicializaStructMeses;

    labelReceitas.Font.Color := RGB(39,174,96);
    labelDespesas.Font.Color := RGB(231,76,60);
    labelPendentes.Font.Color := RGB(231,76,60);

    Color := rgb(204,209,209);

    chatDespesaCategoria.Color := rgb(204,209,209);

    anoAtual := StrToInt(RightStr(DateToStr(Now),4));
    //anoAtual := 2021;
    if checaNumeroAcessosAno() = 0 then
    begin
      atualizaTransacoesFixasAno();
      ShowMessage('Despesas fixas atualizadas para o ano de ' + IntToStr(anoAtual));
      incrementaAcessosAno();
    end
    else
      incrementaAcessosAno();

    labelReceitas.Caption := 'R$ ' + FormatFloat('#,0.00', retornaValorTotalReceitaOuDespesaMesOuAnoSelecionado(tpRECEITA, dataInicio, dataFinal));
    labelDespesas.Caption := 'R$ ' + FormatFloat('#,0.00', -retornaValorTotalReceitaOuDespesaMesOuAnoSelecionado(tpDESPESA, dataInicio, dataFinal));
    labelPendentes.Caption := 'R$ ' + FormatFloat('#,0.00', -retornaValorPendenteMesOuAnoSelecionado(dataInicio, dataFinal));
    labelBalanco.Caption := 'R$ ' + FormatFloat('#,0.00',(valorReceita - (-valorDespesa)));
  end
  else
  begin
    if Dialogs.MessageDlg('Deseja realmente sair?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Application.Terminate;
    end
    else
    begin
      terminarApNoInicio := False;
      OnShow(formSelecaoBaseDados);
    end;
  end;

  primeiroAcesso := False;
end;

procedure TformInicial.btnInserirReceitaClick(Sender: TObject);
begin
  formCadReceita.Show;
end;

procedure TformInicial.btnAbreSlcBDClick(Sender: TObject);
begin
  alteraAlias := True;
  formSelecaoBaseDadosNaoPrincipal.Show;
end;

function TformInicial.retornaValorTotalReceitaOuDespesaMesOuAnoSelecionado(tipoTransacao : String; dataInicio, dataFim : String) : Double;
var
  total : Double;
begin
  if tipoTransacao = tpRECEITA then
  begin
    dmDados.dataSet.CommandText :=
    'SELECT '+
      'SUM(VALOR) AS TOTAL '+
    'FROM '+
      'DADOS_INTEGRADOS '+
    'WHERE '+
      'DATA >= FORMAT(#'+ dataInicio +'#,"mm/dd/yyyy") AND '+
      'DATA <= FORMAT(#'+ dataFinal +'#,"mm/dd/yyyy") AND '+
      'VALOR > 0';

    dmDados.dataSet.Open;
    total := dmDados.dataSet.FieldByName('TOTAL').AsFloat;
    dmDados.dataSet.Close;
    valorReceita := total;
  end
  else
  begin
    dmDados.dataSet.CommandText :=
    'SELECT '+
      'SUM(VALOR) AS TOTAL '+
    'FROM '+
      'DADOS_INTEGRADOS '+
    'WHERE '+
      'DATA >= FORMAT(#'+ dataInicio +'#,"mm/dd/yyyy") AND '+
      'DATA <= FORMAT(#'+ dataFinal +'#,"mm/dd/yyyy") AND '+
      'VALOR < 0';

    dmDados.dataSet.Open;
    total := dmDados.dataSet.FieldByName('TOTAL').AsFloat;
    dmDados.dataSet.Close;
    valorDespesa := total;
  end;
  Result := total;
end;

function TformInicial.retornaValorPendenteMesOuAnoSelecionado(prDataInicio, prDataFim : String) : Double;
var
  total : Double;
begin
  dmDados.dataSet.CommandText :=
  'SELECT '+
      'SUM(VALOR) AS TOTAL '+
    'FROM '+
      'DADOS_INTEGRADOS '+
    'WHERE '+
      'DATA >= FORMAT(#'+ dataInicio +'#,"mm/dd/yyyy") AND '+
      'DATA <= FORMAT(#'+ dataFinal +'#,"mm/dd/yyyy") AND '+
      'VALOR < 0 AND ' +
      'PAGO_RECEBIDO LIKE "NÃO"';

  dmDados.dataSet.Open;
  total := dmDados.dataSet.FieldByName('TOTAL').AsFloat;
  dmDados.dataSet.Close;

  Result := total;
end;

procedure TformInicial.identificaDataAtual();
var
  total : Double;
begin
  mesInicio := StrToInt(LeftStr(RightStr(DateToStr(now),7),2));
  anoInicio := StrToInt(RightStr(DateToStr(now),4));

  dataInicio := '01/' + IntToStr(mesInicio) + '/' + IntToStr(anoInicio);
  dataFinal := DateToStr(EndOfTheMonth(StrToDate(dataInicio)));

  cbAnos.Text := IntToStr(anoInicio);
  cbMeses.Text := converteNumeroMesEmNomeMes(mesInicio);
end;

procedure TformInicial.mudaData();
begin
  dataInicio := '01/' + '10' + cbAnos.Text;
end;

function TformInicial.converteNumeroMesEmNomeMes(numeroMes : Integer) : String;
begin
  case numeroMes of
    1: Result := meses.janeiro;
    2: Result := meses.fevereiro;
    3: Result := meses.marco;
    4: Result := meses.abril;
    5: Result := meses.maio;
    6: Result := meses.junho;
    7: Result := meses.julho;
    8: Result := meses.agosto;
    9: Result := meses.setembro;
    10: Result := meses.outubro;
    11: Result := meses.novembro;
    12: Result := meses.dezembro;
  end;
end;

function TformInicial.converteNomeMesEmNumeroMes(nomeMes : string) : Integer;
begin
  if nomeMes = meses.janeiro then
    Result := 1
  else if nomeMes = meses.fevereiro then
    Result := 2
  else if nomeMes = meses.marco then
    Result := 3
  else if nomeMes = meses.abril then
    Result := 4
  else if nomeMes = meses.maio then
    Result := 5
  else if nomeMes = meses.junho then
    Result := 6
  else if nomeMes = meses.julho then
    Result := 7
  else if nomeMes = meses.agosto then
    Result := 8
  else if nomeMes = meses.setembro then
    Result := 9
  else if nomeMes = meses.outubro then
    Result := 10
  else if nomeMes = meses.novembro then
    Result := 11
  else
    Result := 12;
end;

procedure TformInicial.inicializaStructMeses();
begin
  meses.janeiro   := 'Janeiro';
  meses.fevereiro := 'Fevereiro';
  meses.marco     := 'Março';
  meses.abril     := 'Abril';
  meses.maio      := 'Maio';
  meses.junho     := 'Junho';
  meses.julho     := 'Julho';
  meses.agosto    := 'Agosto';
  meses.setembro  := 'Setembro';
  meses.outubro   := 'Outubro';
  meses.novembro  := 'Novembro';
  meses.dezembro  := 'Dezembro';
end;

procedure TformInicial.cbMesesChange(Sender: TObject);
begin
  mesInicio := converteNomeMesEmNumeroMes(cbMeses.Text);
  anoInicio := StrToInt(cbAnos.Text);

  dataInicio := '01/' + IntToStr(mesInicio) + '/' + IntToStr(anoInicio);
  dataFinal := DateToStr(EndOfTheMonth(StrToDate(dataInicio)));

  labelReceitas.Caption := 'R$ ' + FormatFloat('#,0.00', retornaValorTotalReceitaOuDespesaMesOuAnoSelecionado(tpRECEITA, dataInicio, dataFinal));
  labelDespesas.Caption := 'R$ ' + FormatFloat('#,0.00', -retornaValorTotalReceitaOuDespesaMesOuAnoSelecionado(tpDESPESA, dataInicio, dataFinal));
  labelPendentes.Caption := 'R$ ' + FormatFloat('#,0.00', -retornaValorPendenteMesOuAnoSelecionado(dataInicio, dataFinal));
  labelBalanco.Caption := 'R$ ' + FormatFloat('#,0.00',(valorReceita - (-valorDespesa)));

  alimentaTdbChartDespesaPorCategoria;
end;

procedure TformInicial.cbAnosChange(Sender: TObject);
begin
  mesInicio := converteNomeMesEmNumeroMes(cbMeses.Text);
  anoInicio := StrToInt(cbAnos.Text);

  dataInicio := '01/' + IntToStr(mesInicio) + '/' + IntToStr(anoInicio);
  dataFinal := DateToStr(EndOfTheMonth(StrToDate(dataInicio)));

  labelReceitas.Caption := 'R$ ' + FormatFloat('#,0.00', retornaValorTotalReceitaOuDespesaMesOuAnoSelecionado(tpRECEITA, dataInicio, dataFinal));
  labelDespesas.Caption := 'R$ ' + FormatFloat('#,0.00', -retornaValorTotalReceitaOuDespesaMesOuAnoSelecionado(tpDESPESA, dataInicio, dataFinal));
  labelPendentes.Caption := 'R$ ' + FormatFloat('#,0.00', -retornaValorPendenteMesOuAnoSelecionado(dataInicio, dataFinal));
  labelBalanco.Caption := 'R$ ' + FormatFloat('#,0.00',(valorReceita - (-valorDespesa)));

  alimentaTdbChartDespesaPorCategoria;
end;

procedure TformInicial.FormActivate(Sender: TObject);
begin
  identificaDataAtual;

  alimentaTdbChartDespesaPorCategoria;

  labelReceitas.Caption := 'R$ ' + FormatFloat('#,0.00', retornaValorTotalReceitaOuDespesaMesOuAnoSelecionado(tpRECEITA, dataInicio, dataFinal));
  labelDespesas.Caption := 'R$ ' + FormatFloat('#,0.00', -retornaValorTotalReceitaOuDespesaMesOuAnoSelecionado(tpDESPESA, dataInicio, dataFinal));
  labelPendentes.Caption := 'R$ ' + FormatFloat('#,0.00', -retornaValorPendenteMesOuAnoSelecionado(dataInicio, dataFinal));
  labelBalanco.Caption := 'R$ ' + FormatFloat('#,0.00',(valorReceita - (-valorDespesa)));

  alimentaCombo('SELECT YEAR(DATA) FROM DADOS_INTEGRADOS GROUP BY YEAR(DATA)', cbAnos);

  identificaDataAtual;
end;

procedure TformInicial.BitBtn1Click(Sender: TObject);
begin
  if Dialogs.MessageDlg('Deseja realmente sair?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    {Este form está sendo liberado da memória manualmente, pois ao fechar a
    aplicação estava dando erro de "EInvalidPointer". Não sei o motivo, só sei
    que o fomulário de orçamento não estava sendo limpado da memória totalmente.}
    FreeAndNil(formOrcamento);

    Application.Terminate;

    dmDados.bdCon.Connected := false;
  end;
end;

procedure TformInicial.FormCreate(Sender: TObject);
var
  hMenuHandle : Integer;
begin
  //BorderIcons := [biMinimize, biMaximize];
  hMenuHandle := GetSystemMenu(Handle, False);
  if hMenuHandle <> 0 then
    DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);
end;

procedure TformInicial.BitBtn2Click(Sender: TObject);
begin
  formBalancos.Show;
end;

end.

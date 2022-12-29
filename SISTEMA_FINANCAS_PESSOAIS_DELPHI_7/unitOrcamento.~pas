unit unitOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Mask;

type
  TformOrcamento = class(TForm)
    stringGridOrcamento: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    labelGerarOrcamento: TLabel;
    btnGerarOrcamento: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    labelDataPesquisaOrc: TLabel;
    mskDataInicioOrc: TMaskEdit;
    mskDataFinalOrc: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function sqlGeralOrcamentos(prDataInicio, prDataFinal : String) : string;
    procedure stringGridOrcamentoDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
    procedure stringGridOrcamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure alteraOrcamento();
    procedure inicializaArrays();
    procedure checaAlteracaoGrid(key : Word);
    procedure stringGridOrcamentoSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure btnGerarOrcamentoClick(Sender: TObject);
    procedure habilitaGerarNovoOrcamento;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formOrcamento: TformOrcamento;
  ids : array of Integer;
  valores : array of Double;
  contAlteracoes: Integer;

implementation

uses unitTransacoes, StrUtils, DateUtils, dataModule, DB, StdConvs,
  MaskUtils, UnitGlobal, unitCarregamento;

{$R *.dfm}

procedure TformOrcamento.FormShow(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  Color := rgb(204,209,209);

  stringGridOrcamento.ColCount := 1;

  mesInicioPesquisa := StrToInt(LeftStr(RightStr(DateToStr(now),7),2));;
  anoInicioPesquisa := StrToInt(RightStr(DateToStr(now),4));
  dataInicio := '01/'+ IntToStr(mesInicioPesquisa) +'/'+ IntToStr(anoInicioPesquisa);
  dataFinal := DateToStr(EndOfTheMonth(StrToDate(dataInicio)));
  mesPesquisa := mesInicioPesquisa;
  anoPesquisa := anoInicioPesquisa;

  mskDataInicioOrc.Text := dataInicio;
  mskDataFinalOrc.Text := dataFinal;

  labelDataPesquisaOrc.Caption := nomesMesesPesquisa[mesPesquisa] + ' ' + IntToStr(anoPesquisa);

  alimentaStringGridDinamica(stringGridOrcamento, sqlGeralOrcamentos(dataInicio, dataFinal));

  concatenaStringNaStringGrid(stringGridOrcamento, 2);
  concatenaStringNaStringGrid(stringGridOrcamento, 3);
  concatenaStringNaStringGrid(stringGridOrcamento, 4);

  habilitaGerarNovoOrcamento;

  inicializaArrays();
  Screen.Cursor := crDefault;
end;

procedure TformOrcamento.habilitaGerarNovoOrcamento;
begin
  if stringGridOrcamento.ColCount > 1 then
  begin
    btnGerarOrcamento.Visible := False;
    labelGerarOrcamento.Visible := False
  end
  else
  begin
    labelGerarOrcamento.Visible := True;
    btnGerarOrcamento.Visible := True;
  end;
end;

procedure TformOrcamento.BitBtn3Click(Sender: TObject);
begin
  alimentaStringGridDinamica(stringGridOrcamento, sqlGeralOrcamentos(dataInicio, dataFinal));

  concatenaStringNaStringGrid(stringGridOrcamento, 2);
  concatenaStringNaStringGrid(stringGridOrcamento, 3);
  concatenaStringNaStringGrid(stringGridOrcamento, 4);
end;

procedure TformOrcamento.alteraOrcamento();
var
  i : Integer;
  valor : string;
begin
  //BDState := stBdInsert;
  with dmDados.query do
  begin
    Close;

    removeConcStringNaStringGrid(stringGridOrcamento, 2);

    for i := 1 to stringGridOrcamento.RowCount - 1 do
    begin
      SQL.Clear;

      if stringGridOrcamento.Cells[2,i] = '' then
        stringGridOrcamento.Cells[2,i] := '0';

      if AnsiContainsStr(stringGridOrcamento.Cells[2,i], ',') then
        stringGridOrcamento.Cells[2,i] := StringReplace(stringGridOrcamento.Cells[2,i], ',', '.', [rfReplaceAll, rfIgnoreCase]);

      SQL.Add('UPDATE ORCAMENTO SET VALOR = ' + stringGridOrcamento.Cells[2,i] + ' WHERE CÓDIGO = ' + IntToStr(ids[i]));

      if AnsiContainsStr(stringGridOrcamento.Cells[2,i], '.') then
        stringGridOrcamento.Cells[2,i] := StringReplace(stringGridOrcamento.Cells[2,i], '.', ',', [rfReplaceAll, rfIgnoreCase]);

      ExecSQL;
    end;
  end;
  ShowMessage('Orçamento incluído com sucesso!');
  contAlteracoes := 0;
  inicializaArrays();

  try
    alimentaStringGridDinamica(formCadTransacao.stringGridTotalCategoriaMes, formCadTransacao.sqlTotalPorCategoria(formCadTransacao.mskDataInicio, formCadTransacao.mskDataFinal));
  Except
  on e : Exception do
  end;

  alimentaStringGridDinamica(stringGridOrcamento, sqlGeralOrcamentos(dataInicio, dataFinal));
  concatenaStringNaStringGrid(stringGridOrcamento, 2);
  concatenaStringNaStringGrid(stringGridOrcamento, 3);
  concatenaStringNaStringGrid(stringGridOrcamento, 4);
  //BDState := stBdNormal;
end;

procedure TformOrcamento.BitBtn1Click(Sender: TObject);
begin
  alteraOrcamento();

  if (formCadTransacao.mskDataInicio.Text <> '__/__/____') and (formCadTransacao.mskDataFinal.Text = '__/__/____') then
    alimentaStringGridDinamica(formCadTransacao.stringGridTotalCategoriaMes, formCadTransacao.sqlTotalPorCategoria(formCadTransacao.mskDataInicio, formCadTransacao.mskDataFinal));
end;

function TformOrcamento.sqlGeralOrcamentos(prDataInicio, prDataFinal : string) : string;
var
  sql : String;
begin
  sql :=  'SELECT '+
            'O.CÓDIGO AS ID, '+
            'O.CATEGORIA, '+
            'O.VALOR AS VALOR_PERMITIDO, '+

            'ABS((  SELECT '+
                  'SUM(VALOR) '+
                'FROM '+
                  'DADOS_INTEGRADOS '+
                'WHERE '+
                  'CATEGORIA = O.CATEGORIA AND '+
                  'DATA BETWEEN FORMAT(#'+ mskDataInicioOrc.Text +'#,"mm/dd/yyyy") AND '+
                  'FORMAT(#'+ mskDataFinalOrc.Text +'#,"mm/dd/yyyy"))) AS VALOR_GASTO, '+

                'IIF(O.VALOR - ABS((-(  SELECT '+
                            'SUM(VALOR) '+
                          'FROM '+
                            'DADOS_INTEGRADOS '+
                          'WHERE '+
                            'CATEGORIA = O.CATEGORIA AND '+
                            'DATA>= FORMAT(#'+ mskDataInicioOrc.Text +'#,"mm/dd/yyyy") AND '+
                            'DATA <= FORMAT(#'+ mskDataFinalOrc.Text +'#,"mm/dd/yyyy")))) < 0, 0, '+

                            'O.VALOR - ABS((-(  SELECT '+
                              'SUM(VALOR) '+
                            'FROM '+
                              'DADOS_INTEGRADOS '+
                            'WHERE '+
                              'CATEGORIA = O.CATEGORIA AND '+
                              'DATA>= FORMAT(#'+ mskDataInicioOrc.Text +'#,"mm/dd/yyyy") AND '+
                              'DATA <= FORMAT(#'+ mskDataFinalOrc.Text +'#,"mm/dd/yyyy"))))) AS VALOR_RESTANTE, '+

                            'IIF(IIF(O.VALOR = 0,0,ROUND(((ABS((  SELECT '+
                                                        'SUM(VALOR) '+
                                                      'FROM '+
                                                        'DADOS_INTEGRADOS '+
                                                      'WHERE '+
                                                        'CATEGORIA = O.CATEGORIA AND '+
                                                        'DATA >= FORMAT(#'+ mskDataInicioOrc.Text +'#,"mm/dd/yyyy") AND '+
                                                        'DATA <= FORMAT(#'+ mskDataFinalOrc.Text +'#,"mm/dd/yyyy")))/O.VALOR)*100),2))&"%" = "%","0%",IIF(O.VALOR = 0,0,ROUND(((ABS((  SELECT '+
                                                        'SUM(VALOR) '+
                                                      'FROM '+
                                                        'DADOS_INTEGRADOS '+
                                                      'WHERE '+
                                                        'CATEGORIA = O.CATEGORIA AND '+
                                                        'DATA >= FORMAT(#'+ mskDataInicioOrc.Text +'#,"mm/dd/yyyy") AND '+
                                                        'DATA <= FORMAT(#'+ mskDataFinalOrc.Text +'#,"mm/dd/yyyy")))/O.VALOR)*100),2))&"%") AS PERCENTUAL, '+
            'O.ALTERADO '+
          'FROM '+
            'ORCAMENTO AS O, '+
            'DADOS_INTEGRADOS AS DI '+
          'WHERE '+
            //'DI.VALOR < 0 AND ' +
            'DI.CATEGORIA = O.CATEGORIA AND '+
            'O.DATA_INICIO >= FORMAT(#'+ mskDataInicioOrc.Text +'#,"mm/dd/yyyy") AND '+
            'O.DATA_FIM <= FORMAT(#'+ mskDataFinalOrc.Text +'#,"mm/dd/yyyy") '+
          'GROUP BY '+
            'O.CÓDIGO, '+
            'O.CATEGORIA, '+
            'O.VALOR, '+
            'O.ALTERADO';
  Result := sql;
end;

procedure TformOrcamento.inicializaArrays();
var
  i : integer;
begin
  removeConcStringNaStringGrid(stringGridOrcamento, 2);

  SetLength(ids, stringGridOrcamento.RowCount);
  SetLength(valores, stringGridOrcamento.RowCount);
  for i := 1 to stringGridOrcamento.RowCount - 1 do
  begin
    ids[i] := StrToInt(stringGridOrcamento.Cells[0,i]);
    valores[i] := StrToFloat(stringGridOrcamento.Cells[2,i]);
  end;

  concatenaStringNaStringGrid(stringGridOrcamento, 2);
end;

procedure TformOrcamento.stringGridOrcamentoDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  s, percentualSemSimbolo : string;
  percentual : Double;
begin
  if ARow = 0 then
  begin
    s := stringGridOrcamento.Cells[ACol, ARow];
    stringGridOrcamento.Canvas.Brush.Color := clActiveBorder;
    stringGridOrcamento.Canvas.FillRect(Rect);
    stringGridOrcamento.Canvas.Font.Color := clBlack;
    stringGridOrcamento.Canvas.Font.Style := [fsBold];
    stringGridOrcamento.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, s);
  end
  else if ARow mod 2 = 0 then
  begin
    s := stringGridOrcamento.Cells[ACol, ARow];
    stringGridOrcamento.Canvas.Brush.Color := $229954;
    stringGridOrcamento.Canvas.FillRect(Rect);
    stringGridOrcamento.Canvas.Font.Color := clBlack;
    stringGridOrcamento.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, s);
  end
  else
  begin
    s := stringGridOrcamento.Cells[ACol, ARow];
    stringGridOrcamento.Canvas.Brush.Color := $a9dfbf;
    stringGridOrcamento.Canvas.FillRect(Rect);
    stringGridOrcamento.Canvas.Font.Color := clBlack;
    stringGridOrcamento.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, s);
  end;

  if ARow > 0 then
    percentualSemSimbolo := StringReplace(stringGridOrcamento.Cells[5, ARow], '%', '', [rfReplaceAll, rfIgnoreCase]);

  if percentualSemSimbolo <> '' then
    percentual := StrToFloat(percentualSemSimbolo)
  else
    percentual := 0;
  
  if percentual > 100 then
  begin
    stringGridOrcamento.Canvas.Font.Style := [fsBold];
    stringGridOrcamento.Canvas.Font.Color := RGB(RGB_VERMELHO_2.R, RGB_VERMELHO_2.G, RGB_VERMELHO_2.B);
    stringGridOrcamento.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, s);
  end;

  {if (ARow > 0) and (ACol = 2) then
  begin
    stringGridOrcamento.Canvas.Font.Style := [fsBold];
    stringGridOrcamento.Canvas.Font.Size := 15;
    stringGridOrcamento.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, s);
  end;}

  formCadTransacao.mudaCoresLinhasStringgrid(ARow, ACol, Rect, clBlack, stringGridOrcamento);
end;

procedure TformOrcamento.BitBtn2Click(Sender: TObject);
begin
  if contAlteracoes > 0 then
  begin
    if Dialogs.MessageDlg('Existem '+ IntToStr(contAlteracoes) +' registros alterados que não foram salvos, deseja sair mesmo assim?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Close;
    end;
  end
  else
    Close;
end;

procedure TformOrcamento.checaAlteracaoGrid(key : Word);
var
  i : Integer;
  valorArray, valorGrid : Double;
begin
  if (Ord(key) = 13) or (Ord(key) = 38) or (Ord(key) = 40) then
  begin
    removeConcStringNaStringGrid(stringGridOrcamento, 2);

    contAlteracoes := 0;
    for i := 1 to Length(valores) - 1 do
    begin
      valorArray := valores[i];

      if(stringGridOrcamento.Cells[2,i] <> '') then
        valorGrid := StrToFloat(stringGridOrcamento.Cells[2,i])
      else
      begin
        stringGridOrcamento.Cells[2,i] := '0';
        valorGrid := 0;
      end;

      if valorArray <> valorGrid then
      begin
        contAlteracoes := contAlteracoes + 1;
        stringGridOrcamento.Cells[6,i] := 'ALTERADO';
      end
      else
        stringGridOrcamento.Cells[6,i] := '';
    end;
    concatenaStringNaStringGrid(stringGridOrcamento, 2);
  end;
end;

procedure TformOrcamento.stringGridOrcamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  checaAlteracaoGrid(Key);
end;

procedure TformOrcamento.stringGridOrcamentoSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  if ACol <> 2 then
    stringGridOrcamento.Options := stringGridOrcamento.Options - [goEditing]
  else
    stringGridOrcamento.Options := stringGridOrcamento.Options + [goEditing]
end;

procedure TformOrcamento.btnGerarOrcamentoClick(Sender: TObject);
var
  i : Integer;
begin
  {Consulta os nomes das categorias}
  {Aqui será retornado a quantidade total de categorias cadastradas}
  dmDados.dataSet.CommandText := 'SELECT NOME_CATEGORIA FROM CATEGORIA WHERE TIPO_CATEGORIA = "Despesa"';
  dmDados.dataSet.Open;

  {Insere os registros de orçamento para todas as categorias}
  for i := 0 to dmDados.dataSet.RecordCount - 1 do
  begin
    dmDados.query.Close;
    dmDados.query.SQL.Clear;
    dmDados.query.SQL.Add('INSERT INTO ORCAMENTO (CATEGORIA, DATA_INICIO, DATA_FIM) VALUES (:prNomeCategoria, :prDataInicio, :prDataFim)');
    dmDados.query.Parameters.ParamByName('prNomeCategoria').Value := dmDados.dataSet.Fields[0].AsString;
    dmDados.query.Parameters.ParamByName('prDataInicio').Value := dataInicio;
    dmDados.query.Parameters.ParamByName('prDataFim').Value := dataFinal;
    dmDados.query.ExecSQL;
    dmDados.dataSet.Next;
  end;

  dmDados.dataSet.Close;

  alimentaStringGridDinamica(stringGridOrcamento, sqlGeralOrcamentos(dataInicio, dataFinal));

  habilitaGerarNovoOrcamento;
end;

procedure TformOrcamento.BitBtn4Click(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  mesAnteriorPesquisa(mskDataInicioOrc, mskDataFinalOrc, labelDataPesquisaOrc);

  alimentaStringGridDinamica(stringGridOrcamento, sqlGeralOrcamentos(mskDataInicioOrc.Text, mskDataFinalOrc.Text));

  concatenaStringNaStringGrid(stringGridOrcamento, 2);
  concatenaStringNaStringGrid(stringGridOrcamento, 3);
  concatenaStringNaStringGrid(stringGridOrcamento, 4);

  inicializaArrays;
  Screen.Cursor := crDefault;
end;

procedure TformOrcamento.BitBtn5Click(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  proximoMesPesquisa(mskDataInicioOrc, mskDataFinalOrc, labelDataPesquisaOrc);

  alimentaStringGridDinamica(stringGridOrcamento, sqlGeralOrcamentos(mskDataInicioOrc.Text, mskDataFinalOrc.Text));

  concatenaStringNaStringGrid(stringGridOrcamento, 2);
  concatenaStringNaStringGrid(stringGridOrcamento, 3);
  concatenaStringNaStringGrid(stringGridOrcamento, 4);

  inicializaArrays;
  Screen.Cursor := crDefault;
end;

procedure TformOrcamento.FormCreate(Sender: TObject);
begin
  BorderIcons := BorderIcons - [biMinimize];
end;

end.

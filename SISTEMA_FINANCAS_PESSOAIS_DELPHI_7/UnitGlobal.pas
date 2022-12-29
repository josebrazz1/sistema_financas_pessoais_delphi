unit UnitGlobal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, CheckLst;

type
  TMeses = Record
    janeiro   : String;
    fevereiro : String;
    marco     : String;
    abril     : String;
    maio      : String;
    junho     : String;
    julho     : String;
    agosto    : String;
    setembro  : String;
    outubro   : String;
    novembro  : String;
    dezembro  : String;
  end;

  TRGBcolor = record
    case integer of
      0: (C : TColor);
      1: (R, G, B: byte);
    end;

  function retornaUmRegistroSQL(SQL, campo : String) : String;
  procedure alimentaStringGridDinamica(prStringGrid : TStringGrid; prSQL : String);
  procedure calcTamanhoColuna(prStringGrid : TStringGrid);
  procedure deletaLinhaStringgrid(Grid: TStringGrid; ARow: Integer);

  procedure mesAnteriorPesquisa(prMskDataInicio, prMskDataFinal : TMaskEdit;
    prLabelDataPesquisa : TLabel);

  procedure proximoMesPesquisa(prMskDataInicio, prMskDataFinal : TMaskEdit;
    prLabelDataPesquisa : TLabel);

  procedure concatenaStringNaStringGrid(prStringGrid : TStringGrid;
    colunaMod : Integer);

  procedure removeConcStringNaStringGrid(prStringGrid : TStringGrid;
    colunaMod : Integer);

  procedure alimentaCombo(queryPr : string; comboBoxPr : TComboBox);
  function identificaCamposNaoPreenchidos(prForm : TForm) : Boolean;
  procedure limpaListaCamposNaoPreenchidos();

const
  RGB_VERDE_1 : TRGBcolor = (R:39; G:174; B:96);
  RGB_VERMELHO_1 : TRGBcolor = (R:231; G:76; B:60);
  RGB_VERMELHO_2 : TRGBcolor = (R:169; G:50; B:38);

  tpRECEITA : String = 'RECEITA';
  tpDESPESA : String = 'DESPESA';

  stBdInsert : string = 'INSERT';
  stBdUpdate : string = 'UPDATE';
  stBdDelete : string = 'DELETE';
  stBdNormal : string = '';

  nmFORM_RECEITA : string = 'FORM_RECEITA';
  nmFORM_DESPESA : string = 'FORM_DESPESA';

  deletandoApenasNormal : String = 'APENAS NORMAL';
  deletandoNormalAcompanhada : String = 'NORMAL ACOMPANHADA DE CCR OU FIXA';

  nomesMesesPesquisa : array [1..12] of String =
    ('janeiro','fevereiro','março','abril','maio','junho','julho','agosto',
    'setembro','outubro','novembro','dezembro');

  camposNaoPreenchidosLabels : array [0..7] of String =
    ('Data','Descrição','Conta','Categoria','Subcategoria', 'Pago/recebido','Valor',
    'Número de parcelas');

var
  valorReceita, valorDespesa, somaValoresClicados : Double;

  dataInicio, dataFinal, totalRetornoRegistro,
  BDState, mesPesquisaStr, baseDadosSelecionada, formAberto,
  bdAlias : String;

  mesInicioPesquisa, anoInicioPesquisa, mesInicio,
  anoInicio, anoAtual, mesPesquisa, anoPesquisa : Integer;

  meses : TMeses;

  camposNaoPreenchidos : array of Integer;

  terminarApNoInicio : Boolean = False;
  usuarioOuSenhaIncorretos : Boolean = False;
  primeiroAcesso : Boolean = True;

implementation

uses dataModule, StrUtils, DateUtils;

{Função que retorna apenas um registro em uma consulta SQL}
{É útil para quando se deseja atribuir o valor diretamente
a uma variável, por exemplo}
function retornaUmRegistroSQL(SQL, campo : String) : String;
var
  registroValor : string;
begin
  dmDados.dataSet.CommandText := SQL;
  dmDados.dataSet.Open;
  registroValor := dmDados.dataSet.FieldByName(campo).AsString;
  dmDados.dataSet.Close;

  Result := registroValor;
end;

procedure alimentaStringGridDinamica(prStringGrid : TStringGrid; prSQL : String);
var linha : integer;
var coluna : integer;
begin
  with dmDados.query do
  begin
    Close;
    SQL.Clear;

    {Recebe o comando SQL passado por parâmetro}
    dmDados.dataSet.CommandText := prSQL;

    {Abre o Dataset}
    dmDados.dataSet.Open;

    {Caso o dataset não estiver vazio, ou seja, caso uma consulta tenha sido
    realizada}
    if dmDados.dataSet.RecordCount > 0 then
    begin
      {Percorre todas as colunas}
      for coluna := 0 to dmDados.dataSet.FieldCount - 1 do
      begin
        dmDados.dataSet.First;
        prStringGrid.ColCount := coluna + 1;
        {Para cada coluna percorre todas as linhas}
        for linha := 1 to dmDados.dataSet.RecordCount do
        begin
          {Se a linha for igual a 1 significa que está no título}
          if linha = 1 then
          begin
            {Pega os nomes das colunas do banco de dados e coloca na primeira linha}
            prStringGrid.Cells[coluna,0] := dmDados.dataSet.Fields[coluna].FieldName;
          end;

          {Se a coluna for igual a primeira e a grid for a de despesas}
          if (coluna = 0) and (prStringGrid.Name = 'stringGridTransacoes') then
          begin
            {A coluna 0 recebe o colchetes vazio, pois é ela que indicará o
            clique do usuário em uma linha}
            prStringGrid.Cells[0,linha] := '[    ]';
          end
          else
          begin
            {Caso a coluna não seja a primeira pega as informações do banco de
            dados normalmente}
            prStringGrid.RowCount := linha + 1;
            prStringGrid.Cells[coluna,linha] := dmDados.dataSet.Fields[coluna].AsString;
          end;

          dmDados.dataSet.Next;
        end;
      end;
    end
    else
    begin
      prStringGrid.RowCount := 0;
    end;

    {Após o preenchimento da grid, calcula o tamanho das colunas baseado no
    tamanho da maior palavra encontrada nela}
    calcTamanhoColuna(prStringGrid);

    {Fecha o Dataset}
    dmDados.dataSet.Close;

    {Este trecho mostra em um label, que fica abaixo da grid, o número de
    registros retornados na consulta}
    if prStringGrid.Name = 'stringGridTransacoes' then
    begin
    {Caso esteja realizando esta tarefa após INSERIR um registro}
    if BDState = stBdInsert then
    begin
      deletaLinhaStringgrid(prStringGrid, prStringGrid.RowCount);
      totalRetornoRegistro := 'A consulta retornou ' + IntToStr(prStringGrid.RowCount) + ' registros.';
    end
    {Caso esteja realizando esta tarefa após DELETAR um registro}
    else if BDState = stBdDelete then
      totalRetornoRegistro := 'A consulta retornou ' + IntToStr(prStringGrid.RowCount - 1) + ' registros.'
    {Caso esteja realizando esta tarefa após ALTERAR um registro}
    else if BDState = stBdUpdate then
    begin
      totalRetornoRegistro := 'A consulta retornou ' + IntToStr(prStringGrid.RowCount - 1) + ' registros.';
      prStringGrid.RowCount := prStringGrid.RowCount - 1;
    end
    {Caso seja apenas uma consulta normal}
    else
      totalRetornoRegistro := 'A consulta retornou ' + IntToStr(prStringGrid.RowCount - 1) + ' registros.';
    end;
  end;

  if prStringGrid.Name = 'stringGridTransacoes' then
    concatenaStringNaStringGrid(prStringGrid, 4)
  else if prStringGrid.Name = 'stringGridTotalCategoriaMes' then
  begin
    concatenaStringNaStringGrid(prStringGrid, 1);
    concatenaStringNaStringGrid(prStringGrid, 2);
    concatenaStringNaStringGrid(prStringGrid, 3);
  end
  else if prStringGrid.Name = 'stringGridTotalSubCategoriaMes' then
    concatenaStringNaStringGrid(prStringGrid, 1);

end;

procedure calcTamanhoColuna(prStringGrid : TStringGrid);
var
  i, j, k, Temp, Longest: Integer;
const
  Padding = 20;
begin
  for j := 0 to prStringGrid.ColCount - 1 do
  begin
    Longest := prStringGrid.Canvas.TextWidth(prStringGrid.Cells[j, 0]);
    for i := 0 to prStringGrid.RowCount - 1 do
    begin
      Temp := prStringGrid.Canvas.TextWidth(prStringGrid.Cells[j, i]);
      if Temp > Longest then
      Longest := Temp;
    end;
    prStringGrid.ColWidths[j] := Longest + Padding;
  end;
end;

procedure deletaLinhaStringgrid(Grid: TStringGrid; ARow: Integer);
var
  i: Integer;
begin
  for i := ARow to Grid.RowCount - 2 do
    Grid.Rows[i].Assign(Grid.Rows[i + 1]);

  Grid.RowCount := Grid.RowCount - 1;
end;

procedure proximoMesPesquisa(prMskDataInicio, prMskDataFinal : TMaskEdit;
            prLabelDataPesquisa : TLabel);
begin
  mesPesquisa := mesPesquisa + 1;
  mesPesquisaStr := IntToStr(mesPesquisa);

  if mesPesquisa >= 13 then
  begin
    mesPesquisa := 1;
    anoPesquisa := anoPesquisa + 1;
    mesPesquisaStr := IntToStr(mesPesquisa);
  end;

  if mesPesquisa < 10 then
    mesPesquisaStr := '0' + mesPesquisaStr;

  prLabelDataPesquisa.Caption := nomesMesesPesquisa[mesPesquisa] + ' ' + IntToStr(anoPesquisa);

  prMskDataInicio.Text := '01/' + mesPesquisaStr + '/'+ IntToStr(anoPesquisa);
  prMskDataFinal.Text := DateToStr(EndOfTheMonth(StrToDate(prMskDataInicio.Text)));
end;

procedure mesAnteriorPesquisa(prMskDataInicio, prMskDataFinal : TMaskEdit;
            prLabelDataPesquisa : TLabel);
begin
  mesPesquisa := mesPesquisa - 1;
  mesPesquisaStr := IntToStr(mesPesquisa);

  if mesPesquisa < 1 then
  begin
    mesPesquisa := 12;
    anoPesquisa := anoPesquisa - 1;
    mesPesquisaStr := IntToStr(mesPesquisa);
  end;

  if mesPesquisa < 10 then
    mesPesquisaStr := '0' + mesPesquisaStr;

  prLabelDataPesquisa.Caption := nomesMesesPesquisa[mesPesquisa] + ' ' + IntToStr(anoPesquisa);

  prMskDataInicio.Text := '01/' + mesPesquisaStr + '/'+ IntToStr(anoPesquisa);
  prMskDataFinal.Text := DateToStr(EndOfTheMonth(StrToDate(prMskDataInicio.Text)));
end;

procedure concatenaStringNaStringGrid(prStringGrid : TStringGrid; colunaMod : Integer);
var
  linha, coluna : Integer;
begin
  {Percorre a string grid inteira, linhas e colunas}
  for coluna := 0 to prStringGrid.ColCount - 1 do
  begin
    for linha := 0 to prStringGrid.RowCount - 1 do
    begin
      {Caso a linha atual não seja a linha zero (cabeçalho), e a coluna seja igual a coluna de modificação
      passada por parâmetro e o valor da celula não seja vazio}
      if (linha > 0) and (coluna = colunaMod) and (prStringGrid.Cells[colunaMod, linha] <> '') then
        {Formata a celula para o formato de moeda}
        prStringGrid.Cells[colunaMod, linha] := FormatFloat('#,0.00', StrToFloat(prStringGrid.Cells[colunaMod, linha]));
    end;
  end;

  calcTamanhoColuna(prStringGrid);
end;

procedure removeConcStringNaStringGrid(prStringGrid : TStringGrid; colunaMod : Integer);
var
  linha, coluna : Integer;
begin
  for coluna := 0 to prStringGrid.ColCount - 1 do
  begin
    for linha := 1 to prStringGrid.RowCount - 1 do
    begin
      if coluna = colunaMod then
        prStringGrid.Cells[colunaMod, linha] := StringReplace(prStringGrid.Cells[colunaMod, linha], '.', '',[rfReplaceAll, rfIgnoreCase]);
        prStringGrid.Cells[colunaMod, linha] := StringReplace(prStringGrid.Cells[colunaMod, linha], 'R$', '',[rfReplaceAll, rfIgnoreCase]);
    end;
  end;
end;

//Alimenta combo box ===========================================================
procedure alimentaCombo(queryPr : string; comboBoxPr : TComboBox);
begin
  with dmDados.query do
  begin
    Close;
    SQL.Clear;
    dmDados.dataSet.CommandText := queryPr;
    dmDados.dataSet.Open;
    comboBoxPr.Clear();
    while not dmDados.dataSet.Eof do
    begin
      comboBoxPr.Items.Add(dmDados.dataSet.Fields[0].Value);
      dmDados.dataSet.Next;
    end;
    dmDados.dataSet.Close;
  end;
end;
//==============================================================================

function identificaCamposNaoPreenchidos(prForm : TForm) : Boolean;
var
  i, contCamposNaoPreenchidos : Integer;
  msgValidacaoCampos : String;

begin
  contCamposNaoPreenchidos := 0;

  msgValidacaoCampos := '' + sLineBreak;

  {o length aqui é de 8 pois é o número campos do form que não podem ser
  vazios}
  SetLength(camposNaoPreenchidos, 8);

  {Verifica quais campos estão vazios e adicionam os que estão ao array
  de campos não preenciidos}
  {No caso do campo data, como ele está mascarado como data não checa se
  é vazio e sim se ele possui o formato "  /  /     ", o qual deve possuir
  um length de 10 chars}
  if TMaskEdit(prForm.FindComponent('txtData')).Text = '  /  /    ' then
    camposNaoPreenchidos[0] := 1;
  if TLabeledEdit(prForm.FindComponent('txtDescricao')).Text = '' then
    camposNaoPreenchidos[1] := 2;
  if TComboBox(prForm.FindComponent('cbConta')).Text = '' then
    camposNaoPreenchidos[2] := 3;
  if TComboBox(prForm.FindComponent('cbCategoria')).Text = '' then
    camposNaoPreenchidos[3] := 4;
  if TComboBox(prForm.FindComponent('cbSubcategoria')).Text = '' then
    camposNaoPreenchidos[4] := 5;
  if TComboBox(prForm.FindComponent('cbPagoRecebido')).Text = '' then
    camposNaoPreenchidos[5] := 6;
  if TMaskEdit(prForm.FindComponent('txtValor')).Text = '' then
    camposNaoPreenchidos[6] := 7;

  if prForm.Name = 'formCadTransacao' then
  begin
    if (TLabeledEdit(prForm.FindComponent('txtParcelas')).Text = '') and (TRadioButton(prForm.FindComponent('rdCcr')).Checked) then
      camposNaoPreenchidos[7] := 8;
  end;

  for i := 0 to Length(camposNaoPreenchidosLabels) - 1 do
  begin
    if camposNaoPreenchidos[i] <> 0 then
    begin
      msgValidacaoCampos := msgValidacaoCampos + sLineBreak + camposNaoPreenchidosLabels[i] + sLineBreak;
      contCamposNaoPreenchidos := contCamposNaoPreenchidos + 1;
    end;
  end;

  if contCamposNaoPreenchidos > 0 then
  begin
    ShowMessage('CAMPOS OBRIGATÓRIOS NÃO PREENCHIDOS: ' + msgValidacaoCampos);
    limpaListaCamposNaoPreenchidos;
    Result := True;;
  end
  else
    Result := False;
end;

procedure limpaListaCamposNaoPreenchidos();
begin
  SetLength(camposNaoPreenchidos, 8);

  camposNaoPreenchidos[0] := 0;
  camposNaoPreenchidos[1] := 0;
  camposNaoPreenchidos[2] := 0;
  camposNaoPreenchidos[3] := 0;
  camposNaoPreenchidos[4] := 0;
  camposNaoPreenchidos[5] := 0;
  camposNaoPreenchidos[6] := 0;
  camposNaoPreenchidos[7] := 0;
end;

end.

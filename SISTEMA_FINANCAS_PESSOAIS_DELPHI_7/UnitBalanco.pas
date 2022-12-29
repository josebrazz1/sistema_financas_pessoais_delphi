unit UnitBalanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, TeeProcs, TeEngine, Chart, DbChart;

type
  TformBalancos = class(TForm)
    stringGridBalancos: TStringGrid;
    DBChart1: TDBChart;
    function sqlBalancos : string;
    procedure FormShow(Sender: TObject);
    procedure stringGridBalancosDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formBalancos: TformBalancos;

implementation

uses UnitGlobal, unitTransacoes;

{$R *.dfm}

function TformBalancos.sqlBalancos : string;
var
  sql : string;
begin
  sql :=  'SELECT '+
          '   BAL.MES, '+
          '   SUM(BAL.RECEITA) AS RECEITA, '+
          '   SUM(BAL.DESPESA) AS DESPESA, '+
          '   (SUM(BAL.RECEITA)-ABS(SUM(BAL.DESPESA))) AS BALANCO, '+
          '   IIF(ABS(SUM(BAL.DESPESA)) > SUM(BAL.RECEITA),''X'','''') AS FLAG '+
          'FROM '+
          '   (SELECT DISTINCT '+
          '     MONTH (DI.DATA) AS MES, '+
          '     SUM((SELECT TOP 1 VALOR FROM DADOS_INTEGRADOS WHERE VALOR = DI.VALOR AND VALOR < 0)) AS DESPESA, '+
          '     SUM((SELECT TOP 1 VALOR FROM DADOS_INTEGRADOS WHERE VALOR = DI.VALOR AND VALOR > 0)) AS RECEITA '+
          '   FROM '+
          '     DADOS_INTEGRADOS AS DI '+
          '   WHERE '+
          '     DATA BETWEEN FORMAT(#01/01/2022#,"mm/dd/yyyy") AND '+
          '     FORMAT(#31/12/2022#,"mm/dd/yyyy") '+
          '   GROUP BY '+
          '     MONTH(DI.DATA), '+
          '     VALOR) AS BAL '+
          'GROUP BY '+
          '   BAL.MES';

  Result := sql;
end;

procedure TformBalancos.FormShow(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  alimentaStringGridDinamica(stringGridBalancos, sqlBalancos);

  concatenaStringNaStringGrid(stringGridBalancos, 1);
  concatenaStringNaStringGrid(stringGridBalancos, 2);
  concatenaStringNaStringGrid(stringGridBalancos, 3);
  Screen.Cursor := crDefault;
end;

procedure TformBalancos.stringGridBalancosDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  s, percentualSemSimbolo : string;
begin
  if ARow = 0 then
  begin
    s := stringGridBalancos.Cells[ACol, ARow];
    stringGridBalancos.Canvas.Brush.Color := clActiveBorder;
    stringGridBalancos.Canvas.FillRect(Rect);
    stringGridBalancos.Canvas.Font.Color := clBlack;
    stringGridBalancos.Canvas.Font.Style := [fsBold];
    stringGridBalancos.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, s);
  end
  else if ARow mod 2 = 0 then
  begin
    s := stringGridBalancos.Cells[ACol, ARow];
    stringGridBalancos.Canvas.Brush.Color := $229954;
    stringGridBalancos.Canvas.FillRect(Rect);
    stringGridBalancos.Canvas.Font.Color := clBlack;
    stringGridBalancos.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, s);
  end
  else
  begin
    s := stringGridBalancos.Cells[ACol, ARow];
    stringGridBalancos.Canvas.Brush.Color := $a9dfbf;
    stringGridBalancos.Canvas.FillRect(Rect);
    stringGridBalancos.Canvas.Font.Color := clBlack;
    stringGridBalancos.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, s);
  end;

  if stringGridBalancos.Cells[4, ARow] = 'X' then
  begin
    stringGridBalancos.Canvas.Font.Style := [fsBold];
    stringGridBalancos.Canvas.Font.Color := RGB(RGB_VERMELHO_2.R, RGB_VERMELHO_2.G, RGB_VERMELHO_2.B);
    stringGridBalancos.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, s);
  end;

  formCadTransacao.mudaCoresLinhasStringgrid(ARow, ACol, Rect, clBlack, stringGridBalancos);
end;

procedure TformBalancos.FormCreate(Sender: TObject);
begin
  Color := rgb(204,209,209);
end;

end.

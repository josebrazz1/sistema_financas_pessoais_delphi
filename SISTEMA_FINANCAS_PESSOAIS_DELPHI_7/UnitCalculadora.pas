unit UnitCalculadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TformCalculadora = class(TForm)
    btn7: TBitBtn;
    btn8: TBitBtn;
    btn9: TBitBtn;
    btn4: TBitBtn;
    btn5: TBitBtn;
    btn6: TBitBtn;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn0: TBitBtn;
    btnPonto: TBitBtn;
    BitBtn12: TBitBtn;
    btnIgual: TBitBtn;
    btnSomar: TBitBtn;
    btnSubtrair: TBitBtn;
    btnMultiplicar: TBitBtn;
    btnDividir: TBitBtn;
    btnPorcentagem: TBitBtn;
    btnApagar: TBitBtn;
    btnLimpar: TBitBtn;
    txtCalc: TEdit;
    txtValor1: TEdit;
    txtValor2: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btn0Click(Sender: TObject);
    procedure btnSomarClick(Sender: TObject);
    procedure txtValor1Change(Sender: TObject);
    procedure txtValor2Change(Sender: TObject);
    procedure btnIgualClick(Sender: TObject);
    procedure btnSubtrairClick(Sender: TObject);
    procedure btnMultiplicarClick(Sender: TObject);
    procedure btnDividirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure defineIndiceESinalOperador(prOperador : string; operadorIndexCase : Integer);
    function calcular(prValor1 : Double; prValor2 : Double; indiceOperador : Integer) : Double;
    procedure restauraEstado();
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure validaDivisaoPorZero();
    procedure btnApagarClick(Sender: TObject);
    procedure btnPorcentagemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCalculadora: TformCalculadora;
  valor1, valor2, resultado : Double;
  operadorClicado, divZero, apagando : Boolean;
  operador : String;
  operadorIndice : Integer;

implementation

uses unitReceita, Math, unitTransacoes, Mask, StrUtils;

{$R *.dfm}

procedure TformCalculadora.FormShow(Sender: TObject);
begin
  if  (formCadReceita.Active) and (formCadReceita.txtValor.Text <> '') then
  begin
    txtCalc.Text := formCadReceita.txtValor.Text;
    txtValor1.Text := txtCalc.Text;
    valor1 := StrToFloat(txtCalc.Text);
  end
  else if (formCadTransacao.Active) and (formCadTransacao.txtValor.Text <> '') then
  begin
    txtCalc.Text := formCadTransacao.txtValor.Text;
    txtValor1.Text := txtCalc.Text;
    valor1 := StrToFloat(txtCalc.Text);
  end;

  KeyPreview := True;

  btnIgual.SetFocus;

  Color := rgb(204,209,209);
end;

procedure TformCalculadora.btn0Click(Sender: TObject);
var
  txtCalcLength : Integer;
  ultimoChar : String;
begin
  {Quando est� clicando em algum n�mero significa que n�o est� apagando nada,
  portante a booleana "apagando" recebe False}
  apagando := False;

  {Se o visor da calculadora estiver mostrando algum valor}
  if txtCalc.Text <> '' then
  begin
    {Pega o tamanho da string}
    txtCalcLength := Length(txtCalc.Text);
    {Pega o caracter contido na �ltima posi��o da string}
    ultimoChar := txtCalc.Text[txtCalcLength];
  end
  {Caso o visor estiver vazio n�o se pode digitar a v�rgula, somente um n�mero}
  else if (Sender as TBitBtn).Caption = ',' then
    Exit;

  {Caso N�O exista operador, e o texto do valor1 j� possua uma v�rgula, e o bot�o
  pressionado for a v�rgula e o segundo valor for vazio}
  {Neste caso o usu�rio est� tentando colocar duas v�rgulas no primeiro valor}
  if (not operadorClicado) and (AnsiContainsStr(txtValor1.Text, ',')) and ((Sender as TBitBtn).Caption = ',') and (txtValor2.Text = '') then
    Exit;

  {Caso EXISTA operador, e o texto do valor2 j� possua uma v�rgula, e o bot�o
  pressionado for a v�rgula e o segundo valor N�O for vazio}
  {Neste caso o usu�rio est� tentando colocar duas v�rgulas no segundo valor}
  if (operadorClicado) and (AnsiContainsStr(txtValor2.Text, ',')) and ((Sender as TBitBtn).Caption = ',') and (txtValor2.Text <> '') then
    Exit;

  {Se o bot�o sendo apertado for a v�rgula e o �ltimo caracter tamb�m for v�rgula}
  if ((Sender as TBitBtn).Caption = ',') and (ultimoChar = ',') then
    {Ent�o encerra o c�digo}
    {aqui valida que n�o haja duas virgulas digitadas, por exemplo: "5,,"}
    Exit;

  {Se o bot�o sendo apertado for a v�rgula e o �ltimo caracter for um operador}
  if ((Sender as TBitBtn).Caption = ',') and (ultimoChar = operador) then
    {Ent�o encerra o c�digo}
    {aqui valida que n�o haja uma v�rgula digitada ap�s um operador,
    por exemplo: "+,"}
    Exit;

  {Se nenhum operador foi selecionado para o c�lculo ainda}
  if not operadorClicado then
    {Ent�o atribui valor para o primeiro valor}
    txtValor1.Text := txtValor1.Text + (Sender as TBitBtn).Caption
  else
    {Atribui o valor para o segundo valor}
    txtValor2.Text := txtValor2.Text + (Sender as TBitBtn).Caption
end;

procedure TformCalculadora.btnSomarClick(Sender: TObject);
begin
  defineIndiceESinalOperador('+', 1);
end;

procedure TformCalculadora.defineIndiceESinalOperador(prOperador : string; operadorIndexCase : Integer);
var
  txtCalcLength : integer;
  calcText : string;
begin
  if operador = '%' then
  begin
    calcular(valor1, valor2, operadorIndice);
    Exit;
  end;

  if (operadorClicado) and (txtValor2.Text = '')then
  begin
    operadorIndice := operadorIndexCase;
    operador := prOperador;
    calcText := txtCalc.Text;
    txtCalcLength := Length(calcText);
    Delete(calcText, txtCalcLength, 1);
    txtCalc.Text := calcText;
    txtCalc.Text := txtCalc.Text + operador;
    Exit;
  end;

  {Neste ponto o usu�rio est� clicando em algum operador na calculadora}
  if (not operadorClicado) and (txtValor1.Text <> '') then
  begin
    {Seta que ele escolheu algum operador}
    operadorClicado := True;
    {O sinal do operador e passado por par�metro}
    operador := prOperador;
    {Pega o valor que j� est� na tela e adiciona o operado ao lado direito}
    txtCalc.Text := txtCalc.Text + operador;
    {Passa qual o �ndice do operador para usar no case da procedure "calcular"}
    operadorIndice := operadorIndexCase;
  end
  else
  begin
    {Verifica em qual bot�o de operador o usu�rio clicou e compara com o operador
    selecionado atualmente}
    if operador = prOperador then
    begin
      {Caso sejam iguais realiza o c�lculo daquele operador novamente}
      
      {Neste ponto o usu�rio selecionou dois n�mero e em vez de clicar no
      sinal de igual clicou no opetrador novamente, assim funcionar� como se
      tivesse clicano no sinal de igual}
      divZero := False;
      {Realiza o c�lculo}
      calcular(valor1, valor2, operadorIndexCase);
      {Verifica se a opera��o n�o est� resultando em uma divis�o por zero}
      validaDivisaoPorZero;
    end;
  end;
end;

procedure TformCalculadora.txtValor1Change(Sender: TObject);
begin
  if not apagando then
  begin
    if txtValor1.Text <> '' then
    begin
      txtCalc.Text := operador + txtValor1.Text;
      valor1 := StrToFloat(txtValor1.Text);
    end;
  end
  else
    txtCalc.Text := txtValor1.Text;

  apagando := False;
end;

procedure TformCalculadora.txtValor2Change(Sender: TObject);
begin
  if not apagando then
  begin
    if txtValor2.Text <> '' then
    begin
      txtCalc.Text := txtValor1.Text + operador + txtValor2.Text;
      valor2 := StrToFloat(txtValor2.Text);
    end;
  end
  else
    txtCalc.Text := txtValor2.Text;
end;

function TformCalculadora.calcular(prValor1 : Double; prValor2 : Double; indiceOperador : Integer) : Double;
begin
  {Parte sempre do pressuporto que o c�lculo n�o � uma divis�o por zero, mas
  caso seja ser� identificado afrente}
  divZero := False;

  {Verifica o �ndice do operador e realiza as opera��es abaixo conforme a
  combina�ao deles}
  case indiceOperador of
    1: resultado := valor1 + valor2;
    2: resultado := valor1 - valor2;
    3: resultado := valor1 * valor2;
    4:
    begin
      {Se o segundo valor for maior do que zero significa que, caso for uma
      divis�o, ela n�o � por zero}
      if valor2 > 0 then
        resultado := RoundTo((valor1 / valor2),-2)
      else
      begin
        {Caso seja divis�o por zero, mostra o erro na tela da calculadora e seta
        a booleana para False}
        txtCalc.Text := 'Div/0';
        divZero := True;
      end;
    end;
    else ShowMessage('Erro ao realizar o c�lculo com o operador: '+ operador);
  end;

  validaDivisaoPorZero;
end;

procedure TformCalculadora.validaDivisaoPorZero();
begin
  {Se n�o ocorreu uma divis�o por zero}
  if not divZero then
  begin
    {Limpa o valor2 para que possa ser realizado um novo c�lculo}
    valor2 := 0;
    {O visor da calculadora mostra o resultado}
    txtCalc.Text := FloatToStr(resultado);
    {Essa vari�vel � setada para false e ficar� pronta para outro c�lculo}
    operadorClicado := False;
    operador := '';
    {Este campo mant�m o resultado para c�lculo futuro}
    txtValor1.Text := FloatToStr(resultado);
    txtValor2.Text := '';
    {Normaliza o estado de divis�o por zero, para que n�o haja erro nos pr�ximos
    c�lculos}
    divZero := False;
  end
  else
  begin
    {Entra aqui o caso de uma divis�o por zero}
    operadorClicado := False;
    operador := '';
    txtValor1.Text := '';
    valor1 := 0;
    txtValor2.Text := '';
    valor2 := 0;
  end;
end;

procedure TformCalculadora.btnIgualClick(Sender: TObject);
begin
  {Quando se clica no bot�o de igual � verificado se o campo do valor1 n�o
  � vazio e se existe  algum operador selecionado. No caso dessa condi��o ser
  falsa significa que o usu�rio ainda n�o selecionou nenhum valor, muito menos
  um operador para o c�lculo}
  if (txtValor1.Text <> '') and (operadorClicado) then
    calcular(valor1, valor2, operadorIndice);
end;

procedure TformCalculadora.btnSubtrairClick(Sender: TObject);
begin
  defineIndiceESinalOperador('-', 2);
end;

procedure TformCalculadora.btnMultiplicarClick(Sender: TObject);
begin
  defineIndiceESinalOperador('*', 3);
end;

procedure TformCalculadora.btnDividirClick(Sender: TObject);
begin
  defineIndiceESinalOperador('/', 4);
end;

procedure TformCalculadora.BitBtn1Click(Sender: TObject);
begin
  {Se o usu�rio est� tentando realizar uma divis�o por zero entra neste if}
  if (operador = '/') and (valor2 = 0) then
    divZero := True;

  {Se o valor2 n�o for vazio, significa que o c�lculo ser� feito por este bot�o}
  if txtValor2.Text <> '' then
  begin
    {E o c�lculo n�o for uma divis�o por zero}
    if not divZero then
    begin
      {Realiza o c�lculo}
      calcular(valor1, valor2, operadorIndice);
      {Manda o resultado do c�lculo para os campos valor dos formul�rios}
      formCadReceita.txtValor.Text := FloatToStr(resultado);
      formCadTransacao.txtValor.Text := FloatToStr(resultado);
      {Fecha a calculadora}
      Close;
    end
    else
    begin
      {Entra aqui se � uma divis�o por zero}
      txtCalc.Text := 'Div/0';
      operadorClicado := False;
      operador := '';
      txtValor1.Text := '';
      valor1 := 0;
      txtValor2.Text := '';
      valor2 := 0;
      divZero := False;
    end;
  end
  {Caso o valor2 for vazio, significa que  c�lculo j� est� feito}
  else
  begin
    {Verifica qual formul�rio est� ativo e manda para o campo valor}
    formCadReceita.txtValor.Text := FloatToStr(resultado);
    formCadTransacao.txtValor.Text := FloatToStr(resultado);
    Close;
  end;
end;

procedure TformCalculadora.btnLimparClick(Sender: TObject);
begin
  restauraEstado;
end;

procedure TformCalculadora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  restauraEstado;
end;

procedure TformCalculadora.restauraEstado();
begin
  {Restaura a calculadora para o estado inicial}

  {Limpa o visor}
  txtCalc.Text := '';
  {Limpa os campos de valor}
  txtValor1.Text := '';
  txtValor2.Text := '';
  {diz que n�o h� nenhum operador selecionado}
  operadorClicado := False;
  {Limpa o sinal de operador}
  operador := '';
  {Zera o �ndice do operador}
  operadorIndice := 0;
end;

procedure TformCalculadora.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  btnIgual.SetFocus;

  //ShowMessage(IntToStr(ord(key)));

  case ord(key) of
    8: btnApagar.Click;
    13: btnIgual.Click;
    96: btn0.Click;
    97: btn1.Click;
    98: btn2.Click;
    99: btn3.Click;
    100: btn4.Click;
    101: btn5.Click;
    102: btn6.Click;
    103: btn7.Click;
    104: btn8.Click;
    105: btn9.Click;
    106:
    begin
      if txtValor1.Text <> '' then
        btnMultiplicar.Click;
    end;
    107:
    begin
      if txtValor1.Text <> '' then
        btnSomar.Click;
    end;
    109:
    begin
      if txtValor1.Text <> '' then
        btnSubtrair.Click;
    end;
    110:
    begin
      if txtValor1.Text <> '' then
        btnPonto.Click;
    end;
    111:
    begin
      if txtValor1.Text <> '' then
        btnDividir.Click;
    end;
    194:
    begin
      if txtValor1.Text <> '' then
        btnPonto.Click;
    end;
  end;
end;

procedure TformCalculadora.btnApagarClick(Sender: TObject);
var
   valor1Text, valor2Text : string;
   calcTextLenghtValor1, calcTextLenghtValor2 : Integer;
begin
  apagando := True;

  if not operadorClicado then
  begin
    valor1Text := txtValor1.Text;
    calcTextLenghtValor1 := Length(valor1Text);

    Delete(valor1Text, calcTextLenghtValor1, 1);

    txtValor1.Text := valor1Text;

    operadorClicado := False;
    operador := '';
  end
  else
  begin
    valor2Text := txtValor2.Text;
    calcTextLenghtValor2 := Length(valor2Text);

    Delete(valor2Text, calcTextLenghtValor2, 1);

    txtValor2.Text := valor2Text;
  end;

  if valor2Text = '' then
  begin
    operadorClicado := False;
    operador := '';
  end;

  try
    valor1 := StrToFloat(txtValor1.Text);
    valor2 := StrToFloat(txtValor2.Text);
  Except on e : Exception do
    begin
    end;
  end;

  txtCalc.Text := txtValor1.Text + operador + txtValor2.Text;

  {if txtCalc.Text <> '' then
  begin
    valor1 := StrToFloat(txtValor1.Text);
    txtValor1.Text := FloatToStr(valor1);

    if txtValor2.Text <> '' then
    begin
      valor2 := StrToFloat(txtValor2.Text);
      txtValor2.Text := FloatToStr(valor2);
    end;
    txtCalc.Text := txtValor1.Text + operador + txtValor2.Text;
  end
  else
  begin
    valor1 := 0;
    txtValor1.Text := '';
    txtCalc.Text := '';
    operador := '';
    operadorClicado := False;
  end;}
end;

procedure TformCalculadora.btnPorcentagemClick(Sender: TObject);
begin
  if (Sender as TBitBtn).Caption = '%' then
  begin
    resultado := valor1 / 100;
    txtCalc.Text := FloatToStr(resultado);
    valor1 := resultado;
    txtValor1.Text := FloatToStr(valor1);
  end;
end;

end.

unit UnitSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Buttons;

type
  TformLogin = class(TForm)
    BitBtn1: TBitBtn;
    txtUsuario: TLabeledEdit;
    mskSenha: TMaskEdit;
    labelSenha: TLabel;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    function autenticaUsuario(prUsuario : String; prSenha : String) : Boolean;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLogin: TformLogin;

implementation

uses unitInicial, UnitSelecionaBaseDados, dataModule, DB,
  UnitSelecionaBaseDadosNaoPrincipal, UnitGlobal, Math;

{$R *.dfm}

procedure TformLogin.BitBtn1Click(Sender: TObject);
begin
  //autenticaUsuario(txtUsuario.Text, mskSenha.Text);

  if autenticaUsuario(txtUsuario.Text, mskSenha.Text) then
  begin
    if formSelecaoBaseDados.conectaBD then
    begin
      formInicial.labelMensagemBd.Caption := diretorioBd + bdAlias;
      formInicial.labelMensagemDiretorio.Caption := 'Diret�rio da aplica��o: ' + ExpandFileName(ParamStr(0));

      if not formInicial.Active then
      begin
        ShowMessage('Conectado com sucesso no alias: ' + bdAlias);
        //OnShow(formInicial);
      end
      else
        ShowMessage('Alterado com sucesso para o alias: ' + bdAlias);

      Self.Close;
    end
    else
      ShowMessage('N�o foi poss�vel realizar a conex�o com o banco de dados!');
  end
  else
  begin
    ShowMessage('Usu�rio ou senha incorretos');

    if primeiroAcesso then
      usuarioOuSenhaIncorretos := True;

    if not primeiroAcesso then
    begin
      usuarioOuSenhaIncorretos := True;
      formSelecaoBaseDados.conectaBD;
      usuarioOuSenhaIncorretos := False;
    end;
  end;
end;

function TformLogin.autenticaUsuario(prUsuario : String; prSenha : String) : Boolean;
var
  usuario, senha : String;
begin
  formSelecaoBaseDados.conectaBD;

  dmDados.dataSet.CommandText :=
    'SELECT '+
      'USUARIO, '+
      'SENHA '+
    'FROM '+
      'AUTENTICACAO_USUARIO '+
    'WHERE '+
      '(STRCOMP(USUARIO, "' + prUsuario + '",0) = 0) AND '+
      '(STRCOMP(SENHA, "' + prSenha + '",0) = 0)';

  dmDados.dataSet.Open;
  usuario := dmDados.dataSet.FieldByName('USUARIO').AsString;
  senha := dmDados.dataSet.FieldByName('SENHA').AsString;
  dmDados.dataSet.Close;

  if (prUsuario = '') or (prSenha = '') then
  begin
    Result := False;
    Exit
  end;

  if (prUsuario = usuario) and (prSenha = senha) then
    Result := True
  else
    Result := False;
end;

procedure TformLogin.FormShow(Sender: TObject);
begin
  Color := rgb(204,209,209);

  mskSenha.PasswordChar := '*';
end;

procedure TformLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.ProcessMessages;
  formSelecaoBaseDadosNaoPrincipal.Close;
end;

procedure TformLogin.FormCreate(Sender: TObject);
begin
  BorderIcons := BorderIcons - [biSystemMenu];
end;

procedure TformLogin.BitBtn2Click(Sender: TObject);
begin
  if primeiroAcesso then
  begin
    terminarApNoInicio := True;
    ModalResult := mrOk;
  end
  else
    Self.Close;
end;

end.

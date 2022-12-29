unit UnitSelecionaBaseDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, XPMan;

type
  TformSelecaoBaseDados = class(TForm)
    cbSelecaoBD: TComboBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    XPManifest1: TXPManifest;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    function conectaBD() : Boolean;
    procedure FormShow(Sender: TObject);
    procedure cbSelecaoBDChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    {Vari�vel global contendo o nome do banco de dados ao qual a aplica��o
    dever� se conectar}
    //baseDadosSelecionada : String;
  end;

var
  formSelecaoBaseDados: TformSelecaoBaseDados;
  diretorioBd : string;

implementation

uses unitInicial, dataModule, UnitGlobal, UnitSenha, unitCarregamento;

{$R *.dfm}

function TformSelecaoBaseDados.conectaBD : Boolean;
begin
  Screen.Cursor := crSQLWait;

  bdAlias := baseDadosSelecionada;
  diretorioBd := ExtractFilePath(ParamStr(0));
  dmDados.bdCon.Connected := false;

  {Se o arquivo do banco de dados existe}
  if FileExists(diretorioBd + bdAlias) then
  begin
    {E estiver desconectado ou existir uma solicita��o para alterar o alias}
    if (dmDados.bdCon.Connected = false) or (formInicial.alteraAlias) then
    begin
      {Ent�o conecta com o banco de dados}
      try

        if not usuarioOuSenhaIncorretos then
          dmDados.bdCon.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source=G:\Meu Drive\BANCO_DE_DADOS_PRODUCAO\' + bdAlias + ';Persist Security Info=True'
        else
          dmDados.bdCon.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source=G:\Meu Drive\BANCO_DE_DADOS_PRODUCAO\FINANCAS_PESSOAIS_BD1_TESTE.mdb;Persist Security Info=True';

        dmDados.bdCon.Connected := true;
      Except on e : Exception do
        begin
          ShowMessage('Banco de dados n�o encontado' + sLineBreak + sLineBreak +

          'Verifique se o client do Google Drive est� instalado e inicializado e siga os seguintes passos: '+ sLineBreak + sLineBreak +

          '1 - Fa�a login na conta "finan�as.pessoais.app@gmail.com"' + sLineBreak +
          '2 - Mude a letra da unidade criada em "Este Computador" para "G"' + sLineBreak + sLineBreak +

          'O caminho para o banco de dados deve ficar da seguinte forma: "G:\Meu Drive\BANCO_DE_DADOS_PRODUCAO".' + sLineBreak + sLineBreak +

          'A aplica��o ser� fechada.');

          Application.Terminate;
          Result := False;
          Exit;
        end;
      end;

      {Como a altera��o de alias j� foi feita ent�o seta novamente a vari�vel
      para False}
      formInicial.alteraAlias := False;
      {Se tudo der certo, ent�o ser� retornado True}
      Result := true;
    end;
  end
  else
    Result := False;

  Screen.Cursor := crDefault;
end;

procedure TformSelecaoBaseDados.BitBtn1Click(Sender: TObject);
begin
  baseDadosSelecionada := cbSelecaoBD.Text;

  if baseDadosSelecionada = 'FINANCAS_PESSOAIS_BD1_PRINCIPAL.mdb' then
    formLogin.ShowModal
  else
  begin
    if conectaBD then
    begin
      formInicial.labelMensagemBd.Caption := 'Banco de dados: G:\Meu Drive\BANCO_DE_DADOS_PRODUCAO\' + bdAlias;
      formInicial.labelMensagemDiretorio.Caption := 'Diret�rio da aplica��o: ' + ExpandFileName(ParamStr(0));
      ShowMessage('Conectado com sucesso no alias: '+ bdAlias);
      Release;
      //formInicial.ShowModal;
    end
    else
      ShowMessage('N�o foi poss�vel realizar a conex�o com o banco de dados!');
  end;
end;

procedure TformSelecaoBaseDados.FormShow(Sender: TObject);
begin
  Color := rgb(204,209,209);
end;

procedure TformSelecaoBaseDados.cbSelecaoBDChange(Sender: TObject);
begin
  bdAlias := cbSelecaoBD.Text;
end;

procedure TformSelecaoBaseDados.FormCreate(Sender: TObject);
begin
  BorderIcons := BorderIcons - [biSystemMenu];
end;

procedure TformSelecaoBaseDados.BitBtn3Click(Sender: TObject);
begin
  terminarApNoInicio := True;
  ModalResult := mrOk;
end;

end.

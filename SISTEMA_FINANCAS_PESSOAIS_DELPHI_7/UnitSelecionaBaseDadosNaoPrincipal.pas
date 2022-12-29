unit UnitSelecionaBaseDadosNaoPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, XPMan;

type
  TformSelecaoBaseDadosNaoPrincipal = class(TForm)
    cbSelecaoBD: TComboBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    XPManifest1: TXPManifest;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbSelecaoBDChange(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    {Vari�vel global contendo o nome do banco de dados ao qual a aplica��o
    dever� se conectar}
    //baseDadosSelecionada : String;
  end;

var
  formSelecaoBaseDadosNaoPrincipal: TformSelecaoBaseDadosNaoPrincipal;
  diretorioBd : string;

implementation

uses unitInicial, dataModule, UnitGlobal, UnitSenha,
  UnitSelecionaBaseDados;

{$R *.dfm}

procedure TformSelecaoBaseDadosNaoPrincipal.BitBtn1Click(Sender: TObject);
begin
  baseDadosSelecionada := cbSelecaoBD.Text;

  if baseDadosSelecionada = 'FINANCAS_PESSOAIS_BD1_PRINCIPAL.mdb' then
    formLogin.Show
  else
  begin
    if formSelecaoBaseDados.conectaBD then
    begin
      formInicial.labelMensagemBd.Caption := 'Banco de dados: G:\Meu Drive\BANCO_DE_DADOS_PRODUCAO\' + bdAlias;
      formInicial.labelMensagemDiretorio.Caption := 'Diret�rio da aplica��o: ' + ExpandFileName(ParamStr(0));
      ShowMessage('Alterado com sucesso para o alias: '+ bdAlias);
      Self.Close;
    end
    else
      ShowMessage('N�o foi poss�vel realizar a conex�o com o banco de dados!');
  end;
end;

procedure TformSelecaoBaseDadosNaoPrincipal.FormShow(Sender: TObject);
begin
  Color := rgb(204,209,209);
end;

procedure TformSelecaoBaseDadosNaoPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.ProcessMessages;
end;

procedure TformSelecaoBaseDadosNaoPrincipal.cbSelecaoBDChange(
  Sender: TObject);
begin
  bdAlias := cbSelecaoBD.Text;
end;

procedure TformSelecaoBaseDadosNaoPrincipal.FormDeactivate(
  Sender: TObject);
begin
  Self.Close;
end;

end.

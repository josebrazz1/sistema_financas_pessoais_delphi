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

    {Variável global contendo o nome do banco de dados ao qual a aplicação
    deverá se conectar}
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
    {E estiver desconectado ou existir uma solicitação para alterar o alias}
    if (dmDados.bdCon.Connected = false) or (formInicial.alteraAlias) then
    begin
      {Então conecta com o banco de dados}
      try

        if not usuarioOuSenhaIncorretos then
          dmDados.bdCon.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source=' + diretorioBd + bdAlias + ';Persist Security Info=True'
        else
          dmDados.bdCon.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source='+ diretorioBd + bdAlias +';Persist Security Info=True';

        dmDados.bdCon.Connected := true;
      Except on e : Exception do
        begin
          ShowMessage('Banco de dados não encontado');

          Application.Terminate;
          Result := False;
          Exit;
        end;
      end;

      {Como a alteração de alias já foi feita então seta novamente a variável
      para False}
      formInicial.alteraAlias := False;
      {Se tudo der certo, então será retornado True}
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

  if conectaBD then
  begin
    formInicial.labelMensagemBd.Caption := diretorioBd + bdAlias;
    formInicial.labelMensagemDiretorio.Caption := 'Diretório da aplicação: ' + ExpandFileName(ParamStr(0));
    ShowMessage('Conectado com sucesso no alias: '+ bdAlias);
    Release;
    //formInicial.ShowModal;
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

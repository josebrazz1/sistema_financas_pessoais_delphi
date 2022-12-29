unit unitCadastroConta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TformCadConta = class(TForm)
    txtNomeCategoria: TLabeledEdit;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure inserirConta(nomeCategoriaPr : string);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadConta: TformCadConta;

implementation

uses dataModule, DB, ADODB, unitTransacoes, UnitGlobal, unitReceita;

{$R *.dfm}

procedure TformCadConta.inserirConta(nomeCategoriaPr : string);
begin
  with dmDados.query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO CONTA (NOME_CONTA) VALUES (:prNomeConta)');
    Parameters.ParamByName('prNomeConta').Value := nomeCategoriaPr;
    ExecSQL;
  end;

  ShowMessage('Dados inseridos com sucesso!');
  txtNomeCategoria.Clear;

  if formAberto = nmFORM_RECEITA then
  begin
    alimentaCombo('SELECT NOME_CONTA FROM CONTA', formCadReceita.cbConta);
    formCadReceita.cbConta.ItemIndex := formCadReceita.cbConta.Items.Count - 1;
  end
  else if formAberto = nmFORM_DESPESA then
  begin
    alimentaCombo('SELECT NOME_CONTA FROM CONTA', formCadTransacao.cbConta);
    formCadTransacao.cbConta.ItemIndex := formCadTransacao.cbConta.Items.Count - 1;
  end;

  Close;
end;

procedure TformCadConta.btnOkClick(Sender: TObject);
begin
  if txtNomeCategoria.Text <> '' then
    inserirConta(txtNomeCategoria.Text)
  else
  begin
    ShowMessage('A descrição da conta não pode ser vazia');
    ModalResult := mrNone;
  end;
end;

procedure TformCadConta.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.

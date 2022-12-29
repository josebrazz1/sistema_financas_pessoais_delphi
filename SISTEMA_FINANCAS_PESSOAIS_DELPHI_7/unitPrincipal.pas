unit unitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TformCadCategoria = class(TForm)
    txtNomeCategoria: TLabeledEdit;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure inserirCategoria(nomeCategoriaPr : string);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadCategoria: TformCadCategoria;

implementation

uses dataModule, DB, ADODB, unitTransacoes, UnitGlobal, unitReceita;

{$R *.dfm}

procedure TformCadCategoria.inserirCategoria(nomeCategoriaPr : string);
begin
  with dmDados.query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO CATEGORIA (NOME_CATEGORIA, TIPO_CATEGORIA) VALUES (:prNomeCategoria, :prTipoCategoria)');
    Parameters.ParamByName('prNomeCategoria').Value := nomeCategoriaPr;

    if formAberto = nmFORM_RECEITA then
      Parameters.ParamByName('prTipoCategoria').Value := 'RECEITA'
    else if formAberto = nmFORM_DESPESA then
      Parameters.ParamByName('prTipoCategoria').Value := 'DESPESA';

    ExecSQL;
  end;

  ShowMessage('Dados inseridos com sucesso!');
  txtNomeCategoria.Clear;

  if formAberto = nmFORM_RECEITA then
  begin
    alimentaCombo('SELECT NOME_CATEGORIA FROM CATEGORIA WHERE TIPO_CATEGORIA = "RECEITA" OR TIPO_CATEGORIA = "AMBOS" ORDER BY CÓDIGO', formCadReceita.cbCategoria);
    formCadReceita.cbCategoria.ItemIndex := formCadReceita.cbCategoria.Items.Count - 1;
  end
  else if formAberto = nmFORM_DESPESA then
  begin
    alimentaCombo('SELECT NOME_CATEGORIA FROM CATEGORIA WHERE TIPO_CATEGORIA = "DESPESA" OR TIPO_CATEGORIA = "AMBOS" ORDER BY CÓDIGO', formCadTransacao.cbCategoria);
    formCadTransacao.cbCategoria.ItemIndex := formCadTransacao.cbCategoria.Items.Count - 1;
  end;

  Close;
end;

procedure TformCadCategoria.btnOkClick(Sender: TObject);
begin
  if txtNomeCategoria.Text <> '' then
    inserirCategoria(txtNomeCategoria.Text)
  else
  begin
    ShowMessage('A descrição da categoria não pode ser vazia');
    ModalResult := mrNone;
  end;
end;

procedure TformCadCategoria.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.

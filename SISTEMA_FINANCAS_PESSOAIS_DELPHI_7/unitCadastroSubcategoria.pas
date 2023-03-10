unit unitCadastroSubcategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TformCadSubcategoria = class(TForm)
    txtNomeCategoria: TLabeledEdit;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure inserirSubcategoria(nomeCategoriaPr : string);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadSubcategoria: TformCadSubcategoria;

implementation

uses dataModule, DB, ADODB, unitTransacoes, UnitGlobal, unitReceita;

{$R *.dfm}

procedure TformCadSubcategoria.inserirSubcategoria(nomeCategoriaPr : string);
begin
  with dmDados.query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO SUBCATEGORIA (NOME_SUBCATEGORIA, TIPO_CATEGORIA) VALUES (:prNomeSubcategoria, :prTipoCategoria)');
    Parameters.ParamByName('prNomeSubcategoria').Value := nomeCategoriaPr;

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
    alimentaCombo('SELECT NOME_SUBCATEGORIA FROM SUBCATEGORIA WHERE TIPO_CATEGORIA = "RECEITA" OR TIPO_CATEGORIA = "AMBOS" ORDER BY C?DIGO', formCadReceita.cbSubcategoria);
    formCadReceita.cbSubcategoria.ItemIndex := formCadReceita.cbSubcategoria.Items.Count - 1;
  end
  else if formAberto = nmFORM_DESPESA then
  begin
    alimentaCombo('SELECT NOME_SUBCATEGORIA FROM SUBCATEGORIA WHERE TIPO_CATEGORIA = "DESPESA" OR TIPO_CATEGORIA = "AMBOS" ORDER BY C?DIGO', formCadTransacao.cbSubcategoria);
    formCadTransacao.cbSubcategoria.ItemIndex := formCadTransacao.cbSubcategoria.Items.Count - 1;
  end;

  Close;
end;

procedure TformCadSubcategoria.btnOkClick(Sender: TObject);
begin
  if txtNomeCategoria.Text <> '' then
    inserirSubcategoria(txtNomeCategoria.Text)
  else
  begin
    ShowMessage('A descri??o da subcategoria n?o pode ser vazia');
    ModalResult := mrNone;
  end;
end;

procedure TformCadSubcategoria.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.

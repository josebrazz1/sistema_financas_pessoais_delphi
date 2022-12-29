program Project1;

uses
  Forms,
  unitPrincipal in 'unitPrincipal.pas' {formCadCategoria},
  dataModule in 'dataModule.pas' {dmDados: TDataModule},
  unitTransacoes in 'unitTransacoes.pas' {formCadTransacao},
  unitInicial in 'unitInicial.pas' {formInicial},
  unitAlterarDeletar in 'unitAlterarDeletar.pas' {formAlterarDeletar},
  unitOrcamento in 'unitOrcamento.pas' {formOrcamento},
  unitReceita in 'unitReceita.pas' {formCadReceita},
  UnitSelecionaBaseDados in 'UnitSelecionaBaseDados.pas' {formSelecaoBaseDados},
  UnitCalculadora in 'UnitCalculadora.pas' {formCalculadora},
  UnitGlobal in 'UnitGlobal.pas',
  UnitSenha in 'UnitSenha.pas' {formLogin},
  UnitSelecionaBaseDadosNaoPrincipal in 'UnitSelecionaBaseDadosNaoPrincipal.pas' {formSelecaoBaseDadosNaoPrincipal},
  unitCadastroConta in 'unitCadastroConta.pas' {formCadConta},
  unitCadastroSubcategoria in 'unitCadastroSubcategoria.pas' {formCadSubcategoria},
  UnitBI in 'UnitBI.pas' {Form1},
  unitCarregamento in 'unitCarregamento.pas' {formCarregamento},
  UnitBalanco in 'UnitBalanco.pas' {formBalancos};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformInicial, formInicial);
  Application.CreateForm(TformSelecaoBaseDados, formSelecaoBaseDados);
  Application.CreateForm(TformCadCategoria, formCadCategoria);
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TformCadTransacao, formCadTransacao);
  Application.CreateForm(TformAlterarDeletar, formAlterarDeletar);
  Application.CreateForm(TformOrcamento, formOrcamento);
  Application.CreateForm(TformCadReceita, formCadReceita);
  Application.CreateForm(TformCalculadora, formCalculadora);
  Application.CreateForm(TformLogin, formLogin);
  Application.CreateForm(TformCadConta, formCadConta);
  Application.CreateForm(TformCadSubcategoria, formCadSubcategoria);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TformSelecaoBaseDadosNaoPrincipal, formSelecaoBaseDadosNaoPrincipal);
  Application.CreateForm(TformCarregamento, formCarregamento);
  Application.CreateForm(TformBalancos, formBalancos);
  Application.Run;
end.

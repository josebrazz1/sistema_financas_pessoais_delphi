unit unitCarregamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TformCarregamento = class(TForm)
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCarregamento: TformCarregamento;

implementation

{$R *.dfm}

procedure TformCarregamento.FormActivate(Sender: TObject);
begin
  Color := rgb(204,209,209);
  Application.ProcessMessages;
end;

procedure TformCarregamento.FormCreate(Sender: TObject);
begin
  BorderIcons := BorderIcons - [biSystemMenu]
end;

end.

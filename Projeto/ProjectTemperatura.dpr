program ProjectTemperatura;

uses
  Vcl.Forms,
  UnTelaPrincipal in 'UnTelaPrincipal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

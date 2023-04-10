unit UnTelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    edEntrada: TEdit;
    Label1: TLabel;
    cbMedida: TComboBox;
    Label2: TLabel;
    rgValorConverter: TRadioGroup;
    btConverter: TButton;
    edResul: TEdit;
    procedure btConverterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btConverterClick(Sender: TObject);
begin
  //convers�o Celsius
  if((cbMedida.ItemIndex = 1) And (rgValorConverter.ItemIndex = 0))then
   begin
        edResul.Text := edEntrada.Text
    end;
  if((cbMedida.ItemIndex = 1) And (rgValorConverter.ItemIndex = 0))then
   begin
        edResul.Text := edEntrada.Text
    end;
   if((cbMedida.ItemIndex = 1) And (rgValorConverter.ItemIndex = 0))then
   begin
        edResul.Text := edEntrada.Text
    end;
end;

end.

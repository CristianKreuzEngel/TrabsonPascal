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
    RadioGroup1: TRadioGroup;
    btConverter: TButton;
    GroupBox2: TGroupBox;
    lbResultado: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.

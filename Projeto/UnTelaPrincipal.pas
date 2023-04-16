unit UnTelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    imgBackground: TImage;
    edEntrada: TEdit;
    edResul: TEdit;
    lbTemp: TLabel;
    cbMedida: TComboBox;
    btnConverter: TPanel;
    imgBackgound2: TImage;
    imgAjuda2: TImage;
    imgAjuda: TImage;
    imgFahrenheit: TImage;
    imgKelvin: TImage;
    btnCelsius: TPanel;
    imgCelsius: TImage;
    btnFahrenheit: TPanel;
    btnKelvin: TPanel;
    btnAjuda: TPanel;
    procedure btnConverterClick(Sender: TObject);
    procedure btnCelsiusClick(Sender: TObject);
    procedure btnFahrenheitClick(Sender: TObject);
    procedure btnKelvinClick(Sender: TObject);
    procedure btnAjudaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.btnAjudaClick(Sender: TObject);
begin
    //No bot�o ajuda mostrar as f�rmulas em um showmessage
    //OBS: N�o precisa criar m�todo ou procedure
    //Exemplo:

    //Mensagem de Celsius para Fahrenheit
    if((cbMedida.ItemIndex = 1) and (imgFahrenheit.Visible = true)) then
    begin
        ShowMessage('Para convers�o de Celsius(�C) para Fahrenheit(�F) utiliza-se a seguinte f�rmula:  ((Medida em Celsius) * 9/5) + 32');
    end;
end;

 //controle do select Celsius
procedure TForm1.btnCelsiusClick(Sender: TObject);
begin
    imgCelsius.Visible := true;
    imgFahrenheit.Visible := false;
    imgKelvin.Visible := false;
end;

procedure TForm1.btnConverterClick(Sender: TObject);
  var
    conta: real;
begin
    // <---Celsius--->
    // Convers�o Celsius para Celsius
  if ((cbMedida.ItemIndex = 1) And (imgCelsius.Visible = true)) then
  begin
    edResul.Text := edEntrada.Text;
    lbTemp.Caption := '�C';
  end;
  // Celsius para Fahrenheit
  if ((cbMedida.ItemIndex = 1) And (imgFahrenheit.Visible = true)) then
  begin
    conta := ((StrToFloat(edEntrada.Text) * (9 / 5)) + 32);
    edResul.Text := FormatFloat('###,###,###0.000', conta);
    lbTemp.Caption := '�F';
  end;
  // Celsius para Kelvin
  if ((cbMedida.ItemIndex = 1) And (imgKelvin.Visible = true)) then
  begin
    conta := ((StrToFloat(edEntrada.Text)) + 273.15);
    edResul.Text := FormatFloat('###,###,###0.000', conta);
    lbTemp.Caption := 'K';
  end;

  // <---Fahrenheit--->

  // Fahrenheit para Celsius
  if ((cbMedida.ItemIndex = 2) And (imgCelsius.Visible = true)) then
  begin
    conta := ((StrToFloat(edEntrada.Text) - 32) * (5 / 9));
    edResul.Text := FormatFloat('###,###,###0.000', conta);
    lbTemp.Caption := '�C';
  end;
  // Fahrenheit para Fahrenheit
  if ((cbMedida.ItemIndex = 2) And (imgFahrenheit.Visible = true)) then
  begin
    edResul.Text := edEntrada.Text;
    lbTemp.Caption := '�F';
  end;
  // Fahrenheit para Kelvin
  if ((cbMedida.ItemIndex = 2) And (imgKelvin.Visible = true)) then
  begin
    conta := ((StrToFloat(edEntrada.Text) - 32) * (5 / 9)) + 273.15;
    edResul.Text := FormatFloat('###,###,###0.000', conta);
    lbTemp.Caption := 'K';
  end;

  // <---Kelvin--->

  // Kelvin para Celsius
  if ((cbMedida.ItemIndex = 3) And (imgCelsius.Visible = true)) then
  begin
    conta := (((StrToFloat(edEntrada.Text)) - 273.15));
    edResul.Text := FormatFloat('###,###,##0.00', conta);
    lbTemp.Caption := '�C';
  end;
  // Kelvin para Fahrenheit
  if ((cbMedida.ItemIndex = 3) And (imgFahrenheit.Visible = true)) then
  begin
    conta := (((StrToFloat(edEntrada.Text)) - 273.15) * (9 / 5)) + 32;
    edResul.Text := FormatFloat('###,###,##0.00', conta);
    lbTemp.Caption := '�F';
  end;
  // Kelvin para Kelvin
  if ((cbMedida.ItemIndex = 3) And (imgKelvin.Visible = true)) then
  begin
    edResul.Text := edEntrada.Text;
    lbTemp.Caption := 'K';
  end;
end;

//controle do select Fahrenheit
procedure TForm1.btnFahrenheitClick(Sender: TObject);
begin
    imgCelsius.Visible := false;
    imgFahrenheit.Visible := true;
    imgKelvin.Visible := false;
end;

//controle do select Kelvin
procedure TForm1.btnKelvinClick(Sender: TObject);
begin
    imgCelsius.Visible := false;
    imgFahrenheit.Visible := false;
    imgKelvin.Visible := true;
end;

end.

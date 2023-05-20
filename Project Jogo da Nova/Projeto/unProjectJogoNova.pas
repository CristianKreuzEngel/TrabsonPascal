unit unProjectJogoNova;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Buttons, System.ImageList, Vcl.ImgList, Vcl.Imaging.jpeg, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    carta1: TImage;
    carta2: TImage;
    carta3: TImage;
    carta4: TImage;
    carta5: TImage;
    carta6: TImage;
    carta7: TImage;
    carta8: TImage;
    carta9: TImage;
    carta10: TImage;
    caveira1: TImage;
    caveira2: TImage;
    caveira3: TImage;
    caveira4: TImage;
    caveira5: TImage;
    caveira6: TImage;
    coroa1: TImage;
    coroa2: TImage;
    coroa3: TImage;
    coroa4: TImage;
    coroa5: TImage;
    coroa6: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Image2: TImage;
    tiro3: TImage;
    tiro2: TImage;
    tiro1: TImage;
    tiro4: TImage;
    tiro5: TImage;
    tiro6: TImage;
    tiro7: TImage;
    tiro8: TImage;
    tiro9: TImage;
    faca2: TImage;
    faca3: TImage;
    faca4: TImage;
    faca5: TImage;
    faca6: TImage;
    faca7: TImage;
    faca8: TImage;
    faca9: TImage;
    Button1: TButton;
    faca1: TImage;
    textVez: TLabel;
    procedure Panel1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sorteioCarta();
  private
    { Private declarations }

    PRocedure checarGanhador;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  GHoraInicio: TTime;
  GJogadorDaVez: Integer;
  controladorJog1: Integer;
  controladorJog2: Integer;
  sorteador: Integer;

implementation

{$R *.dfm}

procedure TForm1.sorteioCarta;
begin
  carta1.Visible := false;
  carta2.Visible := false;
  carta3.Visible := false;
  carta4.Visible := false;
  carta5.Visible := false;
  carta6.Visible := false;
  carta7.Visible := false;
  carta8.Visible := false;
  carta9.Visible := false;
  carta10.Visible := false;
  case sorteador of
    0:
      begin

      end;
    1:
      begin

      end;
    2:
      begin
        carta2.Visible := True;
        if GJogadorDaVez = 1 then
          GJogadorDaVez := 2
        else
          GJogadorDaVez := 1

      end;
    3:
      begin

      end;
    4:
      begin

      end;
    5:
      begin

      end;
    6:
      begin

      end;
    7:
      begin

      end;
    8:
      begin

      end;
    9:
      begin

      end;

  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin

  GJogadorDaVez := 1;
  controladorJog1 := 0;
  controladorJog2 := 0;

  tiro1.Visible := false;
  tiro2.Visible := false;
  tiro3.Visible := false;
  tiro4.Visible := false;
  tiro5.Visible := false;
  tiro6.Visible := false;
  tiro7.Visible := false;
  tiro8.Visible := false;
  tiro9.Visible := false;

  faca1.Visible := false;
  faca2.Visible := false;
  faca3.Visible := false;
  faca4.Visible := false;
  faca5.Visible := false;
  faca6.Visible := false;
  faca7.Visible := false;
  faca8.Visible := false;
  faca9.Visible := false;
end;

procedure TForm1.checarGanhador;
begin
  if (faca1.Visible and faca2.Visible and faca3.Visible) or
    (faca4.Visible and faca5.Visible and faca6.Visible) or
    (faca7.Visible and faca8.Visible and faca9.Visible) or
    (faca1.Visible and faca4.Visible and faca7.Visible) or
    (faca2.Visible and faca5.Visible and faca8.Visible) or
    (faca3.Visible and faca6.Visible and faca9.Visible) or
    (faca1.Visible and faca5.Visible and faca9.Visible) or
    (faca3.Visible and faca5.Visible and faca7.Visible) then
  begin
    sleep(500);
    Button1Click(nil);
    if (coroa1.Visible = false) then
      coroa1.Visible := True
    else if coroa2.Visible = false then
      coroa2.Visible := True
    else if coroa3.Visible = false then
    begin
      coroa3.Visible := True;
      ShowMessage('Jogador 1 ganhou!');
    end;
  end
  else if (tiro1.Visible and tiro2.Visible and tiro3.Visible) or
    (tiro4.Visible and tiro5.Visible and tiro6.Visible) or
    (tiro7.Visible and tiro8.Visible and tiro9.Visible) or
    (tiro1.Visible and tiro4.Visible and tiro7.Visible) or
    (tiro2.Visible and tiro5.Visible and tiro8.Visible) or
    (tiro3.Visible and tiro6.Visible and tiro9.Visible) or
    (tiro1.Visible and tiro5.Visible and tiro9.Visible) or
    (tiro3.Visible and tiro5.Visible and tiro7.Visible) then
  begin
    sleep(500);

    Button1Click(nil);
    if (coroa4.Visible = false) then
      coroa4.Visible := True
    else if coroa5.Visible = false then
      coroa5.Visible := True
    else if coroa6.Visible = false then
    begin
      coroa6.Visible := True;
      ShowMessage('Jogador 2 ganhou!');
    end;

  end
  else if (faca1.Visible or tiro1.Visible) And (faca2.Visible or tiro2.Visible)
    and (faca3.Visible or tiro3.Visible) and (faca4.Visible or tiro4.Visible)
    and (faca5.Visible or tiro5.Visible) and (faca6.Visible or tiro6.Visible)
    and (faca7.Visible or tiro7.Visible) and (faca8.Visible or tiro8.Visible)
    and (faca9.Visible or tiro9.Visible) then
  begin
    ShowMessage('Deu Nova!');
  end;

end;

procedure TForm1.Panel1Click(Sender: TObject);
var
  imagemFaca, imagemTiro: TImage;
begin

  if Sender = Panel1 then
  begin
    imagemFaca := faca1;
    imagemTiro := tiro1;
  end;
  if Sender = Panel2 then
  begin
    imagemFaca := faca2;
    imagemTiro := tiro2;
  end;
  if Sender = Panel3 then
  begin
    imagemFaca := faca3;
    imagemTiro := tiro3;
  end;
  if Sender = Panel4 then
  begin
    imagemFaca := faca4;
    imagemTiro := tiro4;
  end;
  if Sender = Panel5 then
  begin
    imagemFaca := faca5;
    imagemTiro := tiro5;
  end;
  if Sender = Panel6 then
  begin
    imagemFaca := faca6;
    imagemTiro := tiro6;
  end;
  if Sender = Panel7 then
  begin
    imagemFaca := faca7;
    imagemTiro := tiro7;
  end;
  if Sender = Panel8 then
  begin
    imagemFaca := faca8;
    imagemTiro := tiro8;
  end;
  if Sender = Panel9 then
  begin
    imagemFaca := faca9;
    imagemTiro := tiro9;
  end;

  if GJogadorDaVez = 1 then
  begin
    imagemTiro.Visible := True;
    imagemTiro.Repaint;
    inc(controladorJog1, 1);
    textVez.Caption := 'Jogador 1';
    checarGanhador;
    GJogadorDaVez := 2;
    if controladorJog1 >= 2 then
    begin
      sorteador := random(10);
      sorteioCarta;
    end;

  end
  else
  begin
    imagemFaca.Visible := True;
    imagemFaca.Repaint;
    inc(controladorJog2, 1);
    textVez.Caption := 'Jogador 2';
    checarGanhador;
    GJogadorDaVez := 1;
    if controladorJog2 >= 2 then
    begin
      sorteador := random(10);
      sorteioCarta;
    end;
  end;
end;

end.

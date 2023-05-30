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
    Label1: TLabel;
    Label2: TLabel;
    procedure Panel1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sorteioCarta();
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

    PRocedure checarGanhador;
    procedure iniciarJogo;
    procedure exibirCarta(carta: TImage);
    procedure trocarPosição;
    procedure pulaVez;
    procedure limpaCampo;
    procedure trocaColuna(img1, img2, img3: TImage);
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
  estahExecutando: boolean;
  aux: boolean;
  contJg1: Integer;
  contJg2: Integer;

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
        exibirCarta(carta10);
        trocaColuna(faca1, faca4, faca7);
        trocaColuna(faca2, faca5, faca8);
        trocaColuna(faca3, faca6, faca9);

        trocaColuna(tiro1, tiro4, tiro7);
        trocaColuna(tiro2, tiro5, tiro8);
        trocaColuna(tiro3, tiro6, tiro9);
      end;
    1:
      begin
        exibirCarta(carta1);
        trocaColuna(faca1, faca3, faca7);
        trocaColuna(faca2, faca9, faca5);
        trocaColuna(faca6, faca4, faca8);

        trocaColuna(tiro1, tiro3, tiro7);
        trocaColuna(tiro2, tiro9, tiro5);
        trocaColuna(tiro6, tiro4, tiro8);
      end;
    2:
      begin
        exibirCarta(carta2);
        pulaVez;
      end;
    3:
      begin
        exibirCarta(carta3);
        tiro2.Visible := false;
        tiro4.Visible := false;
        tiro6.Visible := false;
        tiro8.Visible := false;
        faca2.Visible := false;
        faca4.Visible := false;
        faca6.Visible := false;
        faca8.Visible := false;

      end;
    4:
      begin
        exibirCarta(carta4);
        trocarPosição;
      end;
    5:
      begin
        exibirCarta(carta5);
        limpaCampo;
      end;
    6:
      begin
        exibirCarta(carta6);
        tiro3.Visible := false;
        tiro5.Visible := false;
        tiro7.Visible := false;

        faca3.Visible := false;
        faca5.Visible := false;
        faca7.Visible := false;
      end;
    7:
      begin
        exibirCarta(carta7);
        trocaColuna(faca1, faca2, faca3);
        trocaColuna(faca4, faca5, faca6);
        trocaColuna(faca7, faca8, faca9);

        trocaColuna(tiro1, tiro2, tiro3);
        trocaColuna(tiro4, tiro5, tiro6);
        trocaColuna(tiro7, tiro8, tiro9);
      end;
    8:
      begin
        exibirCarta(carta8);
        if GJogadorDaVez = 1 then
        begin
          tiro1.Visible := false;
          tiro2.Visible := false;
          tiro3.Visible := false;
          tiro4.Visible := false;
          tiro5.Visible := false;
          tiro6.Visible := false;
          tiro7.Visible := false;
          tiro8.Visible := false;
          tiro9.Visible := false;
        end
        else
        begin
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
      end;
    9:
      begin
        exibirCarta(carta9);
        trocarPosição;
      end;

  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  iniciarJogo;
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
    if (coroa4.Visible = false) and (contJg1 < 1) then
    begin
      coroa4.Visible := true;
      caveira1.Visible := true;
      inc(contJg2, 1);
    end
    else if (coroa5.Visible = false) and (caveira5.Visible = false) then
    begin
      coroa5.Visible := true;
      caveira2.Visible := true;
      inc(contJg2, 1);
    end
    else if (coroa6.Visible = false) and (caveira6.Visible = false)  then
    begin
      coroa6.Visible := true;
      caveira3.Visible := true;
      inc(contJg2, 1);
      if (contJg1 >= 2) and (contJg1 > contJg2) then
      begin
        ShowMessage('Jogador 1 wins!');
        iniciarJogo;
        contJg1 := 0;
        contJg2 := 0;
        caveira1.Visible := false;
        caveira2.Visible := false;
        caveira3.Visible := false;
        caveira4.Visible := false;
        caveira5.Visible := false;
        caveira6.Visible := false;

        coroa1.Visible := false;
        coroa2.Visible := false;
        coroa3.Visible := false;
        coroa4.Visible := false;
        coroa5.Visible := false;
        coroa6.Visible := false;

      end
      else
      begin
        ShowMessage('Jogador 2 wins!');
        iniciarJogo;
        contJg1 := 0;
        contJg2 := 0;
        caveira1.Visible := false;
        caveira2.Visible := false;
        caveira3.Visible := false;
        caveira4.Visible := false;
        caveira5.Visible := false;
        caveira6.Visible := false;

        coroa1.Visible := false;
        coroa2.Visible := false;
        coroa3.Visible := false;
        coroa4.Visible := false;
        coroa5.Visible := false;
        coroa6.Visible := false;
      end;

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
    if (coroa1.Visible = false) and (contJg2 < 1) then
    begin
      coroa1.Visible := true;
      caveira4.Visible := true;
      inc(contJg1, 1);
    end
    else if (coroa2.Visible = false) and (caveira2.Visible = false) then
    begin
      coroa2.Visible := true;
      caveira5.Visible := true;
      inc(contJg1, 1);
    end
    else if (coroa3.Visible = false) then
    begin
      coroa3.Visible := true;
      caveira6.Visible := true;
      inc(contJg1, 1);
      if (contJg1 >= 2) and (contJg1 > contJg2) then
      begin
        ShowMessage('Jogador 1 wins!');
        iniciarJogo;
        contJg1 := 0;
        contJg2 := 0;
        caveira1.Visible := false;
        caveira2.Visible := false;
        caveira3.Visible := false;
        caveira4.Visible := false;
        caveira5.Visible := false;
        caveira6.Visible := false;

        coroa1.Visible := false;
        coroa2.Visible := false;
        coroa3.Visible := false;
        coroa4.Visible := false;
        coroa5.Visible := false;
        coroa6.Visible := false;

      end
      else
      begin
        ShowMessage('Jogador 2 wins!');
        iniciarJogo;
        contJg1 := 0;
        contJg2 := 0;
        caveira1.Visible := false;
        caveira2.Visible := false;
        caveira3.Visible := false;
        caveira4.Visible := false;
        caveira5.Visible := false;
        caveira6.Visible := false;

        coroa1.Visible := false;
        coroa2.Visible := false;
        coroa3.Visible := false;
        coroa4.Visible := false;
        coroa5.Visible := false;
        coroa6.Visible := false;
      end;
    end;
  end
  else if (faca1.Visible or tiro1.Visible) And (faca2.Visible or tiro2.Visible)
    and (faca3.Visible or tiro3.Visible) and (faca4.Visible or tiro4.Visible)
    and (faca5.Visible or tiro5.Visible) and (faca6.Visible or tiro6.Visible)
    and (faca7.Visible or tiro7.Visible) and (faca8.Visible or tiro8.Visible)
    and (faca9.Visible or tiro9.Visible) then
  begin
    ShowMessage('Deu Nova!');
    sleep(500);
    Button1Click(nil);
  end;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  iniciarJogo;
  contJg1 := 0;
  contJg2 := 0;
end;

procedure TForm1.iniciarJogo;
begin
  estahExecutando := false;
  GJogadorDaVez := 1;
  controladorJog1 := 0;
  controladorJog2 := 0;
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

procedure TForm1.exibirCarta(carta: TImage);
begin
  carta.Visible := true;
  carta.Repaint;
  sleep(3000);
  Application.ProcessMessages;
  carta.Visible := false;
end;

procedure TForm1.trocarPosição;
begin
  if faca1.Visible = true then
  begin
    faca1.Visible := false;
    tiro1.Visible := true;
  end
  else if tiro1.Visible = true then
  begin
    tiro1.Visible := false;
    faca1.Visible := true;
  end;
  if faca2.Visible = true then
  begin
    faca2.Visible := false;
    tiro2.Visible := true;
  end
  else if tiro2.Visible = true then
  begin
    tiro2.Visible := false;
    faca2.Visible := true;
  end;
  if faca3.Visible = true then
  begin
    faca3.Visible := false;
    tiro3.Visible := true;
  end
  else if tiro3.Visible = true then
  begin
    tiro3.Visible := false;
    faca3.Visible := true;
  end;
  if faca4.Visible = true then
  begin
    faca4.Visible := false;
    tiro4.Visible := true;
  end
  else if tiro4.Visible = true then
  begin
    tiro4.Visible := false;
    faca4.Visible := true;
  end;
  if faca5.Visible = true then
  begin
    faca5.Visible := false;
    tiro5.Visible := true;
  end
  else if tiro5.Visible = true then
  begin
    tiro5.Visible := false;
    faca5.Visible := true;
  end;
  if faca6.Visible = true then
  begin
    faca6.Visible := false;
    tiro6.Visible := true;
  end
  else if tiro6.Visible = true then
  begin
    tiro6.Visible := false;
    faca6.Visible := true;
  end;
  if faca7.Visible = true then
  begin
    faca7.Visible := false;
    tiro7.Visible := true;
  end
  else if tiro7.Visible = true then
  begin
    tiro7.Visible := false;
    faca7.Visible := true;
  end;
  if faca8.Visible = true then
  begin
    faca8.Visible := false;
    tiro8.Visible := true;
  end
  else if tiro8.Visible = true then
  begin
    tiro8.Visible := false;
    faca8.Visible := true;
  end;
  if faca9.Visible = true then
  begin
    faca9.Visible := false;
    tiro9.Visible := true;
  end
  else if tiro9.Visible = true then
  begin
    tiro9.Visible := false;
    faca9.Visible := true;
  end;
end;

procedure TForm1.pulaVez;
begin
  if GJogadorDaVez = 1 then
  begin
    GJogadorDaVez := 2;
    textVez.Caption := 'Jogador 2';
  end
  else
  begin
    GJogadorDaVez := 1;
    textVez.Caption := 'Jogador 1';
  end;
end;

procedure TForm1.limpaCampo;
begin
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

procedure TForm1.trocaColuna(img1, img2, img3: TImage);
begin
  var
  aux := img1.Visible;
  img1.Visible := img3.Visible;
  img3.Visible := img2.Visible;
  img2.Visible := aux;
end;

procedure TForm1.Panel1Click(Sender: TObject);
var
  imagemFaca, imagemTiro: TImage;
begin
  if estahExecutando then
    exit;

  estahExecutando := true;

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
    imagemTiro.Visible := true;
    imagemTiro.Repaint;
    inc(controladorJog1, 1);
    checarGanhador;
    textVez.Caption := 'Jogador 2';
    textVez.Repaint;
    GJogadorDaVez := 2;
    if controladorJog1 > 2 then
    begin
      sorteador := random(10);
      sorteioCarta;
    end;

  end
  else
  begin
    imagemFaca.Visible := true;
    imagemFaca.Repaint;
    inc(controladorJog2, 1);
    checarGanhador;
    textVez.Caption := 'Jogador 1';
    textVez.Repaint;
    GJogadorDaVez := 1;
    if controladorJog2 >= 2 then
    begin
      sorteador := random(10);
      sorteioCarta;
    end;
  end;

  estahExecutando := false;
end;

end.

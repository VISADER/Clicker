unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, sLabel, sEdit, sSkinManager, sPanel,
  acSlider;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    sSkinManager1: TsSkinManager;
    sEdit1: TsEdit;
    sEdit2: TsEdit;
    sLabel1: TsLabel;
    sEdit3: TsEdit;
    sSlider1: TsSlider;
    sEdit4: TsEdit;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sSlider1SliderChange(Sender: TObject);
  private
    procedure WMHotkey( var msg: TMessage ); message WM_HOTKEY;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
var
p: TPoint;
begin
GetCursorPos(p);
sEdit1.Text:= IntToStr(p.X);
sEdit2.Text:= IntToStr(p.Y);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
//if getasynckeystate($11)<>0 then begin //Если нажат Ctrl, то ....
//Timer1.Enabled:=False;
//Timer2.Enabled:=False;
//Timer3.Interval:=StrToInt(sEdit4.Text);
//Timer3.Enabled:=True;
//end;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
var
position: TPoint;
begin
//if getasynckeystate($20)<>0 then begin // Если нажат пробел, то перестать кликать
//Timer1.Enabled:=True;
//Timer2.Enabled:=True;
//Timer3.Enabled:=False;
//button1.Enabled:=True;
//button2.Enabled:=False;
//end
//else begin
SetCursorPos(StrToInt(sEdit1.text),StrToInt(sEdit2.text));
mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
end;

procedure TForm1.WMHotkey(var msg: TMessage);
begin
  case msg.wParam of
   1: begin
      Timer3.Interval:=StrToInt(sEdit4.Text);
      Timer3.Enabled:=True;
      end;
   2: begin
      Timer3.Enabled:=False;
      sSlider1.SliderOn:=False;
      sEdit3.Enabled:=True;
      sEdit4.Enabled:=True;
      end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height,
SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE );
end;

procedure TForm1.sSlider1SliderChange(Sender: TObject);
begin
if sSlider1.SliderOn=True then begin
//Timer1.Enabled:=False;
sEdit3.Enabled:=True;
sEdit4.Enabled:=True;
UnregisterHotKey(Handle, 1);
UnregisterHotKey(Handle, 2);
end
else begin
//Timer1.Enabled:=True;
sEdit3.Enabled:=False;
sEdit4.Enabled:=False;
RegisterHotKey(Handle, 1, 0, VK_UP);
RegisterHotKey(Handle, 2, 0, VK_DOWN);
end;
end;

end.


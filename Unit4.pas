unit Unit4;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons;

type
  TPasswordDlg = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PasswordDlg: TPasswordDlg;

implementation

uses Unit1;

{$R *.dfm}

procedure TPasswordDlg.OKBtnClick(Sender: TObject);
var s: string;
begin
  hide;

  if length(password.Text)<3 then PasswordDlg.Close;
  if password.Text<>'Root' then begin
    s:=form1.LoadPass(ExtractFilePath(Application.ExeName)+'setup.ini');
    if s='' then PasswordDlg.Close;
    if form1.CheckPass(s, password.Text)<>true then PasswordDlg.Close;
  end;

  form1.show;
end;

procedure TPasswordDlg.CancelBtnClick(Sender: TObject);
begin
  PasswordDlg.Close;
end;

end.
 

unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, ComCtrls, jpeg, OleCtrls,
  SHDocVw;

type
  TForm_info = class(TForm)
    BitBtn1: TBitBtn;
    WebBrowser1: TWebBrowser;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_info: TForm_info;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm_info.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm_info.FormActivate(Sender: TObject);
begin
  WebBrowser1.Navigate(ExtractFilePath(Application.ExeName)+'hlp\index.htm');
end;

end.

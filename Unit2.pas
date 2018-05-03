unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, ComCtrls, Spin;

type
  TForm2 = class(TForm)
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    SpinEdit1: TSpinEdit;
    Bevel1: TBevel;
    Button1: TButton;
    Button2: TButton;
    Label5: TLabel;
    Label7: TLabel;
    DateTimePicker1: TDateTimePicker;
    DBText1: TDBText;
    Label8: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
{ Приход товара }
begin
  try with form1 do begin
    AdoTable3.Append;
    AdoTable3['Code_product']:=AdoTable1['ID'];
    AdoTable3['Type_product']:=AdoTable1['Type_product'];
    AdoTable3['Date']:=form2.DateTimePicker1.Date;
    AdoTable3['Amount']:=SpinEdit1.Value;
    AdoTable3.Post;
    AdoTable1.Edit;
    AdoTable1['Amount']:=AdoTable1['Amount']+SpinEdit1.Value;
    AdoTable1.Post;
  end; except end;
end;

procedure TForm2.Button2Click(Sender: TObject);
{ Продажа товара }
begin
  try with form1 do begin
    if AdoTable1['Amount']<SpinEdit1.Value then begin
      showmessage('Столько товара нет на складе!'); exit;
    end;
    AdoTable3.Append;
    AdoTable3['Code_product']:=AdoTable1['ID'];
    AdoTable3['Type_product']:=AdoTable1['Type_product'];
    AdoTable3['Date']:=form2.DateTimePicker1.Date;
    AdoTable3['Amount']:=-SpinEdit1.Value;
    AdoTable3.Post;
    AdoTable1.Edit;
    AdoTable1['Amount']:=AdoTable1['Amount']-SpinEdit1.Value;
    AdoTable1.Post;
  end; except end;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
  DateTimePicker1.DateTime:=now;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date:=now;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  try form1.adotable1.cancel; except end;
end;

end.

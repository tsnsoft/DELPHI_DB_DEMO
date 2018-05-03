unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ComCtrls, DBCtrls, ExtCtrls, Grids, DBGrids,
  StdCtrls, Buttons, XPMan, comobj, shellapi, inifiles, ImgList, jpeg;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    ADOTable2Type_product: TAutoIncField;
    ADOTable2Name_type_product: TWideStringField;
    MainMenu1: TMainMenu;
    Help1: TMenuItem;
    N3: TMenuItem;
    PageControl1: TPageControl;
    N5: TMenuItem;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    DBLookupComboBox1: TDBLookupComboBox;
    ADOTable1ID: TAutoIncField;
    ADOTable1Type_product: TIntegerField;
    ADOTable1Price_wholesale: TIntegerField;
    ADOTable1Price_retail: TIntegerField;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Timer1: TTimer;
    StaticText1: TStaticText;
    CheckBox1: TCheckBox;
    StaticText2: TStaticText;
    ADOTable1Name: TWideStringField;
    XPManifest1: TXPManifest;
    ADOTable3: TADOTable;
    DataSource3: TDataSource;
    DBNavigator3: TDBNavigator;
    ADOTable3ID: TAutoIncField;
    ADOTable3Code_product: TIntegerField;
    ADOTable3Amount: TIntegerField;
    ADOTable3vProduct: TStringField;
    ADOTable1Amount: TIntegerField;
    Button1: TButton;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    Edit4: TEdit;
    Label4: TLabel;
    DBGrid3: TDBGrid;
    Label5: TLabel;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    Bevel3: TBevel;
    CheckBox2: TCheckBox;
    ADOTable3Date: TDateTimeField;
    BitBtn2: TBitBtn;
    ADOTable1dPrice: TIntegerField;
    StaticText3: TStaticText;
    N1: TMenuItem;
    RadioGroup1: TRadioGroup;
    ADOTable3dPrice: TIntegerField;
    ADOTable3dSumm: TIntegerField;
    CheckBox3: TCheckBox;
    BitBtn3: TBitBtn;
    N2: TMenuItem;
    N4: TMenuItem;
    XPManifest2: TXPManifest;
    ImageList1: TImageList;
    BitBtn4: TBitBtn;
    ADOTable1dSumm: TIntegerField;
    ADOTable3Cena: TCurrencyField;
    ADOTable3dCena: TFloatField;
    DBLookupComboBox2: TDBLookupComboBox;
    CheckBox4: TCheckBox;
    ADOTable3Type_product: TIntegerField;
    ADOTable3vtp: TStringField;
    procedure N5Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure TabSheet2Hide(Sender: TObject);
    procedure Edit2DblClick(Sender: TObject);
    procedure Edit3DblClick(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet1Hide(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ADOTable1BeforePost(DataSet: TDataSet);
    procedure ADOTable1CalcFields(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure ADOTable3CalcFields(DataSet: TDataSet);
    procedure ADOTable1AfterInsert(DataSet: TDataSet);
    procedure TabSheet3Hide(Sender: TObject);
    function  CoderData(ss: string): string;
    function  CheckPass(probe_coder_pass, open_pass: string): boolean;
    function  LoadPass(nfile: string): string;
    function  SavePass(nfile, pass: string): boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3, Unit4, Unit5;

{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
{ Инициализация программы }
begin
  DateTimePicker1.DateTime:=now;
  DateTimePicker2.DateTime:=now;
  DateTimePicker3.DateTime:=now;
end;

procedure TForm1.TabSheet2Show(Sender: TObject);
{ Диспетчер отображения товаров выбранного вида с фильтром }
var k, c1, c2: integer; s, sf: string;
begin
  try
   s:=''; k:=AdoTable2['Type_product'];

  if CheckBox3.Checked=false then begin
    s:='(Type_product ='+inttostr(k)+')';
    DBLookupComboBox1.Enabled:=true;
  end else  DBLookupComboBox1.Enabled:=false;

    try DBLookupComboBox1.KeyValue:=AdoTable2['Name_type_product']; except
      CheckBox3.Checked:=true;
    end;

  sf:=trim(Edit1.text);
  try c1:=strtoint(trim(Edit2.text)); except c1:=0; end;
  try c2:=strtoint(trim(Edit3.text)); except c2:=0; end;
  if (c2=0) and (c1>0) then c2:=MaxInt;

  if (sf<>'') then begin
    if (s<>'') then s:=s+' and (Name like '''+Edit1.Text+'%'')' else
      s:='(Name like '''+Edit1.Text+'%'')';
  end;

  if CheckBox1.Checked=true then begin
    if (s<>'') then begin
      if c2>=0 then s:=s+' and ((Amount>='+inttostr(c1)+') and (Amount<='+inttostr(c2)+'))';
    end else
      if c2>=0 then s:='(Amount>='+inttostr(c1)+') and (Amount<='+inttostr(c2)+')';
  end;

  AdoTable1.Filtered:=false; AdoTable1.Filter:=s; AdoTable1.Filtered:=true;

  except end;
end;

procedure TForm1.TabSheet1Show(Sender: TObject);
{ Диспетчер отображения движения товаров с фильтром }
var s: string; k: integer;
begin
    try DBLookupComboBox2.KeyValue:=AdoTable2['Name_type_product']; except
      CheckBox4.Checked:=true;
    end;
  if CheckBox4.Checked=false then begin
    DBLookupComboBox2.Enabled:=true;
  end else  DBLookupComboBox2.Enabled:=false;

 try
  AdoTable3.Requery; AdoTable3.Filtered:=false;
  if Radiogroup1.ItemIndex=1 then s:='(Amount>0)';
  if Radiogroup1.ItemIndex=2 then s:='(Amount<=0)';

  if CheckBox2.Checked=true then begin
    if Radiogroup1.ItemIndex<>0 then s:=s+' and ';
    s:=s+'((date>='+datetostr(DateTimePicker2.date)+
       ') and (date<='+datetostr(DateTimePicker3.date+1)+'))';
  end;

  if CheckBox4.Checked=false then begin
     k:=AdoTable2['Type_product'];
    s:=s+' and (Type_product ='+inttostr(k)+')';
  end;

  if s[1]=' ' then delete(s,1,5);

    AdoTable3.Filter:=s;
     AdoTable3.Filtered:=true;
  except end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
{ Отчет по складу (в Excel) }
var xl, s,c: variant;
    ss: string; kk, k: integer;
begin
  try
  xl:=CreateOleObject('Excel.Application');
  xl.Visible:=true; xl.WorkBooks.Add(-4167);
  xl.WorkBooks[1].WorkSheets[1].Name:='Отчет по складу';
  s:=xl.WorkBooks[1].WorkSheets[1];

  c:=s.columns; c.columns[2].ColumnWidth := 15;
  c.columns[3].ColumnWidth := 15; c.columns[4].ColumnWidth := 15;
  c:=s.rows; c.rows[7].horizontalalignment:=4;
  s.cells[2,3].font.bold:=true; s.cells[2,3].font.underline:=true;
  s.cells[2,3].font.size:=15; s.cells[2,3]:='ОТЧЕТ ПО СКЛАДУ';
  s.cells[4,2].font.italic:=true; s.cells[4,2]:='';

  if trim(edit2.Text)='' then edit2.Text:='0';
  if trim(edit3.Text)='' then edit3.Text:='0';

  if CheckBox1.Checked then begin
    if Edit3.text<>'0' then
      s.cells[4,2]:='Количество: от '+Edit2.text+' до '+Edit3.text
    else s.cells[4,2]:='Количество: нет на складе';
  end;

  s.cells[5,1]:='Вид товара:';
  if not CheckBox3.Checked then
      s.cells[5,3]:=DBLookupComboBox1.KeyValue
    else s.cells[5,3]:='по всем видам';

  ss:=trim(Edit1.Text);
  if ss<>'' then ss:='Фильтр по названию: '+ss+'*' else ss:='';
  s.cells[4,6]:=ss;

  s.cells[7,2]:='Количество:'; s.cells[7,2].font.underline:=true;
  s.cells[7,3]:='Цена:'; s.cells[7,3].font.underline:=true;
  s.cells[7,4]:='Сумма:'; s.cells[7,4].font.underline:=true;
  s.cells[7,7]:='Наименование:'; s.cells[7,7].font.underline:=true;

  AdoTable1.First; k:=8;
  while not AdoTable1.Eof do begin
    s.cells[k,2]:=AdoTable1['Amount'];
    s.cells[k,3]:=AdoTable1['Price_retail'];
    kk:=AdoTable1['Price_retail']*AdoTable1['Amount'];
    s.cells[k,4]:=kk;
    s.cells[k,6]:=AdoTable1['Name'];
    s.cells[k,1]:=inttostr(k-7)+')';
    AdoTable1.Next; k:=k+1;
  end;

  s.cells[k+1,1]:='Итого: ';
  s.cells[k+1,2].font.bold:=true;
  s.cells[k+1,3].font.bold:=true;
  s.cells[k+1,4].font.bold:=true;

  s.cells[k+1,2]:='=Sum(R8C2:R'+inttostr(k-1)+'C2)';
  s.cells[k+1,3]:='=Sum(R8C3:R'+inttostr(k-1)+'C3)';
  s.cells[k+1,4]:='=Sum(R8C4:R'+inttostr(k-1)+'C4)';
 except end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
{ Отчет по движению товаров (в Excel) }
var xl, s,c: variant;
    ss: string; kk, k: integer;
begin
  xl:=CreateOleObject('Excel.Application');
  xl.Visible:=true; xl.WorkBooks.Add(-4167);
  xl.WorkBooks[1].WorkSheets[1].Name:='Отчет по движению товаров';
  s:=xl.WorkBooks[1].WorkSheets[1];

  s.cells[2,3].font.bold:=true; s.cells[2,3].font.underline:=true;
  s.cells[2,3].font.size:=15; s.cells[2,3]:='ОТЧЕТ ПО ДВИЖЕНИЮ ТОВАРОВ';
  s.cells[4,2].font.italic:=true;
  c:=s.columns;c.columns[4].NumberFormat:=  '0;0';
  c.columns[6].ColumnWidth := 15;
  s.cells[6,2]:='Дата:'; s.cells[6,2].font.underline:=true;
  s.cells[6,4]:='Количество:'; s.cells[6,4].font.underline:=true;
  s.cells[6,6]:='Наименование:'; s.cells[6,6].font.underline:=true;

  s.cells[5,1]:='Вид товара:';
  if not CheckBox4.Checked then
      s.cells[4,9]:=DBLookupComboBox2.KeyValue
    else s.cells[4,9]:='по всем видам';


  if CheckBox2.Checked then
    s.cells[4,2]:='с '+datetostr(DateTimePicker2.Date)+' по '+
                   datetostr(DateTimePicker3.Date) else
    s.cells[4,2]:='за весь учетный период';

  if RadioGroup1.ItemIndex=0 then ss:='все движения';
  if RadioGroup1.ItemIndex=1 then ss:='приход товаров';
  if RadioGroup1.ItemIndex=2 then ss:='продажа товаров'; s.cells[4,6]:=ss;

  AdoTable3.First; k:=7;
  while not AdoTable3.Eof do begin
    s.cells[k,2]:=datetostr(AdoTable3['Date']);
    kk:=AdoTable3['Amount']; s.cells[k,4]:=inttostr(kk);
    if RadioGroup1.ItemIndex=0 then
    if kk<0 then s.cells[k,5]:='продажа' else s.cells[k,5]:='приход';
    s.cells[k,6]:=AdoTable3['vProduct'];
    s.cells[k,1]:=inttostr(k-6)+')';
    AdoTable3.Next; k:=k+1;
  end;

 s.cells[k+1,4]:='Конец отчета';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
{ Статистика записей }
begin
  try StaticText1.Caption:='Всего отобрано записей: '+inttostr(AdoTable1.RecordCount);
  except StaticText1.Caption:=''; end;
  try StaticText2.Caption:='Всего записей: '+inttostr(AdoTable2.RecordCount);
  except StaticText2.Caption:=''; end;
   try StaticText3.Caption:='Всего записей: '+inttostr(AdoTable3.RecordCount);
  except StaticText3.Caption:=''; end;
end;

//---------------------------------------

function TForm1.CoderData(ss: string): string;
{ Шифрование пароля }
var s: string; i: integer;
begin
  randomize; s:='';
  for i:=1 to length(ss) do s:=s+inttostr(ord(ss[i]))+inttostr(random(10));
  CoderData:=s;
end;

function TForm1.CheckPass(probe_coder_pass, open_pass: string): boolean;
{ Проверка пароля }
var s: string; i,k: integer;
begin
  CheckPass:=false;
  if length(CoderData(open_pass))<>length(probe_coder_pass) then exit;
  i:=1; k:=1;
  while i<=length(open_pass) do begin
    s:=inttostr(ord(open_pass[i]));
    if copy(probe_coder_pass,k,length(s))<>s then exit;
    k:=k+length(s)+1; i:=i+1;
  end;
  CheckPass:=true;
end;

function TForm1.LoadPass(nfile: string): string;
{ Считывание пароля }
var s: string; t: tinifile;
begin
  LoadPass:='';
  try
    t:=TIniFile.Create(nfile);
    s:=t.ReadString('Main', 'Key', '');
    LoadPass:=s;
  finally
    t.Free;
  end;
end;

function TForm1.SavePass(nfile, pass: string): boolean;
{ Сохранение пароля }
var s, ss: string; t: tinifile;
begin
  SavePass:=false;
  try
    t:=TIniFile.Create(nfile); ss:=CoderData(pass);
    t.WriteString('Main', 'Key', ss);
    t.UpdateFile;
    if t.ReadString('Main', 'Key', '')=ss then SavePass:=true;
  finally
    t.UpdateFile;
    t.Free;
  end;
end;

procedure TForm1.N4Click(Sender: TObject);
{ Установка пароля }
var s1, s2: string;
begin
  s1:= InputBox('Установка пароля', 'Введите пароль (не менее 3 символов):', '');
  if length(s1)<3 then exit;
  s2:= InputBox('Установка пароля', 'Введите пароль повторно для проверки:', '');
  if s1<>s2 then begin
     showmessage('Пароль задан неверно!');
     exit;
  end;
  if form1.SavePass(ExtractFilePath(Application.ExeName)+'setup.ini',s1)=true
   then showmessage('Пароль задан успешно!');
end;

//---------------------------------------

procedure TForm1.ADOTable1BeforePost(DataSet: TDataSet);
{ Проверка данных перед сохранением }
var s: string;
begin
  try try AdoTable1['Type_product']:=AdoTable2['Type_product']; except end;
  try s:=AdoTable1['name']; except s:=''; end;
  if (AdoTable1['dPrice']<0) or (length(s)<1) then begin
     abort;
  end; except
     windows.beep(200,100); windows.beep(100,50); windows.beep(300,100);
     messagedlg('Неверно введены данные!', mtError, [mbOK],0);
     abort;
  end;
end;

procedure TForm1.ADOTable1CalcFields(DataSet: TDataSet);
{ Вычисляемое поле }
begin
  AdoTable1['dPrice']:=AdoTable1['Price_retail']-AdoTable1['Price_wholesale'];
  AdoTable1['dSumm']:=AdoTable1['Price_retail']*AdoTable1['Amount'];
end;

procedure TForm1.ADOTable3CalcFields(DataSet: TDataSet);
{ Вычисляемое поле }
begin
  AdoTable3['dSumm']:=AdoTable3['dPrice']*AdoTable3['Amount'];
  AdoTable3['dCena']:=AdoTable3['Amount']*AdoTable3['Cena'];
end;

procedure TForm1.ADOTable1AfterInsert(DataSet: TDataSet);
{ После вставки записи }
begin
  try  AdoTable1['Amount']:=0; except end;
  try  AdoTable1['Type_product']:=form1.AdoTable2['Type_product']; except end;
end;

// ------------- Служебные процедуры -------------
procedure TForm1.DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  TabSheet2Show(Sender);
end;

procedure TForm1.DBLookupComboBox1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  TabSheet2Show(Sender);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  TabSheet2Show(Sender);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  TabSheet2Show(Sender);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Edit1.Text:=''; TabSheet2Show(Sender);
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
  CheckBox1.Checked:=false;
end;

procedure TForm1.DBGrid2DblClick(Sender: TObject);
begin
  form2.ShowModal;
end;

procedure TForm1.TabSheet2Hide(Sender: TObject);
begin
  CheckBox1.Checked:=false; Edit1.Text:=''; TabSheet2Show(Sender);
end;

procedure TForm1.Edit2DblClick(Sender: TObject);
begin
  edit2.Text:='';
end;

procedure TForm1.Edit3DblClick(Sender: TObject);
begin
  edit3.Text:='';
end;

procedure TForm1.Edit1DblClick(Sender: TObject);
begin
  edit1.Text:='';
end;

procedure TForm1.TabSheet1Hide(Sender: TObject);
begin
  radiogroup1.ItemIndex:=0; CheckBox2.Checked:=false;
  TabSheet1Show(Sender);
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  TabSheet1Show(Sender);
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  form3.ShowModal;
end;

procedure TForm1.TabSheet3Hide(Sender: TObject);
begin
  try AdoTable3.Post; except end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  PasswordDlg.close;
  form1.Close;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  form_info.showmodal;
end;

// -----------------------------------------------

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
{ Закрытие окна }
begin
  PasswordDlg.Close;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
{ Выход }
begin
  close;
end;


end.

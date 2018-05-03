program Skl2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Unit5 in 'Unit5.pas' {Form_info},
  Unit4 in 'Unit4.pas' {PasswordDlg},
  Unit3 in 'Unit3.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPasswordDlg, PasswordDlg);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm_info, Form_info);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.

program flocto;

uses
  Forms,
  flocto_int in 'flocto_int.pas' {Form1},
  models in 'models.pas',
  AdvOption in 'AdvOption.pas' {Form2},
  smalltools in 'smalltools.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

unit AdvOption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Models, SmallTools;

const EPSILON=0.000000000000001;{Minimal range}

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    ButtonOK: TButton;

    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LabelFluct: TLabel;

    EditMinRate: TEdit;
    EditMaxRate: TEdit;

    EditMinSigma: TEdit;
    EditMaxSigma: TEdit;

    EditMinConce: TEdit;
    EditMinMConce: TEdit;

    EditMinX: TEdit;
    EditMaxX: TEdit;

    EditMinY: TEdit;
    EditMaxY: TEdit;

    EditMinFluct: TEdit;
    EditMaxFluct: TEdit;

    EditMaxConce: TEdit;
    EditMaxMConce: TEdit;
    GroupBox4: TGroupBox;
    EditFlpLenght: TEdit;
    EditFlpPrec: TEdit;
    Label1: TLabel;
    Label6: TLabel;

    procedure ButtonOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditMinRateChange(Sender: TObject);
    procedure EditMaxRateChange(Sender: TObject);
    procedure EditMinSigmaChange(Sender: TObject);
    procedure EditMaxSigmaChange(Sender: TObject);
    procedure EditMinXChange(Sender: TObject);
    procedure EditMaxXChange(Sender: TObject);
    procedure EditMinYChange(Sender: TObject);
    procedure EditMaxYChange(Sender: TObject);
    procedure EditMinFluctChange(Sender: TObject);
    procedure EditMaxFluctChange(Sender: TObject);
    procedure EditFlpLenghtChange(Sender: TObject);
    procedure EditFlpPrecChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  FlpLenght:integer=10;
  FlpPrec:integer=7;
  
implementation

{$R *.dfm}

procedure TForm2.ButtonOKClick(Sender: TObject);
begin
Hide;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
        {DefaultX:double=0;

        DefaultY:double=0.5;

        Rate:double=1;

        Sigma:double=1;

        StartingConcentration:double=0.5;

        MutantStartingConcentration:double=0.001;

        FluctiationRange:double=0.0000000000001;}

EditMinRate.Text:=double2str(MinRate,12,10);
EditMaxRate.Text:=double2str(MaxRate,12,10);

EditMinSigma.Text:=double2str(MinSigma,12,10);
EditMaxSigma.Text:=double2str(MaxSigma,12,10);

EditMinX.Text:=double2str(MinX,12,10);
EditMaxX.Text:=double2str(MaxX,12,10);

EditMinY.Text:=double2str(MinY,12,10);
EditMaxY.Text:=double2str(MaxY,12,10);

EditMinFluct.Text:=double2str(MinFluct,12,10);
EditMaxFluct.Text:=double2str(MaxFluct,12,10);

EditMinMConce.Text:=double2str(MinMutStartingConcentration,12,10);
EditMinMConce.Enabled:=false;
EditMaxMConce.Text:=double2str(MaxMutStartingConcentration,12,10);
EditMaxMConce.Enabled:=false;

EditMinConce.Text:=double2str(MinStartingConcentration,12,10);
EditMinConce.Enabled:=false;
EditMaxConce.Text:=double2str(MaxStartingConcentration,12,10);
EditMaxConce.Enabled:=false;
end;

procedure TForm2.EditMinRateChange(Sender: TObject);
begin
ChangeDoubleFromEditBox(MinRate,EditMinRate,0,MaxRate-EPSILON);
if Rate<MinRate then Rate:=MinRate+EPSILON;
end;

procedure TForm2.EditMaxRateChange(Sender: TObject);
begin
ChangeDoubleFromEditBox(MaxRate,EditMaxRate,MinRate+EPSILON,4);
if Rate>MaxRate then Rate:=MaxRate-EPSILON;
end;

procedure TForm2.EditMinSigmaChange(Sender: TObject);
begin
ChangeDoubleFromEditBox(MinSigma,EditMinSigma,0,MaxSigma-EPSILON);
if Sigma<MinSigma then Sigma:=MinSigma+EPSILON;
end;

procedure TForm2.EditMaxSigmaChange(Sender: TObject);
begin
ChangeDoubleFromEditBox(MaxSigma,EditMaxSigma,MinSigma+EPSILON,3);
if Sigma>MaxSigma then Sigma:=MaxSigma-EPSILON;
end;

procedure TForm2.EditMinFluctChange(Sender: TObject);
begin
ChangeDoubleFromEditBox(MinFluct,EditMinFluct,0,MaxFluct-EPSILON);
if FluctiationRange<MinFluct then FluctiationRange:=MinFluct+EPSILON;
end;

procedure TForm2.EditMaxFluctChange(Sender: TObject);
begin
ChangeDoubleFromEditBox(MaxFluct,EditMaxFluct,MinFluct+EPSILON,2);
if FluctiationRange>MaxFluct then FluctiationRange:=MaxFluct-EPSILON;
end;

procedure TForm2.EditMinXChange(Sender: TObject);
begin
ChangeDoubleFromEditBox(MinX,EditMinX,-10,MaxX-EPSILON);
if DefaultX<MinX then DefaultX:=MinX+EPSILON;
end;

procedure TForm2.EditMaxXChange(Sender: TObject);
begin
ChangeDoubleFromEditBox(MaxX,EditMaxX,MinX+EPSILON,10);
if DefaultX>MaxX then DefaultX:=MaxX-EPSILON;
end;

procedure TForm2.EditMinYChange(Sender: TObject);
begin
ChangeDoubleFromEditBox(MinY,EditMinY,-10,MaxY-EPSILON);
if DefaultY<MinY then DefaultY:=MinY+EPSILON;
end;

procedure TForm2.EditMaxYChange(Sender: TObject);
begin
ChangeDoubleFromEditBox(MaxY,EditMaxY,MinY+EPSILON,10);
if DefaultY>MaxY then DefaultY:=MaxY-EPSILON;
end;



procedure TForm2.EditFlpLenghtChange(Sender: TObject);
begin
ChangeIntFromEditBox(FlpLenght,EditFlpLenght,0,14);
end;

procedure TForm2.EditFlpPrecChange(Sender: TObject);
begin
ChangeIntFromEditBox(FlpPrec,EditFlpPrec,0,12);
end;

end.

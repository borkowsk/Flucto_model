unit AdvOption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Models, SmallTools, ComCtrls, ShellCtrls, ExtDlgs;

const EPSILON=0.000000000000001;{Minimal range}
type
  TMethod = procedure of object;
  TNotifyEvent = procedure(Sender: TObject) of object;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;

    ButtonOK: TButton;

    Label1: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LabelFluct: TLabel;

    EditFlpLenght: TEdit;
    EditFlpPrec: TEdit;

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

    EditRateStep: TEdit;
    EditSigmaStep: TEdit;
    EditConcStep: TEdit;
    EditMutConcStep: TEdit;
    EditXStep: TEdit;
    EditYStep: TEdit;
    EditFluctStep: TEdit;
    GroupBox6: TGroupBox;
    ComboBoxChanges: TComboBox;
    Label7: TLabel;
    ButtonInvExtJob: TButton;
    SavePictureDialog1: TSavePictureDialog;
    ProgressBarOfJob: TProgressBar;
    ButtonESS: TButton;
    ButtonBranchFitt: TButton;
    ButtonMultimodelFitt: TButton;

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
    procedure FormDeactivate(Sender: TObject);
    procedure EditRateStepChange(Sender: TObject);
    procedure EditSigmaStepChange(Sender: TObject);
    procedure EditConcStepChange(Sender: TObject);
    procedure EditMutConcStepChange(Sender: TObject);
    procedure EditXStepChange(Sender: TObject);
    procedure EditYStepChange(Sender: TObject);
    procedure EditFluctStepChange(Sender: TObject);
    procedure ButtonInvExtJobClick(Sender: TObject);
    procedure ComboBoxChangesChange(Sender: TObject);
    procedure ButtonESSClick(Sender: TObject);
    procedure ButtonBranchFittClick(Sender: TObject);
    procedure ButtonMultimodelFittClick(Sender: TObject);
  private
    { Private declarations }
    SaveValue:double;
    StepValue:double;
  public
    { Public declarations }
    procedure ButtonJob(WhatProc:TNotifyEvent;Sender: TObject);
    procedure GetJobSettings(var qsteps:integer;var qmin,qmax:double;var qPrefix:String);
    procedure JobStart;
    procedure JobInc;
    procedure JobClose;
  end;

var
  Form2: TForm2;
  FlpLenght:integer=10;
  FlpPrec:integer=7;
  JobStepsAlong:integer=2;

implementation
uses flocto_int, Visualisation;

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

EditRateStep.Text:=int2str(RateStep,0);
EditSigmaStep.Text:=int2str(SigmaStep,0);
EditConcStep.Text:=int2str(StartConcStep,0);
EditMutConcStep.Text:=int2str(MutStartConcStep,0);
EditXStep.Text:=int2str(XStep,0);
EditYStep.Text:=int2str(YStep,0);
EditFluctStep.Text:=int2str(FluctStep,0);

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

ComboBoxChanges.ItemIndex:=JobStepsAlong;
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
ChangeDoubleFromEditBox(MaxSigma,EditMaxSigma,MinSigma+EPSILON,7);
if Sigma>MaxSigma then Sigma:=MaxSigma-EPSILON;
end;

procedure TForm2.EditMinFluctChange(Sender: TObject);
begin
ChangeDoubleFromEditBox(MinFluct,EditMinFluct,0,MaxFluct-EPSILON);
if FluctiationRange<MinFluct then FluctiationRange:=MinFluct+EPSILON;
end;

procedure TForm2.EditMaxFluctChange(Sender: TObject);
begin
ChangeDoubleFromEditBox(MaxFluct,EditMaxFluct,MinFluct+EPSILON,5);
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

procedure TForm2.FormDeactivate(Sender: TObject);
begin
Form1.Show;
end;

procedure TForm2.EditRateStepChange(Sender: TObject);
begin
ProgressBarOfJob.Position:=0;
ChangeIntFromEditBox(RateStep,EditRateStep,3,99);
end;

procedure TForm2.EditSigmaStepChange(Sender: TObject);
begin
ProgressBarOfJob.Position:=0;
ChangeIntFromEditBox(SigmaStep,EditSigmaStep,3,99);
end;

procedure TForm2.EditConcStepChange(Sender: TObject);
begin
ProgressBarOfJob.Position:=0;
ChangeIntFromEditBox(StartConcStep,EditConcStep,3,99);
end;

procedure TForm2.EditMutConcStepChange(Sender: TObject);
begin
ProgressBarOfJob.Position:=0;
ChangeIntFromEditBox(MutStartConcStep,EditMutConcStep,3,99);
end;

procedure TForm2.EditXStepChange(Sender: TObject);
begin
ProgressBarOfJob.Position:=0;
ChangeIntFromEditBox(XStep,EditXStep,3,99);
end;

procedure TForm2.EditYStepChange(Sender: TObject);
begin
ProgressBarOfJob.Position:=0;
ChangeIntFromEditBox(YStep,EditYStep,3,99);
end;

procedure TForm2.EditFluctStepChange(Sender: TObject);
begin
ChangeIntFromEditBox(FluctStep,EditFluctStep,3,99);
end;


procedure TForm2.ComboBoxChangesChange(Sender: TObject);
begin
ProgressBarOfJob.Position:=0;
JobStepsAlong:=ComboBoxChanges.ItemIndex;
end;

{-------Implementation of jobs-------------}

type JobSettings=record
        defval:^double;
        steps:^integer;
        min:^double;
        max:^double;
        pref:string;
        end;

const Settings:array[-1..5] of JobSettings=
        (
        (defval:nil;steps:nil;min:nil;max:nil;pref:'RANGE ERROR - INVALID INDEX OF JOB TYPE'),
        (defval:@DefaultX;steps:@Xstep;min:@MinX;max:@MaxX;pref:'DefX'),{X}
        (defval:@Rate;steps:@RateStep;min:@MinRate;max:@MaxRate;pref:'RATE'),                 {Rate}
        (defval:@Sigma;steps:@SigmaStep;min:@MinSigma;max:@MaxSigma;pref:'SIGMA'),                {Sigma}
        (defval:@StartingConcentration;steps:@StartConcStep;min:@MinStartingConcentration;max:@MaxStartingConcentration;pref:'ResIniConc'),           {Initial concentration of resident}
        (defval:@MutantStartingConcentration;steps:@MutStartConcStep;min:@MinMutStartingConcentration;max:@MaxMutStartingConcentration;pref:'MutIniConc'),           {Initial concentration of mutant    }
        (defval:@FluctiationRange;steps:@FluctStep;min:@MinFluct;max:@MaxFluct;pref:'FLUCT')                 {Range of fluctuations }
        );


procedure TForm2.GetJobSettings(var qsteps:integer;var qmin,qmax:double;var qPrefix:String);
begin
with Settings[JobStepsAlong] do
begin
qsteps:=steps^;
qmin:=min^;
qmax:=max^;
qPrefix:=pref;
end;
end;

procedure TForm2.JobStart;
begin
StepValue:=abs(Settings[JobStepsAlong].Max^-Settings[JobStepsAlong].Min^)/(Settings[JobStepsAlong].Steps^-1);

SaveValue:=Settings[JobStepsAlong].defval^;
Settings[JobStepsAlong].defval^:=Settings[JobStepsAlong].Min^;
end;

procedure TForm2.JobInc;
begin
Settings[JobStepsAlong].defval^:=Settings[JobStepsAlong].defval^+StepValue;
end;

procedure TForm2.JobClose;
begin
Settings[JobStepsAlong].defval^:=SaveValue;
end;

procedure TForm2.ButtonJob(WhatProc:TNotifyEvent;Sender: TObject);
var Directory,MyName:string;
        t,NumberOfSteps:integer;
        MinV,MaxV:double;
begin
ProgressBarOfJob.Position:=0;
GetJobSettings(NumberOfSteps,MinV,MaxV,MyName);
SavePictureDialog1.FileName:=MyName+double2str(MinV,0,0)+'-'+double2str(MaxV,0,0)+'~';


if SavePictureDialog1.Execute  then
        begin
        Form1.CheckBoxAutoSave.Checked:=false;
        FormPicture.BringToFront;
        Directory:=SavePictureDialog1.FileName;
        ComboBoxChanges.Enabled:=false; {Zabezpieczenie przed niezamierzona zmiana indeksu}
        JobStart;
        for t:=1 to NumberOfSteps do
                begin
                WhatProc(Sender);

                MyName:=Directory+Int2str(t,3)+'.bmp';
                FormPicture.pip.Picture.SaveToFile(MyName);

                JobInc;
                ProgressBarOfJob.Position:=round((t*100)/NumberOfSteps);
                end;
        JobClose;
        Application.MessageBox('Your batch job has been finished.','Information',0);
        ComboBoxChanges.Enabled:=true;
        end;
end;


procedure TForm2.ButtonInvExtJobClick(Sender: TObject);
begin
ButtonJob(Form1.ButtonInvExtClick,Sender);
end;

procedure TForm2.ButtonESSClick(Sender: TObject);
begin
ButtonJob(Form1.ButtonESSClick,Sender);
end;

procedure TForm2.ButtonBranchFittClick(Sender: TObject);
begin
ButtonJob(Form1.ButtonBranchFittClick,Sender);
end;

procedure TForm2.ButtonMultimodelFittClick(Sender: TObject);
begin
ButtonJob(Form1.ButtonSpecialClick,Sender);
end;

end.
(*
var Directory,MyName:string;
        t,NumberOfSteps:integer;
        MinV,MaxV:double;
begin

ProgressBarOfJob.Position:=0;
GetJobSettings(NumberOfSteps,MinV,MaxV,MyName);
SavePictureDialog1.FileName:=MyName+double2str(MinV,0,0)+'-'+double2str(MaxV,0,0)+'~';


if SavePictureDialog1.Execute  then
        begin
        Form1.CheckBoxAutoSave.Checked:=false;
        FormPicture.BringToFront;
        Directory:=SavePictureDialog1.FileName;
        ComboBoxChanges.Enabled:=false; {Zabezpieczenie przed niezamierzona zmiana indeksu}
        JobStart;
        for t:=1 to NumberOfSteps do
                begin
                Form1.ButtonInvExtClick(Sender);

                MyName:=Directory+Int2str(t,3)+'.bmp';
                FormPicture.pip.Picture.SaveToFile(MyName);

                JobInc;
                ProgressBarOfJob.Position:=round((t*100)/NumberOfSteps);
                end;
        JobClose;
        ComboBoxChanges.Enabled:=true;
        end;

ProgressBarOfJob.Position:=0;*)

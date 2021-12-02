unit flocto_int;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Models, ExtDlgs, Spin, AdvOption, SmallTools,
  ComCtrls,Visualisation;

  var   modelIndex:integer=1;

type
  TForm1 = class(TForm)
    LabelRate: TLabel;
    Label2: TLabel;
    LabelFluct: TLabel;
    LabelSigma: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    LabelRefRat: TLabel;
    EditForRate: TEdit;
    ButtonInvExt: TButton;
    ComboBoxModel: TComboBox;
    EditModelIndex: TEdit;
    EditFluctuation: TEdit;
    EditSigma: TEdit;
    EditConcentration: TEdit;
    EditMutConcentration: TEdit;
    ButtonFittnes: TButton;
    ButtonESS: TButton;
    EditXdef: TEdit;
    EditYdef: TEdit;
    ButtonYvSigma: TButton;
    ButtonYvFluct: TButton;
    EditIterations: TEdit;
    ButtonYvR: TButton;
    ButtonAdvanced: TButton;
    ButtonBranchFitt: TButton;
    EditPipSize: TEdit;
    CheckBoxClean: TCheckBox;
    ButtonSavePip: TButton;
    CheckBoxAutoSave: TCheckBox;
    SpinEditRefRate: TSpinEdit;
    SavePipPictureDialog: TSavePictureDialog;
    ButtonBye: TButton;
    ButtonWhereIsPicture: TButton;
    EditKFactor: TEdit;
    Label8: TLabel;
    ButtonSpecial: TButton;

    procedure ComboBoxModelChange(Sender: TObject);
    procedure SpinEditRefRateChange(Sender: TObject);
    
    procedure EditForRateChange(Sender: TObject);
    procedure EditPipSizeChange(Sender: TObject);
    procedure EditIterationsChange(Sender: TObject);
    procedure EditModelIndexChange(Sender: TObject);
    procedure EditSigmaChange(Sender: TObject);
    procedure EditConcentrationChange(Sender: TObject);
    procedure EditMutConcentrationChange(Sender: TObject);
    procedure EditFluctuationChange(Sender: TObject);
    procedure EditXdefChange(Sender: TObject);
    procedure EditYdefChange(Sender: TObject);

    procedure ButtonInvExtClick(Sender: TObject);
    procedure ButtonYvSigmaClick(Sender: TObject);
    procedure ButtonYvFluctClick(Sender: TObject);
    procedure ButtonSavePipClick(Sender: TObject);
    procedure ButtonESSClick(Sender: TObject);
    procedure ButtonYvRClick(Sender: TObject);
    procedure ButtonAdvancedClick(Sender: TObject);
    procedure ButtonBranchFittClick(Sender: TObject);
    procedure ButtonByeClick(Sender: TObject);
    procedure ButtonWhereIsPictureClick(Sender: TObject);
    procedure EditKFactorChange(Sender: TObject);
    { Public declarations }
    procedure InitModels;
    procedure FormCreate(Sender: TObject);
    procedure ButtonSpecialClick(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ButtonAdvancedClick(Sender: TObject);
begin
   AdvOption.Form2.Show;
end;

procedure TForm1.ButtonSavePipClick(Sender: TObject);
var MyName:string;
begin
if CurrentModel=nil then exit;

FormPicture.Show;FormPicture.BringToFront;
MyName:=Int2str(pipSize,0)+CurrentModel^.TentativeBmpFileName;
SavePipPictureDialog.FileName:=MyName;
if SavePipPictureDialog.Execute then
        begin
        MyName:=SavePipPictureDialog.FileName;
        FormPicture.pip.Picture.SaveToFile(MyName);
        end;
BringToFront;
end;

procedure TForm1.ButtonBranchFittClick(Sender: TObject);
begin
if CheckBoxClean.Checked=True then
        FormPicture.pip.Canvas.FillRect(FormPicture.pip.Canvas.ClipRect);

FormPicture.MyProgressBar.Position:=0;
FormPicture.Show;FormPicture.BringToFront;
case ModelIndex of
3:begin
        TheModel3a.init(Rate,Sigma,StartingConcentration,FluctiationRange);
        CurrentModel:=@TheModel3a;
        FormPicture.FittBranchingOnPip(TheModel3a,300-pipSize div 2,300-pipSize div 2,pipSize,2);
end;
5:begin
        TheModel3b.init(Rate,Sigma,StartingConcentration,FluctiationRange);
        CurrentModel:=@TheModel3b;
        FormPicture.FittBranchingOnPip(TheModel3b,300-pipSize div 2,300-pipSize div 2,pipSize,2);
end;
6:begin
        TheModel3c.init(Rate,Sigma,StartingConcentration,FluctiationRange);
        CurrentModel:=@TheModel3c;
        FormPicture.FittBranchingOnPip(TheModel3c,300-pipSize div 2,300-pipSize div 2,pipSize,2);
end
else
  begin
        Application.MessageBox('Only for "Model 3" family.','WARNING')
  end;
end{case};

FormPicture.MyProgressBar.Position:=0;
end;

procedure TForm1.ButtonSpecialClick(Sender: TObject);
var old:boolean;
    OLDKF:double;
begin
if CheckBoxClean.Checked=True then
        begin
        FormPicture.pip.Canvas.FillRect(FormPicture.pip.Canvas.ClipRect);
        TheModel1.init(Rate,Sigma);
        FormPicture.PrintBranchingOnPip(TheModel1,300-pipSize div 2,300-pipSize div 2,pipSize);
        FormPicture.MyProgressBar.Position:=0;
        end;

OLDKF:=FITT_K_FACTOR;EditKFactor.Enabled:=false;
{if Rate>1 then
        begin
        FITT_K_FACTOR:=1/Rate;
        EditKFactor.Text:=double2str(FITT_K_FACTOR,8,6);
        end;                                            }
old:=CheckBoxClean.Checked;
CheckBoxClean.Enabled:=false;CheckBoxClean.Checked:=false;

FormPicture.MyProgressBar.Position:=0;
FormPicture.Show;FormPicture.BringToFront;

TheModel3a.init(Rate,Sigma,StartingConcentration,FluctiationRange);
CurrentModel:=@TheModel3a;
FormPicture.FittBranchingOnPip(TheModel3a,300-pipSize div 2,300-pipSize div 2,pipSize,Round(2+Rate));

TheModel3b.init(Rate,Sigma,StartingConcentration,FluctiationRange);
CurrentModel:=@TheModel3b;
FormPicture.FittBranchingOnPip(TheModel3b,300-pipSize div 2,300-pipSize div 2,pipSize,Round(2+Rate));

TheModel3c.init(Rate,Sigma,StartingConcentration,FluctiationRange);
CurrentModel:=@TheModel3c;
FormPicture.FittBranchingOnPip(TheModel3c,300-pipSize div 2,300-pipSize div 2,pipSize,Round(2+Rate));

CheckBoxClean.Checked:=old;CheckBoxClean.Enabled:=true;
FormPicture.MyProgressBar.Position:=0;

FITT_K_FACTOR:=OLDKF;EditKFactor.Enabled:=true;
EditKFactor.Text:=double2str(FITT_K_FACTOR,8,6);
end;

procedure TForm1.InitModels;
begin
case ModelIndex of
1:begin TheModel1.init(Rate,Sigma);
        CurrentModel:=@TheModel1;
        end;
2:begin TheModel2.init(Rate,Sigma,StartingConcentration);
        CurrentModel:=@TheModel2;
        end;

3:begin TheModel3a.init(Rate,Sigma,StartingConcentration,FluctiationRange);
        CurrentModel:=@TheModel3a;
        end;

5:begin TheModel3b.init(Rate,Sigma,StartingConcentration,FluctiationRange);
        CurrentModel:=@TheModel3b;
        end;

6:begin TheModel3c.init(Rate,Sigma,StartingConcentration,FluctiationRange);
        CurrentModel:=@TheModel3c;
        end;

4:begin TheModel4.init(Rate,Sigma,StartingConcentration,MutantStartingConcentration,FluctiationRange);
        CurrentModel:=@TheModel4;
        end;
end {case};
end;

procedure TForm1.ButtonESSClick(Sender: TObject);
begin
with FormPicture do
begin
if CheckBoxClean.Checked=True then
        pip.Canvas.FillRect(pip.Canvas.ClipRect);
MyProgressBar.Position:=0;
InitModels;
Show;BringToFront;
PrintBranchingOnPip(CurrentModel^,300-pipSize div 2,300-pipSize div 2,pipSize);MyProgressBar.Position:=0;
end{with};
end;

procedure TForm1.ButtonYvSigmaClick(Sender: TObject);
begin
with FormPicture do
begin
if CheckBoxClean.Checked=True then
        pip.Canvas.FillRect(pip.Canvas.ClipRect);
InitModels;
Show;BringToFront;
PrintYvSigmaOnPip(CurrentModel^,300-pipSize div 2,300-pipSize div 2,pipSize);MyProgressBar.Position:=0;
end{with};
end;

procedure TForm1.ButtonYvRClick(Sender: TObject);
begin
with FormPicture do
begin
 if CheckBoxClean.Checked=True then
        pip.Canvas.FillRect(pip.Canvas.ClipRect);
InitModels;
Show;BringToFront;
PrintYvROnPip(CurrentModel^,300-pipSize div 2,300-pipSize div 2,pipSize);MyProgressBar.Position:=0;
end{with};
end;

procedure TForm1.ButtonYvFluctClick(Sender: TObject);
begin
with FormPicture do
begin
if CheckBoxClean.Checked=True then
        pip.Canvas.FillRect(pip.Canvas.ClipRect);
InitModels;
Show;BringToFront;
PrintYvFluctOnPip(CurrentModel^,300-pipSize div 2,300-pipSize div 2,pipSize);MyProgressBar.Position:=0;
end{with};
end;


procedure TForm1.ButtonInvExtClick(Sender: TObject);
var
        MyName:string[255];
begin
with FormPicture do
begin
if CheckBoxClean.Checked=True then
        pip.Canvas.FillRect(pip.Canvas.ClipRect);
InitModels;
Show;BringToFront;
PrintOnPip(CurrentModel^,300-pipSize div 2,300-pipSize div 2,pipSize);MyProgressBar.Position:=0;
if  CheckBoxAutoSave.Checked then
        begin
        MyName:=Int2str(pipSize,3)+CurrentModel^.TentativeBmpFileName;
        pip.Picture.SaveToFile(MyName);
        end;
end{with};
end;

procedure TForm1.EditForRateChange(Sender: TObject);
var     R:double;
        c:integer;
begin
ChangeDoubleFromEditBox(Rate,EditForRate,MinRate,MaxRate);
end;

procedure TForm1.EditFluctuationChange(Sender: TObject);
var     R:double;
        c:integer;
begin
ChangeDoubleFromEditBox(FluctiationRange,EditFluctuation,MinFluct,MaxFluct);
end;

procedure TForm1.EditSigmaChange(Sender: TObject);
begin
ChangeDoubleFromEditBox(Sigma,EditSigma,MinSigma,MaxSigma);
end;

procedure TForm1.EditConcentrationChange(Sender: TObject);
begin
ChangeDoubleFromEditBox(StartingConcentration,EditConcentration,MaxStartingConcentration,MaxStartingConcentration);
end;

procedure TForm1.EditMutConcentrationChange(Sender: TObject);
begin
ChangeDoubleFromEditBox(MutantStartingConcentration,EditMutConcentration,MinMutStartingConcentration,MaxMutStartingConcentration);
end;

procedure TForm1.EditXdefChange(Sender: TObject);
begin
ChangeDoubleFromEditBox(defaultX,EditXdef,MinX,MaxX);
end;

procedure TForm1.EditYdefChange(Sender: TObject);
begin
ChangeDoubleFromEditBox(defaultY,EditYdef,MinY,MaxY);
end;

procedure TForm1.EditKFactorChange(Sender: TObject);
begin
ChangeDoubleFromEditBox(FITT_K_FACTOR,EditKFactor,0.00001,1000);
end;


procedure TForm1.EditPipSizeChange(Sender: TObject);
var     R:integer;
        c:integer;
begin
Val(EditPipSize.Text,R,c);
if c<>0 then
        begin
        EditPipSize.Color:=clRed;
        end
        else
        begin
        if (R>10) and (R<=500) then
                        begin
                        PipSize:=R;
                        EditPipSize.Color:=clWhite;
                        end
                        else
                        EditPipSize.Color:=clYellow;
        end;
end;


procedure TForm1.EditModelIndexChange(Sender: TObject);
var     R:integer;
        c:integer;
begin
Val(EditModelIndex.Text,R,c);
if c<>0 then
        begin
        EditModelIndex.Color:=clRed;
        end
        else
        begin
        if (R>0) and (R<=6) then
                        begin
                        ModelIndex:=R;
                        EditModelIndex.Color:=clWhite;
                        end
                        else
                        EditModelIndex.Color:=clYellow;
        end;
{Addapt the interface }
case  ModelIndex of
1:begin
        EditIterations.Enabled:=false;
        EditFluctuation.Enabled:=false;
        EditConcentration.Enabled:=false;
        EditMutConcentration.Enabled:=false;
        end;
2:begin
        EditIterations.Enabled:=true;
        EditIterations.Text:=Int2str(FITNESS_ITER,0);
        EditFluctuation.Enabled:=false;
        EditConcentration.Enabled:=true;
        EditMutConcentration.Enabled:=false;
        end;
3,5,6:begin
        EditIterations.Enabled:=true;
        EditIterations.Text:=Int2str(FITNESS_ITER,0);
        EditFluctuation.Enabled:=true;
        EditConcentration.Enabled:=true;
        EditMutConcentration.Enabled:=false;
        end;
4:begin
        EditIterations.Enabled:=true;
        EditIterations.Text:=Int2str(RATIO_ITER,0);
        EditFluctuation.Enabled:=true;
        EditConcentration.Enabled:=true;
        EditMutConcentration.Enabled:=true;
        end;
end{case};

ComboBoxModel.ItemIndex:=ModelIndex-1;
end;

procedure TForm1.EditIterationsChange(Sender: TObject);
var     R:integer;
        c:integer;
begin
Val(EditIterations.Text,R,c);
if c<>0 then
        begin
        EditIterations.Color:=clRed;
        end
        else
        begin
        if (R>200) and (R<=100000) then
                        begin
                        case ModelIndex of
                        2,3,5,6:FITNESS_ITER:=R;
                        4:RATIO_ITER:=R;
                        end;
                        EditIterations.Color:=clWhite;
                        end
                        else
                        EditIterations.Color:=clYellow;
        end;
end;

procedure TForm1.ComboBoxModelChange(Sender: TObject);
var MyStr:string;
begin
ModelIndex:=ComboBoxModel.ItemIndex+1;
Str(ModelIndex,MyStr);
EditModelIndex.Text:=MyStr;
end;

procedure TForm1.SpinEditRefRateChange(Sender: TObject);
begin
RefreshRate:=SpinEditRefRate.Value;
if RefreshRate=0 then RefreshRate:=1000;
end;

procedure TForm1.ButtonByeClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.ButtonWhereIsPictureClick(Sender: TObject);
begin
FormPicture.WindowState:=wsNormal;
FormPicture.Show;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  EditIterations.Enabled:=false;
  EditFluctuation.Enabled:=false;
  EditConcentration.Enabled:=false;
  EditMutConcentration.Enabled:=false;
end;


end.

unit Visualisation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls,Models, ExtDlgs, Spin, AdvOption, SmallTools;

type
  TFormPicture = class(TForm)
    pip: TImage;
    MyProgressBar: TProgressBar;
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PrintOnPip(var TheModel:AnyModel;stx,sty,size:integer);
    procedure PrintBranchingOnPip(var TheModel:AnyModel;stx,sty,size:integer);
    procedure PrintYvSigmaOnPip(var TheModel:AnyModel;stx,sty,size:integer);
    procedure PrintYvFluctOnPip(var TheModel:AnyModel;stx,sty,size:integer);
    procedure PrintYvROnPip(var TheModel:AnyModel;stx,sty,size:integer);
    procedure FittBranchingOnPip(var MyModel:Model3;stx,sty,size,pointfactor:integer);
  end;

var
  FormPicture: TFormPicture;

  pipSize:integer=200;
  FITT_K_FACTOR:double=1;
  RefreshRate:word=10;
  clTable:array[-4..3] of  TColor=(clBlack,clFuchsia,clGreen,clLime,clYellow, clRed, clNavy,clTeal );


implementation

uses flocto_int;

{$R *.dfm}

procedure TFormPicture.PrintOnPip(var TheModel:AnyModel;stx,sty,Size:integer);
var     xstep,ystep,x,y:double;
        a,b:integer;
const   title= 'X versus Y plot' ;
begin
a:=1;b:=1;   BorderedTextOut(pip.Canvas,a,b,3,3,title);
a:=a+2;b:=1; BorderedTextOut(pip.Canvas,a,b,3,3,TheModel.title);

a:=stx+Size+23;
ystep:=pip.ClientWidth-a-1;
b:=sty+3+pip.Canvas.TextHeight('Xj');
              FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Rate='+double2str(Rate,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Sigma='+double2str(Sigma,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Fluct. Range='+double2str(FluctiationRange,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Initial Conc.='+double2str(StartingConcentration,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Mutant Init.Conc.='+double2str(MutantStartingConcentration,FlpLenght,FlpPrec));

pip.Canvas.Pen.Color:=clMaroon;
DrawGraphConstrains(pip.Canvas,stx-1,sty+size+1,-20,double2str(MinY,FlpLenght,FlpPrec),double2str(MinX,FlpLenght,FlpPrec)); {0,0}
DrawGraphConstrains(pip.Canvas,stx+size+1,sty-1,20,double2str(MaxY,FlpLenght,FlpPrec),double2str(MaxX,FlpLenght,FlpPrec));  {Max,Max}
pip.Canvas.Pen.Color:=clBlack;


xstep:=abs(MaxX-MinX)/(Size);
ystep:=abs(MaxY-MinY)/(Size);

x:=MinX;
a:=stx;
while x<=MaxX do
        begin
        y:=MinY;
        b:=sty+Size-1;

        while y<=MaxY do
                begin
                if TheModel.IsInvasion(x,y) then
                        begin
                        if TheModel.WasSpecial<>0 then
                                pip.Canvas.Pixels[a,b]:=clTable[TheModel.WasSpecial]
                                else
                                pip.Canvas.Pixels[a,b]:=clBlack
                        end
                        else
                        begin
                        if TheModel.WasSpecial<>0 then
                                pip.Canvas.Pixels[a,b]:=clTable[TheModel.WasSpecial]
                                else
                                pip.Canvas.Pixels[a,b]:=clYellow;
                        end;
                dec(b);
                y:=y+ystep;
                end;

        MyProgressBar.Position:=round( (100*(a-stx))/size );
        inc(a);
        x:=x+xstep;

        if a mod RefreshRate = 0 then begin  Application.ProcessMessages; end;
        end;
end;

procedure TFormPicture.PrintYvSigmaOnPip(var TheModel:AnyModel;stx,sty,size:integer);
var     ystep,y:double;
        sstep,sig:double;
        a,b:integer;
const   title= 'Sigma versus Y plot' ;
begin
a:=1;b:=1;   BorderedTextOut(pip.Canvas,a,b,3,3,title);
a:=a+2;b:=1; BorderedTextOut(pip.Canvas,a,b,3,3,TheModel.title);

a:=stx+Size+23;
ystep:=pip.ClientWidth-a-1;
b:=sty+3+pip.Canvas.TextHeight('Xj');
              FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Rate='+double2str(Rate,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'X='+double2str(DefaultX,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Fluct. Range='+double2str(FluctiationRange,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Initial Conc.='+double2str(StartingConcentration,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Mutant Init.Conc.='+double2str(MutantStartingConcentration,FlpLenght,FlpPrec));

pip.Canvas.Pen.Color:=clMaroon;
DrawGraphConstrains(pip.Canvas,stx-1,sty+size+1,-20,double2str(MinY,FlpLenght,FlpPrec),double2str(MinSigma,FlpLenght,FlpPrec)); {0,0}
DrawGraphConstrains(pip.Canvas,stx+size+1,sty-1,20,double2str(MaxY,FlpLenght,FlpPrec),double2str(MaxSigma,FlpLenght,FlpPrec));  {Max,Max}
pip.Canvas.Pen.Color:=clBlack;
ystep:=abs(MaxY-MinY)/(Size);
sstep:=abs(MaxSigma-MinSigma)/(Size);
sig:=MinSigma;
a:=stx;
while sig<=MaxSigma do
        begin
        y:=MinY;
        b:=sty+Size-1;

        while y<=MaxY do
                begin
                TheModel.SetSigma(sig);
                if TheModel.IsInvasion(defaultX,y) then
                        begin
                        if TheModel.WasSpecial<>0 then
                                pip.Canvas.Pixels[a,b]:=clTable[TheModel.WasSpecial]
                                else
                                pip.Canvas.Pixels[a,b]:=clBlack
                        end
                        else
                        begin
                        if TheModel.WasSpecial<>0 then
                                pip.Canvas.Pixels[a,b]:=clTable[TheModel.WasSpecial]
                                else
                                pip.Canvas.Pixels[a,b]:=clYellow;
                        end;
                dec(b);
                y:=y+ystep;
                end;
        MyProgressBar.Position:=round( (100*(a-stx))/size );
        inc(a);
        sig:=sig+sstep;
        if a mod RefreshRate = 0 then begin Application.ProcessMessages; end;
        end;
end;

procedure TFormPicture.PrintYvROnPip(var TheModel:AnyModel;stx,sty,size:integer);
var     ystep,y:double;
        rstep,r:double;
        a,b:integer;
const   title= 'R versus Y plot' ;
begin
a:=1;b:=1;   BorderedTextOut(pip.Canvas,a,b,3,3,title);
a:=a+2;b:=1; BorderedTextOut(pip.Canvas,a,b,3,3,TheModel.title);

a:=stx+Size+23;
ystep:=pip.ClientWidth-a-1;
b:=sty+3+pip.Canvas.TextHeight('Xj');
              FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'X='+double2str(DefaultX,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Sigma='+double2str(Sigma,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Fluct. Range='+double2str(FluctiationRange,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Initial Conc.='+double2str(StartingConcentration,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Mutant Init.Conc.='+double2str(MutantStartingConcentration,FlpLenght,FlpPrec));

pip.Canvas.Pen.Color:=clMaroon;
DrawGraphConstrains(pip.Canvas,stx-1,sty+size+1,-20,double2str(MinY,FlpLenght,FlpPrec),double2str(MinRate,FlpLenght,FlpPrec)); {0,0}
DrawGraphConstrains(pip.Canvas,stx+size+1,sty-1,20,double2str(MaxY,FlpLenght,FlpPrec),double2str(MaxRate,FlpLenght,FlpPrec));  {Max,Max}
pip.Canvas.Pen.Color:=clBlack;

ystep:=abs(MaxY-MinY)/(Size);
rstep:=abs(MaxRate-MinRate)/(Size);
r:=MinRate;
a:=stx;
while r<=MaxRate do
        begin
        y:=MinY;
        b:=sty+Size-1;

        while y<=MaxY do
                begin
                TheModel.SetR(r);
                if TheModel.IsInvasion(defaultX,y) then
                        begin
                        if TheModel.WasSpecial<>0 then
                                pip.Canvas.Pixels[a,b]:=clTable[TheModel.WasSpecial]
                                else
                                pip.Canvas.Pixels[a,b]:=clBlack
                        end
                        else
                        begin
                        if TheModel.WasSpecial<>0 then
                                pip.Canvas.Pixels[a,b]:=clTable[TheModel.WasSpecial]
                                else
                                pip.Canvas.Pixels[a,b]:=clYellow;
                        end;
                dec(b);
                y:=y+ystep;
                end;
        MyProgressBar.Position:=round( (100*(a-stx))/size );
        inc(a);
        r:=r+rstep;
        if a mod RefreshRate = 0 then begin Application.ProcessMessages; end;
        end;
end;

procedure TFormPicture.PrintYvFluctOnPip(var TheModel:AnyModel;stx,sty,size:integer);
var     ystep,y:double;
        fstep,flu:double;
        a,b:integer;
const   title= 'Fluctuation versus Y plot' ;
begin
a:=1;b:=1;   BorderedTextOut(pip.Canvas,a,b,3,3,title);
a:=a+2;b:=1; BorderedTextOut(pip.Canvas,a,b,3,3,TheModel.title);

a:=stx+Size+23;
ystep:=pip.ClientWidth-a-1;
b:=sty+3+pip.Canvas.TextHeight('Xj');
              FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Rate='+double2str(Rate,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Sigma='+double2str(Sigma,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'X='+double2str(DefaultX,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Initial Conc.='+double2str(StartingConcentration,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Mutant Init.Conc.='+double2str(MutantStartingConcentration,FlpLenght,FlpPrec));

pip.Canvas.Pen.Color:=clMaroon;
DrawGraphConstrains(pip.Canvas,stx-1,sty+size+1,-20,double2str(MinY,FlpLenght,FlpPrec),double2str(MinFluct,FlpLenght,FlpPrec)); {0,0}
DrawGraphConstrains(pip.Canvas,stx+size+1,sty-1,20,double2str(MaxY,FlpLenght,FlpPrec),double2str(MaxFluct,FlpLenght,FlpPrec));  {Max,Max}
pip.Canvas.Pen.Color:=clBlack;

fstep:=abs(MaxFluct-MinFluct)/(Size);
ystep:=abs(MaxY-MinY)/(Size);
flu:=MinFluct;
a:=stx;
while flu<=MaxFluct do
        begin
        y:=MinY;
        b:=sty+Size-1;

        while y<=MaxY do
                begin
                TheModel.SetFluct(flu);
                if TheModel.IsInvasion(defaultX,y) then
                        begin
                        if TheModel.WasSpecial<>0 then
                                pip.Canvas.Pixels[a,b]:=clTable[TheModel.WasSpecial]
                                else
                                pip.Canvas.Pixels[a,b]:=clBlack
                        end
                        else
                        begin
                        if TheModel.WasSpecial<>0 then
                                pip.Canvas.Pixels[a,b]:=clTable[TheModel.WasSpecial]
                                else
                                pip.Canvas.Pixels[a,b]:=clYellow;
                        end;
                dec(b);
                y:=y+ystep;
                end;
        MyProgressBar.Position:=round( (100*(a-stx))/size );
        inc(a);
        flu:=flu+fstep;
        if a mod RefreshRate = 0 then begin Application.ProcessMessages; end;
        end;
end;

procedure TFormPicture.PrintBranchingOnPip(var TheModel:AnyModel;stx,sty,Size:integer);
var     xstep,ystep,x,y:double;
        a,b,val:integer;
const   title= 'Fluctuation versus Sigma plot' ;
begin
a:=1;b:=1;   BorderedTextOut(pip.Canvas,a,b,3,3,title);
a:=a+2;b:=1; BorderedTextOut(pip.Canvas,a,b,3,3,TheModel.title);

a:=stx+Size+23;
ystep:=pip.ClientWidth-a-1;
b:=sty+3+pip.Canvas.TextHeight('Xj');
              FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Rate='+double2str(Rate,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'X='+double2str(0,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Y='+double2str(0,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Initial Conc.='+double2str(StartingConcentration,FlpLenght,FlpPrec));
a:=stx+Size+23;FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Mutant Init.Conc.='+double2str(MutantStartingConcentration,FlpLenght,FlpPrec));

pip.Canvas.Pen.Color:=clMaroon;
DrawGraphConstrains(pip.Canvas,stx-1,sty+size+1,-20,double2str(MinSigma,FlpLenght,FlpPrec),double2str(MinFluct,FlpLenght,FlpPrec)); {0,0}
DrawGraphConstrains(pip.Canvas,stx+size+1,sty-1,20,double2str(MaxSigma,FlpLenght,FlpPrec),double2str(MaxFluct,FlpLenght,FlpPrec));  {Max,Max}
pip.Canvas.Pen.Color:=clBlack;

xstep:=abs(MaxFluct-MinFluct)/(Size);
ystep:=abs(MaxSigma-MinSigma)/(Size);
x:=MinFluct;
a:=stx;
while x<=MaxFluct do
        begin
        y:=MinSigma;
        b:=sty+Size-1;

        while y<=MaxSigma do
                begin
                val:=TheModel.IsESSorBranching(y,x);
                pip.Canvas.Pixels[a,b]:=clTable[val];

                dec(b);
                y:=y+ystep;
                end;
        MyProgressBar.Position:=round( (100*(a-stx))/size );
        inc(a);
        x:=x+xstep;

        if a mod RefreshRate = 0 then begin Application.ProcessMessages; end;
        end;
end;

procedure TFormPicture.FittBranchingOnPip(var MyModel:Model3;stx,sty,size,pointfactor:integer);
var kstep,xstep,sstep,k,kmax,y,x,s_y,s_x:double;
    a,b,c,StepsOfK:integer;
    title:string;
const   basetitle= 'Analitical ESS/branching border for ' ;
begin
title:=basetitle+MyModel.Title;
a:=pip.ClientWidth-pip.Canvas.TextWidth(title)-12;
b:=1;
BorderedTextOut(pip.Canvas,a,b,3,3,title);

a:=stx+Size+23;
ystep:=pip.ClientWidth-a-1;
b:=sty+3+pip.Canvas.TextHeight('Xj');

pip.Canvas.Pen.Color:=clRed;
FixWidthTextOut(pip.Canvas,a,b,trunc(ystep),'Rate='+double2str(Rate,FlpLenght,FlpPrec));
pip.Canvas.Pen.Color:=clBlack;

DrawGraphConstrains(pip.Canvas,stx,sty+size,-20,double2str(MinSigma,FlpLenght,FlpPrec),double2str(MinFluct,FlpLenght,FlpPrec)); {0,0}
DrawGraphConstrains(pip.Canvas,stx+size,sty,20,double2str(MaxSigma,FlpLenght,FlpPrec),double2str(MaxFluct,FlpLenght,FlpPrec));  {Max,Max}

{y:=TheModel3.TransitionValue(1.0);}
StepsOfK:=Size*pointfactor;
Kmax:=MaxFluct*FITT_K_FACTOR;
kstep:=(KMax)/(StepsOfK);
xstep:=abs(MaxFluct-MinFluct)/(Size);
sstep:=abs(MaxSigma-MinSigma)/(Size);
a:=stx;c:=0;

k:=0;
while k<=Kmax do
        begin
        y:=MyModel.TransitionValue(k);
        x:=k*y;

        if (y<=MaxSigma) and (y>=MinSigma) and
         (x<=MaxFluct) and (x>=MinFluct) then
                begin
                s_y:=(y-MinSigma)/(MaxSigma-MinSigma);
                s_x:=(x-MinFluct)/(MaxFluct-MinFluct);
                a:=stx+round(Size*s_x);
                b:=sty+Size-round(Size*s_y);
                pip.Canvas.Pixels[a,b]:=MyModel.PreferedColor;
                end;

        MyProgressBar.Position:=round( (c)/(StepsOfK) *100 );
        k:=k+kstep;
        inc(c);
        if c mod RefreshRate = 0 then begin Application.ProcessMessages; end;
        end;
end;


procedure TFormPicture.FormDeactivate(Sender: TObject);
begin
Form1.Show;
end;

end.

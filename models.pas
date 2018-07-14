unit models;

interface
uses SmallTools;
type

AnyModel=object
        Title:string;
        SpecialFlag:integer;
        sigma:double;
        r:double;
        constructor start;
        procedure SetR(ir:double);
        procedure SetSigma(isig:double);
        procedure SetFluct(iflu:double);virtual;
        function TentativeBmpFileName:string;virtual;
        function Legend(line:byte):string;virtual; {Empty string means "end of legend!}
        function IsInvasion(x,y:double):boolean;virtual;
        function WasSpecial:integer;virtual;
        {Searching for ESS}
        function IsESSorBranching(newsigma,fluct:double):integer;virtual;
end;


model1=object(AnyModel)
        constructor startbis;
        procedure init(ir,isigma:double);
        function TentativeBmpFileName:string;virtual;
        function K(x:double):double;
        function Alfa(x,y:double):double;
        function Fitness(x,y:double):double;
        function IsInvasion(x,y:double):boolean;virtual;
        {Searching for ESS}
        function IsESSorBranching(newsigma,fluct:double):integer;virtual;
        end;

model2=object(AnyModel)
        St:double;
        Nr:double;{Density of resident}
        constructor startbis;
        procedure init(ir,isigma,StCnc:double);
        function TentativeBmpFileName:string;virtual;
        procedure iterate_resident(t:integer;x:double);{t - how many times}
        function iterate_with_mut(t:integer;x,y:double):double;{t - how many times}
        function K(x:double):double;
        function Alfa(x,y:double):double;
        function Fitness(x,y:double):double;
        function IsInvasion(x,y:double):boolean;virtual;
        function WasSpecial():integer;virtual;
        {Searching for ESS}
        function IsESSorBranching(newsigma,fluct:double):integer;virtual;
end;

model3=object(AnyModel)
        St:double;
        MyRnd:double;
        FluctRange:double;
        Nr:double;{Density of resident}
        constructor startbis;
        procedure init(ir,isigma,StCnc,iFluctRange:double);
        procedure SetFluct(iflu:double);virtual;
        function TentativeBmpFileName:string;virtual;
        procedure iterate_resident(t:integer;x:double);{t - how many times}
        function iterate_with_mut(t:integer;x,y:double):double;{t - how many times}
        procedure CalcNewMu;
        function Mu:real;       { random mean value of K }
        function K(x,Mean:double):double;
        function Alfa(x,y:double):double;
        function Fitness(x,y:double):double;
        function IsInvasion(x,y:double):boolean;virtual;
        {Searching for ESS}
        function IsESSorBranching(newsigma,fluct:double):integer;virtual;
        function TransitionValue(krange:double):double;virtual; {Where is the transition/bifurcation}
end;

model4=object(AnyModel)
        St:double;{ Relative density of resident at start }
        Sm:double;{ Relative density of mutant when invasion starting }
        MyRnd:double;
        FluctRange:double;
        Nr:double;{Density of resident}
        Nm:double;{Density of mutant}
        constructor startbis;
        procedure init(ir,isigma,ResStCnc,MutStCnc,iFluctRange:double);
        procedure SetFluct(iflu:double);virtual;
        function TentativeBmpFileName:string;virtual;
        procedure iterate_resident(t:integer;x:double);{t - how many times}
        function iterate_with_mut(t:integer;x,y:double):double;{t - how many times}
        procedure CalcNewMu;
        function Mu:real;       { random mean value of K }
        function K(x,Mean:double):double;
        function Alfa(x,y:double):double;
        function Ratio(x,y:double):double;
        function IsInvasion(x,y:double):boolean;virtual;
        {Searching for ESS}
        function IsESSorBranching(newsigma,fluct:double):integer;virtual;
end;


const   SILENT_ITER=100;{Number of iteration of resident population before introduction of mutant}
var     FITNESS_ITER:integer=1000;
        RATIO_ITER:integer=5000;

const   MEAN_WINDOW=100;
        DEF_PLEN=12;
        DEF_PPREC=10;
        EPSILON=0.0001;
        SMALEST_K=0.00000000000001;   {Value of K considered as 0}
        SAMPLE_DIVIDER=2;       {For ESS sampling}

var     DefaultX:double=0;
        MinX:double=-3;
        MaxX:double=3;

        DefaultY:double=0.5;
        MinY:double=-3;
        MaxY:double=3;

        Rate:double=1;
        MinRate:double=0.00001;
        MaxRate:double=4;

        Sigma:double=1;
        MinSigma:double=0.00001;
        MaxSigma:double=1.99999;

        StartingConcentration:double=0.5;
        MinStartingConcentration:double=0.01;
        MaxStartingConcentration:double=0.99;

        MutantStartingConcentration:double=0.001;
        MinMutStartingConcentration:double=0.000000000001;
        MaxMutStartingConcentration:double=0.1;

        FluctiationRange:double=0.0000000000001;
        MinFluct:double=0.0000000000001;
        MaxFluct:double=1.0;

implementation


{MODEL 4=======================================================================}
constructor Model4.startbis;
begin
Title:='The model #4';
end;

procedure  model4.init(ir,isigma,ResStCnc,MutStCnc,iFluctRange:double);
begin
Title:='The model #3';
r:=ir;
sigma:=isigma;
St:=ResStCnc;
Sm:=MutStCnc;
Nr:=0;
Nm:=0;
SpecialFlag:=0;
MyRnd:=0;
FluctRange:=iFluctRange;
end;

procedure model4.SetFluct(iflu:double);
begin
FluctRange:=iFlu;
end;

function model4.TentativeBmpFileName:string;
var name:string[255];
begin
name:='Model4_'+double2str(r,DEF_PLEN,DEF_PPREC)+'_'+double2str(sigma,DEF_PLEN,DEF_PPREC)+'_'+double2str(St,DEF_PLEN,DEF_PPREC)+'_'+double2str(Sm,DEF_PLEN,DEF_PPREC)+double2str(FluctRange,DEF_PLEN,DEF_PPREC)+'.bmp';
TentativeBmpFileName:=name;
end;


procedure model4.CalcNewMu;
begin
MyRnd:=0.5*FluctRange - Random*FluctRange;
{                        [0..1]*0.5}
end;

function model4.Mu:real;       { random mean value of K }
begin
Mu:=MyRnd;
end;

function model4.K(x,mean:double):double;
var p,RND:double;
begin
p:=-sqr(x-mean)/(2*sqr(sigma));
K:=exp(p);
end;

function model4.Alfa(x,y:double):double;
var p:double;
begin
p:=-sqr(y-x)/2;
Alfa:=exp(p);
end;

procedure model4.iterate_resident(t:integer;x:double);{t - how many times}
var     i:integer;{which iteration of eqution}
        curK:double;
begin
for i:=1 to t do
        begin
        CalcNewMu;

        CurK:=K(x,Mu);

        if CurK<SMALEST_K then
                begin
                SpecialFlag:=3;
                exit;
                end;

        Nr:=Nr*(1+r-r*Nr/CurK);

        if Nr<=0 then
                begin
                SpecialFlag:=2;
                exit;
                end;
        end;
end;

function model4.iterate_with_mut(t:integer;x,y:double):double;{t - how many times}
var     i:integer;{which iteration of eqution}
        summ:double;{summ of logarithms of lambda}
        OldNr:double;
        curK:double;
begin
summ:=0;

for i:=1 to t do
        begin
        CalcNewMu;

        OldNr:=Nr;

        CurK:=K(x,Mu);

        if CurK<SMALEST_K then
                begin
                iterate_with_mut:=0;
                specialFlag:=3;
                exit;
                end;

        Nr:=Nr*(1+r-r*( (Nr+Alfa(y,x)*Nm)/CurK ));

        curK:=K(y,Mu);

        if CurK<SMALEST_K then
                begin
                iterate_with_mut:=0;
                specialFlag:=3;
                exit;
                end;

        Nm:=Nm*(1+r-r*( (Nm+Alfa(x,y)*Nr)/CurK ));

        if Nr<=0 then
                begin
                iterate_with_mut:=0;
                SpecialFlag:=2;
                exit;
                end;

        if Nm<=0 then
                begin
                iterate_with_mut:=0;
                SpecialFlag:=1;
                exit;
                end;

        if i>t-MEAN_WINDOW then
                begin
                summ:=summ+( Nm/(Nr+Nm) );
                end;
        end;

iterate_with_mut:=summ/MEAN_WINDOW;
end;

function model4.Ratio(x,y:double):double;
var Rat,Ky:double;
begin
SpecialFlag:=0;

Nr:=St*K(x,0);

Nm:=Sm*Nr;{Introducting of a mutant as a part of current density of a resident}

iterate_resident(SILENT_ITER,x);

if SpecialFlag<>0 then
                begin
                Ratio:=-1;
                exit;
                end;

Rat:=iterate_with_mut(RATIO_ITER,x,y);

if SpecialFlag=0 then
        begin
         Ratio:=Rat;
        end
        else
        begin
         Ratio:=0;
        end;

end;

function model4.IsInvasion(x,y:double):boolean;
var f:double;
begin
f:=Ratio(x,y);
IsInvasion:=(f>Sm);
end;

function model4.IsESSorBranching(newsigma,fluct:double):integer;
begin
init(r,newsigma,St,Sm,fluct);
result:=AnyModel.IsESSorBranching(newsigma,fluct);
end;

{MODEL 3=======================================================================}
constructor Model3.startbis;
begin
Title:='The model #3';
end;

procedure  model3.init(ir,isigma,StCnc,iFluctRange:double);
begin
Title:='The model #3';
r:=ir;
sigma:=isigma;
St:=StCnc;
Nr:=0;
SpecialFlag:=0;
MyRnd:=0;
FluctRange:=iFluctRange;
end;

procedure model3.SetFluct(iflu:double);
begin
FluctRange:=iFlu;
end;

function model3.TentativeBmpFileName:string;
var name:string[255];
begin
name:='Model3_'+double2str(r,DEF_PLEN,DEF_PPREC)+'_'+double2str(sigma,DEF_PLEN,DEF_PPREC)+'_'+double2str(St,DEF_PLEN,DEF_PPREC)+double2str(FluctRange,DEF_PLEN,DEF_PPREC)+'.bmp';
TentativeBmpFileName:=name;
end;

procedure model3.CalcNewMu;
begin
MyRnd:=0.5*FluctRange - Random*FluctRange;
{                        [0..1]*0.5}
end;

function model3.Mu:real;       { random mean value of K }
begin
Mu:=MyRnd;
end;

function model3.K(x,mean:double):double;
var p:double;
begin
p:=-sqr(x-mean)/(2*sqr(sigma));
K:=exp(p);
end;

function model3.Alfa(x,y:double):double;
var p:double;
begin
p:=-sqr(y-x)/2;
Alfa:=exp(p);
end;

procedure model3.iterate_resident(t:integer;x:double);{t - how many times}
var     i:integer;{which iteration of eqution}
        curK:double;
begin
for i:=1 to t do
        begin
        CalcNewMu;

        curK:=K(x,Mu);{May be 0 because od floating point calculation }
        if curK<SMALEST_K then
                begin
                {Ups...}
                SpecialFlag:=3;
                exit;
                end;

        Nr:=Nr*(1+r-r*Nr/curK);  {There overflow may happened!}

        if Nr<=0 then
                begin
                SpecialFlag:=2;
                exit;
                end;
        end;
end;

function model3.iterate_with_mut(t:integer;x,y:double):double;{t - how many times}
var     i:integer;{which iteration of eqution}
        summ:double;{summ of logarithms of lambda}
        lambda,curK:double;
begin
summ:=0;

for i:=1 to t do
        begin
        CalcNewMu;

        curK:=K(y,Mu);
        if curK<SMALEST_K then
                begin
                {Ups...}
                iterate_with_mut:=0;
                SpecialFlag:=3;
                exit;
                end;

        lambda:=1+r-r*( (alfa(x,y)*Nr) / curK );

        curK:=K(x,Mu);{May be 0 because od floating point calculation }

        if curK<SMALEST_K then
                begin
                {Ups...}
                iterate_with_mut:=0;
                SpecialFlag:=3;
                exit;
                end;

        Nr:=Nr*(1+r-r*Nr/curK);       { Nr:=Nr*(1+r-r*Nr/K(x,Mu));}

        if Nr<=0 then
                begin
                iterate_with_mut:=0;
                SpecialFlag:=2;
                exit;
                end;

        if lambda<=0 then
                begin
                iterate_with_mut:=0;
                SpecialFlag:=1;
                exit;
                end;

        summ:=summ+ln(lambda)

        end;

iterate_with_mut:=summ/t;
end;

function model3.Fitness(x,y:double):double;
var F,Ky:double;
begin
SpecialFlag:=0;
Nr:=St*K(x,0);
iterate_resident(SILENT_ITER,x);

if SpecialFlag<>0 then
                begin
                Fitness:=-1;
                exit;
                end;

F:=iterate_with_mut(FITNESS_ITER,x,y);

if SpecialFlag=0 then
        begin
         Fitness:=exp(F);
        end
        else
        begin
         Fitness:=0;
        end;

end;

function model3.IsInvasion(x,y:double):boolean;
var f:double;
begin
f:=Fitness(x,y);
IsInvasion:=(f>1);
end;

{Searching for ESS}
function model3.IsESSorBranching(newsigma,fluct:double):integer;
begin
init(r,newsigma,St,fluct);
result:=AnyModel.IsESSorBranching(newsigma,fluct);
end;

function model3.TransitionValue(krange:double):double; {Where is the transition/bifurcation at singularity x}
var     cur_kt,exp_kt2:double;
        summ_numerator:double;
        numerator:double;
        summ_denominator:double;
        denominator:double;

        t:integer;

    function kt(krange:double):double;{Randimisation of 'k' (small k)}
    begin
    kt:=krange/2.0-Random*krange;
    end;
begin
SpecialFlag:=0;
Nr:=St*K(0,0);

{First loop - for achive the stable state of resident}
for t:=0 to SILENT_ITER do
        begin
        cur_kt:=kt(krange);
        Nr:=Nr*(        1+r-r*Nr*exp( sqr(cur_kt)/2 )     );

        if Nr<=0 then
                begin
                TransitionValue:=0;
                SpecialFlag:=2;
                exit
                end;
        end;

{Second loop - calculate the critical sigma}
summ_numerator:=0;
summ_denominator:=0;

for t:=0 to FITNESS_ITER do
        begin
        {heping values}
        cur_kt:=kt(krange);
        exp_kt2:=exp( sqr(cur_kt)/2 );

        {part 1}
        numerator:=(1+sqr(cur_kt)*exp_kt2);
        numerator:=numerator/(1+r-r*Nr*exp_kt2);
        numerator:=numerator+(r*Nr*sqr(cur_kt)*exp(sqr(cur_kt)))/sqr(1+r-r*Nr*exp_kt2);
        numerator:=numerator*Nr;
        {part2}
        denominator:=exp_kt2;
        denominator:=denominator/(1+r-r*Nr*exp_kt2);
        denominator:=denominator*Nr;
        {summing}
        summ_numerator:=summ_numerator+numerator;
        summ_denominator:=summ_denominator+denominator;

        {next iteration}
        Nr:=Nr*(        1+r-r*Nr*exp( sqr(cur_kt)/2 )     );

        if Nr<=0 then
                begin
                result:=-1000000000000000;
                SpecialFlag:=2;
                exit
                end;
        end;

if summ_denominator<>0 then
        begin
        result:=summ_numerator/summ_denominator;
        result:=sqrt(result);
        end
        else
        begin
        result:=-1000000000000000;
        end;
end;

{MODEL 2=======================================================================}
constructor Model2.startbis;
begin
Title:='The model #2';
end;

procedure  model2.init(ir,isigma,StCnc:double);
begin
r:=ir;
sigma:=isigma;
St:=StCnc;
Nr:=0;
SpecialFlag:=0;
end;

function model2.TentativeBmpFileName:string;
var name:string[255];
begin
name:='Model2_'+double2str(r,DEF_PLEN,DEF_PPREC)+'_'+double2str(sigma,DEF_PLEN,DEF_PPREC)+'_'+double2str(St,DEF_PLEN,DEF_PPREC)+'.bmp';
TentativeBmpFileName:=name;
end;

function model2.WasSpecial():integer;
begin
WasSpecial:=SpecialFlag;
end;

function model2.K(x:double):double;
var p:double;
begin
p:=-sqr(x)/(2*sqr(sigma));
K:=exp(p);
end;

function model2.Alfa(x,y:double):double;
var p:double;
begin
p:=-sqr(y-x)/2;
Alfa:=exp(p);
end;

procedure model2.iterate_resident(t:integer;x:double);{t - how many times}
var     i:integer;{which iteration of eqution}
        curK:double;
begin
for i:=1 to t do
        begin
         curK:=K(x);
        if curK<SMALEST_K then
                begin
                SpecialFlag:=3;
                exit;
                end;

        Nr:=Nr*(1+r-r*Nr/curK);

        if Nr<=0 then
                begin
                SpecialFlag:=2;
                exit;
                end;
        end;
end;

function model2.iterate_with_mut(t:integer;x,y:double):double;{t - how many times}
var     i:integer;{which iteration of eqution}
        summ:double;{summ of logarithms of lambda}
        lambda,curK:double;
begin
summ:=0;

for i:=1 to t do
        begin

        curK:=K(y);
        if curK<SMALEST_K then
                begin
                SpecialFlag:=3;
                iterate_with_mut:=0;
                exit;
                end;

        lambda:=1+r-r*( (alfa(x,y)*Nr) / curK  );                 

        Nr:=Nr*(1+r-r*Nr/K(x));

        if Nr<=0 then
                begin
                iterate_with_mut:=0;
                SpecialFlag:=2;
                exit;
                end;

        if lambda<=0 then
                begin
                iterate_with_mut:=0;
                SpecialFlag:=1;
                exit;
                end;

        summ:=summ+ln(lambda)

        end;

iterate_with_mut:=summ/t;
end;

function model2.Fitness(x,y:double):double;
var F,Ky:double;
begin
SpecialFlag:=0;
Nr:=St*K(x);
iterate_resident(SILENT_ITER,x);

if SpecialFlag<>0 then
                begin
                Fitness:=-1;
                exit;
                end;

F:=iterate_with_mut(FITNESS_ITER,x,y);

if SpecialFlag=0 then
        begin
         Fitness:=exp(F);
        end
        else
        begin
         Fitness:=0;
        end;

end;

function model2.IsInvasion(x,y:double):boolean;
var f:double;
begin
f:=Fitness(x,y);
IsInvasion:=(f>1);
end;

{Searching for ESS}
function model2.IsESSorBranching(newsigma,fluct:double):integer;
begin
init(r,newsigma,St);
result:=AnyModel.IsESSorBranching(newsigma,fluct);
end;

{MODEL 1=======================================================================}
constructor Model1.startbis;
begin
Title:='The model #1';
end;

procedure  model1.init(ir,isigma:double);
begin
r:=ir;
sigma:=isigma;
end;


function model1.TentativeBmpFileName:string;
var name:string[255];
begin
name:='Model1_'+double2str(r,DEF_PLEN,DEF_PPREC)+'_'+double2str(sigma,DEF_PLEN,DEF_PPREC)+'.bmp';
TentativeBmpFileName:=name;
end;


function model1.K(x:double):double;
var p:double;
begin
p:=-sqr(x)/(2*sqr(sigma));
K:=exp(p);
end;

function model1.Alfa(x,y:double):double;
var p:double;
begin
p:=-sqr(y-x)/2;
Alfa:=exp(p);
end;

function model1.Fitness(x,y:double):double;
var F,Ky:double;
begin
Ky:=K(y);

if Ky<SMALEST_K then
        begin
        SpecialFlag:=3;
        Fitness:=0;
        exit
        end;

F:=1+r-r*(alfa(x,y)*K(x))/Ky;

Fitness:=F;
end;

function model1.IsInvasion(x,y:double):boolean;
var f:double;
begin
SpecialFlag:=0;
f:=Fitness(x,y);
IsInvasion:=(f>1);
end;

function model1.IsESSorBranching(newsigma,fluct:double):integer;
begin
init(r,newsigma);
result:=AnyModel.IsESSorBranching(newsigma,fluct);
end;

{-----------------------------------------------------------------------------------}
constructor AnyModel.Start;
begin
Title:='WARNING:You need define a name of model!';
SpecialFlag:=0;
end;

function AnyModel.TentativeBmpFileName:string;
var name:string[255];
begin
name:='last_picture.bmp';
TentativeBmpFileName:=name;
end;

function AnyModel.IsInvasion(x,y:double):boolean;
begin
IsInvasion:=false;
end;

function AnyModel.WasSpecial:integer;
begin
WasSpecial:=SpecialFlag;
end;

function AnyModel.Legend(line:byte):string;{Empty string means "end of legend!}
begin
if line=0 then
        Legend:='"Invasion/extinction model"'
        else
        Legend:='';
end;

function AnyModel.IsESSorBranching(newsigma,fluct:double):integer;
var fy1,fy2,fy3,fy4:boolean;
        val:byte;
begin
{need correct initialisation}
fy1:=IsInvasion(DefaultX,DefaultY);
if WasSpecial<>0 then
        begin result:=WasSpecial; exit; end;

fy2:=IsInvasion(DefaultX,DefaultY/SAMPLE_DIVIDER);
if WasSpecial<>0 then
        begin result:=WasSpecial; exit; end;

fy3:=IsInvasion(DefaultX,-DefaultY/SAMPLE_DIVIDER);
if WasSpecial<>0 then
        begin result:=WasSpecial; exit; end;

fy4:=IsInvasion(DefaultX,-DefaultY);
if WasSpecial<>0 then
        begin result:=WasSpecial; exit; end;

val:=integer(fy1)+integer(fy2)+integer(fy3)+integer(fy4);
result:=-val;
{
if val=0 then
        begin
        result:=0;exit;
        end
        else
        if val=4 then
                begin
                result:=-1;exit;
                end;
result:=-3;}
end;

procedure  AnyModel.SetR(ir:double);
begin
R:=ir;
end;

procedure AnyModel.SetSigma(isig:double);
begin
Sigma:=isig;
end;

procedure AnyModel.SetFluct(iflu:double);
begin

end;

end.

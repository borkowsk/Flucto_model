unit smalltools;
interface
uses StdCtrls,Graphics;

procedure ChangeDoubleFromEditBox(var Value:double;var TheEdit:TEdit;min,max:double);
procedure ChangeIntFromEditBox(var Value:integer;var TheEdit:TEdit;min,max:integer);
function  Double2str(v:double;lengh,prec:byte):string;
function  Int2str(v:longint;lengh:byte):string;
procedure BorderedTextOut(const Canvas:TCanvas;var x1,y1:integer;ra,rb:integer;title:string);
procedure DrawGraphConstrains(const Canvas:TCanvas;x1,y1:integer;ra:integer;Ytext,Xtext:string);

implementation

procedure BorderedTextOut(const Canvas:TCanvas;var x1,y1:integer;ra,rb:integer;title:string);
begin
with Canvas do
        begin
        RoundRect(x1,y1,x1+TextWidth(title)+2+2*ra,y1+TextHeight(title)+2+4*rb,ra,rb);
        TextOut(x1+ra+1,y1+rb+1,title);
        x1:=x1+TextWidth(title)+2+2*ra;
        y1:=y1+TextHeight(title)+2+4*rb;
        end;
end;

procedure DrawGraphConstrains(const Canvas:TCanvas;x1,y1:integer;ra:integer;Ytext,Xtext:string);
begin
with Canvas do
        begin
        MoveTo(x1,y1);LineTo(x1+ra,y1);
        MoveTo(x1,y1);LineTo(x1,y1-ra);
        Xtext:=' '+Xtext+' ';
        Ytext:=' '+Ytext+' ';
        if ra>0 then
                begin
                TextOut(x1,y1-ra-TextHeight(Xtext),Xtext);
                TextOut(x1+ra+1,y1,Ytext);
                end
                else
                begin
                TextOut(x1-1+ra-TextWidth(Ytext),y1,Ytext);
                TextOut(x1,y1-ra,Xtext);
                end
        end;
end;

procedure ChangeDoubleFromEditBox(var Value:double;var TheEdit:TEdit;min,max:double);
var     R:double;
        c:integer;
begin
Val(TheEdit.Text,R,c);
if c<>0 then
        begin
        TheEdit.Color:=clRed;
        end
        else
        begin
        if (R>=min) and (R<=max) then
                        begin
                        Value:=R;
                        TheEdit.Color:=clWhite;
                        end
                        else
                        TheEdit.Color:=clYellow;
        end;

end;

procedure ChangeIntFromEditBox(var Value:integer;var TheEdit:TEdit;min,max:integer);
var     R:integer;
        c:integer;
begin
Val(TheEdit.Text,R,c);
if c<>0 then
        begin
        TheEdit.Color:=clRed;
        end
        else
        begin
        if (R>=min) and (R<=max) then
                        begin
                        Value:=R;
                        TheEdit.Color:=clWhite;
                        end
                        else
                        TheEdit.Color:=clYellow;
        end;

end;

function Double2str(v:double;lengh,prec:byte):string;
var p:string[255];
begin
if lengh>0 then
        begin
        if prec>0 then
                Str(v:lengh:prec,p)
                else
                Str(v:lengh,p)
        end
        else
        Str(v,p);
Double2str:=p;
end;

function Int2str(v:longint;lengh:byte):string;
var p:string[255];
begin
if lengh>0 then
        begin
        Str(v:lengh,p)
        end
        else
        Str(v,p);
Int2str:=p;
end;


end.

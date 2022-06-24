unit FirstGuiApp;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Ani;

type
  TForm1 = class(TForm)
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Text1: TText;
    Rectangle1: TRectangle;
    RoundRect1: TRoundRect;
    GradientAnimation1: TGradientAnimation;
    procedure Button1Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  accumulator: Integer = 12;
  displayValue: Integer = 10;
  currentState : string = 'Addition';
  enterNewValue : boolean = false;

implementation

{$R *.fmx}

function passNumber(value : Integer; returnVal: string) : string;
begin

  if (not enterNewValue) and (currentState = 'Addition') then
    begin
      enterNewValue := true;
      returnVal := '0';
    end;
  if returnVal = '0' then
    returnVal := value.ToString
  else
    returnVal := returnVal + value.ToString;
  displayValue := returnVal.ToInteger();
  passNumber := returnVal;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  Text1.Text := passNumber(1,Text1.text);
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  Text1.Text := passNumber(0,Text1.text);
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  // + button
  currentState := 'Addition';
  if accumulator = 0 then
    accumulator := displayValue
  else
    accumulator := displayValue + accumulator;
  displayValue := accumulator;
  //showMessage('Clicked and plus worked: ' + accumulator.ToString);
  Text1.Text := accumulator.ToString;
  enterNewValue := false;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  StrMessage: string;

begin
  StrMessage := 'Hello, World';
  showMessage (StrMessage);


end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  // Button number7
  Text1.Text := passNumber(7,Text1.text);

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Text1.Text := passNumber(8,Text1.text);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Text1.Text := passNumber(9,Text1.text);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Text1.Text := passNumber(6,Text1.text);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Text1.Text := passNumber(5,Text1.text);
end;



procedure TForm1.Button7Click(Sender: TObject);
begin
  Text1.Text := passNumber(4,Text1.text);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  Text1.Text := passNumber(3,Text1.text);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  Text1.Text := passNumber(2,Text1.text);
end;

end.

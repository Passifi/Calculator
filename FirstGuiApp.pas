unit FirstGuiApp;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Ani;

type
  TForm1 = class(TForm)
    Number7Button: TButton;
    Number8Button: TButton;
    Number9Button: TButton;
    Number6Button: TButton;
    Number5Button: TButton;
    Number4Button: TButton;
    Number3Button: TButton;
    Number2Button: TButton;
    Number1Button: TButton;
    ZeroButton: TButton;
    EqualSign: TButton;
    MultButton: TButton;
    MinusButton: TButton;
    DivisionButton: TButton;
    PlusButton: TButton;
    floatPointButton: TButton;
    SignButton: TButton;
    ClearButton: TButton;
    AccumulatorClearButton: TButton;
    Rectangle1: TRectangle;
    RoundRect1: TRoundRect;
    GradientAnimation1: TGradientAnimation;
    Display: Ttext;

    procedure PlusButtonClick(Sender: TObject);
    procedure Number7ButtonClick(Sender: TObject);

    procedure EqualSignClick(Sender: TObject);

    procedure Number8ButtonClick(Sender: TObject);
    procedure Number9ButtonClick(Sender: TObject);
    procedure Number6ButtonClick(Sender: TObject);
    procedure Number5ButtonClick(Sender: TObject);
    procedure Number4ButtonClick(Sender: TObject);
    procedure Number3ButtonClick(Sender: TObject);
    procedure Number2ButtonClick(Sender: TObject);
    procedure Number1ButtonClick(Sender: TObject);
    procedure ZeroButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure MultButtonClick(Sender: TObject);
    procedure SignButtonClick(Sender: TObject);
    procedure DivisionButtonClick(Sender: TObject);
    procedure floatPointButtonClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  accumulator: Extended = 0;
  operatorRegister : Extended = 0;
  displayValue: Extended = 0;
  currentState : string = 'Addition';
  enterNewValue : boolean = false;

implementation

{$R *.fmx}


procedure clear;
begin
  accumulator := 0;
  displayValue := 0;
  operatorRegister := 0;
end;

procedure addition;
begin
  accumulator := accumulator + operatorRegister;
  displayValue := accumulator;


end;

procedure subtract;
begin
  accumulator := accumulator - operatorRegister;
  displayValue := accumulator;


end;

procedure multiply;
begin
  accumulator := accumulator * operatorRegister;
  displayValue := accumulator;

end;

procedure divide;
begin
  if not (operatorRegister = 0) then
  begin
    accumulator := accumulator / operatorRegister;
    displayValue := accumulator;
  end;
end;


procedure TForm1.DivisionButtonClick(Sender: TObject);
begin

  currentState := 'Division';
  accumulator := displayValue;
  operatorRegister := displayValue;
  enterNewValue := true;


end;

procedure TForm1.EqualSignClick(Sender: TObject);
begin
  case currentState[1]  of
    'A' : addition;
    'S' : subtract;
    'M' : multiply;
    'D' : divide;
    'N' : accumulator := displayValue;
  end;
  enterNewValue := true;

  Display.text := displayValue.ToString;

end;
procedure TForm1.floatPointButtonClick(Sender: TObject);
var
  counter : integer;
begin
  if Display.text.contains('.') then
    exit;


  Display.text := Display.text + '.';
end;

procedure TForm1.MultButtonClick(Sender: TObject);
begin
  currentState := 'Multiply';
  accumulator := displayValue;
  operatorRegister := displayValue;
  enterNewValue := true;
end;

function passNumber(value : extended; returnVal: string) : string;
begin

  if (enterNewValue)  then
    begin
      enterNewValue := false;
      returnVal := '0';
    end;
  if returnVal = '0' then
    returnVal := value.ToString
  else
    returnVal := returnVal + value.ToString;
  displayValue := returnVal.toextended();
  operatorRegister := displayValue;
  passNumber := returnVal;
end;

procedure TForm1.Number1ButtonClick(Sender: TObject);
begin
  Display.Text := passNumber(1,Display.text);
end;

procedure TForm1.ZeroButtonClick(Sender: TObject);
begin
  Display.Text := passNumber(0,Display.text);

end;

procedure TForm1.PlusButtonClick(Sender: TObject);
begin
  // + button
  currentState := 'Addition';
  accumulator := displayValue;
  operatorRegister := displayValue;
  enterNewValue := true;
end;




procedure TForm1.SignButtonClick(Sender: TObject);
begin
  displayValue := displayValue * -1;
  Display.text := displayValue.tostring;
end;

procedure TForm1.ClearButtonClick(Sender: TObject);
begin
  clear;
  Display.text := displayValue.ToString;
end;

procedure TForm1.Number7ButtonClick(Sender: TObject);
begin


  Display.Text := passNumber(7,Display.text);

end;

procedure TForm1.Number8ButtonClick(Sender: TObject);
begin
  Display.Text := passNumber(8,Display.text);
end;

procedure TForm1.Number9ButtonClick(Sender: TObject);
begin
  Display.Text := passNumber(9,Display.text);
end;

procedure TForm1.Number6ButtonClick(Sender: TObject);
begin
  Display.Text := passNumber(6,Display.text);
end;

procedure TForm1.Number5ButtonClick(Sender: TObject);
begin
  Display.Text := passNumber(5,Display.text);
end;



procedure TForm1.Number4ButtonClick(Sender: TObject);
begin
  Display.Text := passNumber(4,Display.text);
end;

procedure TForm1.Number3ButtonClick(Sender: TObject);
begin
  Display.Text := passNumber(3,Display.text);
end;

procedure TForm1.Number2ButtonClick(Sender: TObject);
begin
  Display.Text := passNumber(2,Display.text);
end;

end.

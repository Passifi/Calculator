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
    Text1: TText;
    Rectangle1: TRectangle;
    RoundRect1: TRoundRect;
    GradientAnimation1: TGradientAnimation;
    procedure Button1Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
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

procedure TForm1.Button12Click(Sender: TObject);
begin
  case currentState[1]  of
    'A' : accumulator := accumulator + displayValue;
    'S' : accumulator := accumulator - displayValue;
    'M' : accumulator := accumulator * displayValue;
    'N' : accumulator := displayValue;
  end;
  enterNewValue := true;
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
  if (not enterNewValue) and (currentState = 'Addition') then
    enterNewValue := true;
    Text1.Text := '0';
  if Text1.Text = '0' then
    Text1.Text := '7'
  else
    Text1.Text := Text1.Text + '7';
  displayValue := Text1.Text.ToInteger();


end;

end.

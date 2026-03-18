// Программа нейронной сети,
// настраивающейся для определения признаков чётности цифр
program NeuronNet;

uses
  KernelUnit,
  RangedIntegerUnit,
  RangedRealUnit,
  NumeralUnit,
  NumeralsUnit,
  NeuronNetUnit,
  Forms,
  NumeralComponentsUnit,
  MainFormUnit {MainForm},
  NumeralPictureFormUnit {NumeralPictureForm},
  AboutBoxUnit in 'AboutBoxUnit.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end. // NeuronNet

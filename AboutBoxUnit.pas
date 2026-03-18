// Модуль класса формы о программе
unit AboutBoxUnit;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  // Класс формы о программе
  TAboutBox = class(TForm)
    m_Panel: TPanel;
    m_ProgramIcon: TImage;
    m_ProductName: TLabel;
    m_Version: TLabel;
    m_Copyright: TLabel;
    m_Comments: TLabel;
    m_OKButton: TButton;
    m_AuthorLabel: TLabel;
    m_ProfessorLabel: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

end. // AboutBoxUnit
 

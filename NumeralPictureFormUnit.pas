// Модуль класс формы битового изображения цифры
unit NumeralPictureFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, NumeralComponentsUnit, KernelUnit;

type
  // Класс формы изображения цифры
  TNumeralPictureForm = class(TForm)
    // Панель-контейнер битового изображения цифры
    m_PicturePanel: TPanel;

    // Коробочки выбора опций наличия битов истнности в изображении цифры
    CheckBox001: TCheckBox;  CheckBox002: TCheckBox;  CheckBox003: TCheckBox;
    CheckBox004: TCheckBox;  CheckBox005: TCheckBox;  CheckBox006: TCheckBox;
    CheckBox007: TCheckBox;  CheckBox008: TCheckBox;  CheckBox009: TCheckBox;
    CheckBox010: TCheckBox;  CheckBox011: TCheckBox;  CheckBox012: TCheckBox;
    CheckBox013: TCheckBox;  CheckBox014: TCheckBox;  CheckBox015: TCheckBox;
    CheckBox016: TCheckBox;  CheckBox017: TCheckBox;  CheckBox018: TCheckBox;
    CheckBox019: TCheckBox;  CheckBox020: TCheckBox;  CheckBox021: TCheckBox;
    CheckBox022: TCheckBox;  CheckBox023: TCheckBox;  CheckBox024: TCheckBox;
    CheckBox025: TCheckBox;  CheckBox026: TCheckBox;  CheckBox027: TCheckBox;
    CheckBox028: TCheckBox;  CheckBox029: TCheckBox;  CheckBox030: TCheckBox;
    CheckBox031: TCheckBox;  CheckBox032: TCheckBox;  CheckBox033: TCheckBox;
    CheckBox034: TCheckBox;  CheckBox035: TCheckBox;  CheckBox036: TCheckBox;
    CheckBox037: TCheckBox;  CheckBox038: TCheckBox;  CheckBox039: TCheckBox;
    CheckBox040: TCheckBox;  CheckBox041: TCheckBox;  CheckBox042: TCheckBox;
    CheckBox043: TCheckBox;  CheckBox044: TCheckBox;  CheckBox045: TCheckBox;

    CheckBox046: TCheckBox;  CheckBox047: TCheckBox;  CheckBox048: TCheckBox;
    CheckBox049: TCheckBox;  CheckBox050: TCheckBox;  CheckBox051: TCheckBox;
    CheckBox052: TCheckBox;  CheckBox053: TCheckBox;  CheckBox054: TCheckBox;
    CheckBox055: TCheckBox;  CheckBox056: TCheckBox;  CheckBox057: TCheckBox;
    CheckBox058: TCheckBox;  CheckBox059: TCheckBox;  CheckBox060: TCheckBox;
    CheckBox061: TCheckBox;  CheckBox062: TCheckBox;  CheckBox063: TCheckBox;
    CheckBox064: TCheckBox;  CheckBox065: TCheckBox;  CheckBox066: TCheckBox;
    CheckBox067: TCheckBox;  CheckBox068: TCheckBox;  CheckBox069: TCheckBox;
    CheckBox070: TCheckBox;  CheckBox071: TCheckBox;  CheckBox072: TCheckBox;
    CheckBox073: TCheckBox;  CheckBox074: TCheckBox;  CheckBox075: TCheckBox;
    CheckBox076: TCheckBox;  CheckBox077: TCheckBox;  CheckBox078: TCheckBox;
    CheckBox079: TCheckBox;  CheckBox080: TCheckBox;  CheckBox081: TCheckBox;
    CheckBox082: TCheckBox;  CheckBox083: TCheckBox;  CheckBox084: TCheckBox;
    CheckBox085: TCheckBox;  CheckBox086: TCheckBox;  CheckBox087: TCheckBox;
    CheckBox088: TCheckBox;  CheckBox089: TCheckBox;  CheckBox090: TCheckBox;

    CheckBox091: TCheckBox;  CheckBox092: TCheckBox;  CheckBox093: TCheckBox;
    CheckBox094: TCheckBox;  CheckBox095: TCheckBox;  CheckBox096: TCheckBox;
    CheckBox097: TCheckBox;  CheckBox098: TCheckBox;  CheckBox099: TCheckBox;
    CheckBox100: TCheckBox;  CheckBox101: TCheckBox;  CheckBox102: TCheckBox;
    CheckBox103: TCheckBox;  CheckBox104: TCheckBox;  CheckBox105: TCheckBox;
    CheckBox106: TCheckBox;  CheckBox107: TCheckBox;  CheckBox108: TCheckBox;
    CheckBox109: TCheckBox;  CheckBox110: TCheckBox;  CheckBox111: TCheckBox;
    CheckBox112: TCheckBox;  CheckBox113: TCheckBox;  CheckBox114: TCheckBox;
    CheckBox115: TCheckBox;  CheckBox116: TCheckBox;  CheckBox117: TCheckBox;
    CheckBox118: TCheckBox;  CheckBox119: TCheckBox;  CheckBox120: TCheckBox;
    CheckBox121: TCheckBox;  CheckBox122: TCheckBox;  CheckBox123: TCheckBox;
    CheckBox124: TCheckBox;  CheckBox125: TCheckBox;  CheckBox126: TCheckBox;
    CheckBox127: TCheckBox;  CheckBox128: TCheckBox;  CheckBox129: TCheckBox;
    CheckBox130: TCheckBox;  CheckBox131: TCheckBox;  CheckBox132: TCheckBox;
    CheckBox133: TCheckBox;  CheckBox134: TCheckBox;  CheckBox135: TCheckBox;

    CheckBox136: TCheckBox;  CheckBox137: TCheckBox;  CheckBox138: TCheckBox;
    CheckBox139: TCheckBox;  CheckBox140: TCheckBox;  CheckBox141: TCheckBox;
    CheckBox142: TCheckBox;  CheckBox143: TCheckBox;  CheckBox144: TCheckBox;
    CheckBox145: TCheckBox;  CheckBox146: TCheckBox;  CheckBox147: TCheckBox;
    CheckBox148: TCheckBox;  CheckBox149: TCheckBox;  CheckBox150: TCheckBox;
    CheckBox151: TCheckBox;  CheckBox152: TCheckBox;  CheckBox153: TCheckBox;
    CheckBox154: TCheckBox;  CheckBox155: TCheckBox;  CheckBox156: TCheckBox;
    CheckBox157: TCheckBox;  CheckBox158: TCheckBox;  CheckBox159: TCheckBox;
    CheckBox160: TCheckBox;  CheckBox161: TCheckBox;  CheckBox162: TCheckBox;
    CheckBox163: TCheckBox;  CheckBox164: TCheckBox;  CheckBox165: TCheckBox;
    CheckBox166: TCheckBox;  CheckBox167: TCheckBox;  CheckBox168: TCheckBox;
    CheckBox169: TCheckBox;  CheckBox170: TCheckBox;  CheckBox171: TCheckBox;
    CheckBox172: TCheckBox;  CheckBox173: TCheckBox;  CheckBox174: TCheckBox;
    CheckBox175: TCheckBox;  CheckBox176: TCheckBox;  CheckBox177: TCheckBox;
    CheckBox178: TCheckBox;  CheckBox179: TCheckBox;  CheckBox180: TCheckBox;

    CheckBox181: TCheckBox;  CheckBox182: TCheckBox;  CheckBox183: TCheckBox;
    CheckBox184: TCheckBox;  CheckBox185: TCheckBox;  CheckBox186: TCheckBox;
    CheckBox187: TCheckBox;  CheckBox188: TCheckBox;  CheckBox189: TCheckBox;
    CheckBox190: TCheckBox;  CheckBox191: TCheckBox;  CheckBox192: TCheckBox;
    CheckBox193: TCheckBox;  CheckBox194: TCheckBox;  CheckBox195: TCheckBox;
    CheckBox196: TCheckBox;  CheckBox197: TCheckBox;  CheckBox198: TCheckBox;
    CheckBox199: TCheckBox;  CheckBox200: TCheckBox;  CheckBox201: TCheckBox;
    CheckBox202: TCheckBox;  CheckBox203: TCheckBox;  CheckBox204: TCheckBox;
    CheckBox205: TCheckBox;  CheckBox206: TCheckBox;  CheckBox207: TCheckBox;
    CheckBox208: TCheckBox;  CheckBox209: TCheckBox;  CheckBox210: TCheckBox;
    CheckBox211: TCheckBox;  CheckBox212: TCheckBox;  CheckBox213: TCheckBox;
    CheckBox214: TCheckBox;  CheckBox215: TCheckBox;  CheckBox216: TCheckBox;
    CheckBox217: TCheckBox;  CheckBox218: TCheckBox;  CheckBox219: TCheckBox;
    CheckBox220: TCheckBox;  CheckBox221: TCheckBox;  CheckBox222: TCheckBox;
    CheckBox223: TCheckBox;  CheckBox224: TCheckBox;  CheckBox225: TCheckBox;

    // Кнопка согласия выбора представленного битового изображения цифры
    m_OKButton: TButton;

    // Процедура - прорисовка формы
    procedure FormPaint(Sender: TObject);
    // Процедура - закрытие формы
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
    // Поле - количество бит в ширину цифры
    VerticalBitsNumber:   NumeralSquareSideBitsNumberRange;
    // Поле - количество бит в высоту цифры
    HorizontalBitsNumber: NumeralSquareSideBitsNumberRange;
    // Поле - указатели на компоненты бит числа
    BitsCheckBoxes: Array[NumeralSquareSideBitsNumberRange,
      NumeralSquareSideBitsNumberRange] of PCheckBox;
  end; // TNumeralPictureForm
  //----------------------------------------------------------------------------

var
  NumeralPictureForm: TNumeralPictureForm;

implementation

{$R *.dfm}

uses
  RangedIntegerUnit, NumeralUnit, MainFormUnit, Buttons;

// Процедура - прорисовка формы
procedure TNumeralPictureForm.FormPaint(Sender: TObject);
var
  // Количество бит по вертикали, ограниченное в пределах заданного диапазона
  locVerticalBitsNumber,
  // Количество бит по горизонтали, ограниченное в пределах заданного диапазона
  locHorizontalBitsNumber: RangedInteger;
  // Счётчик бит по вертикали
  locVerticalBitIndex,
  // Счётчик бит по горизонтали
  locHorizontalBitIndex: NumeralSquareSideBitsNumberRange;
  // Отображаемая цифра
  locNumeral: Numeral;
  // Счётчик количества бит цифры
  locBitIndex: 0..MAX_NUMARAL_SQUARE_BITS_NUMBER;
begin
  // Получение матрицы компонентов для изображения цифры
  BitsCheckBoxes[ 1, 1]:=@CheckBox001; BitsCheckBoxes[ 1, 2]:=@CheckBox002;
  BitsCheckBoxes[ 1, 3]:=@CheckBox003; BitsCheckBoxes[ 1, 4]:=@CheckBox004;
  BitsCheckBoxes[ 1, 5]:=@CheckBox005; BitsCheckBoxes[ 1, 6]:=@CheckBox006;
  BitsCheckBoxes[ 1, 7]:=@CheckBox007; BitsCheckBoxes[ 1, 8]:=@CheckBox008;
  BitsCheckBoxes[ 1, 9]:=@CheckBox009; BitsCheckBoxes[ 1,10]:=@CheckBox010;
  BitsCheckBoxes[ 1,11]:=@CheckBox011; BitsCheckBoxes[ 1,12]:=@CheckBox012;
  BitsCheckBoxes[ 1,13]:=@CheckBox013; BitsCheckBoxes[ 1,14]:=@CheckBox014;
  BitsCheckBoxes[ 1,15]:=@CheckBox015;

  BitsCheckBoxes[ 2, 1]:=@CheckBox016; BitsCheckBoxes[ 2, 2]:=@CheckBox017;
  BitsCheckBoxes[ 2, 3]:=@CheckBox018; BitsCheckBoxes[ 2, 4]:=@CheckBox019;
  BitsCheckBoxes[ 2, 5]:=@CheckBox020; BitsCheckBoxes[ 2, 6]:=@CheckBox021;
  BitsCheckBoxes[ 2, 7]:=@CheckBox022; BitsCheckBoxes[ 2, 8]:=@CheckBox023;
  BitsCheckBoxes[ 2, 9]:=@CheckBox024; BitsCheckBoxes[ 2,10]:=@CheckBox025;
  BitsCheckBoxes[ 2,11]:=@CheckBox026; BitsCheckBoxes[ 2,12]:=@CheckBox027;
  BitsCheckBoxes[ 2,13]:=@CheckBox028; BitsCheckBoxes[ 2,14]:=@CheckBox029;
  BitsCheckBoxes[ 2,15]:=@CheckBox030;

  BitsCheckBoxes[ 3, 1]:=@CheckBox031; BitsCheckBoxes[ 3, 2]:=@CheckBox032;
  BitsCheckBoxes[ 3, 3]:=@CheckBox033; BitsCheckBoxes[ 3, 4]:=@CheckBox034;
  BitsCheckBoxes[ 3, 5]:=@CheckBox035; BitsCheckBoxes[ 3, 6]:=@CheckBox036;
  BitsCheckBoxes[ 3, 7]:=@CheckBox037; BitsCheckBoxes[ 3, 8]:=@CheckBox038;
  BitsCheckBoxes[ 3, 9]:=@CheckBox039; BitsCheckBoxes[ 3,10]:=@CheckBox040;
  BitsCheckBoxes[ 3,11]:=@CheckBox041; BitsCheckBoxes[ 3,12]:=@CheckBox042;
  BitsCheckBoxes[ 3,13]:=@CheckBox043; BitsCheckBoxes[ 3,14]:=@CheckBox044;
  BitsCheckBoxes[ 3,15]:=@CheckBox045;

  BitsCheckBoxes[ 4, 1]:=@CheckBox046; BitsCheckBoxes[ 4, 2]:=@CheckBox047;
  BitsCheckBoxes[ 4, 3]:=@CheckBox048; BitsCheckBoxes[ 4, 4]:=@CheckBox049;
  BitsCheckBoxes[ 4, 5]:=@CheckBox050; BitsCheckBoxes[ 4, 6]:=@CheckBox051;
  BitsCheckBoxes[ 4, 7]:=@CheckBox052; BitsCheckBoxes[ 4, 8]:=@CheckBox053;
  BitsCheckBoxes[ 4, 9]:=@CheckBox054; BitsCheckBoxes[ 4,10]:=@CheckBox055;
  BitsCheckBoxes[ 4,11]:=@CheckBox056; BitsCheckBoxes[ 4,12]:=@CheckBox057;
  BitsCheckBoxes[ 4,13]:=@CheckBox058; BitsCheckBoxes[ 4,14]:=@CheckBox059;
  BitsCheckBoxes[ 4,15]:=@CheckBox060;

  BitsCheckBoxes[ 5, 1]:=@CheckBox061; BitsCheckBoxes[ 5, 2]:=@CheckBox062;
  BitsCheckBoxes[ 5, 3]:=@CheckBox063; BitsCheckBoxes[ 5, 4]:=@CheckBox064;
  BitsCheckBoxes[ 5, 5]:=@CheckBox065; BitsCheckBoxes[ 5, 6]:=@CheckBox066;
  BitsCheckBoxes[ 5, 7]:=@CheckBox067; BitsCheckBoxes[ 5, 8]:=@CheckBox068;
  BitsCheckBoxes[ 5, 9]:=@CheckBox069; BitsCheckBoxes[ 5,10]:=@CheckBox070;
  BitsCheckBoxes[ 5,11]:=@CheckBox071; BitsCheckBoxes[ 5,12]:=@CheckBox072;
  BitsCheckBoxes[ 5,13]:=@CheckBox073; BitsCheckBoxes[ 5,14]:=@CheckBox074;
  BitsCheckBoxes[ 5,15]:=@CheckBox075;

  BitsCheckBoxes[ 6, 1]:=@CheckBox076; BitsCheckBoxes[ 6, 2]:=@CheckBox077;
  BitsCheckBoxes[ 6, 3]:=@CheckBox078; BitsCheckBoxes[ 6, 4]:=@CheckBox079;
  BitsCheckBoxes[ 6, 5]:=@CheckBox080; BitsCheckBoxes[ 6, 6]:=@CheckBox081;
  BitsCheckBoxes[ 6, 7]:=@CheckBox082; BitsCheckBoxes[ 6, 8]:=@CheckBox083;
  BitsCheckBoxes[ 6, 9]:=@CheckBox084; BitsCheckBoxes[ 6,10]:=@CheckBox085;
  BitsCheckBoxes[ 6,11]:=@CheckBox086; BitsCheckBoxes[ 6,12]:=@CheckBox087;
  BitsCheckBoxes[ 6,13]:=@CheckBox088; BitsCheckBoxes[ 6,14]:=@CheckBox089;
  BitsCheckBoxes[ 6,15]:=@CheckBox090;

  BitsCheckBoxes[ 7, 1]:=@CheckBox091; BitsCheckBoxes[ 7, 2]:=@CheckBox092;
  BitsCheckBoxes[ 7, 3]:=@CheckBox093; BitsCheckBoxes[ 7, 4]:=@CheckBox094;
  BitsCheckBoxes[ 7, 5]:=@CheckBox095; BitsCheckBoxes[ 7, 6]:=@CheckBox096;
  BitsCheckBoxes[ 7, 7]:=@CheckBox097; BitsCheckBoxes[ 7, 8]:=@CheckBox098;
  BitsCheckBoxes[ 7, 9]:=@CheckBox099; BitsCheckBoxes[ 7,10]:=@CheckBox100;
  BitsCheckBoxes[ 7,11]:=@CheckBox101; BitsCheckBoxes[ 7,12]:=@CheckBox102;
  BitsCheckBoxes[ 7,13]:=@CheckBox103; BitsCheckBoxes[ 7,14]:=@CheckBox104;
  BitsCheckBoxes[ 7,15]:=@CheckBox105;

  BitsCheckBoxes[ 8, 1]:=@CheckBox106; BitsCheckBoxes[ 8, 2]:=@CheckBox107;
  BitsCheckBoxes[ 8, 3]:=@CheckBox108; BitsCheckBoxes[ 8, 4]:=@CheckBox109;
  BitsCheckBoxes[ 8, 5]:=@CheckBox110; BitsCheckBoxes[ 8, 6]:=@CheckBox111;
  BitsCheckBoxes[ 8, 7]:=@CheckBox112; BitsCheckBoxes[ 8, 8]:=@CheckBox113;
  BitsCheckBoxes[ 8, 9]:=@CheckBox114; BitsCheckBoxes[ 8,10]:=@CheckBox115;
  BitsCheckBoxes[ 8,11]:=@CheckBox116; BitsCheckBoxes[ 8,12]:=@CheckBox117;
  BitsCheckBoxes[ 8,13]:=@CheckBox118; BitsCheckBoxes[ 8,14]:=@CheckBox119;
  BitsCheckBoxes[ 8,15]:=@CheckBox120;

  BitsCheckBoxes[ 9, 1]:=@CheckBox121; BitsCheckBoxes[ 9, 2]:=@CheckBox122;
  BitsCheckBoxes[ 9, 3]:=@CheckBox123; BitsCheckBoxes[ 9, 4]:=@CheckBox124;
  BitsCheckBoxes[ 9, 5]:=@CheckBox125; BitsCheckBoxes[ 9, 6]:=@CheckBox126;
  BitsCheckBoxes[ 9, 7]:=@CheckBox127; BitsCheckBoxes[ 9, 8]:=@CheckBox128;
  BitsCheckBoxes[ 9, 9]:=@CheckBox129; BitsCheckBoxes[ 9,10]:=@CheckBox130;
  BitsCheckBoxes[ 9,11]:=@CheckBox131; BitsCheckBoxes[ 9,12]:=@CheckBox132;
  BitsCheckBoxes[ 9,13]:=@CheckBox133; BitsCheckBoxes[ 9,14]:=@CheckBox134;
  BitsCheckBoxes[ 9,15]:=@CheckBox135;

  BitsCheckBoxes[10, 1]:=@CheckBox136; BitsCheckBoxes[10, 2]:=@CheckBox137;
  BitsCheckBoxes[10, 3]:=@CheckBox138; BitsCheckBoxes[10, 4]:=@CheckBox139;
  BitsCheckBoxes[10, 5]:=@CheckBox140; BitsCheckBoxes[10, 6]:=@CheckBox141;
  BitsCheckBoxes[10, 7]:=@CheckBox142; BitsCheckBoxes[10, 8]:=@CheckBox143;
  BitsCheckBoxes[10, 9]:=@CheckBox144; BitsCheckBoxes[10,10]:=@CheckBox145;
  BitsCheckBoxes[10,11]:=@CheckBox146; BitsCheckBoxes[10,12]:=@CheckBox147;
  BitsCheckBoxes[10,13]:=@CheckBox148; BitsCheckBoxes[10,14]:=@CheckBox149;
  BitsCheckBoxes[10,15]:=@CheckBox150;

  BitsCheckBoxes[11, 1]:=@CheckBox151; BitsCheckBoxes[11, 2]:=@CheckBox152;
  BitsCheckBoxes[11, 3]:=@CheckBox153; BitsCheckBoxes[11, 4]:=@CheckBox154;
  BitsCheckBoxes[11, 5]:=@CheckBox155; BitsCheckBoxes[11, 6]:=@CheckBox156;
  BitsCheckBoxes[11, 7]:=@CheckBox157; BitsCheckBoxes[11, 8]:=@CheckBox158;
  BitsCheckBoxes[11, 9]:=@CheckBox159; BitsCheckBoxes[11,10]:=@CheckBox160;
  BitsCheckBoxes[11,11]:=@CheckBox161; BitsCheckBoxes[11,12]:=@CheckBox162;
  BitsCheckBoxes[11,13]:=@CheckBox163; BitsCheckBoxes[11,14]:=@CheckBox164;
  BitsCheckBoxes[11,15]:=@CheckBox165;

  BitsCheckBoxes[12, 1]:=@CheckBox166; BitsCheckBoxes[12, 2]:=@CheckBox167;
  BitsCheckBoxes[12, 3]:=@CheckBox168; BitsCheckBoxes[12, 4]:=@CheckBox169;
  BitsCheckBoxes[12, 5]:=@CheckBox170; BitsCheckBoxes[12, 6]:=@CheckBox171;
  BitsCheckBoxes[12, 7]:=@CheckBox172; BitsCheckBoxes[12, 8]:=@CheckBox173;
  BitsCheckBoxes[12, 9]:=@CheckBox174; BitsCheckBoxes[12,10]:=@CheckBox175;
  BitsCheckBoxes[12,11]:=@CheckBox176; BitsCheckBoxes[12,12]:=@CheckBox177;
  BitsCheckBoxes[12,13]:=@CheckBox178; BitsCheckBoxes[12,14]:=@CheckBox179;
  BitsCheckBoxes[12,15]:=@CheckBox180;

  BitsCheckBoxes[13, 1]:=@CheckBox181; BitsCheckBoxes[13, 2]:=@CheckBox182;
  BitsCheckBoxes[13, 3]:=@CheckBox183; BitsCheckBoxes[13, 4]:=@CheckBox184;
  BitsCheckBoxes[13, 5]:=@CheckBox185; BitsCheckBoxes[13, 6]:=@CheckBox186;
  BitsCheckBoxes[13, 7]:=@CheckBox187; BitsCheckBoxes[13, 8]:=@CheckBox188;
  BitsCheckBoxes[13, 9]:=@CheckBox189; BitsCheckBoxes[13,10]:=@CheckBox190;
  BitsCheckBoxes[13,11]:=@CheckBox191; BitsCheckBoxes[13,12]:=@CheckBox192;
  BitsCheckBoxes[13,13]:=@CheckBox193; BitsCheckBoxes[13,14]:=@CheckBox194;
  BitsCheckBoxes[13,15]:=@CheckBox195;

  BitsCheckBoxes[14, 1]:=@CheckBox196; BitsCheckBoxes[14, 2]:=@CheckBox197;
  BitsCheckBoxes[14, 3]:=@CheckBox198; BitsCheckBoxes[14, 4]:=@CheckBox199;
  BitsCheckBoxes[14, 5]:=@CheckBox200; BitsCheckBoxes[14, 6]:=@CheckBox201;
  BitsCheckBoxes[14, 7]:=@CheckBox202; BitsCheckBoxes[14, 8]:=@CheckBox203;
  BitsCheckBoxes[14, 9]:=@CheckBox204; BitsCheckBoxes[14,10]:=@CheckBox205;
  BitsCheckBoxes[14,11]:=@CheckBox206; BitsCheckBoxes[14,12]:=@CheckBox207;
  BitsCheckBoxes[14,13]:=@CheckBox208; BitsCheckBoxes[14,14]:=@CheckBox209;
  BitsCheckBoxes[14,15]:=@CheckBox210;

  BitsCheckBoxes[15, 1]:=@CheckBox211; BitsCheckBoxes[15, 2]:=@CheckBox212;
  BitsCheckBoxes[15, 3]:=@CheckBox213; BitsCheckBoxes[15, 4]:=@CheckBox214;
  BitsCheckBoxes[15, 5]:=@CheckBox215; BitsCheckBoxes[15, 6]:=@CheckBox216;
  BitsCheckBoxes[15, 7]:=@CheckBox217; BitsCheckBoxes[15, 8]:=@CheckBox218;
  BitsCheckBoxes[15, 9]:=@CheckBox219; BitsCheckBoxes[15,10]:=@CheckBox220;
  BitsCheckBoxes[15,11]:=@CheckBox221; BitsCheckBoxes[15,12]:=@CheckBox222;
  BitsCheckBoxes[15,13]:=@CheckBox223; BitsCheckBoxes[15,14]:=@CheckBox224;
  BitsCheckBoxes[15,15]:=@CheckBox225;

  
  // Установка размерности матрицы в допустимых пределах -
  // количества бит по вертикали и горизонтели
  locVerticalBitsNumber:=RangedInteger.Create(1,
    MAX_NUMARAL_SQUARE_SIDE_BITS_NUMBER, MainForm.m_NetHeighSpinEdit.Value);
  locHorizontalBitsNumber:=RangedInteger.Create(1,
    MAX_NUMARAL_SQUARE_SIDE_BITS_NUMBER, MainForm.m_NetWidthSpinEdit.Value);
  VerticalBitsNumber:=locVerticalBitsNumber.Value;
  HorizontalBitsNumber:=locHorizontalBitsNumber.Value;

  // Сокрытие неиспользуемых бит матрицы
  for locVerticalBitIndex:=1 to MAX_NUMARAL_SQUARE_SIDE_BITS_NUMBER do
    for locHorizontalBitIndex:=HorizontalBitsNumber + 1 to
      MAX_NUMARAL_SQUARE_SIDE_BITS_NUMBER do
      BitsCheckBoxes[locVerticalBitIndex,locHorizontalBitIndex]^.Visible:=False;
  for locVerticalBitIndex:=VerticalBitsNumber + 1 to
    MAX_NUMARAL_SQUARE_SIDE_BITS_NUMBER do
    for locHorizontalBitIndex:=1 to HorizontalBitsNumber do
      BitsCheckBoxes[locVerticalBitIndex,locHorizontalBitIndex]^.Visible:=False;

  // Запись заданной цифры из главной формы
  locNumeral:=Numeral.Create(DEFAULT_TRUE_BIT, DEFAULT_FALSE_BIT,
    HorizontalBitsNumber * VerticalBitsNumber,
    MainForm.CurrentNumeralBitsEdit.Text, True);

  // Изображение текущей цифры
  locBitIndex:=0;
  for locVerticalBitIndex:=1 to VerticalBitsNumber do
    for locHorizontalBitIndex:=1 to HorizontalBitsNumber do
      begin
        locBitIndex:=locBitIndex + 1;
        if locNumeral.Bits[locBitIndex] = DEFAULT_TRUE_BIT then
          BitsCheckBoxes[locVerticalBitIndex,locHorizontalBitIndex]^.Checked:=
            True;
      end; // for
end; // TNumeralPictureForm.FormPaint
//------------------------------------------------------------------------------

 // Процедура - закрытие формы
procedure TNumeralPictureForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  // Счётчик бит по вертикали
  locVerticalBitIndex,
  // Счётчик бит по горизонтали
  locHorizontalBitIndex: NumeralSquareSideBitsNumberRange;
begin
  if NumeralPictureForm.ModalResult = mrOk then
    begin
      // Запись битового представления цифры в главную форму
      MainForm.CurrentNumeralBitsEdit.Text:=EMPTY_STRING;
      for locVerticalBitIndex:=1 to VerticalBitsNumber do
        for locHorizontalBitIndex:=1 to HorizontalBitsNumber do
          if BitsCheckBoxes[locVerticalBitIndex,locHorizontalBitIndex]^.Checked =
            True then
            MainForm.CurrentNumeralBitsEdit.Text:=
              MainForm.CurrentNumeralBitsEdit.Text + DEFAULT_TRUE_BIT
          else
            MainForm.CurrentNumeralBitsEdit.Text:=
              MainForm.CurrentNumeralBitsEdit.Text + DEFAULT_FALSE_BIT;
    end; // if
end; // TNumeralPictureForm.FormClose
//------------------------------------------------------------------------------

end. // NumeralPictureFormUnit

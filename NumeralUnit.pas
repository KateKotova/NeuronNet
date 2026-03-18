// Модуль класса битового изображения цифры
unit NumeralUnit;

interface

uses
  RangedIntegerUnit;

type
  // Класс - цифра
  Numeral = class
    protected
      // Поле - бит истинности в изображении цифры
      m_TrueBit: Char;
      // Поле - бит ложности в изображении цифры
      m_FalseBit: Char;

      // Поле - количество разрядов для изображения цифры
      m_BitsNumber: RangedInteger;
      // Поле - разряды для изображения цифры
      m_Bits: String;
      // Поле - признак чётности цифры
      m_IsEven: Boolean;

      // Функция - получение количества разрядов для изображения цифры
      function  GetBitsNumber: Integer;
      // Процедура - установка количества разрядов для изображения цифры
      procedure SetBitsNumber(parValue: Integer);

      // Процедура - установка разрядов для изображения цифры
      procedure SetBits(parValue: String);

    public
      // Свойство - бит истинности в изображении цифры
      property TrueBit:  Char read m_TrueBit;
      // Свойство - бит ложности в изображении цифры
      property FalseBit: Char read m_FalseBit;

      // Свойство - количество разрядов для изображения цифры
      property BitsNumber: Integer read GetBitsNumber write SetBitsNumber;
      // Свойство - разряды для изображения цифры
      property Bits:       String  read m_Bits        write SetBits;
      // Свойство - признак чётности цифры
      property IsEven:     Boolean read m_IsEven      write m_IsEven;

      // Конструктор - создание цифры
      constructor Create(const parTrueBit, parFalseBit: Char;
        const parBitsNumber: Integer; const parBits: String;
        const parIsEven: Boolean);
  end; // Numeral
  //----------------------------------------------------------------------------

  // Указатель на цифру
  PNumeral = ^Numeral;


implementation

uses
  KernelUnit;

// Функция - получение количества разрядов для изображения цифры
function Numeral.GetBitsNumber: Integer;
begin
  Result:=m_BitsNumber.Value;
end; // Numeral.GetBitsNumber
//------------------------------------------------------------------------------

// Процедура - установка количества разрядов для изображения цифры
// parValue - заданное количество бит изображения цифры
procedure Numeral.SetBitsNumber(parValue: Integer);
var
  // Прежнее количество разрядов для изображения цифры
  locOldBitsNumber: NumeralBitsNumberRange;
begin
  // Установка новой длины строки бит в пределах диапазона
  locOldBitsNumber:=m_BitsNumber.Value;
  m_BitsNumber.Value:=parValue;

  // Установка новой длины строки бит
  if m_BitsNumber.Value < locOldBitsNumber then
    SetLength(m_Bits, m_BitsNumber.Value)
  else
    if m_BitsNumber.Value > locOldBitsNumber then
      // Добавление битов ложности в конец для расширения строки
      m_Bits:=m_Bits + StringOfChar(m_FalseBit, m_BitsNumber.Value -
        locOldBitsNumber);
end; // Numeral.SetBitsNumber
//------------------------------------------------------------------------------

// Процедура - установка разрядов для изображения цифры
// parValue - заданная строка бит изображения цифры
procedure Numeral.SetBits(parValue: String);
var
  // Счётчик бит изображения
  i: NumeralBitsNumberRange;
  // Длина заданной строки битового изображения
  locValueLength: NumeralBitsNumberRange;
begin
  // Установка длины строки бит
  locValueLength:=Length(parValue);
  if m_BitsNumber.Value < locValueLength then
    begin
      SetLength(parValue, m_BitsNumber.Value);
      locValueLength:=m_BitsNumber.Value;
    end // if
  else
    if m_BitsNumber.Value > locValueLength then
      // Добавление битов ложности в конец для расширения строки
      parValue:=parValue + StringOfChar(m_FalseBit, m_BitsNumber.Value -
        locValueLength);

  // Просмотр и сравнение всех бит с битами истинности,
  // прочие переписываются как биты ложности
  // (добавленные в конец биты ложности не просматриваются)
  for i:=1 to locValueLength do
    if parValue[i] <> m_TrueBit then
      parValue[i]:=m_FalseBit;

  m_Bits:=parValue;
end; // Numeral.SetBits
//------------------------------------------------------------------------------

// Конструктор - создание цифры
// parTrueBit - заданный символ бита истинности в изображении цифры
// parFalseBit - заданный символ бита ложности в изображении цифры
// parBitsNumber - заданное количество бит изображения цифры
// parIsEven - заданный признак чётности цифры
constructor Numeral.Create(const parTrueBit, parFalseBit: Char;
  const parBitsNumber: Integer; const parBits: String;
  const parIsEven: Boolean);
begin
  // Установка бит истинности и ложности,
  // при их совпадении принимаются значения по умолчанию
  if parTrueBit = parFalseBit then
    begin
      m_TrueBit:=DEFAULT_TRUE_BIT;
      m_FalseBit:=DEFAULT_FALSE_BIT;
    end // if
  else
    begin
      m_TrueBit:=parTrueBit;
      m_FalseBit:=parFalseBit;
    end; // else

  // Установка длины строки бит в пределах диапазона
  m_BitsNumber:=RangedInteger.Create(MIN_NUMERAL_BITS_NUMBER,
    MAX_NUMERAL_BITS_NUMBER, parBitsNumber);
  // Запись строки бит графического представления цифры
  Bits:=parBits;
  // Установка чётности цифры
  m_IsEven:=parIsEven;
end; // Numeral.Create
//------------------------------------------------------------------------------

end. // NumeralUnit


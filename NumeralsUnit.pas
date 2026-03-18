// Модуль класса битового изображения массива цифр
unit NumeralsUnit;

interface

uses
  KernelUnit, RangedIntegerUnit, NumeralUnit;

type
  // Класс - цифры
  Numerals = class
    protected
      // Поле - количество разрядов для изображения цифры
      m_BitsNumber: RangedInteger;
      // Поле - количество цифр
      m_Number: RangedInteger;
      // Поле - массив указателей на изображения цифр
      m_Values: Array[NumeralsNumberRange] of PNumeral;

      // Функция - получение количества разрядов для изображения цифры
      function  GetBitsNumber: Integer;
      // Процедура - установка количества разрядов для изображения цифры
      procedure SetBitsNumber(parValue: Integer);

      // Функция - получение количества цифр
      function  GetNumber: Integer;
      // Процедура - установка количества цифр
      procedure SetNumber(parValue: Integer);

      // Функция - получение значения битового изображения цифры
      function  GetBits(parIndex: Integer): String;
      // Процедура - установка значения битового изображения цифры
      procedure SetBits(parIndex: Integer; parValue: String);

      // Функция - получение признака чётности цифры
      function  GetIsEven(parIndex: Integer): Boolean;
      // Процедура - установка признака чётности цифры
      procedure SetIsEven(parIndex: Integer; parValue: Boolean);

    public
      // Свойство - количество разрядов для изображения цифры
      property BitsNumber: Integer read  GetBitsNumber write SetBitsNumber;
      // Свойство - ограниченное количество разрядов для изображения цифры
      property RangedBitsNumber: RangedInteger read m_BitsNumber;
      
      // Свойство - количество цифр
      property Number:     Integer read  GetNumber     write SetNumber;
      // Свойство - ограниченное количество цифр
      property RangedNumber: RangedInteger read m_Number;

      // Свойство - значение битового изображения цифры
      property Bits[parIndex: Integer]: String read GetBits write SetBits;

      // Свойство - значение признака чётности цифры
      property IsEven[parIndex: Integer]: Boolean read  GetIsEven
                                                  write SetIsEven;

      // Конструктор - создание цифр
      constructor Create(const parBitsNumber, parNumber: Integer);
      // Деструктор - удаление цифер
      destructor Destroy; override;
  end; // Numerals
  //----------------------------------------------------------------------------


implementation

// Функция - получение количества разрядов для изображения цифры
function Numerals.GetBitsNumber: Integer;
begin
  Result:=m_BitsNumber.Value;
end; // Numerals.GetBitsNumber
//------------------------------------------------------------------------------

// Процедура - установка количества разрядов для изображения цифры
// parValue - заданное количество разрядов изображения цифры
procedure Numerals.SetBitsNumber(parValue: Integer);
var
  // Счётчик цифр
  i: NumeralsNumberRange;
begin
  // Установка новой длины строки бит в пределах диапазона для каждой из цифр
  m_BitsNumber.Value:=parValue;
  for i:=1 to m_Number.Value do
    m_Values[i]^.BitsNumber:=parValue;
end; // Numerals.SetBitsNumber
//------------------------------------------------------------------------------

// Функция - получение количества цифр
function Numerals.GetNumber: Integer;
begin
  Result:=m_Number.Value;
end; // Numerals.GetNumber
//------------------------------------------------------------------------------

// Процедура - установка количества цифр
// parValue - заданное количество цифр в массиве
procedure Numerals.SetNumber(parValue: Integer);
var
  // Счётчик цифр
  i: NumeralsNumberRange;
  // Прежнее количество цифр
  locOldNumber: NumeralsNumberRange;
begin
  // Установка нового количества цифр в пределах диапазона
  locOldNumber:=m_Number.Value;
  m_Number.Value:=parValue;

  // Установка нового количества цифр
  if m_Number.Value < locOldNumber then
    // Удаление последних цифр
    for i:=locOldNumber downto m_Number.Value + 1 do
      Dispose(m_Values[i])
  else
    if m_Number.Value > locOldNumber then
      // Добавление пустых чётных цифр в конец массива
      for i:=locOldNumber + 1 to m_Number.Value do
        begin
          New(m_Values[i]);
          m_Values[i]^:=Numeral.Create(DEFAULT_TRUE_BIT, DEFAULT_FALSE_BIT,
            m_BitsNumber.Value, EMPTY_STRING, True);
        end; // for
end; // Numerals.SetNumber
//------------------------------------------------------------------------------

// Функция - получение значения битового изображения цифры
// parIndex - заданный индекс цифры в массиве
function Numerals.GetBits(parIndex: Integer): String;
begin
  // В случае выхода индекса за границы диапазона возвращается пустая строка
  if not m_Number.NumberIsInRangeToValue(parIndex) then
    Result:=EMPTY_STRING
  else
    Result:=m_Values[parIndex]^.Bits;
end; // Numerals.GetBits
//------------------------------------------------------------------------------

// Процедура - установка значения битового изображения цифры
// parIndex - заданный индекс цифры в массиве
// parValue - заданное битовое представление цифры с указанным индексом
procedure Numerals.SetBits(parIndex: Integer; parValue: String);
begin
  // Значение записывается, если индекс в пределах диапазона
  if m_Number.NumberIsInRangeToValue(parIndex) then
    m_Values[parIndex]^.Bits:=parValue;
end; // Numerals.SetBits
//------------------------------------------------------------------------------

// Функция - получение признака чётности цифры
// parIndex - заданный индекс цифры в массиве
function Numerals.GetIsEven(parIndex: Integer): Boolean;
begin
  // В случае выхода индекса за границы диапазона возвращается истина
  if not m_Number.NumberIsInRangeToValue(parIndex) then
    Result:=True
  else
    Result:=m_Values[parIndex]^.IsEven;
end; // Numerals.GetIsEven
//------------------------------------------------------------------------------

// Процедура - установка признака чётности цифры
// parIndex - заданный индекс цифры в массиве
// parValue - заданный прзнак чётности цифры с указанным индексом
procedure Numerals.SetIsEven(parIndex: Integer; parValue: Boolean);
begin
  // Значение записывается, если индекс в пределах диапазона
  if m_Number.NumberIsInRangeToValue(parIndex) then
    m_Values[parIndex]^.IsEven:=parValue;
end; // Numerals.SetIsEven
//------------------------------------------------------------------------------

// Конструктор - создание цифр
// parBitsNumber - заданное количество бит для изображения цифры
// parNumber - заданное количество цифр в массиве
constructor Numerals.Create(const parBitsNumber, parNumber: Integer);
var
  // Счётчик цифр
  i: NumeralsNumberRange;
begin
  // Установка длины строки бит в пределах диапазона
  m_BitsNumber:=RangedInteger.Create(MIN_NUMERAL_BITS_NUMBER,
    MAX_NUMERAL_BITS_NUMBER, parBitsNumber);
  // Установка количества цифр в пределах диапазона
  m_Number:=RangedInteger.Create(MIN_NUMERALS_NUMBER, MAX_NUMERALS_NUMBER,
    parNumber);
  // Создание пустых чётных цифр
  for i:=1 to m_Number.Value do
    begin
      New(m_Values[i]);
      m_Values[i]^:=Numeral.Create(DEFAULT_TRUE_BIT, DEFAULT_FALSE_BIT,
        m_BitsNumber.Value, EMPTY_STRING, True);
    end; // for
end; // Numerals.SetNumeralBit
//------------------------------------------------------------------------------

// Деструктор - удаление цифер
destructor Numerals.Destroy;
var
  // Счётчик цифр
  i: NumeralsNumberRange;
begin
  for i:=1 to m_Number.Value do
    Dispose(m_Values[i]);
end; // Numerals.Destroy
//------------------------------------------------------------------------------

end. // NumeralsUnit


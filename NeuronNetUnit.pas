// Модуль класса нейронной сети
unit NeuronNetUnit;

interface

uses
  KernelUnit, RangedRealUnit, NumeralsUnit;

type
  // Класс - нейронная сеть
  NeuronNet = class
    protected
      // Поле - цифры
      m_Numerals: Numerals;
      // Поле - коэффициент скорости обучения
      m_EducationVelocityCoefficient: RangedReal;
      // Поле - порог суммы
      m_SumThreshold: Real;
      // Поле - массив весовых коэффициентов
      m_Weights: Array[NumeralBitsNumberRange] of ^Real;

      // Функция - получение количества разрядов для изображения цифры
      function  GetNumeralBitsNumber: Integer;
      // Процедура - установка количества разрядов для изображения цифры
      procedure SetNumeralBitsNumber(parValue: Integer);

      // Функция - получение количества цифр
      function  GetNumeralsNumber: Integer;
      // Процедура - установка количества цифр
      procedure SetNumeralsNumber(parValue: Integer);

      // Функция - получение значения битового изображения цифры
      function  GetNumeralBits(parIndex: Integer): String;
      // Процедура - установка значения битового изображения цифры
      procedure SetNumeralBits(parIndex: Integer; parValue: String);

      // Функция - получение действительного признака чётности цифры
      function  GetNumeralIsEvenReal(parIndex: Integer): Boolean;
      // Процедура - установка действительного признака чётности цифры
      procedure SetNumeralIsEvenReal(parIndex: Integer; parValue: Boolean);

      // Функция - получение коэффициента скорости обучения
      function  GetEducationVelocityCoefficient: Real;
      // Процедура - установка коэффициента скорости обучения
      procedure SetEducationVelocityCoefficient(parValue: Real);

      // Процедура - установка начального порога суммы
      procedure SetStartSumThreshold;

      // Функция - получение значения весового коэффициента
      function  GetWeight(parIndex: Integer): Real;

      // Процедура - установка начальных весовых коэффициентов
      procedure  SetStartWeights;

    public
      // Свойство - количество разрядов для изображения цифры
      property NumeralBitsNumber: Integer read  GetNumeralBitsNumber
                                          write SetNumeralBitsNumber;
      // Свойство - количество цифр
      property NumeralsNumber:    Integer read  GetNumeralsNumber
                                          write SetNumeralsNumber;
      // Свойство - значение битового изображения цифры
      property NumeralBits[parIndex: Integer]: String read  GetNumeralBits
                                                      write SetNumeralBits;
      // Свойство - действительное значение признака чётности цифры
      property NumeralIsEvenReal[parIndex: Integer]: Boolean
        read  GetNumeralIsEvenReal write SetNumeralIsEvenReal;

      // Свойство - коэффициент скорости обучения
      property EducationVelocityCoefficient: Real
        read  GetEducationVelocityCoefficient
        write SetEducationVelocityCoefficient;
      // Свойство - порог суммы
      property SumThreshold: Real read m_SumThreshold;
      // Свойство - значение весового коэффициента
      property Weight[parIndex: Integer]: Real read GetWeight;

      // Функция - произведение бита цифры и весового коэффициента
      function MultiplicationNumeralBitAndWeight(const parNumeralIndex,
        parWeightIndex: Integer): Real;
      // Функция - сумма произведений битов цифры и весовых коэффициентов
      function SumMultiplications(const parNumeralIndex: Integer): Real;
      // Функция - получнное признака чётности цифры
      function NumeralIsEvenGot(const parIndex: Integer): Boolean;
      // Функция - погрешность полученного признака чётности цифры
      function NumeralGotParityEpsilon(const parIndex: Integer): SmallInt;

      // Функция - признак изменения порога и весовых коэффициентов
      // при устранении погрешности на следующей итерации
      function IterationGotNewSumThresholdAndWeights
        (const parNumeralIndex: Integer): Boolean;
      // Функция - признак первоначальной отлаженнсти
      // весовых коэффициентов для цифры
      function NumeralWeightsAreOriginallyAdjusted
        (const parNumeralIndex: Integer): Boolean;

      // Процедура - настройка весовых коэффициентов
      procedure AdjustWeights(var parSomeNumeralsAreEqual: Boolean);

      // Функция - признак чётности некоторой цифры,
      // представленной в битовой строке
      function SomeNumeralIsEven(var parNumeralBits: String): Boolean;

      // Конструктор - создание нейронной сети
      constructor Create(const parNumeralBitsNumber, parNumeralsNumber: Integer;
        const parEducationVelocityCoefficient: Real);
      // Деструктор - удаление нейронной сети
      destructor Destroy; override;
  end; // NeuronNet
  //----------------------------------------------------------------------------


implementation

uses
  NumeralUnit;

// Функция - получение количества разрядов для изображения цифры
function NeuronNet.GetNumeralBitsNumber: Integer;
begin
  Result:=m_Numerals.BitsNumber;
end; // NeuronNet.GetNumeralBitsNumber
//------------------------------------------------------------------------------

// Процедура - установка количества разрядов для изображения цифры
// parValue - заданное количество разрядов изображения цифры
procedure NeuronNet.SetNumeralBitsNumber(parValue: Integer);
var
  // Счётчик количества разрядов для изображения цифры
  i: NumeralBitsNumberRange;
  // Прежнее количество разрядов для изображения цифры
  locOldNumeralBitsNumber: NumeralBitsNumberRange;
begin
  // Установка нового количества цифр в пределах диапазона
  locOldNumeralBitsNumber:=m_Numerals.BitsNumber;
  m_Numerals.BitsNumber:=parValue;

  // Установка нового количества весовых коэффициентов
  if m_Numerals.BitsNumber < locOldNumeralBitsNumber then
    // Удаление последних весовых коэффициентов
    for i:=locOldNumeralBitsNumber downto m_Numerals.BitsNumber + 1 do
      Dispose(m_Weights[i])
  else
    if m_Numerals.BitsNumber > locOldNumeralBitsNumber then
      // Добавление нулевых весовых коэффициентов в конец массива
      for i:=locOldNumeralBitsNumber + 1 to m_Numerals.BitsNumber do
        begin
          New(m_Weights[i]);
          m_Weights[i]^:=0;
        end; // for
end; // NeuronNet.SetNumeralBitsNumber
//------------------------------------------------------------------------------

// Функция - получение количества цифр
function NeuronNet.GetNumeralsNumber: Integer;
begin
  Result:=m_Numerals.Number;
end; // NeuronNet.GetNumeralsNumber
//------------------------------------------------------------------------------

// Процедура - установка количества цифр
// parValue - заданное количество цифр
procedure NeuronNet.SetNumeralsNumber(parValue: Integer);
begin
  m_Numerals.Number:=parValue;
end; // NeuronNet.SetNumeralsNumber
//------------------------------------------------------------------------------

// Функция - получение значения битового изображения цифры
// parIndex - заданный индекс цифры в массиве
function NeuronNet.GetNumeralBits(parIndex: Integer): String;
begin
  Result:=m_Numerals.Bits[parIndex];
end; // NeuronNet.GetNumeralBits
//------------------------------------------------------------------------------

// Процедура - установка значения битового изображения цифры
// parIndex - заданный индекс цифры в массиве
// parValue - заданное битовое изображение цифры с указанным индексом
procedure NeuronNet.SetNumeralBits(parIndex: Integer; parValue: String);
begin
  m_Numerals.Bits[parIndex]:=parValue;
end; // NeuronNet.SetNumeralBits
//------------------------------------------------------------------------------

// Функция - получение действительного признака чётности цифры
// parIndex - заданный индекс цифры в массиве
function NeuronNet.GetNumeralIsEvenReal(parIndex: Integer): Boolean;
begin
  Result:=m_Numerals.IsEven[parIndex];
end; // NeuronNet.GetNumeralIsEvenReal
//------------------------------------------------------------------------------

// Процедура - установка действительного признака чётности цифры
// parIndex - заданный индекс цифры в массиве
// parValue - заданный признак чётности цифры с указанным индексом
procedure NeuronNet.SetNumeralIsEvenReal(parIndex: Integer; parValue: Boolean);
begin
  m_Numerals.IsEven[parIndex]:=parValue;
end; // NeuronNet.SetNumeralIsEvenReal
//------------------------------------------------------------------------------

// Функция - получение коэффициента скорости обучения
function NeuronNet.GetEducationVelocityCoefficient: Real;
begin
  Result:=m_EducationVelocityCoefficient.Value;
end; // NeuronNet.GetEducationVelocityCoefficient
//------------------------------------------------------------------------------

// Процедура - установка коэффициента скорости обучения
// parValue - заданное значение коэффициента обучаемости сети
procedure NeuronNet.SetEducationVelocityCoefficient(parValue: Real);
begin
 m_EducationVelocityCoefficient.Value:=parValue;
end; // NeuronNet.SetEducationVelocityCoefficient
//------------------------------------------------------------------------------

// Процедура - установка начального порога суммы
procedure NeuronNet.SetStartSumThreshold;
begin
  Randomize;
  // Cлучайно cмоделированная величина,
  // отвечающая логарифмически-нормальному распределения
  m_SumThreshold:=LogarithmicNormalDistributedValue;
end; // NeuronNet.SetEducationVelocityCoefficient
//------------------------------------------------------------------------------

// Функция - получение значения весового коэффициента
// parIndex - заданный индекс весового коэффициента
function NeuronNet.GetWeight(parIndex: Integer): Real;
begin
  // В случае выхода индекса за границы диапазона возвращается нуль
  if not m_Numerals.RangedBitsNumber.NumberIsInRangeToValue(parIndex) then
    Result:=0
  else
    Result:=m_Weights[parIndex]^;
end; // NeuronNet.GetWeight
//------------------------------------------------------------------------------

// Процедура - установка начальных весовых коэффициентов
procedure NeuronNet.SetStartWeights;
var
  // Счётчик количества разрядов для изображения цифры
  i: NumeralBitsNumberRange;
begin
  Randomize;
  for i:=1 to m_Numerals.BitsNumber do
    // Cлучайно cмоделированная величина,
    // распределённая по нормальному закону распределения на интервале [0; 1)
    m_Weights[i]^:=NormalDistributedRangedValue;
end; // NeuronNet.SetStartWeights
//------------------------------------------------------------------------------

// Функция - произведение бита цифры и весового коэффициента
// parNumeralIndex - заданный индекс цифры
// parWeightIndex - заданный индекс весового коэффициента
function NeuronNet.MultiplicationNumeralBitAndWeight(const parNumeralIndex,
  parWeightIndex: Integer): Real;
begin
  // В случае несуществующих индексов или при незначащем (ложном) бите
  //(при умножении на нуль получается нуль) возвращается нуль
  if (not m_Numerals.RangedNumber.NumberIsInRangeToValue(parNumeralIndex)) or
    (not m_Numerals.RangedBitsNumber.NumberIsInRangeToValue(parWeightIndex)) or
    (m_Numerals.Bits[parNumeralIndex][parWeightIndex] = DEFAULT_FALSE_BIT) then
    Result:=0
  else
    Result:=m_Weights[parWeightIndex]^;
end; // NeuronNet.MultiplicationNumeralBitAndWeight
//------------------------------------------------------------------------------

// Функция - сумма произведений битов цифры и весовых коэффициентов
// parNumeralIndex - заданный индекс цифры
function NeuronNet.SumMultiplications(const parNumeralIndex: Integer): Real;
var
  // Индекс весового коэффициента
  locWeightIndex: NumeralBitsNumberRange;
begin
  Result:=0;
  // В случае несуществующего индекса возвращается нуль
  if m_Numerals.RangedNumber.NumberIsInRangeToValue(parNumeralIndex) then
    for locWeightIndex:=1 to m_Numerals.BitsNumber do
      Result:=Result + MultiplicationNumeralBitAndWeight(parNumeralIndex,
        locWeightIndex);
end; // NeuronNet.SumMultiplications
//------------------------------------------------------------------------------

// Функция - полученние признака чётности цифры
// parIndex - заданный индекс цифры
function NeuronNet.NumeralIsEvenGot(const parIndex: Integer): Boolean;
begin
  // Цифра считается чётной, если сумма произведений весовых коэффициентов
  // и бит изображения цифры не меньше установленного порогового значения суммы
  if SumMultiplications(parIndex) >= m_SumThreshold then
    Result:=True
  else
    Result:=False;
end; // NeuronNet.NumeralIsEvenGot
//------------------------------------------------------------------------------

// Функция - погрешность получнного признака чётности цифры
// parIndex - заданный индекс цифры
function NeuronNet.NumeralGotParityEpsilon(const parIndex: Integer): SmallInt;
begin
  // Погрешность - разность полученного и действительного
  // признаков чётности цифры
  Result:=SmallInt(NumeralIsEvenGot(parIndex)) -
    SmallInt(m_Numerals.IsEven[parIndex]);
end; // NeuronNet.NumeralGotParityEpsilon
//------------------------------------------------------------------------------

// Функция - признак изменения порога и весовых коэффициентов
// при устранении погрешности на следующей итерации
// parNumeralIndex - заданный индекс цифры
function NeuronNet.IterationGotNewSumThresholdAndWeights
  (const parNumeralIndex: Integer): Boolean;
var
  // Погрешность признака чётности на текущей итерации
  locNumeralGotParityEpsilon: SmallInt;
  // Индекс весового коэффициента
  locWeightIndex: NumeralBitsNumberRange;
  // Произведение коэффициента обучения и погрешности чётности цифры
  locMultiplicationCoefficientAndEpsilon: Real;
begin
  // В случае несуществующего индекса возвращается ложь
  if not m_Numerals.RangedNumber.NumberIsInRangeToValue(parNumeralIndex) then
    begin
      Result:=False;
      Exit;
    end; // if

  // Вычисление погрешности и в случае её наличия - изменение порога и
  // весовых коэффициентов
  locNumeralGotParityEpsilon:=NumeralGotParityEpsilon(parNumeralIndex);

  if locNumeralGotParityEpsilon = 0 then
    Result:=False
  else
    begin
      locMultiplicationCoefficientAndEpsilon:=
        m_EducationVelocityCoefficient.Value * locNumeralGotParityEpsilon;
      // Новый порог суммы
      m_SumThreshold:=m_SumThreshold + locMultiplicationCoefficientAndEpsilon;

      // Все весовые коэффициенты тоже новые
      for locWeightIndex:=1 to m_Numerals.BitsNumber do
        if m_Numerals.Bits[parNumeralIndex][locWeightIndex] = DEFAULT_TRUE_BIT
          then
          m_Weights[locWeightIndex]^:=m_Weights[locWeightIndex]^ -
            locMultiplicationCoefficientAndEpsilon;
      Result:=True;
    end; // else
end; // NeuronNet.IterationGotNewSumThresholdAndWeights
//------------------------------------------------------------------------------

// Функция - признак первоначальной отлаженнсти
// весовых коэффициентов для цифры
// parNumeralIndex - заданный индекс цифры
function NeuronNet.NumeralWeightsAreOriginallyAdjusted
  (const parNumeralIndex: Integer): Boolean;
begin
  // Результат, обратный признаку изменения порога и весовых коэффициентов
  // при устранении погрешности на первой итерации
  Result:=not IterationGotNewSumThresholdAndWeights(parNumeralIndex);

  if not Result then
    // Улучшение коэффициентов до сведения погрешности к нулю
    while IterationGotNewSumThresholdAndWeights(parNumeralIndex) do
      ;
end; // NeuronNet.NumeralWeightsAreOriginallyAdjusted
//------------------------------------------------------------------------------

// Процедура - настройка весовых коэффициентов
// parSomeNumeralsAreEqual - признак эквивалентности
//   битовых представлений некоторых цифр
procedure NeuronNet.AdjustWeights(var parSomeNumeralsAreEqual: Boolean);
var
  // Признак отрегулирования всех цифр
  locAllNumbersAreAdjusted: Boolean;
  // Индексы цифр
  i, j: NumeralsNumberRange;
begin
  // Установка начального порога суммы
  SetStartSumThreshold;
  // Установка начальных весовых коэффициентов
  SetStartWeights;

  // Проверка уникальности кажлой цифры (эквивалентных цифр не должно быть)
  parSomeNumeralsAreEqual:=False;
  // Попарное сравнение цифр методм ускоренного перебора
  for i:=1 to m_Numerals.Number - 1 do
    for j:=i + 1 to m_Numerals.Number do
      if m_Numerals.Bits[i] = m_Numerals.Bits[j] then
        begin
          parSomeNumeralsAreEqual:=True;
          Exit;
        end; // if

  repeat
    // Признак отрегулированя всех цифр
    locAllNumbersAreAdjusted:=True;

    // Просмотр всех цифр до тех пор, пока все коэффициенты будут отрегулированы
    for i:=1 to m_Numerals.Number do
      locAllNumbersAreAdjusted:=locAllNumbersAreAdjusted and
        NumeralWeightsAreOriginallyAdjusted(i);
  until locAllNumbersAreAdjusted;
end; // NeuronNet.AdjustWeights
//------------------------------------------------------------------------------

// Функция - признак чётности цифры,
// представленной в битовой строке
// parNumeralBits - заданное битовое редставление некоторой цифры
function NeuronNet.SomeNumeralIsEven(var parNumeralBits: String): Boolean;
var
  // Заданная цифра
  locSomeNumeral: Numeral;
  // Сумма произведений отлаженных весовых коэффициентов и битов цифры
  locSumMultiplications: Real;
  // Индекс весового коэффициента
  i: NumeralBitsNumberRange;
begin
  // Образование новой отдельной цифры из заданных бит
  locSomeNumeral:=Numeral.Create(DEFAULT_TRUE_BIT, DEFAULT_TRUE_BIT,
    m_Numerals.BitsNumber, parNumeralBits, True);

  // Получение суммы произведений отлаженных весовых коэффициентов и битов цифры
  locSumMultiplications:=0;
  for i:=1 to locSomeNumeral.BitsNumber do
    if locSomeNumeral.Bits[i] = DEFAULT_TRUE_BIT then
      locSumMultiplications:=locSumMultiplications + m_Weights[i]^;

  // Вывод цифры
  parNumeralBits:=locSomeNumeral.Bits;
  // Уничтожение цифры
  locSomeNumeral.Destroy;

  // Получение признака чётности цифры в зависимости от порога
  if locSumMultiplications >= m_SumThreshold then
    Result:=True
  else
    Result:=False;
end; // NeuronNet.SomeNumeralIsEven
//------------------------------------------------------------------------------

// Конструктор - создание нейронной сети
// parNumeralBitsNumber - заданное количество бит изображения цифры
// parNumeralsNumber - заданное количество цифр в массиве
// parEducationVelocityCoefficient - заданное значение
//   коэффициента обучаемости сети
constructor NeuronNet.Create(const parNumeralBitsNumber,
  parNumeralsNumber: Integer; const parEducationVelocityCoefficient: Real);
var
  // Счётчик цифр
  i: NumeralsNumberRange;
begin
  // Создание цифр
  m_Numerals:=Numerals.Create(parNumeralBitsNumber, parNumeralsNumber);
  // Коэффициент скорости обучения
  m_EducationVelocityCoefficient:=RangedReal.Create
    (MIN_EDUCATION_VELOCITY_COEFFICIENT, MAX_EDUCATION_VELOCITY_COEFFICIENT,
    parEducationVelocityCoefficient);
  // Установка начального порога суммы
  SetStartSumThreshold;

  // Создание пустых весовых коэффициентов
  for i:=1 to m_Numerals.BitsNumber do
    New(m_Weights[i]);
  // Установка начальных весовых коэффициентов
  SetStartWeights;
end; // NeuronNet.Create
//------------------------------------------------------------------------------

// Деструктор - удаление нейронной сети
destructor NeuronNet.Destroy;
var
  // Счётчик весовых коэффициетов
  i: NumeralBitsNumberRange;
begin
  // Удаление весовых коэффициентов
  for i:=1 to m_Numerals.BitsNumber do
    Dispose(m_Weights[i]);
  // Удаление цифр
  m_Numerals.Destroy;
end; // NeuronNet.Destroy
//------------------------------------------------------------------------------

end. // NeuronNetUnit

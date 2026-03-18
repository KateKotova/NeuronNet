// Модуль класса целого числа, ограниченнога в пределах диапазона
unit RangedIntegerUnit;

interface

type
  // Класс - целое число, ограниченное в пределах диапазона
  RangedInteger = class
    protected
      // Поле - минимальное значение
      m_Min: Integer;
      // Поле - максимальное значение
      m_Max: Integer;
      // Поле - значение
      m_Value: Integer;

      // Процедура - установка значения
      procedure SetValue(parValue: Integer);

    public
      // Свойство - минимальное значение
      property Min:   Integer read m_Min;
      // Свойство - максимальное значение
      property Max:   Integer read m_Max;
      // Свойство - значение
      property Value: Integer read m_Value write SetValue;

      // Функция - признак принадлежности предельному диапазону
      function NumberIsInLimitingRange(const parNumber: Integer): Boolean;
      // Функция - признак принадлежности числа диапазону от минимального
      // до установленного занчения
      function NumberIsInRangeToValue(const parNumber: Integer): Boolean;

      // Конструктор - создание целого числа, ограниченнога в пределах диапазона
      constructor Create(const parMin, parMax, parValue: Integer);
  end; // RangedInteger
  //----------------------------------------------------------------------------


implementation

// Процедура - установка значения
// parValue - заданное целое значение числа
procedure RangedInteger.SetValue(parValue: Integer);
begin
  // Значение задаётся в пределах установленного диапазона
  if parValue < m_Min then
    m_Value:=m_Min
  else
    if parValue > m_Max then
      m_Value:=m_Max
    else m_Value:=parValue;
end; // RangedInteger.SetValue
//------------------------------------------------------------------------------

// Функция - признак принадлежности числа предельному диапазону
// parNumber - заданное целое число
function RangedInteger.NumberIsInLimitingRange
  (const parNumber: Integer): Boolean;
begin
  if (parNumber < m_Min) or (parNumber > m_Max) then
    Result:=False
  else
    Result:=True;
end; // RangedInteger.NumberIsInLimitingRange
//------------------------------------------------------------------------------

// Функция - признак принадлежности числа диапазону от минимального
// до установленного занчения
// parNumber - заданное целое число
function RangedInteger.NumberIsInRangeToValue
  (const parNumber: Integer): Boolean;
begin
  if (parNumber < m_Min) or (parNumber > m_Value) then
    Result:=False
  else
    Result:=True;
end; // RangedInteger.NumberIsInRangeToValue
//------------------------------------------------------------------------------

// Конструктор - создание целого числа, ограниченнога в пределах диапазона
// parMin - заданная нижняя целая граница диапазона числа
// parMax - заданная верхняя целая граница диапазона числа
// parValue - заданное целое значение числа
constructor RangedInteger.Create(const parMin, parMax, parValue: Integer);
begin
  // Если минимум больше максимума, границы меняются местами
  if parMax < parMin then
    begin
      m_Min:=parMax;
      m_Max:=parMin;
    end // if
  else
    begin
      m_Min:=parMin;
      m_Max:=parMax;
    end; // else
  // Установка значения
  Value:=parValue;
end; // RangedInteger.Create
//------------------------------------------------------------------------------

end. // RangedIntegerUnit

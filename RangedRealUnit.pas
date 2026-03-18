// Модуль класса дробного числа, ограниченнога в пределах диапазона
unit RangedRealUnit;

interface

type
  // Класс - дробное число, ограниченное в пределах диапазона
  RangedReal = class
    protected
      // Поле - минимальное значение
      m_Min: Real;
      // Поле - максимальное значение
      m_Max: Real;
      // Поле - значение
      m_Value: Real;

      // Процедура - установка значени¤
      procedure SetValue(parValue: Real);

    public
      // Свойство - минимальное значение
      property Min:   Real read m_Min;
      // Свойство - максимальное значение
      property Max:   Real read m_Max;
      // Свойство - значение
      property Value: Real read m_Value write SetValue;

      // Конструктор - создание целого числа, ограниченнога в пределах диапазона
      constructor Create(const parMin, parMax, parValue: Real);
  end; // RangedReal
  //----------------------------------------------------------------------------


implementation

// Процедура - установка значени¤
// parValue - заданное дробное значение числа
procedure RangedReal.SetValue(parValue: Real);
begin
  // Значение задаЄтс¤ в пределах установленного диапазона
  if parValue < m_Min then
    m_Value:=m_Min
  else
    if parValue > m_Max then
      m_Value:=m_Max
    else m_Value:=parValue;
end; // RangedReal.SetValue
//------------------------------------------------------------------------------

// Конструктор - создание целого числа, ограниченнога в пределах диапазона
// parMin - заданна¤ нижн¤¤ дробна¤ граница диапазона числа
// parMax - заданна¤ верхн¤¤ дробна¤ граница диапазона числа
// parValue - заданное дробное значение числа
constructor RangedReal.Create(const parMin, parMax, parValue: Real);
begin
  // Если минимум больше максимума, границы мен¤ютс¤ местами
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
  // Остановка значени¤
  Value:=parValue;
end; // RangedReal.Create
//------------------------------------------------------------------------------

end. // RangedRealUnit

// Модуль ядра: базовые константы и функции
unit KernelUnit;

interface

const
  // Пустая строка
  EMPTY_STRING = '';
  // Строка отступа
  TABULATION_STRING = '     ';

  // Бит истинности в изображении цифры по умолчанию
  DEFAULT_TRUE_BIT = '1';
  // Бит ложности в изображении цифры по умолчанию
  DEFAULT_FALSE_BIT = '0';

  // Минимальное количество бит изображения цыфры
  MIN_NUMERAL_BITS_NUMBER = 0;
  // Максимальное количество бит изображения цыфры
  MAX_NUMERAL_BITS_NUMBER = 255;

  // Минимальное количество цифр
  MIN_NUMERALS_NUMBER = 0;
  // Максимальное количество цифр
  MAX_NUMERALS_NUMBER = 10;

  // Минимальное значение коэффициента обучаемости сети
  MIN_EDUCATION_VELOCITY_COEFFICIENT = 0.0001;
  // Максимальное значение коэффициента обучаемости сети
  MAX_EDUCATION_VELOCITY_COEFFICIENT = 1;

  // Максимальное количество бит стороны квадрата изображения цифры
  MAX_NUMARAL_SQUARE_SIDE_BITS_NUMBER = 15;
  // Максимальное количество бит квадрата изображения цифры
  MAX_NUMARAL_SQUARE_BITS_NUMBER = MAX_NUMARAL_SQUARE_SIDE_BITS_NUMBER *
                                   MAX_NUMARAL_SQUARE_SIDE_BITS_NUMBER;

  // Параметры функции плотности распределения вероятностей
  C: Real = 5;
  B: Real = 2;

  // Заголовок процесса настройки сети
  NET_ADJUSTMENT_CAPTION = 'Настройка сети...';
  // Заголовок чётной цифры
  EVEN_NUMERAL_CAPTION = 'Цифра чётная';
  // Заголовок нечётной цифры  
  NOT_EVEN_NUMERAL_CAPTION = 'Цифра нечётная';

type
  // Тип - диапазон длины строки битового изображения цифры
  NumeralBitsNumberRange = MIN_NUMERAL_BITS_NUMBER..MAX_NUMERAL_BITS_NUMBER;
  // Тип - диапазон количества цифр
  NumeralsNumberRange = MIN_NUMERALS_NUMBER..MAX_NUMERALS_NUMBER;
  // Тип - диапазон количества бит стороны квадрата изображения цифры
  NumeralSquareSideBitsNumberRange = 1..MAX_NUMARAL_SQUARE_SIDE_BITS_NUMBER;
  // Тип - текстовый файл
  TextFile = Text;

// Функция - случайно cмоделированная величина,
// распределённая по нормальному закону распределения на интервале [0; 1)
function NormalDistributedRangedValue: Real;
// Функция - случайно cмоделированная величина,
// отвечающая логарифмически-нормальному распределения
function LogarithmicNormalDistributedValue: Real;


implementation

// Функция - случайно cмоделированная величина,
// распределённая по нормальному закону распределения на интервале [0; 1)
function NormalDistributedRangedValue: Real;
var
  // Параметры циклов.
  i: Byte;
  // Случайлое число в интервале [0; 1)
  locRandom: Real;

begin
  // Получение значения реализации случайной величины,
  // соласно центральной предельной теореме
  Result:=0;
  for i:=1 to 12 do
    begin
      locRandom:=Random;
      Result:=Result + locRandom;
    end; // for

  Result:=Result - 6;
end; // NormalDistributedRangedValue
//------------------------------------------------------------------------------

// Функция - случайно cмоделированная величина,
// отвечающая логарифмически-нормальному распределения
function LogarithmicNormalDistributedValue: Real;
begin
  Result:=Exp(C * NormalDistributedRangedValue + B);
end; // LogarithmicNormalDistributedValue
//------------------------------------------------------------------------------

end. // KernelUnit


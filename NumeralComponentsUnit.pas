// Модуль класса указателей на компоненты числа
unit NumeralComponentsUnit;

interface

uses                      
  StdCtrls, Spin, ExtCtrls, Buttons;

type
  // Указатели на компоненты
  // Указатель на панель
  PPanel       = ^TPanel;
  // Указатель на поле редактирования
  PEdit        = ^TEdit;
  // Указатель на коробочку выбора опции
  PCheckBox    = ^TCheckBox;
  // Указатель на быструю кнопку
  PSpeedButton = ^TSpeedButton;
  // Указатель на поле с прокруткой значений
  PSpinEdit    = ^TSpinEdit;

  // Класс - указатели на компоненты числа
  NumeralComponents = class
    protected
      // Функция - получение видимости
      function  GetVisible: Boolean;
      // Процедура - установка видимости
      procedure SetVisible(parValue: Boolean);

    public
      // Поле - панель-контейнер
      ContainerPanel:     PPanel;
      // Поле - поле битового представления
      BitsEdit:           PEdit;
      // Поле - выбор прзнака чётности числа
      IsEvenCheckBox:     PCheckBox;
      // Поле - кнопка вызова изображения цифры
      PictureSpeedButton: PSpeedButton;

      // Свойство - видимость
      property Visible: Boolean read GetVisible write SetVisible;      

      // Конструктор - создание указателей на компоненты числа
      constructor Create(locContainerPanel: PPanel; locBitsEdit: PEdit;
        locIsEvenCheckBox: PCheckBox; locPictureSpeedButton: PSpeedButton);
  end; // NumeralComponents


implementation

// Конструктор - создание указателей на компоненты числа
// locContainerPanel - заданный указатель на панель-контейнер
// locBitsEdit - заданный указатель на поле редактирования
//   битового представления цифры
// locIsEvenCheckBox - заданный указатель на коробочку установки
//   признака чётности цифры
// locPictureSpeedButton - заданный указатель на быструю кнопку
//   вывода изображения цифры
constructor NumeralComponents.Create(locContainerPanel: PPanel; locBitsEdit: PEdit;
  locIsEvenCheckBox: PCheckBox; locPictureSpeedButton: PSpeedButton);
begin
  ContainerPanel:=locContainerPanel;
  BitsEdit:=locBitsEdit;
  IsEvenCheckBox:=locIsEvenCheckBox;
  PictureSpeedButton:=locPictureSpeedButton;
end; // NumeralComponents.Create
//------------------------------------------------------------------------------

// Функция - получение видимости
function NumeralComponents.GetVisible: Boolean;
begin
  Result:=ContainerPanel^.Visible;
end; // NumeralComponents.GetVisible
//------------------------------------------------------------------------------

// Процедура - установка видимости
// parValue - заданный признак видимости компонентов свойств цифры
procedure NumeralComponents.SetVisible(parValue: Boolean);
begin
  ContainerPanel^.Visible:=parValue;
end; // NumeralComponents.SetVisible
//------------------------------------------------------------------------------

end. // NumeralComponentsUnit

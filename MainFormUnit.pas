// Модуль класса главной формы
unit MainFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls, Buttons, KernelUnit, NumeralComponentsUnit,
  NeuronNetUnit, ComCtrls, ToolWin, ImgList;

type
  // Класс главной формы
  TMainForm = class(TForm)
    // Пенель исходных данных
    m_TopPanel: TPanel;

    // Компоненты количества цифр
    m_NumeralsNumberPanel: TPanel;
    m_NumeralsNumberSpinEdit: TSpinEdit;
    m_NumeralsNumberLabel: TLabel;
    // Компоненты количества бит изображения цифры в ширину
    m_NetWidthPanel: TPanel;
    m_NetWidthSpinEdit: TSpinEdit;
    m_NetWidthLabel: TLabel;
    // Компоненты количества бит изображения цифры в высоту
    m_NetHeighPanel: TPanel;
    m_NetHeighSpinEdit: TSpinEdit;
    m_NetHeighLabel: TLabel;
    // Компоненты коэффициента обучаемости сети
    m_EVCoefficientPanel: TPanel;
    m_EVCoefficientEdit: TEdit;
    m_EVCoefficientLabel: TLabel;

    // Панель цифр и весовых коэффициентов
    m_CenterPanel: TPanel;

    // Панель весовых коэффициентов
    m_WeightsPanel: TPanel;

    // Компоненты порога суммы
    m_SumThresholdPanel: TPanel;
    m_SumThresholdEdit: TEdit;
    m_SumThresholdLabel: TLabel;
    // Окно весовых коэффициентов
    m_WeightsMemo: TMemo;

    // Панель цифр
    m_NumeralsPanel: TPanel;

    // Текст заголовка номера цифры
    m_NumeralNumberStaticText: TStaticText;
    // Текст заголовка чётности цифры
    m_NumeralIsEvenStaticText: TStaticText;
    // Текст заголовка изображения цифры
    m_NumeralPictureStaticText: TStaticText;
    // Текст заголовка битового представления цифры
    m_NumeralBitsStaticText: TStaticText;
    // Панели компонентов цифр
    m_NumeralPanel1: TPanel;
    m_NumeralPanel2: TPanel;
    m_NumeralPanel3: TPanel;
    m_NumeralPanel4: TPanel;
    m_NumeralPanel5: TPanel;
    m_NumeralPanel6: TPanel;
    m_NumeralPanel7: TPanel;
    m_NumeralPanel8: TPanel;
    m_NumeralPanel9: TPanel;
    m_NumeralPanel10: TPanel;
    // Тексты нидексов цифр
    m_NumeralNumberStaticText1: TStaticText;
    m_NumeralNumberStaticText2: TStaticText;
    m_NumeralNumberStaticText3: TStaticText;
    m_NumeralNumberStaticText4: TStaticText;
    m_NumeralNumberStaticText5: TStaticText;
    m_NumeralNumberStaticText6: TStaticText;
    m_NumeralNumberStaticText7: TStaticText;
    m_NumeralNumberStaticText8: TStaticText;
    m_NumeralNumberStaticText9: TStaticText;
    m_NumeralNumberStaticText10: TStaticText;
    // Коробочки выбора признаков чётности цифр
    m_NumeralIsEvenCheckBox1: TCheckBox;
    m_NumeralIsEvenCheckBox2: TCheckBox;
    m_NumeralIsEvenCheckBox3: TCheckBox;
    m_NumeralIsEvenCheckBox4: TCheckBox;
    m_NumeralIsEvenCheckBox5: TCheckBox;
    m_NumeralIsEvenCheckBox6: TCheckBox;
    m_NumeralIsEvenCheckBox7: TCheckBox;
    m_NumeralIsEvenCheckBox8: TCheckBox;
    m_NumeralIsEvenCheckBox9: TCheckBox;
    m_NumeralIsEvenCheckBox10: TCheckBox;
    // Быстрые кнопки вызова битовых изображений цифр
    m_NumeralPictureSpeedButton1: TSpeedButton;
    m_NumeralPictureSpeedButton2: TSpeedButton;
    m_NumeralPictureSpeedButton3: TSpeedButton;
    m_NumeralPictureSpeedButton4: TSpeedButton;
    m_NumeralPictureSpeedButton5: TSpeedButton;
    m_NumeralPictureSpeedButton6: TSpeedButton;
    m_NumeralPictureSpeedButton7: TSpeedButton;
    m_NumeralPictureSpeedButton8: TSpeedButton;
    m_NumeralPictureSpeedButton9: TSpeedButton;
    m_NumeralPictureSpeedButton10: TSpeedButton;
    // Поля строк битовых представлений цифр
    m_NumeralBitsEdit1: TEdit;
    m_NumeralBitsEdit2: TEdit;
    m_NumeralBitsEdit3: TEdit;
    m_NumeralBitsEdit4: TEdit;
    m_NumeralBitsEdit5: TEdit;
    m_NumeralBitsEdit6: TEdit;
    m_NumeralBitsEdit7: TEdit;
    m_NumeralBitsEdit8: TEdit;
    m_NumeralBitsEdit9: TEdit;
    m_NumeralBitsEdit10: TEdit;

    // Панель настройки и тестирования
    m_BottomPanel: TPanel;

    // Кнопка настройки сети
    m_AdjustNetBitBtn: TBitBtn;

    // Компоненты тестирования чётности цифры
    m_SomeNumeralBitsEdit: TEdit;
    m_SomeNumeralPictureSpeedButton: TSpeedButton;
    m_SomeNumeralIsEvenStaticText: TStaticText;
    m_CheckNetBitBtn: TBitBtn;

    // Главная панель
    m_ToolBar: TToolBar;

    // Разделители
    m_SeperatorToolButton1: TToolButton;
    m_SeperatorToolButton2: TToolButton;
    m_SeperatorToolButton3: TToolButton;
    m_SeperatorToolButton4: TToolButton;
    // Кнопка создания новых цифр
    m_NewBitBtn: TBitBtn;
    // Кнопка загрузки цифр
    m_OpenBitBtn: TBitBtn;
    // Кнопка записи цифр
    m_SaveBitBtn: TBitBtn;
    // Кнопка о прогамме
    m_AboutBitBtn: TBitBtn;
    // Диалог загрузки
    m_OpenDialog: TOpenDialog;
    // Диалог сохранения
    m_SaveDialog: TSaveDialog;

    // Процедура - выбор количества цифр
    procedure m_NumeralsNumberSpinEditChange(Sender: TObject);
    // Процедура - выбор количества бит изображения цифры в ширину
    procedure m_NetWidthSpinEditChange(Sender: TObject);
    // Процедура - выбор количества бит изображения цифры в высоту
    procedure m_NetHeighSpinEditChange(Sender: TObject);
    // Процедура - выбор коэффициента скорости обучаемости сети
    procedure m_EVCoefficientEditChange(Sender: TObject);

    // Процедуры - вызов формы изображения цифры
    procedure m_NumeralPictureSpeedButton1Click(Sender: TObject);
    procedure m_NumeralPictureSpeedButton2Click(Sender: TObject);
    procedure m_NumeralPictureSpeedButton3Click(Sender: TObject);
    procedure m_NumeralPictureSpeedButton4Click(Sender: TObject);
    procedure m_NumeralPictureSpeedButton5Click(Sender: TObject);
    procedure m_NumeralPictureSpeedButton6Click(Sender: TObject);
    procedure m_NumeralPictureSpeedButton7Click(Sender: TObject);
    procedure m_NumeralPictureSpeedButton8Click(Sender: TObject);
    procedure m_NumeralPictureSpeedButton9Click(Sender: TObject);
    procedure m_NumeralPictureSpeedButton10Click(Sender: TObject);
    procedure m_SomeNumeralPictureSpeedButtonClick(Sender: TObject);

    // Процедура - настройка сети
    procedure m_AdjustNetBitBtnClick(Sender: TObject);
    // Процедура - проверка чётности цифры
    procedure m_CheckNetBitBtnClick(Sender: TObject);

    // Процедура - создание новых цифр
    procedure m_NewBitBtnClick(Sender: TObject);
    // Процедура - открытие файлы цифр
    procedure m_OpenBitBtnClick(Sender: TObject);
    // Процедура - сохранение цифр
    procedure m_SaveBitBtnClick(Sender: TObject);

    // Процедура - вызов сведений о программе
    procedure m_AboutBitBtnClick(Sender: TObject);

    // Процедура - создание формы
    procedure FormCreate(Sender: TObject);
    // Процедура - уничтожение формы
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

    // Поле - массив указателей на компоненты чисел
    NumeralsComponents: Array[1..MAX_NUMERALS_NUMBER] of NumeralComponents;
    // Поле - нейронная сеть чётности
    PartityNeuronNet: NeuronNet;
    // Поле - указатель на компонент битового представления текущей цифры
    CurrentNumeralBitsEdit: PEdit;

    // Процедура - изменение значения диапазона компонента
    procedure SpinEditChange(parSpinEdit: PSpinEdit);
    // Процедура - вызов формы изображения цифры,
    // чьё битовое изображение записано в поле
    procedure NumeralPictureFormShowModal(parNumeralBitsEdit: PEdit);
  end; // TMainForm
  //----------------------------------------------------------------------------

var
  MainForm: TMainForm;


implementation

{$R *.dfm}

uses
  NumeralPictureFormUnit, AboutBoxUnit;

// Процедура - изменение значения диапазона компонента
procedure TMainForm.SpinEditChange(parSpinEdit: PSpinEdit);
begin
  // Недопустимость пустого значения - замена минимальным
  if parSpinEdit^.Text = EMPTY_STRING then
    parSpinEdit^.Value:=parSpinEdit^.MinValue;
end; // TMainForm.SpinEditChange
//------------------------------------------------------------------------------

// Процедура - выбор количества цифр
procedure TMainForm.m_NumeralsNumberSpinEditChange(Sender: TObject);
var
  // Количество цифр
  i: NumeralsNumberRange;
begin
  // Недопустимость пустого значения - замена минимальным
  SpinEditChange(@m_NumeralsNumberSpinEdit);

  // Видимоть компонентов только указанного количества цифр
  for i:=1 to m_NumeralsNumberSpinEdit.Value do
    NumeralsComponents[i].Visible:=True;
  for i:=m_NumeralsNumberSpinEdit.Value + 1 to MAX_NUMERALS_NUMBER do
    NumeralsComponents[i].Visible:=False;
end; // TMainForm.m_NumeralsNumberSpinEditChange
//------------------------------------------------------------------------------

// Процедура - выбор количества бит изображения цифры в ширину
procedure TMainForm.m_NetWidthSpinEditChange(Sender: TObject);
begin
  SpinEditChange(@m_NetWidthSpinEdit);
end; // TMainForm.m_NetWidthSpinEditChange
//------------------------------------------------------------------------------

// Процедура - выбор количества бит изображения цифры в высоту
procedure TMainForm.m_NetHeighSpinEditChange(Sender: TObject);
begin
  SpinEditChange(@m_NetHeighSpinEdit);
end; // TMainForm.m_NetHeighSpinEditChange
//------------------------------------------------------------------------------

// Процедура - выбор коэффициента скорости обучаемости сети
procedure TMainForm.m_EVCoefficientEditChange(Sender: TObject);
begin
  try
    StrToFloat(m_EVCoefficientEdit.Text);
  except
    m_EVCoefficientEdit.Text:=FloatToStr(MIN_EDUCATION_VELOCITY_COEFFICIENT);
  end;
end; // TMainForm.m_EVCoefficientEditChange
//------------------------------------------------------------------------------

// Процедура - вызов формы изображения цифры,
// чьё битовое изображение записано в поле
procedure TMainForm.NumeralPictureFormShowModal(parNumeralBitsEdit: PEdit);
begin
  CurrentNumeralBitsEdit:=parNumeralBitsEdit;
  NumeralPictureForm:=TNumeralPictureForm.Create(NumeralPictureForm);
  NumeralPictureForm.ShowModal;
end; // TMainForm.NumeralPictureFormShowModal
//------------------------------------------------------------------------------

// Процедуры - вызов формы изображения цифры
procedure TMainForm.m_NumeralPictureSpeedButton1Click(Sender: TObject);
begin
  NumeralPictureFormShowModal(@m_NumeralBitsEdit1);
end; // TMainForm.m_NumeralPictureSpeedButton1Click

procedure TMainForm.m_NumeralPictureSpeedButton2Click(Sender: TObject);
begin
  NumeralPictureFormShowModal(@m_NumeralBitsEdit2);
end; // TMainForm.m_NumeralPictureSpeedButton2Click

procedure TMainForm.m_NumeralPictureSpeedButton3Click(Sender: TObject);
begin
  NumeralPictureFormShowModal(@m_NumeralBitsEdit3);
end; // TMainForm.m_NumeralPictureSpeedButton3Click

procedure TMainForm.m_NumeralPictureSpeedButton4Click(Sender: TObject);
begin
  NumeralPictureFormShowModal(@m_NumeralBitsEdit4);
end; // TMainForm.m_NumeralPictureSpeedButton4Click

procedure TMainForm.m_NumeralPictureSpeedButton5Click(Sender: TObject);
begin
  NumeralPictureFormShowModal(@m_NumeralBitsEdit5);
end; // TMainForm.m_NumeralPictureSpeedButton5Click

procedure TMainForm.m_NumeralPictureSpeedButton6Click(Sender: TObject);
begin
  NumeralPictureFormShowModal(@m_NumeralBitsEdit6);
end; // TMainForm.m_NumeralPictureSpeedButton6Click

procedure TMainForm.m_NumeralPictureSpeedButton7Click(Sender: TObject);
begin
  NumeralPictureFormShowModal(@m_NumeralBitsEdit7);
end; // TMainForm.m_NumeralPictureSpeedButton7Click

procedure TMainForm.m_NumeralPictureSpeedButton8Click(Sender: TObject);
begin
  NumeralPictureFormShowModal(@m_NumeralBitsEdit8);
end; // TMainForm.m_NumeralPictureSpeedButton8Click

procedure TMainForm.m_NumeralPictureSpeedButton9Click(Sender: TObject);
begin
  NumeralPictureFormShowModal(@m_NumeralBitsEdit9);
end; // TMainForm.m_NumeralPictureSpeedButton9Click

procedure TMainForm.m_NumeralPictureSpeedButton10Click(Sender: TObject);
begin
  NumeralPictureFormShowModal(@m_NumeralBitsEdit10);
end; // TMainForm.m_NumeralPictureSpeedButton10Click

procedure TMainForm.m_SomeNumeralPictureSpeedButtonClick(Sender: TObject);
begin
  NumeralPictureFormShowModal(@m_SomeNumeralBitsEdit);
end; // TMainForm.m_SomeNumeralPictureSpeedButtonClick
//------------------------------------------------------------------------------

// Процедура - настройка сети
procedure TMainForm.m_AdjustNetBitBtnClick(Sender: TObject);
var
  // Счётчик цифр
  locNumeralIndex: NumeralsNumberRange;
  // Счётчик бит изображения цифры
  locNumeralBitsIndex: NumeralBitsNumberRange;
  // Признак существования эквивалентных цифр
  locSomeNumeralsAreEqual: Boolean;
begin
  // Количество цифр
  PartityNeuronNet.NumeralsNumber:=m_NumeralsNumberSpinEdit.Value;
  // Количество бит для представления одной цифры
  PartityNeuronNet.NumeralBitsNumber:=m_NetWidthSpinEdit.Value *
    m_NetHeighSpinEdit.Value;
  // Коэффициент обучаемости сети
  PartityNeuronNet.EducationVelocityCoefficient:=
    StrToFloat(m_EVCoefficientEdit.Text);

  // Битовые представления цифр и их действительные прзнаки чётности
  for locNumeralIndex:=1 to PartityNeuronNet.NumeralsNumber do
    begin
      PartityNeuronNet.NumeralBits[locNumeralIndex]:=
        NumeralsComponents[locNumeralIndex].BitsEdit^.Text;
      PartityNeuronNet.NumeralIsEvenReal[locNumeralIndex]:=
        NumeralsComponents[locNumeralIndex].IsEvenCheckBox^.Checked;
    end; // for

  // Недоступность посторной настройки и тестирования
  m_AdjustNetBitBtn.Enabled:=False;
  m_CheckNetBitBtn.Enabled:=False;
  // Очистка весовых коэффициентов
  m_WeightsMemo.Clear;
  m_WeightsMemo.Lines.Add(EMPTY_STRING);
  m_WeightsMemo.Lines.Add(TABULATION_STRING + NET_ADJUSTMENT_CAPTION);
  m_WeightsMemo.Lines.Add(EMPTY_STRING);
  m_WeightsMemo.Lines.Add(EMPTY_STRING);
  m_WeightsMemo.Lines.Add(EMPTY_STRING);    

  // Настройка сети
  PartityNeuronNet.AdjustWeights(locSomeNumeralsAreEqual);

  // Вывод полученных данных
  // Битовые представления цифр
  for locNumeralIndex:=1 to PartityNeuronNet.NumeralsNumber do
    NumeralsComponents[locNumeralIndex].BitsEdit^.Text:=
      PartityNeuronNet.NumeralBits[locNumeralIndex];
  // Коэффициент обучаемости сети
  m_EVCoefficientEdit.Text:=
    FloatToStr(PartityNeuronNet.EducationVelocityCoefficient);
  // Порог суммы
  m_SumThresholdEdit.Text:=FloatToStr(PartityNeuronNet.SumThreshold);
  // Очистка весовых коэффициентов
  m_WeightsMemo.Lines.Clear;

  // Если сеть настроена
  if not locSomeNumeralsAreEqual then
    begin
      m_WeightsMemo.Lines.Add(EMPTY_STRING);
      for locNumeralBitsIndex:=1 to PartityNeuronNet.NumeralBitsNumber do
        m_WeightsMemo.Lines.Add(Format(TABULATION_STRING +
          'W[ %.3d ] = %22.18f', [Integer(locNumeralBitsIndex),
          PartityNeuronNet.Weight[locNumeralBitsIndex]]));

      // Доступность проверки цифры
      m_CheckNetBitBtn.Enabled:=True;
    end // if
  else
    Application.MessageBox('Некоторые цифры эквивалентны',
      'Сеть не настроена', MB_OK + MB_ICONWARNING);

  // Недоступность посторной настройки
  m_AdjustNetBitBtn.Enabled:=True;
end; // TMainForm.m_AdjustNetBitBtnClick
//------------------------------------------------------------------------------

// Процедура - проверка чётности цифры
procedure TMainForm.m_CheckNetBitBtnClick(Sender: TObject);
var
  // Строка битового представления заданной цифры
  locSomeNumeralBits: String;
begin
  locSomeNumeralBits:=m_SomeNumeralBitsEdit.Text;
  // Проверка чётности некоторой цифры, представленной в битовой строке
  if PartityNeuronNet.SomeNumeralIsEven(locSomeNumeralBits) then
    m_SomeNumeralIsEvenStaticText.Caption:=EVEN_NUMERAL_CAPTION
  else
    m_SomeNumeralIsEvenStaticText.Caption:=NOT_EVEN_NUMERAL_CAPTION;
  // Вывод цифры
  m_SomeNumeralBitsEdit.Text:=locSomeNumeralBits;
end; // TMainForm.m_CheckNetBitBtnClick
//------------------------------------------------------------------------------

// Процедура - создание новых цифр
procedure TMainForm.m_NewBitBtnClick(Sender: TObject);
var
  // Счётчик количества цифр
  locNumeralIndex: NumeralsNumberRange;
begin
  // Установки минимальных исходных значений количества цифр
  // и бит по горизонтали и вертикали сетки изображения цифры
  m_NumeralsNumberSpinEdit.Text:=IntToStr(m_NumeralsNumberSpinEdit.MinValue);
  m_NetWidthSpinEdit.Text:=IntToStr(m_NetWidthSpinEdit.MinValue);
  m_NetHeighSpinEdit.Text:=IntToStr(m_NetHeighSpinEdit.MinValue);

  // Очистка компонентов цифр
  for locNumeralIndex:=1 to MAX_NUMERALS_NUMBER do
    begin
      NumeralsComponents[locNumeralIndex].IsEvenCheckBox^.Checked:=False;
      NumeralsComponents[locNumeralIndex].BitsEdit^.Text:=EMPTY_STRING;
    end; // for
end; // TMainForm.m_NewBitBtnClick
//------------------------------------------------------------------------------

// Процедура - открытие файлы цифр
procedure TMainForm.m_OpenBitBtnClick(Sender: TObject);
var
  // Текстовый файл
  locTextFile: TextFile;
  // Имя текстового файла
  locFileName: String;
  // Индекс строки файла
  locFileStringIndex: Integer;
  // Строка из фала
  locFileString: String;
begin
  // Если выбран файл
  if m_OpenDialog.Execute then
    begin
      locFileName:=m_OpenDialog.FileName;
      AssignFile(locTextFile, locFileName);
      Reset(locTextFile);

      // Создание новых цифр - установка значений по умочнию
      m_NewBitBtn.OnClick(m_NewBitBtn);

      // Чтение файла
      locFileStringIndex:=0;
      while not Eof(locTextFile) do
        begin
          locFileStringIndex:=locFileStringIndex + 1;
          // Чтение очередной строки
          ReadLn(locTextFile, locFileString);
          locFileString:=Trim(locFileString);

          // Выбор параметра чтения в зависимости от индекса прочитанной строки
          case locFileStringIndex of
            1:
              // Количество цифр
              try
                m_NumeralsNumberSpinEdit.Value:=StrToInt(locFileString);
              except
              end; // try

            2:
              // Количество бит изображения по горизонтали
              try
                m_NetWidthSpinEdit.Value:=StrToInt(locFileString);
              except
              end; // try

            3:
              // Количество бит изображения по вертикали
              try
                m_NetHeighSpinEdit.Value:=StrToInt(locFileString);
              except
              end; // try

            else
              // Просмотр строк битовых изображений цифр
              begin
                // Если строка непуста,
                // то первый символ означает прзнак чётности
                if Length(locFileString) > 0 then
                  begin
                    if locFileString[1] = DEFAULT_TRUE_BIT then
                      NumeralsComponents[locFileStringIndex - 3].
                        IsEvenCheckBox^.Checked:=True;

                    // Если длина строки больше одного, то она содержит
                    // также биты изображение цифры
                    if Length(locFileString) > 1 then
                      NumeralsComponents[locFileStringIndex - 3].BitsEdit^.
                        Text:=Copy(locFileString, 2, Length(locFileString) - 1);
                  end; // if
              end; // else
          end; // case
        end; // while

      CloseFile(locTextFile);
    end; // if
end; // TMainForm.m_OpenBitBtnClick
//------------------------------------------------------------------------------

// Процедура - сохранение цифр
procedure TMainForm.m_SaveBitBtnClick(Sender: TObject);
var
  // Текстовый файл
  locTextFile: TextFile;
  // Имя текстового файла
  locFileName: String;
  // Индекс строки файла
  locFileStringIndex: Integer;
  // Строка из фала
  locFileString: String;
begin
  // Если выбран файл
  if m_SaveDialog.Execute then
    begin
      locFileName:=m_SaveDialog.FileName;
      AssignFile(locTextFile, locFileName);
      Rewrite(locTextFile);

      // Формирование строки для записи файла
      locFileStringIndex:=0;
      // Пока не записаны все цифры
      while (locFileStringIndex - 3) < m_NumeralsNumberSpinEdit.Value do
        begin
          locFileStringIndex:=locFileStringIndex + 1;
          // Выбор параметра записи в зависимости от индекса заполняемой строки
          case locFileStringIndex of
            1:
              // Количество цифр
              locFileString:=IntToStr(m_NumeralsNumberSpinEdit.Value);
            2:
              // Количество бит изображения по горизонтали
              locFileString:=IntToStr(m_NetWidthSpinEdit.Value);
            3:
              // Количество бит изображения по вертикали
              locFileString:=IntToStr(m_NetHeighSpinEdit.Value);

            else
              // Просмотр строк битовых изображений цифр
              begin
                // Первый символ означает признак чётности
                if NumeralsComponents[locFileStringIndex - 3].IsEvenCheckBox^.
                  Checked then
                  locFileString:=DEFAULT_TRUE_BIT
                else
                  locFileString:=DEFAULT_FALSE_BIT;

                // Далее строка содержит биты изображение цифры
                locFileString:=locFileString +
                  NumeralsComponents[locFileStringIndex - 3].BitsEdit^.Text;
              end; // else
          end; // case
          
          // Запись строки в файл
          WriteLn(locTextFile, locFileString);
        end; // while

      CloseFile(locTextFile);
    end; // if
end; // TMainForm.m_SaveBitBtnClick
//------------------------------------------------------------------------------

// Процедура - вызов сведений о программе
procedure TMainForm.m_AboutBitBtnClick(Sender: TObject);
begin
  AboutBox.ShowModal;
end; // TMainForm.m_AboutBitBtnClick
//------------------------------------------------------------------------------

// Процедура - создание формы
procedure TMainForm.FormCreate(Sender: TObject);
begin
  // Ассоциация компонентов в цифрами
  NumeralsComponents[1]:=NumeralComponents.Create(@m_NumeralPanel1,
    @m_NumeralBitsEdit1, @m_NumeralIsEvenCheckBox1,
    @m_NumeralPictureSpeedButton1);
  NumeralsComponents[2]:=NumeralComponents.Create(@m_NumeralPanel2,
    @m_NumeralBitsEdit2, @m_NumeralIsEvenCheckBox2,
    @m_NumeralPictureSpeedButton2);
  NumeralsComponents[3]:=NumeralComponents.Create(@m_NumeralPanel3,
    @m_NumeralBitsEdit3, @m_NumeralIsEvenCheckBox3,
    @m_NumeralPictureSpeedButton3);
  NumeralsComponents[4]:=NumeralComponents.Create(@m_NumeralPanel4,
    @m_NumeralBitsEdit4, @m_NumeralIsEvenCheckBox4,
    @m_NumeralPictureSpeedButton4);
  NumeralsComponents[5]:=NumeralComponents.Create(@m_NumeralPanel5,
    @m_NumeralBitsEdit5, @m_NumeralIsEvenCheckBox5,
    @m_NumeralPictureSpeedButton5);
  NumeralsComponents[6]:=NumeralComponents.Create(@m_NumeralPanel6,
    @m_NumeralBitsEdit6, @m_NumeralIsEvenCheckBox6,
    @m_NumeralPictureSpeedButton6);
  NumeralsComponents[7]:=NumeralComponents.Create(@m_NumeralPanel7,
    @m_NumeralBitsEdit7, @m_NumeralIsEvenCheckBox7,
    @m_NumeralPictureSpeedButton7);
  NumeralsComponents[8]:=NumeralComponents.Create(@m_NumeralPanel8,
    @m_NumeralBitsEdit8, @m_NumeralIsEvenCheckBox8,
    @m_NumeralPictureSpeedButton8);
  NumeralsComponents[9]:=NumeralComponents.Create(@m_NumeralPanel9,
    @m_NumeralBitsEdit9, @m_NumeralIsEvenCheckBox9,
    @m_NumeralPictureSpeedButton9);
  NumeralsComponents[10]:=NumeralComponents.Create(@m_NumeralPanel10,
    @m_NumeralBitsEdit10, @m_NumeralIsEvenCheckBox10,
    @m_NumeralPictureSpeedButton10);

  // Создание пустой нейронной сети
  PartityNeuronNet:=NeuronNet.Create(1, 1, StrToFloat(m_EVCoefficientEdit.Text));
end; // TMainForm.FormCreate
//------------------------------------------------------------------------------

// Процедура - уничтожение формы
procedure TMainForm.FormDestroy(Sender: TObject);
begin
  // Уничтожение нейронной сети
  PartityNeuronNet.Destroy;
end; // TMainForm.FormDestroy
//------------------------------------------------------------------------------

end. // MainFormUnit


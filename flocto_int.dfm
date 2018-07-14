object Form1: TForm1
  Left = 683
  Top = 151
  Width = 374
  Height = 661
  Caption = 'Evolution in fluctuating enviroment v0.75'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object LabelRate: TLabel
    Left = 16
    Top = 88
    Width = 39
    Height = 20
    Caption = 'Rate:'
  end
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 43
    Height = 20
    Caption = 'Model'
  end
  object LabelFluct: TLabel
    Left = 16
    Top = 328
    Width = 117
    Height = 20
    Caption = 'Range of Fluct.: '
  end
  object LabelSigma: TLabel
    Left = 16
    Top = 128
    Width = 49
    Height = 20
    Caption = 'Sigma:'
  end
  object Label3: TLabel
    Left = 16
    Top = 168
    Width = 116
    Height = 16
    Caption = 'Initial concentration:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 208
    Width = 117
    Height = 16
    Caption = 'Initial con. of mutant:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 16
    Top = 248
    Width = 75
    Height = 20
    Caption = 'Default X :'
  end
  object Label6: TLabel
    Left = 16
    Top = 288
    Width = 75
    Height = 20
    Caption = 'Default Y :'
  end
  object Label7: TLabel
    Left = 16
    Top = 368
    Width = 108
    Height = 16
    Caption = 'Num. of iterations :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 16
    Top = 536
    Width = 66
    Height = 20
    Caption = 'Pict. size:'
  end
  object LabelRefRat: TLabel
    Left = 16
    Top = 568
    Width = 97
    Height = 20
    Caption = 'Refresh rate :'
  end
  object Label8: TLabel
    Left = 152
    Top = 496
    Width = 53
    Height = 20
    Caption = 'K fact. :'
  end
  object EditForRate: TEdit
    Left = 136
    Top = 80
    Width = 209
    Height = 28
    TabOrder = 0
    Text = 'Put "r" (rate) here'
    OnChange = EditForRateChange
  end
  object ButtonInvExt: TButton
    Left = 192
    Top = 400
    Width = 153
    Height = 25
    Caption = 'Invasion/Extinction'
    TabOrder = 1
    OnClick = ButtonInvExtClick
  end
  object ComboBoxModel: TComboBox
    Left = 72
    Top = 8
    Width = 233
    Height = 28
    ItemHeight = 20
    ItemIndex = 0
    TabOrder = 2
    Text = 'Model 1'
    OnChange = ComboBoxModelChange
    Items.Strings = (
      'Model 1'
      'Model 2'
      'Model 3 uniform'
      'Model 4'
      'Model 3 two-valued'
      'Model 3 normal')
  end
  object EditModelIndex: TEdit
    Left = 312
    Top = 8
    Width = 33
    Height = 28
    TabOrder = 3
    Text = '1'
    OnChange = EditModelIndexChange
  end
  object EditFluctuation: TEdit
    Left = 136
    Top = 320
    Width = 209
    Height = 28
    TabOrder = 4
    Text = 'Put "fluctuation range" here'
    OnChange = EditFluctuationChange
  end
  object EditSigma: TEdit
    Left = 136
    Top = 120
    Width = 209
    Height = 28
    TabOrder = 5
    Text = 'Put "sigma" here'
    OnChange = EditSigmaChange
  end
  object EditConcentration: TEdit
    Left = 136
    Top = 160
    Width = 209
    Height = 28
    TabOrder = 6
    Text = 'Put initial concentration here'
    OnChange = EditConcentrationChange
  end
  object EditMutConcentration: TEdit
    Left = 136
    Top = 200
    Width = 209
    Height = 28
    TabOrder = 7
    Text = 'Put initial mutant conc. here'
    OnChange = EditMutConcentrationChange
  end
  object ButtonFittnes: TButton
    Left = 192
    Top = 432
    Width = 153
    Height = 25
    Caption = '"Fittness"'
    Enabled = False
    TabOrder = 8
  end
  object ButtonESS: TButton
    Left = 192
    Top = 464
    Width = 153
    Height = 25
    Caption = 'Branching mapp'
    TabOrder = 9
    OnClick = ButtonESSClick
  end
  object EditXdef: TEdit
    Left = 136
    Top = 240
    Width = 209
    Height = 28
    TabOrder = 10
    Text = '0'
    OnChange = EditXdefChange
  end
  object EditYdef: TEdit
    Left = 136
    Top = 280
    Width = 209
    Height = 28
    TabOrder = 11
    Text = '0.5'
    OnChange = EditYdefChange
  end
  object ButtonYvSigma: TButton
    Left = 16
    Top = 400
    Width = 169
    Height = 25
    Caption = 'Y versus Sigma'
    TabOrder = 12
    OnClick = ButtonYvSigmaClick
  end
  object ButtonYvFluct: TButton
    Left = 16
    Top = 464
    Width = 169
    Height = 25
    Caption = 'Y versus Fluct'
    TabOrder = 13
    OnClick = ButtonYvFluctClick
  end
  object EditIterations: TEdit
    Left = 136
    Top = 360
    Width = 209
    Height = 28
    TabOrder = 14
    Text = 'Put # of iterations here'
    OnChange = EditIterationsChange
  end
  object ButtonYvR: TButton
    Left = 16
    Top = 432
    Width = 169
    Height = 25
    Caption = 'Y versus Rate'
    TabOrder = 15
    OnClick = ButtonYvRClick
  end
  object ButtonAdvanced: TButton
    Left = 184
    Top = 40
    Width = 161
    Height = 25
    Caption = 'Advanced options'
    TabOrder = 16
    OnClick = ButtonAdvancedClick
  end
  object ButtonBranchFitt: TButton
    Left = 16
    Top = 496
    Width = 129
    Height = 25
    Caption = 'Branching Fitt'
    TabOrder = 17
    OnClick = ButtonBranchFittClick
  end
  object EditPipSize: TEdit
    Left = 120
    Top = 528
    Width = 121
    Height = 28
    TabOrder = 18
    Text = 'Put picture size here'
    OnChange = EditPipSizeChange
  end
  object CheckBoxClean: TCheckBox
    Left = 248
    Top = 536
    Width = 113
    Height = 17
    Caption = 'Clean picture'
    Checked = True
    State = cbChecked
    TabOrder = 19
  end
  object ButtonSavePip: TButton
    Left = 16
    Top = 600
    Width = 169
    Height = 25
    Caption = 'Save this picture as ...'
    TabOrder = 20
    OnClick = ButtonSavePipClick
  end
  object CheckBoxAutoSave: TCheckBox
    Left = 248
    Top = 568
    Width = 97
    Height = 17
    Caption = 'Auto save'
    TabOrder = 21
  end
  object SpinEditRefRate: TSpinEdit
    Left = 120
    Top = 560
    Width = 121
    Height = 30
    MaxValue = 20
    MinValue = 0
    TabOrder = 22
    Value = 10
    OnChange = SpinEditRefRateChange
  end
  object ButtonBye: TButton
    Left = 192
    Top = 600
    Width = 153
    Height = 25
    Caption = 'Bye! Bye!'
    TabOrder = 23
    OnClick = ButtonByeClick
  end
  object ButtonWhereIsPicture: TButton
    Left = 8
    Top = 40
    Width = 161
    Height = 25
    Caption = 'Where is my picture?'
    TabOrder = 24
    OnClick = ButtonWhereIsPictureClick
  end
  object EditKFactor: TEdit
    Left = 208
    Top = 496
    Width = 97
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    TabOrder = 25
    Text = 'Change K Factor here.'
    OnChange = EditKFactorChange
  end
  object ButtonSpecial: TButton
    Left = 312
    Top = 496
    Width = 33
    Height = 25
    Caption = '!!!'
    TabOrder = 26
    OnClick = ButtonSpecialClick
  end
  object SavePipPictureDialog: TSavePictureDialog
    DefaultExt = '.bmp'
    InitialDir = '.'
    Title = 'Save picture as ...'
    Left = 88
    Top = 72
  end
end

object Form1: TForm1
  Left = 199
  Top = 111
  Width = 1100
  Height = 667
  Caption = 'Evolution in fluctuating enviroment v0.55'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 20
  object pip: TImage
    Left = 8
    Top = 8
    Width = 729
    Height = 600
  end
  object LabelRate: TLabel
    Left = 744
    Top = 104
    Width = 39
    Height = 20
    Caption = 'Rate:'
  end
  object Label2: TLabel
    Left = 752
    Top = 24
    Width = 43
    Height = 20
    Caption = 'Model'
  end
  object LabelFluct: TLabel
    Left = 744
    Top = 344
    Width = 117
    Height = 20
    Caption = 'Range of Fluct.: '
  end
  object LabelSigma: TLabel
    Left = 744
    Top = 144
    Width = 49
    Height = 20
    Caption = 'Sigma:'
  end
  object Label3: TLabel
    Left = 744
    Top = 184
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
    Left = 744
    Top = 224
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
    Left = 744
    Top = 264
    Width = 75
    Height = 20
    Caption = 'Default X :'
  end
  object Label6: TLabel
    Left = 744
    Top = 304
    Width = 75
    Height = 20
    Caption = 'Default Y :'
  end
  object Label7: TLabel
    Left = 744
    Top = 384
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
    Left = 744
    Top = 576
    Width = 66
    Height = 20
    Caption = 'Pict. size:'
  end
  object LabelRefRat: TLabel
    Left = 928
    Top = 544
    Width = 97
    Height = 20
    Caption = 'Refresh rate :'
  end
  object EditForRate: TEdit
    Left = 864
    Top = 96
    Width = 209
    Height = 28
    TabOrder = 0
    Text = 'Put "r" (rate) here'
    OnChange = EditForRateChange
  end
  object OK: TButton
    Left = 920
    Top = 416
    Width = 161
    Height = 25
    Caption = 'Invasion/Extinction'
    TabOrder = 1
    OnClick = OKClick
  end
  object ComboBoxModel: TComboBox
    Left = 816
    Top = 24
    Width = 233
    Height = 28
    ItemHeight = 20
    ItemIndex = 3
    TabOrder = 2
    Text = 'Model 4'
    OnChange = ComboBoxModelChange
    Items.Strings = (
      'Model 1'
      'Model 2'
      'Model 3'
      'Model 4')
  end
  object EditModelIndex: TEdit
    Left = 1056
    Top = 24
    Width = 25
    Height = 28
    TabOrder = 3
    Text = '4'
    OnChange = EditModelIndexChange
  end
  object EditFluctuation: TEdit
    Left = 864
    Top = 336
    Width = 209
    Height = 28
    TabOrder = 4
    Text = 'Put "fluctuation range" here'
    OnChange = EditFluctuationChange
  end
  object EditSigma: TEdit
    Left = 864
    Top = 136
    Width = 209
    Height = 28
    TabOrder = 5
    Text = 'Put "sigma" here'
    OnChange = EditSigmaChange
  end
  object EditConcentration: TEdit
    Left = 864
    Top = 176
    Width = 209
    Height = 28
    TabOrder = 6
    Text = 'Put initial concentration here'
    OnChange = EditConcentrationChange
  end
  object EditMutConcentration: TEdit
    Left = 864
    Top = 216
    Width = 209
    Height = 28
    TabOrder = 7
    Text = 'Put initial mutant conc. here'
    OnChange = EditMutConcentrationChange
  end
  object ButtonFittnes: TButton
    Left = 920
    Top = 512
    Width = 161
    Height = 25
    Caption = '"Fittness"'
    TabOrder = 8
  end
  object ButtonESS: TButton
    Left = 920
    Top = 448
    Width = 161
    Height = 25
    Caption = 'Branching mapp'
    TabOrder = 9
    OnClick = ButtonESSClick
  end
  object EditXdef: TEdit
    Left = 864
    Top = 256
    Width = 209
    Height = 28
    TabOrder = 10
    Text = '0'
    OnChange = EditXdefChange
  end
  object EditYdef: TEdit
    Left = 864
    Top = 296
    Width = 209
    Height = 28
    TabOrder = 11
    Text = '0.5'
    OnChange = EditYdefChange
  end
  object ButtonYvSigma: TButton
    Left = 744
    Top = 448
    Width = 169
    Height = 25
    Caption = 'Y versus Sigma'
    TabOrder = 12
    OnClick = ButtonYvSigmaClick
  end
  object ButtonYvFluct: TButton
    Left = 744
    Top = 512
    Width = 169
    Height = 25
    Caption = 'Y versus Fluct'
    TabOrder = 13
    OnClick = ButtonYvFluctClick
  end
  object EditIterations: TEdit
    Left = 864
    Top = 376
    Width = 209
    Height = 28
    TabOrder = 14
    Text = 'Put # of iterations here'
    OnChange = EditIterationsChange
  end
  object ButtonYvR: TButton
    Left = 744
    Top = 480
    Width = 169
    Height = 25
    Caption = 'Y versus Rate'
    TabOrder = 15
    OnClick = ButtonYvRClick
  end
  object ButtonAdvanced: TButton
    Left = 864
    Top = 56
    Width = 209
    Height = 25
    Caption = 'Advanced options'
    TabOrder = 16
    OnClick = ButtonAdvancedClick
  end
  object ButtonBranchFitt: TButton
    Left = 920
    Top = 480
    Width = 161
    Height = 25
    Caption = 'Branching Fitt'
    TabOrder = 17
    OnClick = ButtonBranchFittClick
  end
  object MyProgressBar: TProgressBar
    Left = 8
    Top = 616
    Width = 729
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 18
  end
  object EditPipSize: TEdit
    Left = 816
    Top = 568
    Width = 161
    Height = 28
    TabOrder = 19
    Text = 'Put picture size here'
    OnChange = EditPipSizeChange
  end
  object CheckBoxClean: TCheckBox
    Left = 776
    Top = 544
    Width = 129
    Height = 17
    Caption = 'Clean picture'
    Checked = True
    State = cbChecked
    TabOrder = 20
  end
  object ButtonSavePip: TButton
    Left = 888
    Top = 608
    Width = 193
    Height = 25
    Caption = 'Save this picture as ...'
    TabOrder = 21
    OnClick = ButtonSavePipClick
  end
  object CheckBoxAutoSave: TCheckBox
    Left = 760
    Top = 608
    Width = 97
    Height = 17
    Caption = 'Auto save'
    TabOrder = 22
  end
  object SpinEditRefRate: TSpinEdit
    Left = 1032
    Top = 544
    Width = 49
    Height = 30
    MaxValue = 20
    MinValue = 0
    TabOrder = 23
    Value = 10
    OnChange = SpinEditRefRateChange
  end
  object SavePipPictureDialog: TSavePictureDialog
    DefaultExt = '.bmp'
    InitialDir = '.'
    Title = 'Save picture as ...'
    Left = 744
    Top = 544
  end
end

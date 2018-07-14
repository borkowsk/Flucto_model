object Form2: TForm2
  Left = 796
  Top = 107
  Width = 538
  Height = 432
  Caption = 'Evolution in fluctuating enviroment - Advanced option'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 385
    Height = 209
    Caption = 'Constrains'
    TabOrder = 0
    object Label2: TLabel
      Left = 88
      Top = 32
      Width = 35
      Height = 16
      Caption = 'Rate :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 80
      Top = 56
      Width = 45
      Height = 16
      Caption = 'Sigma :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 5
      Top = 80
      Width = 119
      Height = 16
      Caption = 'Initial concentration :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 4
      Top = 104
      Width = 120
      Height = 16
      Caption = 'Initial con. of mutant :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object X: TLabel
      Left = 112
      Top = 128
      Width = 14
      Height = 16
      Caption = 'X :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Y: TLabel
      Left = 112
      Top = 152
      Width = 15
      Height = 16
      Caption = 'Y :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LabelFluct: TLabel
      Left = 28
      Top = 176
      Width = 95
      Height = 16
      Caption = 'Range of Fluct.: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object GroupBox2: TGroupBox
      Left = 128
      Top = 16
      Width = 121
      Height = 185
      Caption = 'Minimal value'
      TabOrder = 0
      object EditMinRate: TEdit
        Left = 0
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'EditMinRate'
        OnChange = EditMinRateChange
      end
      object EditMinSigma: TEdit
        Left = 0
        Top = 40
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'EditMinSigma'
        OnChange = EditMinSigmaChange
      end
      object EditMinConce: TEdit
        Left = 0
        Top = 64
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'EditMinConce'
      end
      object EditMinMConce: TEdit
        Left = 0
        Top = 88
        Width = 121
        Height = 21
        TabOrder = 3
        Text = 'EditMinMConce'
      end
      object EditMinX: TEdit
        Left = 0
        Top = 112
        Width = 121
        Height = 21
        TabOrder = 4
        Text = 'EditMinX'
        OnChange = EditMinXChange
      end
      object EditMinY: TEdit
        Left = 0
        Top = 136
        Width = 121
        Height = 21
        TabOrder = 5
        Text = 'EditMinY'
        OnChange = EditMinYChange
      end
      object EditMinFluct: TEdit
        Left = 0
        Top = 160
        Width = 121
        Height = 21
        TabOrder = 6
        Text = 'EditMinFluct'
        OnChange = EditMinFluctChange
      end
    end
    object GroupBox3: TGroupBox
      Left = 256
      Top = 16
      Width = 121
      Height = 185
      Caption = 'Maximal value'
      TabOrder = 1
      object EditMaxRate: TEdit
        Left = 0
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'EditMaxRate'
        OnChange = EditMaxRateChange
      end
      object EditMaxSigma: TEdit
        Left = 0
        Top = 40
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'EditMaxSigma'
        OnChange = EditMaxSigmaChange
      end
      object Edit10: TEdit
        Left = 48
        Top = 112
        Width = 1
        Height = 21
        TabOrder = 2
        Text = 'Edit10'
      end
      object EditMaxConce: TEdit
        Left = 0
        Top = 64
        Width = 121
        Height = 21
        TabOrder = 3
        Text = 'EditMaxConce'
      end
      object EditMaxMConce: TEdit
        Left = 0
        Top = 88
        Width = 121
        Height = 21
        TabOrder = 4
        Text = 'EditMaxMConce'
      end
      object EditMaxX: TEdit
        Left = 0
        Top = 112
        Width = 121
        Height = 21
        TabOrder = 5
        Text = 'EditMaxX'
        OnChange = EditMaxXChange
      end
      object EditMaxY: TEdit
        Left = 0
        Top = 136
        Width = 121
        Height = 21
        TabOrder = 6
        Text = 'EditMaxY'
        OnChange = EditMaxYChange
      end
      object EditMaxFluct: TEdit
        Left = 0
        Top = 160
        Width = 121
        Height = 21
        TabOrder = 7
        Text = 'EditMaxFluct'
        OnChange = EditMaxFluctChange
      end
    end
  end
  object GroupBox5: TGroupBox
    Left = 400
    Top = 8
    Width = 121
    Height = 209
    Caption = 'Steps for batch jobs'
    TabOrder = 1
    object EditRateStep: TEdit
      Left = 0
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'EditRateStep'
      OnChange = EditRateStepChange
    end
    object EditSigmaStep: TEdit
      Left = 0
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'EditSigmaStep'
      OnChange = EditSigmaStepChange
    end
    object EditConcStep: TEdit
      Left = 0
      Top = 80
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'EditConcStep'
      OnChange = EditConcStepChange
    end
    object EditMutConcStep: TEdit
      Left = 0
      Top = 104
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'EditMutConcStep'
      OnChange = EditMutConcStepChange
    end
    object EditXStep: TEdit
      Left = 0
      Top = 128
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'EditXStep'
      OnChange = EditXStepChange
    end
    object EditYStep: TEdit
      Left = 0
      Top = 152
      Width = 121
      Height = 21
      TabOrder = 5
      Text = 'EditYStep'
      OnChange = EditYStepChange
    end
    object EditFluctStep: TEdit
      Left = 0
      Top = 176
      Width = 121
      Height = 21
      TabOrder = 6
      Text = 'EditFluctStep'
      OnChange = EditFluctStepChange
    end
  end
  object ButtonOK: TButton
    Left = 448
    Top = 368
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = ButtonOKClick
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 352
    Width = 289
    Height = 49
    Caption = 'Settings for printing values on pictures'
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 39
      Height = 13
      Caption = 'Lenght :'
    end
    object Label6: TLabel
      Left = 152
      Top = 24
      Width = 49
      Height = 13
      Caption = 'Precision :'
    end
    object EditFlpLenght: TEdit
      Left = 64
      Top = 16
      Width = 57
      Height = 21
      TabOrder = 0
      Text = '10'
      OnChange = EditFlpLenghtChange
    end
    object EditFlpPrec: TEdit
      Left = 208
      Top = 16
      Width = 73
      Height = 21
      TabOrder = 1
      Text = '7'
      OnChange = EditFlpPrecChange
    end
  end
  object GroupBox6: TGroupBox
    Left = 8
    Top = 224
    Width = 513
    Height = 121
    Caption = 'Batch job'
    TabOrder = 4
    object Label7: TLabel
      Left = 8
      Top = 24
      Width = 54
      Height = 13
      Caption = 'Step along '
    end
    object ComboBoxChanges: TComboBox
      Left = 64
      Top = 16
      Width = 249
      Height = 21
      ItemHeight = 13
      ItemIndex = 3
      TabOrder = 0
      Text = 'Initial concentration of resident'
      OnChange = ComboBoxChangesChange
      Items.Strings = (
        'X'
        'Rate'
        'Sigma'
        'Initial concentration of resident'
        'Initial concentration of mutant'
        'Range of fluctuations')
    end
    object ButtonInvExtJob: TButton
      Left = 8
      Top = 64
      Width = 185
      Height = 25
      Caption = 'Invasion/extinction Job'
      TabOrder = 1
      OnClick = ButtonInvExtJobClick
    end
    object ProgressBarOfJob: TProgressBar
      Left = 8
      Top = 40
      Width = 497
      Height = 16
      Min = 0
      Max = 100
      TabOrder = 2
    end
    object ButtonESS: TButton
      Left = 8
      Top = 88
      Width = 185
      Height = 25
      Caption = 'Branching mapp job'
      TabOrder = 3
      OnClick = ButtonESSClick
    end
    object ButtonBranchFitt: TButton
      Left = 192
      Top = 64
      Width = 153
      Height = 25
      Caption = 'Branching fitt job'
      TabOrder = 4
      OnClick = ButtonBranchFittClick
    end
    object ButtonMultimodelFitt: TButton
      Left = 344
      Top = 64
      Width = 161
      Height = 25
      Caption = 'Multimodel branching fitt job'
      TabOrder = 5
      OnClick = ButtonMultimodelFittClick
    end
  end
  object SavePictureDialog1: TSavePictureDialog
    FilterIndex = 0
    InitialDir = '.'
    Title = 'Select directory and provide name prefix :'
    Left = 304
    Top = 352
  end
end

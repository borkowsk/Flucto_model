object FormPicture: TFormPicture
  Left = 2
  Top = 149
  Width = 790
  Height = 653
  Caption = 'Evolution in fluctuating enviroment - graphs'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefaultPosOnly
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object pip: TImage
    Left = 0
    Top = 0
    Width = 780
    Height = 600
  end
  object MyProgressBar: TProgressBar
    Left = 0
    Top = 608
    Width = 777
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 0
  end
end

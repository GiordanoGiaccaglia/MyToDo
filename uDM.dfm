object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 293
  Width = 389
  object FDManager1: TFDManager
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 88
    Top = 56
  end
  object FDConnection1: TFDConnection
    AfterConnect = FDConnection1AfterConnect
    Left = 88
    Top = 144
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 208
    Top = 48
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = FDConnection1
    ModifySQL.Strings = (
      'UPDATE Tasks set Done = 1 WHERE Id = :ID')
    DeleteSQL.Strings = (
      'DELETE FROM Tasks WHERE Id = :ID')
    Left = 192
    Top = 144
  end
end

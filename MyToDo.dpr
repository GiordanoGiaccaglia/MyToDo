program MyToDo;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FormMain},
  uDM in 'uDM.pas' {DataModule1: TDataModule},
  uTODO.Task in 'uTODO.Task.pas',
  uFrame.Task in 'uFrame.Task.pas' {FrameTask: TFrame},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.

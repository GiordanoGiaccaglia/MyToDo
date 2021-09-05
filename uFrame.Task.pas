unit uFrame.Task;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  uTODO.Task
  ,uDM;

type
  TFrameTask = class(TFrame)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    FTask: TMyTask;
    procedure UpdateStatus;
  public
      constructor Create(AOwner: TComponent;T: TMyTask); overload;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameTask }

procedure TFrameTask.BitBtn1Click(Sender: TObject);
begin
  if DataModule1.MarkTaskAsDone(FTask) then
  begin
    FTask.Done := true;
    UpdateStatus;
  end;
end;

procedure TFrameTask.BitBtn2Click(Sender: TObject);
begin
  if DataModule1.DeleteTask(FTask) then
  begin
    Self.Visible := true;
    self.Free;
  end;
end;

constructor TFrameTask.Create(AOwner: TComponent; T: TMyTask);
begin
  inherited create(AOwner);

  FTask := T;

  Self.Name := 'TASK_'+FTask.Id.ToString;
  Label1.Caption := FTask.Task;

  UpdateStatus;
end;

procedure TFrameTask.UpdateStatus;
begin
  if FTask.Done then
  begin
    Label1.Font.Color := clLime;
    BitBtn1.Enabled := false;
  end else
  begin
    Label1.Font.Color := clRed;
    BitBtn1.Enabled := true;
  end;
end;

end.

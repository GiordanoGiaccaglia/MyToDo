unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls
  ,uDM
  ,uTODO.Task
  ,uFrame.Task;

type
  TFormMain = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    btnAdd: TButton;
    ScrollBox1: TScrollBox;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowTaskList;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.btnAddClick(Sender: TObject);
var
  T:TMyTask;
  FrameTask: TFrameTask;
begin
  T := TMyTask.Create(edit1.Text);

  DataModule1.AddTask(T);

  FrameTask := TFrameTask.Create(ScrollBox1,T);
  FrameTask.Parent := ScrollBox1;
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
   DataModule1.prepareConnection;

   ShowTaskList;
end;

procedure TFormMain.ShowTaskList;
var
  Task: TMyTask;
  FrameTask: TFrameTask;
begin
  for Task in DataModule1.GetTaskList do
  begin
    FrameTask := TFrameTask.Create(ScrollBox1,Task);
    FrameTask.Parent := ScrollBox1;
  end;
end;

end.

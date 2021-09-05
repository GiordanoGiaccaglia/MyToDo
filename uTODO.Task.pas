unit uTODO.Task;

interface

uses
  System.SysUtils,
  Data.DB;

type
  TMyTask = record
    Id: Integer;
    Done: Boolean;
    DueDate: TDateTime;
    Priority: Integer;
    Task: String;
  public
    constructor Create(ATask:String);
  end;

  TMyTaskList = array of TMyTask;

  TMyTaskHelper = record helper for TMyTask
    procedure LoadFromDataSetRecord(AData: TFields);
  end;

implementation

{ TMyTask }

constructor TMyTask.Create(ATask:String);
begin
  Done := false;
  DueDate := now + 1;
  Priority := 0;
  Task := ATask;
end;

{ TMyTaskHelper }

procedure TMyTaskHelper.LoadFromDataSetRecord(AData: TFields);
begin
  Self.Id := AData.FieldByName('Id').AsInteger;
  Self.Done := AData.FieldByName('Done').asInteger = 1;
  Self.DueDate := AData.FieldByName('DueDate').asDateTime;
  Self.Priority := AData.FieldByName('Id').AsInteger;
  Self.Task := AData.FieldByName('Task').asString;
end;

end.

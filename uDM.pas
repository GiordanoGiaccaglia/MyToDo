unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Phys, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.VCLUI.Wait,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite, Data.DB, FireDAC.Comp.Client,
  FireDac.DApt,
  System.IOUtils,
  uTODO.Task, FireDAC.Stan.Param;

type
  TDataModule1 = class(TDataModule)
    FDManager1: TFDManager;
    FDConnection1: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDUpdateSQL1: TFDUpdateSQL;
    procedure FDConnection1AfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    const
     CONNECTION_DEF = 'SQLite_Connection';
     DB_NAME = 'myTodo.db';

    function getDBPath:String;
    function prepareConnection:Boolean;
    procedure configureDB;

    procedure AddTask(var T: TMyTask);
    function MarkTaskAsDone(const T: TMyTask):Boolean;
    function DeleteTask(const T: TMyTask):Boolean;
    function GetTaskList: TMyTaskList;

  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDataModule1.AddTask(var T: TMyTask);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(Self);
  try
    Q.ConnectionName := CONNECTION_DEF;
    Q.ExecSQL('INSERT INTO Tasks (Done,DueDate,Priority,Task) '+
              'VALUES(?,?,?,?)',
              [T.Done,T.DueDate,T.Priority,T.Task]);

    T.Id := Int64(FDConnection1.GetLastAutoGenValue('Tasks'));
  finally
    Q.Free;
  end;
end;

procedure TDataModule1.configureDB;
begin
  FDConnection1.ExecSQL('CREATE TABLE IF NOT EXISTS "Tasks"( '+
  '"Id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,'+
  '"Done" integer NOT NULL DEFAULT 0, '+
  '"DueDate" DATETIME,'+
  '"Priority" integer NOT NULL DEFAULT 0, '+
  '"Task" text);');
end;

function TDataModule1.DeleteTask(const T: TMyTask): Boolean;
begin
  try
    FDUpdateSQL1.Commands[arDelete].ParamByName('ID').AsInteger := T.Id;
    FDUpdateSQL1.Commands[arDelete].Execute;
    Result := true;
  except
    Result := false;
  end;
end;

procedure TDataModule1.FDConnection1AfterConnect(Sender: TObject);
begin
  configureDB;
end;

function TDataModule1.getDBPath: String;
begin
  //Includere la unit System.IOUtils
  Result := TPath.Combine(TPath.GetDocumentsPath,DB_NAME);
end;

function TDataModule1.GetTaskList: TMyTaskList;
var
  Q: TFDQuery;
  I: Integer;
  T:TMyTask;
begin
  Q := TFDQuery.Create(Self);
  try
    Q.ConnectionName := CONNECTION_DEF;
    Q.Open('SELECT * FROM Tasks');
    SetLength(Result, Q.RecordCount);
    for I := 0 to High(Result) do
    begin
      Result[I].LoadFromDataSetRecord(Q.Fields);
      Q.Next;
    end;
  finally
    Q.Free;
  end;
end;

function TDataModule1.MarkTaskAsDone(const T: TMyTask): Boolean;
begin
  try
    FDUpdateSQL1.Commands[arUpdate].ParamByName('ID').AsInteger := T.Id;
    FDUpdateSQL1.Commands[arUpdate].Execute;
    Result := true;
  except
    Result := false;
  end;
end;

function TDataModule1.prepareConnection:Boolean;
var
  oParams:TStringList;
begin
  oParams := TSTringList.Create;
  try
    oParams.Add('Database='+getDBPath);
    FDManager.AddConnectionDef(CONNECTION_DEF, 'SQLIte', oParams);
  finally
    oParams.Free;
  end;

  FDConnection1.ConnectionDefName := CONNECTION_DEF;

  try
    FDConnection1.Connected :=true;
    Result := true;
  except
    Result := false;
  end;
end;

end.

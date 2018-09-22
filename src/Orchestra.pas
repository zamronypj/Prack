unit Orchestra;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Queue, DateUtils, Connections;

const
  TIMEOUT_LIMIT = 60;

type

  { TOrchestra }

  TOrchestra = class(TThread)
  private
    FQueue: TPrackQueue;
  protected
    procedure Execute; override;
  public
    constructor Create(aQueue: TPrackQueue);
  end;

implementation

{ TOrchestra }

constructor TOrchestra.Create(aQueue: TPrackQueue);
begin
  FQueue := aQueue;
  inherited Create(False);
end;

procedure TOrchestra.Execute;
var
  List: TList;
  Connection: TPrackConnection;
  I: integer;
begin
  while not Terminated do
  begin
    FQueue.ReadyRequestsEvent.WaitFor(1000);
    List := FQueue.LockList;
    try
      for I := List.Count - 1 downto 0 do
      begin
        Connection := TPrackConnection(List.Items[I]);

        if (Connection.Status <> pcsReady) and
          (SecondsBetween(Now, Connection.CreatedAt) >= TIMEOUT_LIMIT) then
        begin
          Connection.Response.Code := 503;
          Connection.Response.Body := 'Timeout' + CRLF;
          Connection.Status := pcsReady;
        end;

        if Connection.Status = pcsError then
        begin
          Connection.Response.Code := 503;
          Connection.Response.Body := 'Backend error' + CRLF;
          Connection.Status := pcsReady;
        end;

        if Connection.Status <> pcsReady then
          Continue;

        // TODO: Responses can be sent in parallel
        Connection.SendResponse;
        List.Remove(Connection);
        FreeAndNil(Connection);
      end;
    finally
      FQueue.UnlockList;
    end;
  end;
end;

end.
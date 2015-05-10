unit frBase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql50conn, sqldb, FileUtil, DividerBevel, Forms,
  Controls, StdCtrls, LCLType, maskedit, ExtCtrls, DBCtrls, Calendar, Spin,
  EditBtn, Buttons, ActnList, ComCtrls, Dialogs, db, LSForms;

type

  { TfBase }

  TfBase = class(TFrame)
    acCerrar: TAction;
    acEditar: TAction;
    acEliminar: TAction;
    acNuevo: TAction;
    acConfirmar: TAction;
    acCancelar: TAction;
    ActionList1: TActionList;
    bbCerrar: TBitBtn;
    dbComandos: TDividerBevel;
    ilComando: TImageList;
    paBase: TPanel;
    paComando: TPanel;
    paContenido: TPanel;
    qNuevoId: TSQLQuery;
    procedure acCerrarExecute(Sender: TObject);
    procedure CustomKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FrameInit(Sender: TObject);
    procedure AsignarKeyDown(TWC:TWinControl);
  private
    { private declarations }
    procedure CerrarFrame;
  protected

  public
    { public declarations }
    constructor Create(AOwner: TComponent);
    function NuevoID(tabla:string):LongInt;
  end;

implementation

{$R *.lfm}

{ TfBase }

procedure TfBase.FrameInit(Sender: TObject);
begin
//  AsignarKeyDown(Self);
end;

procedure TfBase.AsignarKeyDown(TWC:TWinControl);
var
  i: integer;
begin
  //Asigno el comportamiento de que el <ENTER> funcione como <TAB> para cambiar
  //de campo en los controles de edición. Se hace en forma recursiva para todos
  //los controles hijos del frame
  with TWC do
  begin
    for i := 0 to ControlCount - 1 do
    begin
      //Llamada recursiva
      if (Controls[i] is TWinControl) and ((Controls[i] as TWinControl).ControlCount>0) then
            AsignarKeyDown(Controls[i] as TWinControl);
      if (Controls[i] is TCustomEdit) then
        (Controls[i] as TCUstomEdit).OnKeyDown := @CustomKeyDown
      else if (Controls[i] is TCustomComboBox) then
        (Controls[i] as TCustomComboBox).OnKeyDown := @CustomKeyDown
      else if (Controls[i] is TCustomCalendar) then
        (Controls[i] as TCustomCalendar).OnKeyDown := @CustomKeyDown
      else if (Controls[i] is TCustomCheckBox) then
        (Controls[i] as TCustomCheckBox).OnKeyDown := @CustomKeyDown;
    end;
  end;
end;

procedure TfBase.CerrarFrame;
var
  i: integer;
  HayCambios: boolean;
  mr: TModalResult;
begin
  //verificar si hay cambios antes de cerrar
  HayCambios:=false;
  for i:=0 to ComponentCount-1 do
  begin
    if (Components[i] is TSQLQuery) and ((Components[i] as TSQLQuery).Active) then
    begin
      if (Components[i] as TSQLQuery).State in [dsEdit,dsInsert] then
        (Components[i] as TSQLQuery).Post;
      if (Components[i] as TSQLQuery).ChangeCount>0 then
        HayCambios:=true;
    end;
  end;
  if HayCambios then
  begin
    mr:=MessageDlg('¿Desea aplicar los cambios antes de cerrar?', mtConfirmation, mbYesNoCancel,0);
    if mr=mrYes then
    begin
      if acConfirmar.Execute then
      begin
        if Parent is TTabSheet then
          Parent.Free;
      end;
    end else if mr=mrNo then
    begin
      if acCancelar.Execute then
      begin
        if Parent is TTabSheet then
          Parent.Free;
      end;
    end;
  end else
  begin
    if Parent is TTabSheet then
      Parent.Free;
  end;
end;


constructor TfBase.Create(AOwner: TComponent);
begin
  inherited;
  FrameInit(self);
end;

function TfBase.NuevoID(tabla: string): LongInt;
var
  ID:integer;
begin
  ID:=-1;
  qNuevoId.Active:=false;
  if tabla <> '' then
  begin
    qNuevoId.SQL.Clear;
    qNuevoId.SQL.Add('SELECT nuevo_id('''+tabla+''') as ID');
    qNuevoId.Active:=true;
    if qNuevoId.RecordCount=1 then
    begin
      ID:=qNuevoId.FieldByName('ID').AsInteger;
      if ID<1 then
        ID:=-1;
    end;
  end;
  qNuevoId.Active:=false;
  Result:=ID;
end;


procedure TfBase.CustomKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := VK_TAB;
    inherited KeyDown(Key, Shift);
  end;
end;

procedure TfBase.acCerrarExecute(Sender: TObject);
begin
  CerrarFrame;
end;

initialization
//  LSRegisterEnterAsTAB([TCustomMemo, TCustomButton {to skip memos and buttons... } ]);

end.



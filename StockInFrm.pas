unit StockInFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ComCtrls, ExtCtrls, StdCtrls, DBCtrls,
  ComObj;

type
  TFrmStockIn = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    单头数据: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    cdsTranH: TADOQuery;
    cdsTranB: TADOQuery;
    dsTranH: TDataSource;
    dsTranB: TDataSource;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    Edit2: TEdit;
    CheckBox2: TCheckBox;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    cdsTranBPID_: TGuidField;
    cdsTranBIt_: TIntegerField;
    cdsTranBPartCode_: TWideStringField;
    cdsTranBDesc_: TWideStringField;
    cdsTranBSpec_: TWideStringField;
    cdsTranBUnit_: TWideStringField;
    cdsTranBNum_: TBCDField;
    cdsTranBPDNum_: TWideStringField;
    cdsTranBFinal_: TBooleanField;
    cdsTranHID_: TGuidField;
    cdsTranHTBDate_: TDateTimeField;
    cdsTranHTBNo_: TWideStringField;
    cdsTranHType_: TIntegerField;
    cdsTranHAppUser_: TWideStringField;
    Panel2: TPanel;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsTranHNewRecord(DataSet: TDataSet);
    procedure TabSheet2Show(Sender: TObject);
    procedure cdsTranBNewRecord(DataSet: TDataSet);
    procedure cdsTranBPartCode_Validate(Sender: TField);
    procedure cdsTranBPartCode_Change(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure cdsTranHType_GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTranBFinal_GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    function GetNewTBNo(const TB: String): String;
  public
    { Public declarations }
  end;
  TStock = class
  public
    function UpdateByCode(const PartCode: String; Num: Double): Boolean;
  end;

implementation

uses MainFrm;

{$R *.dfm}

procedure TFrmStockIn.Button1Click(Sender: TObject);
var
  SQLCmd: String;
begin
  SQLCmd := '';
  if CheckBox1.Checked then SQLCmd := SQLCmd + Format(' and TBNo_=''%s''', [Self.Edit1.Text]);
  if CheckBox2.Checked then SQLCmd := SQLCmd + Format(' and AppUser_=''%s''', [Self.Edit2.Text]);
  {
  if SQLCmd = '' then
  begin
    ShowMessage('请您输入查询条件！');
    Exit;
  end;
  }
  with Self.cdsTranH do
  begin
    Active := False;
    SQL.Text := 'select * from TranH where Type_=0';
    SQL.Add(SQLCmd);
    SQL.Add('order by TBNo_');
    Open;
  end;
end;

procedure TFrmStockIn.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmStockIn.Button3Click(Sender: TObject);
var
  WH: TStock;
begin
  with cdsTranB do
  begin
    //如果未保存，先保存
    if State in [dsInsert, dsEdit] then
      Post;
    //开始过帐
    First;
    while not Eof do
    begin
      if not FieldByName('Final_').AsBoolean then
      begin
        //如果没有过帐，就执行过帐，过帐成功后回写Final_=True;
        WH := TStock.Create;
        try
          if WH.UpdateByCode(FieldByName('PartCode_').AsString, FieldByName('Num_').AsFloat) then
          begin
            Edit;
            FieldByName('Final_').AsBoolean := True;
            Post;
          end;
        finally
          WH.Free;
        end;
      end;
      Next;
    end;
  end;
end;

procedure TFrmStockIn.cdsTranBFinal_GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.AsBoolean then
    Text := '已过帐'
  else
    Text := '';
end;

procedure TFrmStockIn.cdsTranBNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('PID_').AsString := cdsTranH.FieldByName('ID_').AsString;
    FieldByName('It_').AsInteger := RecordCount + 1;
    FieldByName('PDNum_').AsFloat := 0;
    FieldByName('Num_').AsFloat := 0;
    FieldByName('Final_').AsBoolean := False;
  end;
end;

procedure TFrmStockIn.cdsTranBPartCode_Change(Sender: TField);
var
  cdsTmp: TADOQuery;
begin
  cdsTmp := TADOQuery.Create(Self);
  try
    with cdsTmp do
    begin
      Connection := FrmMain.adoConn;
      SQL.Text := Format('select * from Part where Code_=''%s''', [Sender.AsString]);
      Open;
      if not Eof then
      begin
        cdsTranB.FieldByName('Desc_').AsString := cdsTmp.FieldByName('Desc_').AsString;
        cdsTranB.FieldByName('Spec_').AsString := cdsTmp.FieldByName('Spec_').AsString;
        cdsTranB.FieldByName('Unit_').AsString := cdsTmp.FieldByName('Unit_').AsString;
      end;
    end;
  finally
    cdsTmp.Free;
  end;
end;

procedure TFrmStockIn.cdsTranBPartCode_Validate(Sender: TField);
var
  cdsTmp: TADOQuery;
begin
  cdsTmp := TADOQuery.Create(Self);
  try
    with cdsTmp do
    begin
      Connection := FrmMain.adoConn;
      SQL.Text := Format('select * from Part where Code_=''%s''', [Sender.AsString]);
      Open;
      if Eof then
      begin
        ShowMessage(Format('料号 %s 不存在！', [Sender.AsString]));
        Abort; //Delphi, 放弃当前事件
      end;
    end;
  finally
    cdsTmp.Free;
  end;
end;

procedure TFrmStockIn.cdsTranHNewRecord(DataSet: TDataSet);
var
  sGUID: string;
begin
  sGUID := CreateClassID();
  with DataSet do
  begin
    FieldByName('Type_').AsInteger := 0; //0.进货单; 1.出货单; 2.盘点单
    FieldByName('TBNo_').AsString := GetNewTBNo('IN');
    FieldByName('AppUser_').AsString := __Account;
    FieldByName('TBDate_').AsDateTime := Date();
    FieldByName('ID_').AsString := sGUID;
  end;
end;

procedure TFrmStockIn.cdsTranHType_GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  case Sender.AsInteger of
  0: Text := '进货单';
  1: Text := '出货单';
  2: Text := '盘点单';
  end;
end;

procedure TFrmStockIn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmStockIn.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

function TFrmStockIn.GetNewTBNo(const TB: String): String;
var
  i: Integer;
  YM: String;
  No: String;
  cdsTmp: TADOQuery;
begin
  YM := FormatDatetime('YYYYMM', Date());
  i := 0;
  while True do
  begin
    Inc(i);
    No := '000' + IntToStr(i);
    No := Copy(No, Length(No) - 3, 4);
    No := TB + YM + No; //得到新的单号
    cdsTmp := TADOQuery.Create(Self);
    try
      cdsTmp.Connection := FrmMain.adoConn;
      cdsTmp.SQL.Text := Format('select * from TranH where TBNo_=''%s''', [No]);
      cdsTmp.Open;
      if cdsTmp.Eof then
      begin
        Result := No;
        Break;
      end;
    finally
      cdsTmp.Free;
    end;
  end;
end;

procedure TFrmStockIn.TabSheet2Show(Sender: TObject);
begin
  with cdsTranH do
  begin
    if not Active then
      Exit;
    if FieldByName('ID_').AsString = '' then
      Exit;
    if State in [dsInsert, dsEdit] then
      cdsTranH.Post;
  end;
  with cdsTranB do
  begin
    Active := False;
    SQL.Text := Format('select * from TranB where PID_=''%s''',
      [cdsTranH.FieldByName('ID_').AsString]);
    Open;
  end;
end;

{ TStock }

function TStock.UpdateByCode(const PartCode: String; Num: Double): Boolean;
var
  cdsStock: TADOQuery;
begin
  cdsStock := TADOQuery.Create(nil);
  try
    with cdsStock do
    begin
      Connection := FrmMain.adoConn;
      SQL.Text := Format('select * from Stock where PartCode_=''%s''', [PartCode]);
      Open;
      if Eof then
        begin
          Append;
          FieldByName('PartCode_').AsString := PartCode;
          FieldByName('Num_').AsFloat := Num;
          FieldByName('UpdateDate_').AsDateTime := Now();
          Post;
        end
      else
        begin
          Edit;
          FieldByName('Num_').AsFloat := FieldByName('Num_').AsFloat + Num;
          FieldByName('UpdateDate_').AsDateTime := Now();
          Post;
        end;
    end;
    Result := True;
  finally
    cdsStock.Free;
  end;
end;

end.

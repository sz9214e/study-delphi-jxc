unit StockSch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, DBCtrls, DB, ADODB;

type
  TSchStock = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    cdsStock: TADOQuery;
    dsStock: TDataSource;
    DBNavigator1: TDBNavigator;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses MainFrm;

{$R *.dfm}

procedure TSchStock.Button1Click(Sender: TObject);
var
  SQLCmd: String;
begin
  SQLCmd := '';
  if CheckBox1.Checked then SQLCmd := SQLCmd + Format(' and Code_=''%s''', [Self.Edit1.Text]);
  if CheckBox2.Checked then SQLCmd := SQLCmd + Format(' and Desc_=''%s''', [Self.Edit2.Text]);
  if CheckBox3.Checked then SQLCmd := SQLCmd + Format(' and Spec_=''%s''', [Self.Edit3.Text]);
  {
  if SQLCmd = '' then
  begin
    ShowMessage('请您输入查询条件！');
    Exit;
  end;
  }
  with Self.cdsStock do
  begin
    Active := False;
    SQL.Text := 'select P.Code_,P.Desc_,P.Spec_,P.Unit_,S.Num_,S.UpdateDate_ '
      + 'from Stock S inner join Part P on S.PartCode_=P.Code_';
    if SQLCmd <> '' then
      SQL.Add('where ' + Copy(SQLCmd, 6, Length(SQLCmd)));
    Open;
  end;
end;

procedure TSchStock.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TSchStock.Edit1Change(Sender: TObject);
begin
  CheckBox1.Checked := Edit1.Text <> '';
end;

procedure TSchStock.Edit2Change(Sender: TObject);
begin
  CheckBox2.Checked := Edit2.Text <> '';
end;

procedure TSchStock.Edit3Change(Sender: TObject);
begin
  CheckBox3.Checked := Edit3.Text <> '';
end;

procedure TSchStock.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

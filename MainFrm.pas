unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB;

type
  TFrmMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    adoConn: TADOConnection;
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;
  __Account: String;

implementation

uses PartFrm, StockInFrm, StockOutFrm, StockSch, StockDetailSch;

{$R *.dfm}

procedure TFrmMain.N4Click(Sender: TObject);
var
  Child: TFrmPart;
begin
  Child := TFrmPart.Create(Self);
  Child.Show;
end;

procedure TFrmMain.N5Click(Sender: TObject);
begin
  (TFrmStockIn.Create(Self)).Show;
end;

procedure TFrmMain.N6Click(Sender: TObject);
begin
  (TFrmStockOut.Create(Self)).Show;
end;

procedure TFrmMain.N8Click(Sender: TObject);
begin
  (TSchStock.Create(Self)).Show;
end;

procedure TFrmMain.N9Click(Sender: TObject);
begin
  (TSchStockDetail.Create(Self)).Show;
end;

end.

program jxc;

uses
  Forms,
  Controls,
  LoginDlg in 'LoginDlg.pas' {DlgLogin},
  MainFrm in 'MainFrm.pas' {FrmMain},
  StockDetailSch in 'StockDetailSch.pas' {SchStockDetail},
  StockOutFrm in 'StockOutFrm.pas' {FrmStockOut},
  StockInFrm in 'StockInFrm.pas' {FrmStockIn};

{$R *.res}

var
  Dlg: TDlgLogin;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Dlg := TDlgLogin.Create(nil);
  try
    //if Dlg.ShowModal = mrOk then
    begin
      __Account := Dlg.edtAccount.Text;
      Application.CreateForm(TFrmMain, FrmMain);
  end;
  finally
    Dlg.Free;
  end;
  Application.Run;
end.

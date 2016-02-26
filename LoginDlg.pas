unit LoginDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TDlgLogin = class(TForm)
    Label1: TLabel;
    edtAccount: TEdit;
    Label2: TLabel;
    edtPassword: TEdit;
    btnLogin: TButton;
    btnClose: TButton;
    procedure btnLoginClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TDlgLogin.btnCloseClick(Sender: TObject);
begin
  Self.ModalResult := mrClose;
end;

procedure TDlgLogin.btnLoginClick(Sender: TObject);
begin
  if (Self.edtAccount.Text = 'admin') and (Self.edtPassword.Text = 'admin') then
    Self.ModalResult := mrOk
  else
    ShowMessage('您的用户名或密码错误，请检查！');
end;

end.

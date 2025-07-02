program BalanService;

uses
  Vcl.Forms,
  uTelaInicial in 'uTelaInicial.pas' {frmTelaPrincipal},
  uTelaCredenciasDoBancoDeDados in 'uTelaCredenciasDoBancoDeDados.pas' {frmTelaCredenciaisDoBancoDeDados},
  dmUtils in 'dmUtils.pas' {dtmUtils: TDataModule},
  uTelaMudarImagemDeFundo in 'uTelaMudarImagemDeFundo.pas' {frmTelaMudarImagemDeFundo};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTelaPrincipal, frmTelaPrincipal);
  Application.CreateForm(TdtmUtils, dtmUtils);
  Application.Run;
end.

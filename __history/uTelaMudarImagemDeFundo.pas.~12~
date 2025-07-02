unit uTelaMudarImagemDeFundo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, IniFiles;

type
  TfrmTelaMudarImagemDeFundo = class(TForm)
    ImagemDeFundo: TImage;
    FileOpenDialog: TFileOpenDialog;
    CaminhoImagem: TEdit;
    frmTelaImagemDeFundo: TLabel;
    SpeedButton1: TSpeedButton;
    ImageList1: TImageList;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FileOpenDialogFileOkClick(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaMudarImagemDeFundo: TfrmTelaMudarImagemDeFundo;

implementation

{$R *.dfm}

uses uTelaInicial;

procedure TfrmTelaMudarImagemDeFundo.Button1Click(Sender: TObject);
var
  ArquivoIni: TIniFile;
  ServidorArqIni: String;
  PortaArqIni: String;
begin
  ArquivoIni := TIniFile.Create(ExtractFilePath(ParamStr(0))+'CONFIG.ini');
  try
    ArquivoIni.WriteString('Background', 'ImagemDeFundo', CaminhoImagem.Text);
  finally
    ArquivoIni.Free;
  end;
  ShowMessage('Dados Gravados');
  frmTelaPrincipal.ImagemDeFundo.Picture.LoadFromFile(CaminhoImagem.Text);
  Self.Close;
end;

procedure TfrmTelaMudarImagemDeFundo.FileOpenDialogFileOkClick(Sender: TObject; var CanClose:
    Boolean);
begin
  if FileOpenDialog.FileName <> '' then
    begin
      CaminhoImagem.Text := FileOpenDialog.FileName;
      ImagemDeFundo.Picture.LoadFromFile(FileOpenDialog.FileName);
    end;
end;

procedure TfrmTelaMudarImagemDeFundo.FormShow(Sender: TObject);
var
  ArquivoIni: TIniFile;
  CaminhoImagemArqIni: String;
  PortaArqIni: String;
  ServidorArqIni: String;
begin
  ArquivoIni := TIniFile.Create(ExtractFilePath(ParamStr(0))+'CONFIG.ini');
  try
    CaminhoImagemArqIni := ArquivoIni.ReadString('Background', 'ImagemDeFundo', 'NullKey');
    if CaminhoImagemArqIni <> 'NullKey' then
      begin
        CaminhoImagem.Text := CaminhoImagemArqIni;
        ImagemDeFundo.Picture.LoadFromFile(CaminhoImagemArqIni);
      end;

  finally
    ArquivoIni.Free;
  end;
end;

procedure TfrmTelaMudarImagemDeFundo.SpeedButton1Click(Sender: TObject);
begin
  FileOpenDialog.Execute;

end;

end.

unit dmUtils;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, uTPLb_CryptographicLibrary, uTPLb_Codec,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TdtmUtils = class(TDataModule)
    Query: TFDQuery;
    Banco: TFDConnection;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Criptografar(ATexto, Chave: String): String;
    function Descriptografar(ATextoCriptografado, Chave: String): String;
    function QryResult(AQuery: String): TFDQuery;
  end;

var
  dtmUtils: TdtmUtils;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmUtils.DataModuleDestroy(Sender: TObject);
begin

end;

{ TdtmUtils }

function TdtmUtils.Criptografar(ATexto, Chave: String): String;
var
  CryptoLib: TCryptographicLibrary;
  Codificacao: TCodec;
begin
  Result := '';
  CryptoLib := TCryptographicLibrary.Create(nil);
  Codificacao := TCodec.Create(nil);
  try
    Codificacao.CryptoLibrary := CryptoLib;
    Codificacao.StreamCipherId := 'native.StreamToBlock';
    Codificacao.BlockCipherId := 'native.AES-256'; //Encriptação AES 256 bits
    Codificacao.ChainModeId := 'native.CBC';

    Codificacao.Reset;
    Codificacao.Password := Chave; //Atribuindo a chave para a Criptografia
    Codificacao.EncryptString(ATexto, Result, TEncoding.UTF8);
  finally
    FreeAndNil(CryptoLib);
    FreeAndNil(Codificacao);
  end;
end;

function TdtmUtils.Descriptografar(ATextoCriptografado, Chave: String): String;
var
  CryptoLib: TCryptographicLibrary;
  Codificacao: TCodec;
begin
  Result := '';
  CryptoLib := TCryptographicLibrary.Create(nil);
  Codificacao := TCodec.Create(nil);
  try
    Codificacao.CryptoLibrary := CryptoLib;
    Codificacao.StreamCipherId := 'native.StreamToBlock';
    Codificacao.BlockCipherId := 'native.AES-256'; //Encriptação AES 256 bits
    Codificacao.ChainModeId := 'native.CBC';

    Codificacao.Reset;
    Codificacao.Password := Chave; //Atribuindo a chave para Decriptografia
    Codificacao.DecryptString(Result, ATextoCriptografado, TEncoding.UTF8);
  finally
    FreeAndNil(CryptoLib);
    FreeAndNil(Codificacao);
  end;
end;

function TdtmUtils.QryResult(AQuery: String): TFDQuery;
begin
  Query.SQL.Text := AQuery;
  Query.Open;
  Result := Query;
end;

end.

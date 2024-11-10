unit dlQuotedPrintable;

interface

uses SysUtils;

type
  TQuotedPrintable = class
    public
      //convert QuotedPrintable to String
      class function Decode(const AData: String): String;
      //convert String to QuotedPrintable
      class function Encode(const AData: String): String;
  end;

implementation

{ TQuotedPrintable }

class function TQuotedPrintable.Decode(const AData: String): String;
var i: integer;
    hex: String;
begin
  Result:= '';
  if AData.IsEmpty then
    Exit;

  i:= 1;
  while i <= Length(AData) do
  begin
    if SameText(AData[i], '=') then
    begin

      if (i + 2 <= Length(AData)) then
      begin
        hex:= AData[i + 1] + AData[i + 2];

        Result:= Result + String(AnsiChar(StrToInt('$' + hex)));

        inc(i, 3);
      end
      else
      begin
        Result:= Result + AData[i];
        inc(i);
      end;
    end
    else
    begin
      Result:= Result + AData[i];
      inc(i);
    end;
  end;

  Result:= UTF8ToString(RawByteString(Result));

end;

class function TQuotedPrintable.Encode(const AData: String): String;
var i: integer;
    Buf: TBytes;
begin
  Result:= '';
  if AData.IsEmpty then
    Exit;

  Buf:= TEncoding.UTF8.GetBytes(AData);

  for i := Low(Buf) to High(Buf) do
    Result:= Result + '=' + IntToHex(Buf[i])

end;

end.

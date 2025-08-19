
unit ChkSums;

interface

uses SysUtils, Classes;

type
  PSum8   = ^TSum8;
  TSum8    = byte;
  PSumA8  = ^TSumA8;
  TSumA8   = array[0..0] of TSum8;

{ Sum = Sum + Data[n] mod 2^8 }
function Sum8(const Data; const DataSize: LongWord; const BeginSum: TSum8 = 0): TSum8; overload;
function Sum8(const Stream: TStream): TSum8; overload;

type
  PSum16  = ^TSum16;
  TSum16   = word;
  PSumA16 = ^TSumA16;
  TSumA16  = array[0..0] of TSum16;

{ Sum = Sum + Data[n] mod 2^16 }
function Sum16(const Data; const DataSize: LongWord; const BeginSum: TSum16 = 0): TSum16; overload;
function Sum16(const Stream: TStream): TSum16; overload;


type
  PSum32  = ^TSum32;
  TSum32   = LongWord;
  PSumA32 = ^TSumA32;
  TSumA32  = array[0..0] of TSum32;

{ Sum = Sum + Data[n] mod 2^32 }
function Sum32(const Data; const DataSize: LongWord; const BeginSum: TSum32 = 0): TSum32; overload;
function Sum32(const Stream: TStream): TSum32; overload;


type
  PSum64  = ^TSum64;
  TSum64   = UInt64;
  PSumA64 = ^TSumA64;
  TSumA64  = array[0..0] of TSum64;

{ Sum = Sum + Data[n] mod 2^64 }
function Sum64(const Data; const DataSize: LongWord; const BeginSum: TSum64 = 0): TSum64; overload;
function Sum64(const Stream: TStream): TSum64; overload;


implementation


function Sum8(const Data; const DataSize: LongWord; const BeginSum: TSum8 = 0): TSum8;
var ptr : PSumA8;
    N   : TSum32;
begin
  result := BeginSum;
  ptr := @Data;
  for N := 0 to DataSize-1 do
    result := TSum8((result + ptr^[N]));
end;


function Sum8(const Stream: TStream): TSum8;
var
  Data : array[0..65535] of byte;
  DataSize : LongWord;
begin
  result := 0;
  repeat
    DataSize := Stream.Read(Data, 65536);
    result := Sum8(Data, DataSize, result);
  until DataSize < 65536;
end;


function Sum16(const Data; const DataSize: LongWord; const BeginSum: TSum16 = 0): TSum16;
var ptr : PSumA16;
    N   : TSum32;
begin
  result := BeginSum;
  ptr := @Data;
  for N := 0 to (DataSize shr 1)-1 do
    result := TSum16((result + ptr^[N]));
end;


function Sum16(const Stream: TStream): TSum16;
var
  Data : array[0..65535] of byte;
  DataSize : LongWord;
begin
  result := 0;
  repeat
    DataSize := Stream.Read(Data, 65536);
    result := Sum16(Data, DataSize, result);
  until DataSize < 65536;
end;


function Sum32(const Data; const DataSize: LongWord; const BeginSum: TSum32 = 0): TSum32;
var ptr : PSumA32;
    N   : TSum32;
begin
  result := BeginSum;
  ptr := @Data;
  for N := 0 to (DataSize shr 2)-1 do
    result := TSum32((result + ptr^[N]));
end;


function Sum32(const Stream: TStream): TSum32;
var
  Data : array[0..65535] of byte;
  DataSize : LongWord;
begin
  result := 0;
  repeat
    DataSize := Stream.Read(Data, 65536);
    result := Sum32(Data, DataSize, result);
  until DataSize < 65536;
end;


function Sum64(const Data; const DataSize: LongWord; const BeginSum: TSum64 = 0): TSum64;
var ptr : PSumA64;
    N   : TSum32;
begin
  result := BeginSum;
  ptr := @Data;
  for N := 0 to (DataSize shr 3)-1 do
    result := TSum64((result + ptr^[N]));
end;


function Sum64(const Stream: TStream): TSum64;
var
  Data : array[0..65535] of byte;
  DataSize : LongWord;
begin
  result := 0;
  repeat
    DataSize := Stream.Read(Data, 65536);
    result := Sum64(Data, DataSize, result);
  until DataSize < 65536;
end;


end.

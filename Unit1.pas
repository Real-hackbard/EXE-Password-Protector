unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EditRexe, ExtCtrls, ShellApi, ComCtrls, Spin, Menus,
  IniFiles, ChkSums, PNGImage, CommCtrl, uxTheme, XPMan;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Timer1: TTimer;
    Button2: TButton;
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Memo2: TMemo;
    Memo3: TMemo;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox9: TCheckBox;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    GroupBox2: TGroupBox;
    Edit2: TEdit;
    Button1: TButton;
    GroupBox3: TGroupBox;
    Edit1: TEdit;
    Button3: TButton;
    ProgressBar2: TProgressBar;
    Label2: TLabel;
    Label4: TLabel;
    SpinEdit2: TSpinEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton3: TRadioButton;
    Label3: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ProgressBar1: TProgressBar;
    GroupBox4: TGroupBox;
    Button5: TButton;
    Button4: TButton;
    Edit3: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Header1: THeader;
    Header2: THeader;
    Button7: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1PropertiesChange(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label10MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpinEdit2Click(Sender: TObject);
    procedure SpinEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure SpinEdit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
  private
    { Private declarations }
    flbHorzScrollWidth: Integer;
  public
    { Public declarations }
    procedure WriteOptions;
    procedure ReadOptions;
  end;

type
  TFileVersionInfo = record
    FileType,
    CompanyName,
    FileDescription,
    FileVersion,
    InternalName,
    LegalCopyRight,
    LegalTradeMarks,
    OriginalFileName,
    ProductName,
    ProductVersion,
    Comments,
    SpecialBuildStr,
    PrivateBuildStr,
    FileFunction: string;
    DebugBuild,
    PreRelease,
    SpecialBuild,
    PrivateBuild,
    Patched,
    InfoInferred: Boolean;
  end;

var
  Form1: TForm1;
  t : Extended;
  TIF : TIniFile;

const
  DataBufferSize = 1024*1024;  

implementation

{$R *.dfm}
function MainDir : string;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

procedure TForm1.WriteOptions;    // ################### Options Write
var OPT :string;
begin
   OPT := 'Options';

   if not DirectoryExists(MainDir + 'Data\Options\')
   then ForceDirectories(MainDir + 'Data\Options\');

   TIF := TIniFile.Create(MainDir + 'Data\Options\Options.ini');
   with TIF do
   begin
   WriteInteger(OPT,'Count',SpinEdit2.Value);
   if CheckBox4.Checked = true then begin
   WriteString(OPT,'LastPass',Edit1.Text);
   end;
   WriteBool(OPT,'HEX',RadioButton1.Checked);
   WriteBool(OPT,'Numbers',RadioButton2.Checked);
   WriteBool(OPT,'Letters',RadioButton3.Checked);
   WriteBool(OPT,'Custom',RadioButton4.Checked);
   WriteBool(OPT,'Try64',CheckBox1.Checked);
   WriteBool(OPT,'Backup',CheckBox2.Checked);
   WriteBool(OPT,'SavePass',CheckBox3.Checked);
   WriteBool(OPT,'SaveLastPass',CheckBox4.Checked);
   WriteBool(OPT,'ClearBackup',CheckBox5.Checked);
   WriteBool(OPT,'ReportDescription',CheckBox6.Checked);
   WriteBool(OPT,'DumpDOSInfo',CheckBox7.Checked);
   WriteBool(OPT,'DumpPEInfo',CheckBox8.Checked);
   WriteBool(OPT,'DumpOptionalInfo',CheckBox9.Checked);
   WriteBool(OPT,'Time',CheckBox10.Checked);
   WriteBool(OPT,'Size',CheckBox11.Checked);
   WriteBool(OPT,'8bit',CheckBox12.Checked);
   WriteBool(OPT,'16bit',CheckBox13.Checked);
   WriteBool(OPT,'32bit',CheckBox14.Checked);
   WriteBool(OPT,'64bit',CheckBox15.Checked);

   //WriteBool(OPT,'SaveOptions',CheckBox1.Checked);
   //WriteInteger(OPT,'Compress',Combobox1.ItemIndex);
   //WriteInteger(OPT,'Overlay',RadioGroup1.ItemIndex);
   Free;
   end;
end;

procedure TForm1.ReadOptions;    // ################### Options Read
var OPT:string;
begin
  OPT := 'Options';
  if FileExists(MainDir + 'Data\Options\Options.ini') then
  begin
  TIF:=TIniFile.Create(MainDir + 'Data\Options\Options.ini');
  with TIF do
  begin
  SpinEdit2.Value:=ReadInteger(OPT,'Count',SpinEdit2.Value);
  if CheckBox4.Checked = true then begin
  Edit1.Text:=ReadString(OPT,'LastPass',Edit1.Text);
  end;
  RadioButton1.Checked:=ReadBool(OPT,'HEX',RadioButton1.Checked);
  RadioButton2.Checked:=ReadBool(OPT,'Numbers',RadioButton2.Checked);
  RadioButton3.Checked:=ReadBool(OPT,'Letters',RadioButton3.Checked);
  RadioButton4.Checked:=ReadBool(OPT,'Custom',RadioButton4.Checked);
  CheckBox1.Checked:=ReadBool(OPT,'Try64',CheckBox1.Checked);
  CheckBox2.Checked:=ReadBool(OPT,'Backup',CheckBox2.Checked);
  CheckBox3.Checked:=ReadBool(OPT,'SavePass',CheckBox3.Checked);
  CheckBox4.Checked:=ReadBool(OPT,'SaveLastPass',CheckBox4.Checked);
  CheckBox5.Checked:=ReadBool(OPT,'ClearBackup',CheckBox5.Checked);
  CheckBox6.Checked:=ReadBool(OPT,'ReportDescription',CheckBox6.Checked);
  CheckBox7.Checked:=ReadBool(OPT,'DumpDOSInfo',CheckBox7.Checked);
  CheckBox8.Checked:=ReadBool(OPT,'DumpPEInfo',CheckBox8.Checked);
  CheckBox9.Checked:=ReadBool(OPT,'DumpOptionalInfo',CheckBox9.Checked);
  CheckBox10.Checked:=ReadBool(OPT,'Time',CheckBox10.Checked);
  CheckBox11.Checked:=ReadBool(OPT,'Size',CheckBox11.Checked);
  CheckBox12.Checked:=ReadBool(OPT,'8bit',CheckBox12.Checked);
  CheckBox13.Checked:=ReadBool(OPT,'16bit',CheckBox13.Checked);
  CheckBox14.Checked:=ReadBool(OPT,'32bit',CheckBox14.Checked);
  CheckBox15.Checked:=ReadBool(OPT,'64bit',CheckBox15.Checked);

  //CheckBox1.Checked:=ReadBool(OPT,'SaveOptions',CheckBox1.Checked);
  //Combobox1.ItemIndex:=ReadInteger(OPT,'Compress',combobox1.ItemIndex);
  //RadioGroup1.ItemIndex:=ReadInteger(OPT,'Overlay',RadioGroup1.ItemIndex);
  Free;
  end;
  end;
end;

procedure DumpDOSHeader(const h: IMAGE_DOS_HEADER; Lines: TStrings);
begin
  Lines.Add('');
  Lines.Add('DUMP DOS FILE HEADER :');
  Lines.Add(Format('Magic number: %d', [h.e_magic]));
  Lines.Add(Format('Bytes on last page of file: %d', [h.e_cblp]));
  Lines.Add(Format('Pages in file: %d', [h.e_cp]));
  Lines.Add(Format('Relocations: %d', [h.e_crlc]));
  Lines.Add(Format('Size of header in paragraphs: %d', [h.e_cparhdr]));
  Lines.Add(Format('Minimum extra paragraphs needed: %d', [h.e_minalloc]));
  Lines.Add(Format('Maximum extra paragraphs needed: %d', [h.e_maxalloc]));
  Lines.Add(Format('Initial (relative) SS value: %d', [h.e_ss]));
  Lines.Add(Format('Initial SP value: %d', [h.e_sp]));
  Lines.Add(Format('Checksum: %d', [h.e_csum]));
  Lines.Add(Format('Initial IP value: %d', [h.e_ip]));
  Lines.Add(Format('Initial (relative) CS value: %d', [h.e_cs]));
  Lines.Add(Format('File address of relocation table: %d', [h.e_lfarlc]));
  Lines.Add(Format('Overlay number: %d', [h.e_ovno]));
  Lines.Add(Format('OEM identifier (for e_oeminfo): %d', [h.e_oemid]));
  Lines.Add(Format('OEM information; e_oemid specific: %d', [h.e_oeminfo]));
  Lines.Add(Format('File address of new exe header: %d', [h._lfanew]));
  Lines.Add('');
end;

procedure DumpPEHeader(const h: IMAGE_FILE_HEADER; Lines: TStrings);
var
  dt: TDateTime;
begin
  Lines.Add('DUMP OF PE FILE HEADER :');
  Lines.Add(Format('Machine: %4x', [h.Machine]));
  case h.Machine of
    IMAGE_FILE_MACHINE_UNKNOWN : Lines.Add(' MACHINE_UNKNOWN ');
    IMAGE_FILE_MACHINE_I386: Lines.Add(' Intel 386. ');
    IMAGE_FILE_MACHINE_R3000: Lines.Add(' MIPS little-endian, 0x160 big-endian ');
    IMAGE_FILE_MACHINE_R4000: Lines.Add(' MIPS little-endian ');
    IMAGE_FILE_MACHINE_R10000: Lines.Add(' MIPS little-endian ');
    IMAGE_FILE_MACHINE_ALPHA: Lines.Add(' Alpha_AXP ');
    IMAGE_FILE_MACHINE_POWERPC: Lines.Add(' IBM PowerPC Little-Endian ');
    // some values no longer defined in winnt.h
    $14D: Lines.Add(' Intel i860');
    $268: Lines.Add(' Motorola 68000');
    $290: Lines.Add(' PA RISC');
    else
      Lines.Add(' unknown machine type');
  end; { Case }
  Lines.Add(Format('NumberOfSections: %d', [h.NumberOfSections]));
  Lines.Add(Format('TimeDateStamp: %d', [h.TimeDateStamp]));
  dt := EncodeDate(1970, 1, 1) + h.Timedatestamp / SecsPerDay;
  Lines.Add(FormatDateTime(' c', dt));

  Lines.Add(Format('PointerToSymbolTable: %d', [h.PointerToSymbolTable]));
  Lines.Add(Format('NumberOfSymbols: %d', [h.NumberOfSymbols]));
  Lines.Add(Format('SizeOfOptionalHeader: %d', [h.SizeOfOptionalHeader]));
  Lines.Add(Format('Characteristics: %d', [h.Characteristics]));
  if (IMAGE_FILE_DLL and h.Characteristics) <> 0 then
    Lines.Add(' file is a DLL')
  else if (IMAGE_FILE_EXECUTABLE_IMAGE and h.Characteristics) <> 0 then
    Lines.Add(' file is a program');
  Lines.Add('');
end;

procedure DumpOptionalHeader(const h: IMAGE_OPTIONAL_HEADER; Lines: TStrings);
begin
  Lines.Add('DUMP OF PE OPTIONAL FILE HEADER :');
  Lines.Add(Format('Magic: %d', [h.Magic]));
  case h.Magic of
    $107: Lines.Add(' ROM image');
    $10b: Lines.Add(' executable image');
    else
      Lines.Add(' unknown image type');
  end; { If }
  Lines.Add(Format('MajorLinkerVersion: %d', [h.MajorLinkerVersion]));
  Lines.Add(Format('MinorLinkerVersion: %d', [h.MinorLinkerVersion]));
  Lines.Add(Format('SizeOfCode: %d', [h.SizeOfCode]));
  Lines.Add(Format('SizeOfInitializedData: %d', [h.SizeOfInitializedData]));
  Lines.Add(Format('SizeOfUninitializedData: %d', [h.SizeOfUninitializedData]));
  Lines.Add(Format('AddressOfEntryPoint: %d', [h.AddressOfEntryPoint]));
  Lines.Add(Format('BaseOfCode: %d', [h.BaseOfCode]));
  Lines.Add(Format('BaseOfData: %d', [h.BaseOfData]));
  Lines.Add(Format('ImageBase: %d', [h.ImageBase]));
  Lines.Add(Format('SectionAlignment: %d', [h.SectionAlignment]));
  Lines.Add(Format('FileAlignment: %d', [h.FileAlignment]));
  Lines.Add(Format('MajorOperatingSystemVersion: %d', [h.MajorOperatingSystemVersion]));
  Lines.Add(Format('MinorOperatingSystemVersion: %d', [h.MinorOperatingSystemVersion]));
  Lines.Add(Format('MajorImageVersion: %d', [h.MajorImageVersion]));
  Lines.Add(Format('MinorImageVersion: %d', [h.MinorImageVersion]));
  Lines.Add(Format('MajorSubsystemVersion: %d', [h.MajorSubsystemVersion]));
  Lines.Add(Format('MinorSubsystemVersion: %d', [h.MinorSubsystemVersion]));
  Lines.Add(Format('Win32VersionValue: %d', [h.Win32VersionValue]));
  Lines.Add(Format('SizeOfImage: %d', [h.SizeOfImage]));
  Lines.Add(Format('SizeOfHeaders: %d', [h.SizeOfHeaders]));
  Lines.Add(Format('CheckSum: %d', [h.CheckSum]));
  Lines.Add(Format('Subsystem: %d', [h.Subsystem]));
  case h.Subsystem of
    IMAGE_SUBSYSTEM_NATIVE:
      Lines.Add(' Image doesn''t require a subsystem. ');
    IMAGE_SUBSYSTEM_WINDOWS_GUI:
      Lines.Add(' Image runs in the Windows GUI subsystem. ');
    IMAGE_SUBSYSTEM_WINDOWS_CUI:
      Lines.Add(' Image runs in the Windows character subsystem. ');
    IMAGE_SUBSYSTEM_OS2_CUI:
      Lines.Add(' image runs in the OS/2 character subsystem. ');
    IMAGE_SUBSYSTEM_POSIX_CUI:
      Lines.Add(' image run in the Posix character subsystem. ');
    else
      Lines.Add(' unknown subsystem')
  end; { Case }
  Lines.Add(Format('DllCharacteristics: %d', [h.DllCharacteristics]));
  Lines.Add(Format('SizeOfStackReserve: %d', [h.SizeOfStackReserve]));
  Lines.Add(Format('SizeOfStackCommit: %d', [h.SizeOfStackCommit]));
  Lines.Add(Format('SizeOfHeapReserve: %d', [h.SizeOfHeapReserve]));
  Lines.Add(Format('SizeOfHeapCommit: %d', [h.SizeOfHeapCommit]));
  Lines.Add(Format('LoaderFlags: %d', [h.LoaderFlags]));
  Lines.Add(Format('NumberOfRvaAndSizes: %d', [h.NumberOfRvaAndSizes]));
end;

function FileVersionInfo(const sAppNamePath: TFileName): TFileVersionInfo;
var
  rSHFI: TSHFileInfo;
  iRet: Integer;
  VerSize: Integer;
  VerBuf: PChar;
  VerBufValue: Pointer;
  VerHandle: Cardinal;
  VerBufLen: Cardinal;
  VerKey: string;
  FixedFileInfo: PVSFixedFileInfo;

  // dwFileType, dwFileSubtype
  function GetFileSubType(FixedFileInfo: PVSFixedFileInfo): string;
  begin
    case FixedFileInfo.dwFileType of

      VFT_UNKNOWN: Result    := 'Unknown';
      VFT_APP: Result        := 'Application';
      VFT_DLL: Result        := 'DLL';
      VFT_STATIC_LIB: Result := 'Static-link Library';

      VFT_DRV:
        case
          FixedFileInfo.dwFileSubtype of
          VFT2_UNKNOWN: Result         := 'Unknown Driver';
          VFT2_DRV_COMM: Result        := 'Communications Driver';
          VFT2_DRV_PRINTER: Result     := 'Printer Driver';
          VFT2_DRV_KEYBOARD: Result    := 'Keyboard Driver';
          VFT2_DRV_LANGUAGE: Result    := 'Language Driver';
          VFT2_DRV_DISPLAY: Result     := 'Display Driver';
          VFT2_DRV_MOUSE: Result       := 'Mouse Driver';
          VFT2_DRV_NETWORK: Result     := 'Network Driver';
          VFT2_DRV_SYSTEM: Result      := 'System Driver';
          VFT2_DRV_INSTALLABLE: Result := 'InstallableDriver';
          VFT2_DRV_SOUND: Result       := 'Sound Driver';
        end;
      VFT_FONT:
        case FixedFileInfo.dwFileSubtype of
          VFT2_UNKNOWN: Result       := 'Unknown Font';
          VFT2_FONT_RASTER: Result   := 'Raster Font';
          VFT2_FONT_VECTOR: Result   := 'Vector Font';
          VFT2_FONT_TRUETYPE: Result := 'Truetype Font';
          else;
        end;
      VFT_VXD: Result := 'Virtual Defice Identifier = ' +
          IntToHex(FixedFileInfo.dwFileSubtype, 8);
    end;
  end;


  function HasdwFileFlags(FixedFileInfo: PVSFixedFileInfo; Flag: Word): Boolean;
  begin
    Result := (FixedFileInfo.dwFileFlagsMask and
      FixedFileInfo.dwFileFlags and
      Flag) = Flag;
  end;

  function GetFixedFileInfo: PVSFixedFileInfo;
  begin
    if not VerQueryValue(VerBuf, '', Pointer(Result), VerBufLen) then
      Result := nil
  end;

  function GetInfo(const aKey: string): string;
  begin
    Result := '';
    VerKey := Format('\StringFileInfo\%.4x%.4x\%s',
      [LoWord(Integer(VerBufValue^)),
      HiWord(Integer(VerBufValue^)), aKey]);
    if VerQueryValue(VerBuf, PChar(VerKey), VerBufValue, VerBufLen) then
      Result := StrPas(VerBufValue);
  end;

  function QueryValue(const aValue: string): string;
  begin
    Result := '';
    // obtain version information about the specified file
    if GetFileVersionInfo(PChar(sAppNamePath), VerHandle, VerSize, VerBuf) and
      // return selected version information
      VerQueryValue(VerBuf, '\VarFileInfo\Translation', VerBufValue, VerBufLen) then
      Result := GetInfo(aValue);
  end;
begin
  // Initialize the Result
  with Result do
  begin
    FileType         := '';
    CompanyName      := '';
    FileDescription  := '';
    FileVersion      := '';
    InternalName     := '';
    LegalCopyRight   := '';
    LegalTradeMarks  := '';
    OriginalFileName := '';
    ProductName      := '';
    ProductVersion   := '';
    Comments         := '';
    SpecialBuildStr  := '';
    PrivateBuildStr  := '';
    FileFunction     := '';
    DebugBuild       := False;
    Patched          := False;
    PreRelease       := False;
    SpecialBuild     := False;
    PrivateBuild     := False;
    InfoInferred     := False;
  end;

  // Get the file type
  if SHGetFileInfo(PChar(sAppNamePath), 0, rSHFI, SizeOf(rSHFI),
    SHGFI_TYPENAME) <> 0 then
  begin
    Result.FileType := rSHFI.szTypeName;
  end;

  iRet := SHGetFileInfo(PChar(sAppNamePath), 0, rSHFI, SizeOf(rSHFI), SHGFI_EXETYPE);
  if iRet <> 0 then
  begin
    // determine whether the OS can obtain version information
    VerSize := GetFileVersionInfoSize(PChar(sAppNamePath), VerHandle);
    if VerSize > 0 then
    begin
      VerBuf := AllocMem(VerSize);
      try
        with Result do
        begin
          CompanyName      := QueryValue('CompanyName');
          FileDescription  := QueryValue('FileDescription');
          FileVersion      := QueryValue('FileVersion');
          InternalName     := QueryValue('InternalName');
          LegalCopyRight   := QueryValue('LegalCopyRight');
          LegalTradeMarks  := QueryValue('LegalTradeMarks');
          OriginalFileName := QueryValue('OriginalFileName');
          ProductName      := QueryValue('ProductName');
          ProductVersion   := QueryValue('ProductVersion');
          Comments         := QueryValue('Comments');
          SpecialBuildStr  := QueryValue('SpecialBuild');
          PrivateBuildStr  := QueryValue('PrivateBuild');
          // Fill the VS_FIXEDFILEINFO structure
          FixedFileInfo := GetFixedFileInfo;
          DebugBuild    := HasdwFileFlags(FixedFileInfo, VS_FF_DEBUG);
          PreRelease    := HasdwFileFlags(FixedFileInfo, VS_FF_PRERELEASE);
          PrivateBuild  := HasdwFileFlags(FixedFileInfo, VS_FF_PRIVATEBUILD);
          SpecialBuild  := HasdwFileFlags(FixedFileInfo, VS_FF_SPECIALBUILD);
          Patched       := HasdwFileFlags(FixedFileInfo, VS_FF_PATCHED);
          InfoInferred  := HasdwFileFlags(FixedFileInfo, VS_FF_INFOINFERRED);
          FileFunction  := GetFileSubType(FixedFileInfo);
        end;
      finally
        FreeMem(VerBuf, VerSize);
      end
    end;
  end
end;

function MyGetFileSize(const Filename: string): TULargeInteger; 
var 
  Find: THandle;
  Data: TWin32FindData; 
begin 
  Result.QuadPart := -1; 
  Find := FindFirstFile(PChar(Filename), Data); 
  if (Find <> INVALID_HANDLE_VALUE) then 
  begin 
    Result.LowPart := Data.nFileSizeLow; 
    Result.HighPart := Data.nFileSizeHigh; 
    Windows.FindClose(Find); 
  end; 
end;

function IsExecutable32Bit(const lpExeFilename: String): Boolean;
const
  kb32 = 1024 * 32;
var
  Buffer : Array[0..kb32-1] of Byte; 
  hFile : DWord;
  bRead : DWord;
  bToRead : DWord;
  pDos : PImageDosHeader;
  pNt : PImageNtHeaders;
begin
  Result := False;
  hFile := CreateFile(pChar(lpExeFilename), GENERIC_READ, FILE_SHARE_READ, NIL,
    OPEN_EXISTING, 0, 0);
  if hFile <> INVALID_HANDLE_VALUE then
    try
      bToRead := GetFileSize(hFile, NIL);
      if bToRead > kb32 then bToRead := kb32;
      if not ReadFile(hFile, Buffer, bToRead, bRead, NIL) then Exit;
      if bRead = bToRead then
      begin
        pDos := @Buffer[0];
        if pDos.e_magic = IMAGE_DOS_SIGNATURE then
        begin
          pNt := PImageNtHeaders(LongInt(pDos) + pDos._lfanew);
          if pNt.Signature = IMAGE_NT_SIGNATURE then
            Result := pNt.FileHeader.Machine and IMAGE_FILE_32BIT_MACHINE > 0;
        end; {
        else
          raise Exception.Create('File is not a valid executable.');
        }
      end; {
        else
          raise Exception.Create('File is not an executable.');
        }
    finally
      CloseHandle(hFile);
    end;
end;

function IsExecutable64Bit(const lpExeFilename: String): Boolean;
begin
  Result := not IsExecutable32Bit(lpExeFilename);
end;

function DeleteFile(const AFile: string): boolean;
var
 sh: SHFileOpStruct;
begin
 ZeroMemory(@sh, sizeof(sh));
 with sh do
   begin
   Wnd := Application.Handle;
   wFunc := fo_Delete;
   pFrom := PChar(AFile +#0);
   fFlags := fof_Silent or fof_NoConfirmation;
   end;
 result := SHFileOperation(sh) = 0;
end;

function ReadFile(FileName: String): AnsiString;
var
  F             :File;
  Buffer        :AnsiString;
  Size,ReadBytes:Integer;
  DefaultFileMode:Byte;
begin
  Result := '';
  DefaultFileMode := FileMode;
  FileMode := 0;
  AssignFile(F, FileName);
  Reset(F, 1);

  if (IOResult = 0) then
  begin
    Size := FileSize(F);
    while (Size > 1024) do
    begin
      SetLength(Buffer, 1024);
      BlockRead(F, Buffer[1], 1024, ReadBytes);
      Result := Result + Buffer;
      Dec(Size, ReadBytes);
    end;
    SetLength(Buffer, Size);
    BlockRead(F, Buffer[1], Size);
    Result := Result + Buffer;
    CloseFile(F);
  end;

  FileMode := DefaultFileMode;
end;

function Xorit(Buffer :String; Key :Integer) :String;
var
  i, c, x  :Integer;
begin
  for i := 1 to Length(Buffer) do
  begin
    c := Integer(Buffer[i]);
    x := c xor Key;
    Result := Result + Char(x);
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  p, i, max : integer;
  s, str, blocks : string;
begin
  t := t + 4.03;

  //if t = 76.6 then t := 76.63;
  if t = 40.3 then t := 40.33;

  max := SpinEdit2.Value;
  s := FloatToStr(t);
  if s = '76,6' then s := '76,61';
  p := pos(',',s);
  if p > 0 then s[p] := '.';

  Label1.Alignment := taCenter;
  Label1.Layout := tlCenter;
  Label1.Caption := s + ' %';

  Label9.Caption := '';
  for i := 0 to max do
  begin
  Randomize;
     str := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
     blocks := '';
     blocks := blocks + str[Random(Length(str) + max) + 1];
     Label9.Caption := Label9.Caption + blocks;
  end;

  ProgressBar1.Position := Round(t);
  if t > 100.00 then begin
  Timer1.Enabled := false;
  Label1.Caption := '100.00 %';
  Button2.Click;
  Exit;
  end;
  Application.ProcessMessages;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not FileExists(MainDir + 'Data\Drivers\Crypt.dll') then begin
  ShowMessage('Error "Crypt.dll" not found, check Drivers Folder !');
  Application.Terminate; end;

  if not FileExists(MainDir + 'Data\Drivers\PE-Files.dll') then begin
  ShowMessage('Error "PE-Files.dll" not found, check Drivers Folder !');
  Application.Terminate; end;

  if not FileExists(MainDir + 'Data\Drivers\RunPE.dll') then begin
  ShowMessage('Error "RunPE.dll" not found, check Drivers Folder !');
  Application.Terminate; end;

  if not DirectoryExists(MainDir + 'Data\Password\')
   then ForceDirectories(MainDir + 'Data\Password\');

  if not DirectoryExists(MainDir + 'Data\Backup\')
   then ForceDirectories(MainDir + 'Data\Backup\');

  Label1.Alignment := taCenter;
  Label1.Layout := tlCenter;
  t := 0.00;
  Listbox1.Perform(LB_SetHorizontalExtent, 300, Longint(0));
  Listbox2.Perform(LB_SetHorizontalExtent, 300, Longint(0));


end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Buffer,Pword :String;
begin
  Pword  := Xorit(Edit1.Text, 125684);
  Buffer := Xorit(ReadFile(Edit2.Text), 1337);

  CopyFile(PChar(ExtractFilePath(Application.ExeName) + 'Data\Crypter\Crypter.exe'),
                 PChar(SaveDialog1.FileName), False);
  InsOrReplaceInFile('PW', SaveDialog1.FileName, Pword);
  InsOrReplaceInFile('FE', SaveDialog1.FileName, Buffer);
  MessageBoxA(0, 'Your program is now Encrypted and Protected, dont forget Password.',
                 'EXE Protector', 64);
  //DeleteFile(ExtractFilePath(OpenDialog1.FileName) + 'Crypter.exe');

  Label9.Caption := 'Crypting done, EXE new Size : ' +
              IntToStr( MyGetFileSize(Edit3.Text).QuadPart div 1000 ) + ' Kb';
  Button7.Click;
end;
procedure TForm1.FormShow(Sender: TObject);

begin
   ReadOptions;
   SpinEdit2.OnClick(sender);
   Button3.OnClick(sender);
   

end;

procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Edit1.Text := UpperCase(Edit1.Text);
  Edit1.SelStart := Length(Edit1.Text);
end;

procedure TForm1.Edit1PropertiesChange(Sender: TObject);
begin
  if Edit1.Text = '' then begin
  Button5.Enabled := false;
  end else begin
  Button5.Enabled := true;
  end;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture; Perform(wm_syscommand,$f012, 0);
end;

procedure TForm1.Label5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture; Perform(wm_syscommand,$f012, 0);
end;

procedure TForm1.Label6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture; Perform(wm_syscommand,$f012, 0);
end;

procedure TForm1.Label10MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture; Perform(wm_syscommand,$f012, 0);
end;

procedure TForm1.Label7MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture; Perform(wm_syscommand,$f012, 0);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteOptions;

  if CheckBox5.Checked = true then begin
  DeleteFile(MainDir + 'Data\Backup\*.*');
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  FvI: TFileVersionInfo;
  fs: TFilestream;
  signature: DWORD;
  dos_header: IMAGE_DOS_HEADER;
  pe_header: IMAGE_FILE_HEADER;
  opt_header: IMAGE_OPTIONAL_HEADER;

  R8   : TSum8;
  R16  : TSum16;
  R32  : TSum32;
  R64  : TSum64;
  Data     : pByte;
  DataSize : LongInt;
  GT : LongWord;
  RSZ: LongWord;
const
  Tabulator: array[0..0] of Integer = (70);
  BoolValues: array[Boolean] of string = ('No', 'Yes');
begin
  Edit2.Text := '';
  if OpenDialog1.Execute then begin
    Edit2.Text := OpenDialog1.FileName;
    ProgressBar1.Position := 0;
    t := 0.00;
    StatusBar1.Panels[1].Text := ExtractFileName(OpenDialog1.FileName);
    StatusBar1.Panels[3].Text := IntToStr( MyGetFileSize(OpenDialog1.FileName).QuadPart div 1000 ) + ' Kb';
    Button5.Enabled := true;

    if CheckBox2.Checked = true then begin
    CopyFile(PChar(OpenDialog1.FileName),
                 PChar(MainDir + 'Data\Backup\' + ExtractFileName(OpenDialog1.FileName)), true);
    end;
  end;

  if Edit2.Text = '' then begin
  StatusBar1.Panels[1].Text := '';
  StatusBar1.Panels[3].Text := '0 Kb';
  StatusBar1.Panels[5].Text := '';
  Exit;
  end;

  // 64 bit
  if CheckBox1.Checked = false then begin
  if IsExecutable64Bit(OpenDialog1.FileName) = true then begin
  Beep;
  StatusBar1.Panels[5].Text :=  '64 Bit';
  MessageDlg('This EXE has a 64 bit architecture, click try Crypt 64 bit on Options.',mtInformation, [mbOK], 0);
  Button5.Enabled := false;
  end else begin
  StatusBar1.Panels[5].Text :=  '32 Bit';
  Button5.Enabled := true;
  end;
  end;
  // 64 bit end;

  ListBox1.Clear;

  if CheckBox6.Checked = true then begin
  FvI := FileVersionInfo(OpenDialog1.FileName);
  ListBox1.TabWidth := 1;
  SendMessage(ListBox1.Handle, LB_SETTABSTOPS, 1, Longint(@Tabulator));
  with FvI, ListBox1.Items do
  begin
    Add('FileType :'#9 + FileType);
    Add('CompanyName :'#9 + CompanyName);
    Add('FileDescription :'#9 + FileDescription); // siehe Eigenschaftsdialog des Explorers
    Add('FileVersion :'#9 + FileVersion);
    Add('InternalName :'#9 + InternalName);
    Add('LegalCopyRight :'#9 + LegalCopyRight);
    Add('LegalTradeMarks :'#9 + LegalTradeMarks);
    Add('OriginalFileName :'#9 + OriginalFileName);
    Add('ProductName :'#9 + ProductName);
    Add('ProductVersion :'#9 + ProductVersion);
    Add('SpecialBuildStr :'#9 + SpecialBuildStr);
    Add('PrivateBuildStr :'#9 + PrivateBuildStr);
    Add('FileFunction :'#9 + FileFunction);
    Add('DebugBuild :'#9 + BoolValues[DebugBuild]);
    Add('PreRelease :'#9 + BoolValues[PreRelease]);
    Add('PrivateBuild :'#9 + BoolValues[PrivateBuild]);
    Add('SpecialBuild :'#9 + BoolValues[SpecialBuild]);
  end;
  end;

  ////////////////////////////
  begin
      fs := TFilestream.Create(OpenDialog1.FileName, fmOpenread or fmShareDenyNone);
      try

        fs.read(dos_header, SizeOf(dos_header));
        if dos_header.e_magic <> IMAGE_DOS_SIGNATURE then
        begin
          ListBox1.Items.Add('Invalid File Header');
          Exit;
        end;
        if CheckBox7.Checked = true then begin
        DumpDOSHeader(dos_header, ListBox1.Items);
        end;

        fs.seek(dos_header._lfanew, soFromBeginning);
        fs.read(signature, SizeOf(signature));
        if signature <> IMAGE_NT_SIGNATURE then
        begin
          ListBox1.Items.Add('Invalid PE Header');
          Exit;
        end;

        fs.read(pe_header, SizeOf(pe_header));

        if CheckBox8.Checked = true then begin
        DumpPEHeader(pe_header, ListBox1.Items);
        end;

        if CheckBox9.Checked = true then begin
        if pe_header.SizeOfOptionalHeader > 0 then
        begin
          fs.read(opt_header, SizeOf(opt_header));
          DumpOptionalHeader(opt_header, ListBox1.Items);
        end;
        end;

      finally
        fs.Free;
      end;
    end;
    //////////////////////////////////////////

    //////////////
    try
    Memo2.Clear;

    R8   := 0;
    R16  := 0;
    R32  := 0;
    R64  := 0;

    with TFileStream.Create(Edit2.Text, fmOpenRead) do
    try
      RSZ := 0;
      GT := GetTickCount;
      Data := AllocMem(DataBufferSize);
      repeat
        DataSize := Read(Data^, DataBufferSize);
        R8  := ChkSums.Sum8(Data^, DataSize, R8);
        R16 := ChkSums.Sum16(Data^, DataSize, R16);
        R32 := ChkSums.Sum32(Data^, DataSize, R32);
        R64 := ChkSums.Sum64(Data^, DataSize, R64);
        inc(RSZ, DataSize);
        Application.ProcessMessages;
      until
      DataSize < DataBufferSize;
      GT := GetTickCount-GT;
    finally
      FreeMem(Data, DataBufferSize);
      Free;
    end;

    if CheckBox10.Checked = true then begin
    Memo2.Lines.Add(format('Checksum Calculation: %.3n sec', [GT*0.001]));
    end;
    if CheckBox11.Checked = true then begin
    Memo2.Lines.Add(format('Read bytes      : %.2n KBytes', [RSZ/1024]));
    end;
    if CheckBox12.Checked = true then begin
    Memo2.Lines.Add(format('8  bits: 0x%.2x', [R8]));
    end;
    if CheckBox13.Checked = true then begin
    Memo2.Lines.Add(format('16 bits: 0x%.4x', [R16]));
    end;
    if CheckBox14.Checked = true then begin
    Memo2.Lines.Add(format('32 bits: 0x%.8x', [R32]));
    end;
    if CheckBox15.Checked = true then begin
    Memo2.Lines.Add(format('64 bits: 0x%.16x', [R64]));
    end;
  finally
    //ListBox1.Items.EndUpdate;
  end;
  ////////////

  //ListBox1.HeaderSections[0].Text := ExtractFileName(Edit2.Text) + ' Information :';

  Listbox1.Perform(LB_SetHorizontalExtent, 300, Longint(0));
  Listbox2.Perform(LB_SetHorizontalExtent, 300, Longint(0));
  StatusBar1.SetFocus;
end;

procedure TForm1.Button3Click(Sender: TObject);
var i, max : integer;
    str : string;
begin
  if RadioButton1.Checked = true then begin
  str := '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  max := SpinEdit2.Value;
  Edit1.Text := '';
  for i := 1 to max do
  begin
   Edit1.Text := Edit1.Text + str[random(length(str))];
  end;
  end;

  if RadioButton2.Checked = true then begin
  str := '1234567890';
  max := SpinEdit2.Value;
  Edit1.Text := '';
  for i := 1 to max do
  begin
   Edit1.Text := Edit1.Text + str[random(length(str))];
  end;
  end;

  if RadioButton3.Checked = true then begin
  str := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  max := SpinEdit2.Value;
  Edit1.Text := '';
  for i := 1 to max do
  begin
   Edit1.Text := Edit1.Text + str[random(length(str))];
  end;
  end;

  ProgressBar2.Position := SpinEdit2.Value * 4;
  if SpinEdit2.Value > ProgressBar2.Max then ProgressBar2.Position := 100;
  if SpinEdit2.Value = 100 then ProgressBar2.Position := ProgressBar2.Max;

  if uxTheme.IsThemeActive then
    uxTheme.SetWindowTheme(Form1.ProgressBar2.Handle, '', '');

  if SpinEdit2.Value < 12 then begin
  ProgressBar2.Perform(PBM_SETBARCOLOR, -1, clgreen);
  end;
  if SpinEdit2.Value > 12 then begin
  ProgressBar2.Perform(PBM_SETBARCOLOR, -1, clNavy);
  end;

  if SpinEdit2.Value > 20 then begin
  ProgressBar2.Perform(PBM_SETBARCOLOR, -1, clRed);
  end;

  Application.ProcessMessages;

  StatusBar1.SetFocus;
end;

procedure TForm1.SpinEdit2Click(Sender: TObject);
begin
  ProgressBar2.Position := SpinEdit2.Value * 4;

  if SpinEdit2.Value > ProgressBar2.Max then ProgressBar2.Position := 100;
  if SpinEdit2.Value = 100 then ProgressBar2.Position := ProgressBar2.Max;
end;

procedure TForm1.SpinEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  ProgressBar2.Position := SpinEdit2.Value * 4;
  if SpinEdit2.Value > ProgressBar2.Max then ProgressBar2.Position := 100;
  if SpinEdit2.Value = 100 then ProgressBar2.Position := ProgressBar2.Max;
end;

procedure TForm1.SpinEdit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ProgressBar2.Position := SpinEdit2.Value * 4;

  if SpinEdit2.Value > ProgressBar2.Max then ProgressBar2.Position := 100;
  if SpinEdit2.Value = 100 then ProgressBar2.Position := ProgressBar2.Max;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
  Edit1.ReadOnly := true;
  SpinEdit2.Enabled := true;
  ProgressBar2.Enabled := true;
  SpinEdit2.OnClick(sender);
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
  Edit1.ReadOnly := true;
  SpinEdit2.Enabled := true;
  ProgressBar2.Enabled := true;
  SpinEdit2.OnClick(sender);
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
  Edit1.ReadOnly := true;
  SpinEdit2.Enabled := true;
  ProgressBar2.Enabled := true;
  SpinEdit2.OnClick(sender);
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
  if RadioButton4.Checked = true then begin
  SpinEdit2.Enabled := false;
  ProgressBar2.Position := 1;
  ProgressBar2.Enabled := false;
  Edit1.ReadOnly := false;
  Edit1.SetFocus;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
  if Edit2.Text = '' then begin
  Beep;
  MessageDlg('No EXE Created..',mtInformation, [mbOK], 0);
  Exit;
  StatusBar1.SetFocus;
  end;
  StatusBar1.SetFocus;
  ShellExecute(Handle, 'open', PChar(Edit3.Text), 0 , 0, SW_SHOW);
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  Buffer, Pword :String;
  i : integer;
begin
  StatusBar1.SetFocus;
  if (Edit2.Text = '') or (Edit1.Text = '') then begin
  Beep;
  MessageDlg('No EXE or Password found.',mtInformation, [mbOK], 0);
  Exit;
  StatusBar1.SetFocus;
  end;

  t := 0.00;
  Label1.Caption := '0.00 %';

  if CheckBox3.Checked = true then begin
  Memo1.Clear;
  Memo1.Lines.Add('Password for : ' + ExtractFileName(Edit2.Text));
  Memo1.Lines.Add(Edit1.Text);
  Memo1.Lines.Add('');
  for i := 0 to ListBox1.Items.Count -1 do begin
  Memo1.Lines.Add(ListBox1.Items.Strings[i]);
  end;
  Memo1.Lines.SaveToFile(MainDir + 'Data\Password\' + StatusBar1.Panels[1].Text + '.ini');
  end;

  SaveDialog1.FileName := 'Crypt.' +  StatusBar1.Panels[1].Text;

  if not SaveDialog1.Execute then Exit;

  Edit3.Text := SaveDialog1.FileName;
  Timer1.Enabled := true;
  {
  Pword  := Xorit(Edit1.Text, 125684);
  Buffer := Xorit(ReadFile(Edit2.Text), 1337);

  CopyFile(PChar(ExtractFilePath(ParamStr(0))+'Data\Crypter\Crypter.exe'),
                 PChar(SaveDialog1.FileName), False);
  InsOrReplaceInFile('PW', SaveDialog1.FileName, Pword);
  InsOrReplaceInFile('FE', SaveDialog1.FileName, Buffer);
  MessageBoxA(0, 'Your program is now Encrypted and Protected, dont forget Password.',
                 'Exe Protector', 64);
  DeleteFile(ExtractFilePath(OpenDialog1.FileName) + 'Crypter.exe');
  }
  StatusBar1.SetFocus;
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  FvI: TFileVersionInfo;
  fs: TFilestream;
  signature: DWORD;
  dos_header: IMAGE_DOS_HEADER;
  pe_header: IMAGE_FILE_HEADER;
  opt_header: IMAGE_OPTIONAL_HEADER;

  R8   : TSum8;
  R16  : TSum16;
  R32  : TSum32;
  R64  : TSum64;
  Data     : pByte;
  DataSize : LongInt;
  GT : LongWord;
  RSZ: LongWord;
const
  Tabulator: array[0..0] of Integer = (70);
  BoolValues: array[Boolean] of string = ('No', 'Yes');
begin
  //Edit2.Text := '';
  //if OpenDialog1.Execute then begin
  //  Edit2.Text := OpenDialog1.FileName;
    //ProgressBar1.Position := 0;
    //t := 0.00;
    //StatusBar1.Panels[1].Text := ExtractFileName(OpenDialog1.FileName);
    //StatusBar1.Panels[3].Text := IntToStr( MyGetFileSize(OpenDialog1.FileName).QuadPart div 1000 ) + ' Kb';
    //Button5.Enabled := true;

    //if CheckBox2.Checked = true then begin
    //CopyFile(PChar(OpenDialog1.FileName),
    //             PChar(MainDir + 'Data\Backup\' + ExtractFileName(OpenDialog1.FileName)), true);
    //end;
  //end;

  ListBox2.Clear;

  if CheckBox6.Checked = true then begin
  FvI := FileVersionInfo(Edit3.Text);
  ListBox2.TabWidth := 1;
  SendMessage(ListBox2.Handle, LB_SETTABSTOPS, 1, Longint(@Tabulator));
  with FvI, ListBox2.Items do
  begin
    Add('FileType :'#9 + FileType);
    Add('CompanyName :'#9 + CompanyName);
    Add('FileDescription :'#9 + FileDescription); // siehe Eigenschaftsdialog des Explorers
    Add('FileVersion :'#9 + FileVersion);
    Add('InternalName :'#9 + InternalName);
    Add('LegalCopyRight :'#9 + LegalCopyRight);
    Add('LegalTradeMarks :'#9 + LegalTradeMarks);
    Add('OriginalFileName :'#9 + OriginalFileName);
    Add('ProductName :'#9 + ProductName);
    Add('ProductVersion :'#9 + ProductVersion);
    Add('SpecialBuildStr :'#9 + SpecialBuildStr);
    Add('PrivateBuildStr :'#9 + PrivateBuildStr);
    Add('FileFunction :'#9 + FileFunction);
    Add('DebugBuild :'#9 + BoolValues[DebugBuild]);
    Add('PreRelease :'#9 + BoolValues[PreRelease]);
    Add('PrivateBuild :'#9 + BoolValues[PrivateBuild]);
    Add('SpecialBuild :'#9 + BoolValues[SpecialBuild]);
  end;
  end;

  ////////////////////////////
  begin
      fs := TFilestream.Create(Edit3.Text, fmOpenread or fmShareDenyNone);
      try

        fs.read(dos_header, SizeOf(dos_header));
        if dos_header.e_magic <> IMAGE_DOS_SIGNATURE then
        begin
          ListBox2.Items.Add('Invalid File Header');
          Exit;
        end;
        if CheckBox7.Checked = true then begin
        DumpDOSHeader(dos_header, ListBox2.Items);
        end;

        fs.seek(dos_header._lfanew, soFromBeginning);
        fs.read(signature, SizeOf(signature));
        if signature <> IMAGE_NT_SIGNATURE then
        begin
          ListBox2.Items.Add('Invalid PE Header');
          Exit;
        end;

        fs.read(pe_header, SizeOf(pe_header));

        if CheckBox8.Checked = true then begin
        DumpPEHeader(pe_header, ListBox2.Items);
        end;

        if CheckBox9.Checked = true then begin
        if pe_header.SizeOfOptionalHeader > 0 then
        begin
          fs.read(opt_header, SizeOf(opt_header));
          DumpOptionalHeader(opt_header, ListBox2.Items);
        end;
        end;

      finally
        fs.Free;
      end;
    end;
    //////////////////////////////////////////

    //////////////
    try
    Memo3.Clear;

    R8   := 0;
    R16  := 0;
    R32  := 0;
    R64  := 0;

    with TFileStream.Create(Edit3.Text, fmOpenRead) do
    try
      RSZ := 0;
      GT := GetTickCount;
      Data := AllocMem(DataBufferSize);
      repeat
        DataSize := Read(Data^, DataBufferSize);
        R8  := ChkSums.Sum8(Data^, DataSize, R8);
        R16 := ChkSums.Sum16(Data^, DataSize, R16);
        R32 := ChkSums.Sum32(Data^, DataSize, R32);
        R64 := ChkSums.Sum64(Data^, DataSize, R64);
        inc(RSZ, DataSize);
        Application.ProcessMessages;
      until
      DataSize < DataBufferSize;
      GT := GetTickCount-GT;
    finally
      FreeMem(Data, DataBufferSize);
      Free;
    end;

    if CheckBox10.Checked = true then begin
    Memo3.Lines.Add(format('Checksum Calculation: %.3n sec', [GT*0.001]));
    end;
    if CheckBox11.Checked = true then begin
    Memo3.Lines.Add(format('Read bytes      : %.2n KBytes', [RSZ/1024]));
    end;
    if CheckBox12.Checked = true then begin
    Memo3.Lines.Add(format('8  bits: 0x%.2x', [R8]));
    end;
    if CheckBox13.Checked = true then begin
    Memo3.Lines.Add(format('16 bits: 0x%.4x', [R16]));
    end;
    if CheckBox14.Checked = true then begin
    Memo3.Lines.Add(format('32 bits: 0x%.8x', [R32]));
    end;
    if CheckBox15.Checked = true then begin
    Memo3.Lines.Add(format('64 bits: 0x%.16x', [R64]));
    end;
  finally
    //ListBox1.Items.EndUpdate;
  end;

  Listbox1.Perform(LB_SetHorizontalExtent, 300, Longint(0));
  Listbox2.Perform(LB_SetHorizontalExtent, 300, Longint(0));
  StatusBar1.SetFocus;
end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
begin
  ProgressBar2.Position := SpinEdit2.Value * 4;

  if SpinEdit2.Value > ProgressBar2.Max then ProgressBar2.Position := 100;
  if SpinEdit2.Value = 100 then ProgressBar2.Position := ProgressBar2.Max;

  if uxTheme.IsThemeActive then
    uxTheme.SetWindowTheme(Form1.ProgressBar2.Handle, '', '');

  if SpinEdit2.Value < 12 then begin
  ProgressBar2.Perform(PBM_SETBARCOLOR, -1, clgreen);
  end;
  if SpinEdit2.Value > 12 then begin
  ProgressBar2.Perform(PBM_SETBARCOLOR, -1, clNavy);
  end;

  if SpinEdit2.Value > 20 then begin
  ProgressBar2.Perform(PBM_SETBARCOLOR, -1, clRed);
  end;

  Application.ProcessMessages;
end;

end.

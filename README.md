# EXE-Password-Protector:

</br>

![Compiler](https://github.com/user-attachments/assets/a916143d-3f1b-4e1f-b1e0-1067ef9e0401) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![D7](https://github.com/user-attachments/assets/a0cd940c-4ec5-42ba-988e-2fde2223d582)  
![Components](https://github.com/user-attachments/assets/d6a7a7a4-f10e-4df1-9c4f-b4a1a8db7f0e) : ![None](https://github.com/user-attachments/assets/30ebe930-c928-4aaf-a8e1-5f68ec1ff349)  
![Discription](https://github.com/user-attachments/assets/4a778202-1072-463a-bfa3-842226e300af) &nbsp;&nbsp;: ![EXE Password Protector](https://github.com/user-attachments/assets/23e23ee7-200b-4fd4-b8ae-f4b6d22f80f5)  
![Last Update](https://github.com/user-attachments/assets/e1d05f21-2a01-4ecf-94f3-b7bdff4d44dd) &nbsp;: ![102025](https://github.com/user-attachments/assets/62cea8cc-bd7d-49bd-b920-5590016735c0)  
![License](https://github.com/user-attachments/assets/ff71a38b-8813-4a79-8774-09a2f3893b48) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![Freeware](https://github.com/user-attachments/assets/1fea2bbf-b296-4152-badd-e1cdae115c43)

</br>

An "exe password protector" is software designed to add password protection to executable (.exe) files, preventing unauthorized access to the program. This means that when someone tries to run the protected .exe, they will be prompted for a password before the program can launch. 

</br>

![EXEPasswordCreatorr](https://github.com/user-attachments/assets/e20f97ef-afd8-411b-b0d6-d7b038f29980)

</br>

### Prevents Unauthorized Access:
It restricts access to your applications by requiring a password to run them. 

### Easy to Use:
Many such tools offer a simple interface, often with a drag-and-drop or browse function to select the .exe file. 

### Creates a Security Layer:
It adds a layer of security to your applications, especially useful if you share your computer with others. 

### Backup Option:
Some programs, like EXE Password Protector, offer a backup option for the protected file, which can be helpful if you forget the password. 

### Encryption:
The software typically encrypts the executable file, adding a layer of security. 

### Password Prompt:
When the user tries to open the protected file, they will see a password prompt. 
Decryption (on inputting the correct password):
If the correct password is provided, the software may decrypt the file temporarily for execution, and the program will launch. 

### Example of a program:
ExeLock is one example of such software. It allows you to lock any .exe program with a password, and it supports features like hardware binding and license control. 

### Security:
While it offers a good level of protection, it's not foolproof. A determined user could potentially bypass the protection by analyzing the program's code, though this is more complex and less likely to happen. 

### Password Management:
Ensure you remember the password, as some software may not offer password recovery options.

### Instructions:
The project includes two components.
* The design of the password query
* Building the password into the Execution.
* First, launch the Creator project and create the password prompt. This EXE file must be added to the "..\Data\Crypter\Crypter.exe" folder and renamed to "Crypter.exe".
* Next, the main project is started to integrate the Crypter.exe and rebuild the password query.
* Generate a strong password to prevent unauthorized access to the executable file.

The program can also analyze the content and compare it with the original file. Only the header information and the CRC calculation are compared.

The crypter not only encrypts the execution but also protects the file from unauthorized access. As soon as unauthorized access to the file occurs, the execution is destroyed, rendering the file unusable and unexecutable.

### Here is an ASM excerpt of the Data that is Encrypted:

```asm
 mov_eax_:         String = 'B8';       // MOV EAX,DWORD
 mov_ecx_:         String = 'B9';       // MOV ECX,DWORD
 mov_esi_:         String = 'BE';       // MOV ESI,DWORD
 mov_edi_:         String = 'BF';       // MOV EDI,DWORD
 mov_IXI_:         String = 'C705';
 mov_IXI_eax:      String = 'A3';
 mov_eax_esp:      String = '89E0';     // MOV EAX,ESP
 mov_edx_IeaxI:    String = '8B10';     // MOV EDX,[EAX]
 mov_eax_IediI:    String = '8B07';     // MOV EAX,[EDI]
 mov_esi_IesiI:    String = '8B36';     // MOV ESI,[ESI]
 mov_esi_Ieax1ChI: String = '8B701C';   // MOV ESI,[EAX+$1C]
 mov_edx_Ieax3ChI: String = '8B503C';   // MOV EDX,[EAX+$3C] $3C
 mov_edi_Ieax20hI: String = '8B7820';   // MOV EDI,[EAX+$20]
 mov_eax_Ieax78hI: String = '8B4078';   // MOV EAX,[EAX+$78] $78

 add_eax_edx:      String = '01D0';     // ADD EAX,EDX
 add_edx_eax:      String = '01C2';     // ADD EDX,EAX  (EDX:= EDX + EAX)
 add_edi_edx:      String = '01D7';     // ADD EDI,EDX
 add_esi_edx:      String = '01D6';     // ADD ESI,EDX
 add_edi_ecx:      String = '01CF';     // ADD EDI,ECX
 add_esi_ecx:      String = '01CE';     // ADD ESI,ECX
 sub_eax_:         String = '2D';       // SUB EAX

 pushBy_:          String = '6A';       // PUSH (Byte)
 pushDW_:          String = '68';       // PUSH (DWORD)
 push_eax:         String = '50';       // PUSH EAX
 push_edx:         String = '52';       // PUSH EDX
 push_IXI:         String = 'FF35';     // PUSH
 pop_eax:          String = '58';       // POP EAX

 cmp_dx_:          String = '6681FA';   // CMP DX, (Byte)
 cmp_Ieax4hI_:     String = '817804';   // CMP [EAX+4],(DWORD)
 cmp_dw_Ieax08hI_: String = '817808';   // CMP Dword Ptr [EAX+$08],(DWORD)
 cmp_dw_Ieax0ChI_: String = '81780C';   // CMP Dword Ptr [EAX+$0C],(DWORD)

 jz_:              String = '74';
 jnz_:             String = '0F85';
 jmp_:             String = 'EB';
 jmpe_:            String = 'FF25';
 jmp_eax:          String = 'FFE0';

 call_eax:         String = 'FFD0';     // CALL EAX EAX
 call_esi:         String = 'FFD6';     // CALL ESI ESI
 call_dword_ptr_:  String = 'FF15';     // CALL DWORD

 xor_ax_ax:        String = '6631C0';   // XOR AX,AX
 or_eax_eax:       String = '09C0';     // OR EAX,EAX EAX
 xchg_eax_edx:     String = '87C2';     // XCHG EAX,EDX

 cld:              String = 'FC';
 repe_cmpsb:       String = 'F3A6';

 MZ:               String = '4D5A';
 rocA:             String = '726F6341';
 USER32:           String = '5573657233322E646C6C00';
 LoadLibraryA:     String = '4C6F61644C6962726172794100';
 GetModuleHandleA: String = '4765744D6F64756C6548616E646C654100';
 RegisterClassExA: String = '5265676973746572436C61737345784100';
 CreateWindowExA:  String = '43726561746557696E646F7745784100';
 ShowWindow:       String = '53686F7757696E646F7700';
 GetMessageA:      String = '4765744D6573736167654100';
 TranslateMessage: String = '5472616E736C6174654D65737361676500';
 DispatchMessageA: String = '44697370617463684D6573736167654100';
 ExitProcess:      String = '4578697450726F6365737300';
 DefWindowProcA:   String = '44656657696E646F7750726F634100';
 PostQuitMessage:  String = '506F7374517569744D65737361676500';
 SendMessageA:     String = '53656E644D6573736167654100';
 TWinClass:        String = '5457696E436C61737300';
 WinTitle:         String = 'C2E2E5E4E8F2E520EFE0F0EEEBFC2E00';
 OK:               String = '4F4B00';
 Button:           String = '427574746F6E00';
 Edit:             String = '4564697400';
```

</br>

Encryption works reliably with 32-bit EXE files. 64-bit versions can be problematic. Therefore, a checkbox must be enabled in the options to allow an attempt to encrypt a 64-bit file, which often fails.

You can now try to extract the password using a dumper, but this process, even if successful, will not provide the real password because it is also encrypted.

</br>

<img width="600" height="563" alt="headers-of-the-PE-file" src="https://github.com/user-attachments/assets/359179ec-8d74-4569-a7f0-a007c1e7ac3f" />

</br>

### Virus false alarm:
Once the file is encrypted, the information is no longer the same and is classified as potentially dangerous by virus programs.

An "EXE virus false alarm" means that an antivirus program mistakenly classifies an executable file (EXE file) as malicious when it is actually harmless. These false alarms, also known as false positives, can be triggered by various factors, such as similarities in file structure or compression techniques used.

Ein Fehlalarm liegt vor, wenn ein Antivirenprogramm eine Datei als schädlich erkennt, die tatsächlich keine Malware enthält. 
Solche Fehlalarme können bei verschiedenen Dateitypen auftreten, aber EXE-Dateien sind aufgrund ihrer Ausführbarkeit anfälliger für solche Fehleinstufungen. 
Häufig sind es harmlose Programme oder URLs, die fälschlicherweise als Malware erkannt werden.

Causes of false positives for EXE files:
Similarities in file structure:
Some harmless programs or libraries may have similar file structures or use similar compression techniques as malware.
Behavior-based detection:
Antivirus programs often use behavior-based detection methods, which can detect unusual activity even in legitimate programs, which can lead to a false positive.

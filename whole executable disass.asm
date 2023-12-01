SerialKey2020315118:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:       f3 0f 1e fa             endbr64 
    1004:       48 83 ec 08             sub    $0x8,%rsp
    1008:       48 8b 05 d9 3f 00 00    mov    0x3fd9(%rip),%rax        # 4fe8 <__gmon_start__@Base>
    100f:       48 85 c0                test   %rax,%rax
    1012:       74 02                   je     1016 <_init+0x16>
    1014:       ff d0                   call   *%rax
    1016:       48 83 c4 08             add    $0x8,%rsp
    101a:       c3                      ret    

Disassembly of section .plt:

0000000000001020 <putchar@plt-0x10>:
    1020:       ff 35 e2 3f 00 00       push   0x3fe2(%rip)        # 5008 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:       ff 25 e4 3f 00 00       jmp    *0x3fe4(%rip)        # 5010 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:       0f 1f 40 00             nopl   0x0(%rax)

0000000000001030 <putchar@plt>:
    1030:       ff 25 e2 3f 00 00       jmp    *0x3fe2(%rip)        # 5018 <putchar@GLIBC_2.2.5>
    1036:       68 00 00 00 00          push   $0x0
    103b:       e9 e0 ff ff ff          jmp    1020 <_init+0x20>

0000000000001040 <strncpy@plt>:
    1040:       ff 25 da 3f 00 00       jmp    *0x3fda(%rip)        # 5020 <strncpy@GLIBC_2.2.5>
    1046:       68 01 00 00 00          push   $0x1
    104b:       e9 d0 ff ff ff          jmp    1020 <_init+0x20>

0000000000001050 <strlen@plt>:
    1050:       ff 25 d2 3f 00 00       jmp    *0x3fd2(%rip)        # 5028 <strlen@GLIBC_2.2.5>
    1056:       68 02 00 00 00          push   $0x2
    105b:       e9 c0 ff ff ff          jmp    1020 <_init+0x20>

0000000000001060 <printf@plt>:
    1060:       ff 25 ca 3f 00 00       jmp    *0x3fca(%rip)        # 5030 <printf@GLIBC_2.2.5>
    1066:       68 03 00 00 00          push   $0x3
    106b:       e9 b0 ff ff ff          jmp    1020 <_init+0x20>

0000000000001070 <strcspn@plt>:
    1070:       ff 25 c2 3f 00 00       jmp    *0x3fc2(%rip)        # 5038 <strcspn@GLIBC_2.2.5>
    1076:       68 04 00 00 00          push   $0x4
    107b:       e9 a0 ff ff ff          jmp    1020 <_init+0x20>

0000000000001080 <fgets@plt>:
    1080:       ff 25 ba 3f 00 00       jmp    *0x3fba(%rip)        # 5040 <fgets@GLIBC_2.2.5>
    1086:       68 05 00 00 00          push   $0x5
    108b:       e9 90 ff ff ff          jmp    1020 <_init+0x20>

0000000000001090 <strcmp@plt>:
    1090:       ff 25 b2 3f 00 00       jmp    *0x3fb2(%rip)        # 5048 <strcmp@GLIBC_2.2.5>
    1096:       68 06 00 00 00          push   $0x6
    109b:       e9 80 ff ff ff          jmp    1020 <_init+0x20>

00000000000010a0 <fflush@plt>:
    10a0:       ff 25 aa 3f 00 00       jmp    *0x3faa(%rip)        # 5050 <fflush@GLIBC_2.2.5>
    10a6:       68 07 00 00 00          push   $0x7
    10ab:       e9 70 ff ff ff          jmp    1020 <_init+0x20>

00000000000010b0 <exit@plt>:
    10b0:       ff 25 a2 3f 00 00       jmp    *0x3fa2(%rip)        # 5058 <exit@GLIBC_2.2.5>
    10b6:       68 08 00 00 00          push   $0x8
    10bb:       e9 60 ff ff ff          jmp    1020 <_init+0x20>

00000000000010c0 <__ctype_b_loc@plt>:
    10c0:       ff 25 9a 3f 00 00       jmp    *0x3f9a(%rip)        # 5060 <__ctype_b_loc@GLIBC_2.3>
    10c6:       68 09 00 00 00          push   $0x9
    10cb:       e9 50 ff ff ff          jmp    1020 <_init+0x20>

00000000000010d0 <usleep@plt>:
    10d0:       ff 25 92 3f 00 00       jmp    *0x3f92(%rip)        # 5068 <usleep@GLIBC_2.2.5>
    10d6:       68 0a 00 00 00          push   $0xa
    10db:       e9 40 ff ff ff          jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

00000000000010e0 <__cxa_finalize@plt>:
    10e0:       ff 25 12 3f 00 00       jmp    *0x3f12(%rip)        # 4ff8 <__cxa_finalize@GLIBC_2.2.5>
    10e6:       66 90                   xchg   %ax,%ax

Disassembly of section .text:

00000000000010f0 <_start>:
    10f0:       f3 0f 1e fa             endbr64 
    10f4:       31 ed                   xor    %ebp,%ebp
    10f6:       49 89 d1                mov    %rdx,%r9
    10f9:       5e                      pop    %rsi
    10fa:       48 89 e2                mov    %rsp,%rdx
    10fd:       48 83 e4 f0             and    $0xfffffffffffffff0,%rsp
    1101:       50                      push   %rax
    1102:       54                      push   %rsp
    1103:       45 31 c0                xor    %r8d,%r8d
    1106:       31 c9                   xor    %ecx,%ecx
    1108:       48 8d 3d 51 04 00 00    lea    0x451(%rip),%rdi        # 1560 <main>
    110f:       ff 15 b3 3e 00 00       call   *0x3eb3(%rip)        # 4fc8 <__libc_start_main@GLIBC_2.34>
    1115:       f4                      hlt    
    1116:       66 2e 0f 1f 84 00 00    cs nopw 0x0(%rax,%rax,1)
    111d:       00 00 00 

0000000000001120 <deregister_tm_clones>:
    1120:       48 8d 3d 59 3f 00 00    lea    0x3f59(%rip),%rdi        # 5080 <__TMC_END__>
    1127:       48 8d 05 52 3f 00 00    lea    0x3f52(%rip),%rax        # 5080 <__TMC_END__>
    112e:       48 39 f8                cmp    %rdi,%rax
    1131:       74 15                   je     1148 <deregister_tm_clones+0x28>
    1133:       48 8b 05 96 3e 00 00    mov    0x3e96(%rip),%rax        # 4fd0 <_ITM_deregisterTMCloneTable@Base>
    113a:       48 85 c0                test   %rax,%rax
    113d:       74 09                   je     1148 <deregister_tm_clones+0x28>
    113f:       ff e0                   jmp    *%rax
    1141:       0f 1f 80 00 00 00 00    nopl   0x0(%rax)
    1148:       c3                      ret    
    1149:       0f 1f 80 00 00 00 00    nopl   0x0(%rax)

0000000000001150 <register_tm_clones>:
    1150:       48 8d 3d 29 3f 00 00    lea    0x3f29(%rip),%rdi        # 5080 <__TMC_END__>
    1157:       48 8d 35 22 3f 00 00    lea    0x3f22(%rip),%rsi        # 5080 <__TMC_END__>
    115e:       48 29 fe                sub    %rdi,%rsi
    1161:       48 89 f0                mov    %rsi,%rax
    1164:       48 c1 ee 3f             shr    $0x3f,%rsi
    1168:       48 c1 f8 03             sar    $0x3,%rax
    116c:       48 01 c6                add    %rax,%rsi
    116f:       48 d1 fe                sar    %rsi
    1172:       74 14                   je     1188 <register_tm_clones+0x38>
    1174:       48 8b 05 75 3e 00 00    mov    0x3e75(%rip),%rax        # 4ff0 <_ITM_registerTMCloneTable@Base>
    117b:       48 85 c0                test   %rax,%rax
    117e:       74 08                   je     1188 <register_tm_clones+0x38>
    1180:       ff e0                   jmp    *%rax
    1182:       66 0f 1f 44 00 00       nopw   0x0(%rax,%rax,1)
    1188:       c3                      ret    
    1189:       0f 1f 80 00 00 00 00    nopl   0x0(%rax)

0000000000001190 <__do_global_dtors_aux>:
    1190:       f3 0f 1e fa             endbr64 
    1194:       80 3d e5 3e 00 00 00    cmpb   $0x0,0x3ee5(%rip)        # 5080 <__TMC_END__>
    119b:       75 2b                   jne    11c8 <__do_global_dtors_aux+0x38>
    119d:       55                      push   %rbp
    119e:       48 83 3d 52 3e 00 00    cmpq   $0x0,0x3e52(%rip)        # 4ff8 <__cxa_finalize@GLIBC_2.2.5>
    11a5:       00 
    11a6:       48 89 e5                mov    %rsp,%rbp
    11a9:       74 0c                   je     11b7 <__do_global_dtors_aux+0x27>
    11ab:       48 8b 3d c6 3e 00 00    mov    0x3ec6(%rip),%rdi        # 5078 <__dso_handle>
    11b2:       e8 29 ff ff ff          call   10e0 <__cxa_finalize@plt>
    11b7:       e8 64 ff ff ff          call   1120 <deregister_tm_clones>
    11bc:       c6 05 bd 3e 00 00 01    movb   $0x1,0x3ebd(%rip)        # 5080 <__TMC_END__>
    11c3:       5d                      pop    %rbp
    11c4:       c3                      ret    
    11c5:       0f 1f 00                nopl   (%rax)
    11c8:       c3                      ret    
    11c9:       0f 1f 80 00 00 00 00    nopl   0x0(%rax)

00000000000011d0 <frame_dummy>:
    11d0:       f3 0f 1e fa             endbr64 
    11d4:       e9 77 ff ff ff          jmp    1150 <register_tm_clones>
    11d9:       0f 1f 80 00 00 00 00    nopl   0x0(%rax)

00000000000011e0 <wait_secs>:
    11e0:       41 56                   push   %r14
    11e2:       53                      push   %rbx
    11e3:       50                      push   %rax
    11e4:       85 ff                   test   %edi,%edi
    11e6:       74 3a                   je     1222 <wait_secs+0x42>
    11e8:       89 fb                   mov    %edi,%ebx
    11ea:       4c 8b 35 e7 3d 00 00    mov    0x3de7(%rip),%r14        # 4fd8 <stdout@GLIBC_2.2.5>
    11f1:       66 2e 0f 1f 84 00 00    cs nopw 0x0(%rax,%rax,1)
    11f8:       00 00 00 
    11fb:       0f 1f 44 00 00          nopl   0x0(%rax,%rax,1)
    1200:       bf 40 42 0f 00          mov    $0xf4240,%edi
    1205:       e8 c6 fe ff ff          call   10d0 <usleep@plt>
    120a:       bf 2e 00 00 00          mov    $0x2e,%edi
    120f:       e8 1c fe ff ff          call   1030 <putchar@plt>
    1214:       49 8b 3e                mov    (%r14),%rdi
    1217:       e8 84 fe ff ff          call   10a0 <fflush@plt>
    121c:       66 83 c3 ff             add    $0xffff,%bx
    1220:       75 de                   jne    1200 <wait_secs+0x20>
    1222:       48 8d 3d 1b 0e 00 00    lea    0xe1b(%rip),%rdi        # 2044 <_IO_stdin_used+0x44>
    1229:       31 c0                   xor    %eax,%eax
    122b:       e8 30 fe ff ff          call   1060 <printf@plt>
    1230:       48 83 c4 08             add    $0x8,%rsp
    1234:       5b                      pop    %rbx
    1235:       41 5e                   pop    %r14
    1237:       c3                      ret    
    1238:       0f 1f 84 00 00 00 00    nopl   0x0(%rax,%rax,1)
    123f:       00 

0000000000001240 <function_c>:
    1240:       55                      push   %rbp
    1241:       53                      push   %rbx
    1242:       50                      push   %rax
    1243:       89 f3                   mov    %esi,%ebx
    1245:       89 fd                   mov    %edi,%ebp
    1247:       e8 74 fe ff ff          call   10c0 <__ctype_b_loc@plt>
    124c:       48 8b 00                mov    (%rax),%rax
    124f:       48 63 cd                movslq %ebp,%rcx
    1252:       0f b7 04 48             movzwl (%rax,%rcx,2),%eax
    1256:       31 d2                   xor    %edx,%edx
    1258:       a9 00 01 00 00          test   $0x100,%eax
    125d:       0f 94 c2                sete   %dl
    1260:       c1 e2 05                shl    $0x5,%edx
    1263:       8d 72 5a                lea    0x5a(%rdx),%esi
    1266:       83 ca 41                or     $0x41,%edx
    1269:       a9 00 08 00 00          test   $0x800,%eax
    126e:       bd 39 00 00 00          mov    $0x39,%ebp
    1273:       0f 44 ee                cmove  %esi,%ebp
    1276:       be 30 00 00 00          mov    $0x30,%esi
    127b:       0f 44 f2                cmove  %edx,%esi
    127e:       89 ef                   mov    %ebp,%edi
    1280:       29 f7                   sub    %esi,%edi
    1282:       83 c7 01                add    $0x1,%edi
    1285:       89 d8                   mov    %ebx,%eax
    1287:       99                      cltd   
    1288:       f7 ff                   idiv   %edi
    128a:       01 d1                   add    %edx,%ecx
    128c:       89 c8                   mov    %ecx,%eax
    128e:       29 e8                   sub    %ebp,%eax
    1290:       85 c0                   test   %eax,%eax
    1292:       8d 44 06 ff             lea    -0x1(%rsi,%rax,1),%eax
    1296:       0f 4e c1                cmovle %ecx,%eax
    1299:       48 83 c4 08             add    $0x8,%rsp
    129d:       5b                      pop    %rbx
    129e:       5d                      pop    %rbp
    129f:       c3                      ret    

00000000000012a0 <function_f>:
    12a0:       41 56                   push   %r14
    12a2:       53                      push   %rbx
    12a3:       48 83 ec 18             sub    $0x18,%rsp
    12a7:       48 89 fb                mov    %rdi,%rbx
    12aa:       49 89 e6                mov    %rsp,%r14
    12ad:       ba 04 00 00 00          mov    $0x4,%edx
    12b2:       4c 89 f7                mov    %r14,%rdi
    12b5:       48 89 de                mov    %rbx,%rsi
    12b8:       e8 83 fd ff ff          call   1040 <strncpy@plt>
    12bd:       48 8d 7c 24 04          lea    0x4(%rsp),%rdi
    12c2:       48 8d 73 05             lea    0x5(%rbx),%rsi
    12c6:       ba 04 00 00 00          mov    $0x4,%edx
    12cb:       e8 70 fd ff ff          call   1040 <strncpy@plt>
    12d0:       48 8d 7c 24 08          lea    0x8(%rsp),%rdi
    12d5:       48 8d 73 0a             lea    0xa(%rbx),%rsi
    12d9:       ba 04 00 00 00          mov    $0x4,%edx
    12de:       e8 5d fd ff ff          call   1040 <strncpy@plt>
    12e3:       48 8d 7c 24 0c          lea    0xc(%rsp),%rdi
    12e8:       48 8d 73 0f             lea    0xf(%rbx),%rsi
    12ec:       ba 04 00 00 00          mov    $0x4,%edx
    12f1:       e8 4a fd ff ff          call   1040 <strncpy@plt>
    12f6:       48 8d 7c 24 10          lea    0x10(%rsp),%rdi
    12fb:       48 8d 73 14             lea    0x14(%rbx),%rsi
    12ff:       ba 04 00 00 00          mov    $0x4,%edx
    1304:       e8 37 fd ff ff          call   1040 <strncpy@plt>
    1309:       c6 44 24 14 00          movb   $0x0,0x14(%rsp)
    130e:       ba 14 00 00 00          mov    $0x14,%edx
    1313:       48 89 df                mov    %rbx,%rdi
    1316:       4c 89 f6                mov    %r14,%rsi
    1319:       e8 22 fd ff ff          call   1040 <strncpy@plt>
    131e:       c6 43 14 00             movb   $0x0,0x14(%rbx)
    1322:       48 83 c4 18             add    $0x18,%rsp
    1326:       5b                      pop    %rbx
    1327:       41 5e                   pop    %r14
    1329:       c3                      ret    
    132a:       66 0f 1f 44 00 00       nopw   0x0(%rax,%rax,1)

0000000000001330 <function_e>:
    1330:       53                      push   %rbx
    1331:       48 89 fb                mov    %rdi,%rbx
    1334:       e8 17 fd ff ff          call   1050 <strlen@plt>
    1339:       48 89 c1                mov    %rax,%rcx
    133c:       31 c0                   xor    %eax,%eax
    133e:       48 83 f9 18             cmp    $0x18,%rcx
    1342:       0f 85 8b 00 00 00       jne    13d3 <function_e+0xa3>
    1348:       e8 73 fd ff ff          call   10c0 <__ctype_b_loc@plt>
    134d:       48 8b 08                mov    (%rax),%rcx
    1350:       31 c0                   xor    %eax,%eax
    1352:       4c 8d 05 ab 0c 00 00    lea    0xcab(%rip),%r8        # 2004 <_IO_stdin_used+0x4>
    1359:       31 f6                   xor    %esi,%esi
    135b:       eb 13                   jmp    1370 <function_e+0x40>
    135d:       0f 1f 00                nopl   (%rax)
    1360:       40 80 ff 2d             cmp    $0x2d,%dil
    1364:       75 6d                   jne    13d3 <function_e+0xa3>
    1366:       48 83 c6 01             add    $0x1,%rsi
    136a:       48 83 fe 18             cmp    $0x18,%rsi
    136e:       74 5e                   je     13ce <function_e+0x9e>
    1370:       48 0f be 3c 33          movsbq (%rbx,%rsi,1),%rdi
    1375:       f6 44 79 01 0c          testb  $0xc,0x1(%rcx,%rdi,2)
    137a:       75 06                   jne    1382 <function_e+0x52>
    137c:       40 80 ff 2d             cmp    $0x2d,%dil
    1380:       75 51                   jne    13d3 <function_e+0xa3>
    1382:       8d 56 fc                lea    -0x4(%rsi),%edx
    1385:       83 fa 0f                cmp    $0xf,%edx
    1388:       77 dc                   ja     1366 <function_e+0x36>
    138a:       49 63 14 90             movslq (%r8,%rdx,4),%rdx
    138e:       4c 01 c2                add    %r8,%rdx
    1391:       ff e2                   jmp    *%rdx
    1393:       40 80 ff 2d             cmp    $0x2d,%dil
    1397:       75 3a                   jne    13d3 <function_e+0xa3>
    1399:       83 fe 13                cmp    $0x13,%esi
    139c:       74 c2                   je     1360 <function_e+0x30>
    139e:       83 fe 0e                cmp    $0xe,%esi
    13a1:       74 1d                   je     13c0 <function_e+0x90>
    13a3:       83 fe 09                cmp    $0x9,%esi
    13a6:       75 be                   jne    1366 <function_e+0x36>
    13a8:       0f 1f 84 00 00 00 00    nopl   0x0(%rax,%rax,1)
    13af:       00 
    13b0:       40 80 ff 2d             cmp    $0x2d,%dil
    13b4:       75 1d                   jne    13d3 <function_e+0xa3>
    13b6:       83 fe 13                cmp    $0x13,%esi
    13b9:       74 a5                   je     1360 <function_e+0x30>
    13bb:       83 fe 0e                cmp    $0xe,%esi
    13be:       75 a6                   jne    1366 <function_e+0x36>
    13c0:       40 80 ff 2d             cmp    $0x2d,%dil
    13c4:       75 0d                   jne    13d3 <function_e+0xa3>
    13c6:       48 83 fe 13             cmp    $0x13,%rsi
    13ca:       74 94                   je     1360 <function_e+0x30>
    13cc:       eb 98                   jmp    1366 <function_e+0x36>
    13ce:       b8 01 00 00 00          mov    $0x1,%eax
    13d3:       5b                      pop    %rbx
    13d4:       c3                      ret    
    13d5:       66 2e 0f 1f 84 00 00    cs nopw 0x0(%rax,%rax,1)
    13dc:       00 00 00 
    13df:       90                      nop

00000000000013e0 <function_d>:
    13e0:       55                      push   %rbp
    13e1:       41 57                   push   %r15
    13e3:       41 56                   push   %r14
    13e5:       41 55                   push   %r13
    13e7:       41 54                   push   %r12
    13e9:       53                      push   %rbx
    13ea:       48 83 ec 18             sub    $0x18,%rsp
    13ee:       41 89 d7                mov    %edx,%r15d
    13f1:       49 89 f6                mov    %rsi,%r14
    13f4:       49 89 fd                mov    %rdi,%r13
    13f7:       41 89 d4                mov    %edx,%r12d
    13fa:       41 c1 fc 04             sar    $0x4,%r12d
    13fe:       e8 bd fc ff ff          call   10c0 <__ctype_b_loc@plt>
    1403:       4c 8b 10                mov    (%rax),%r10
    1406:       31 f6                   xor    %esi,%esi
    1408:       41 b8 39 00 00 00       mov    $0x39,%r8d
    140e:       41 b9 30 00 00 00       mov    $0x30,%r9d
    1414:       66 2e 0f 1f 84 00 00    cs nopw 0x0(%rax,%rax,1)
    141b:       00 00 00 
    141e:       66 90                   xchg   %ax,%ax
    1420:       49 0f be 6c 35 00       movsbq 0x0(%r13,%rsi,1),%rbp
    1426:       41 0f b7 04 6a          movzwl (%r10,%rbp,2),%eax
    142b:       31 ff                   xor    %edi,%edi
    142d:       a9 00 01 00 00          test   $0x100,%eax
    1432:       40 0f 94 c7             sete   %dil
    1436:       c1 e7 05                shl    $0x5,%edi
    1439:       8d 5f 5a                lea    0x5a(%rdi),%ebx
    143c:       83 cf 41                or     $0x41,%edi
    143f:       a9 00 08 00 00          test   $0x800,%eax
    1444:       41 0f 45 d8             cmovne %r8d,%ebx
    1448:       41 0f 45 f9             cmovne %r9d,%edi
    144c:       89 d9                   mov    %ebx,%ecx
    144e:       29 f9                   sub    %edi,%ecx
    1450:       83 c1 01                add    $0x1,%ecx
    1453:       44 89 e0                mov    %r12d,%eax
    1456:       99                      cltd   
    1457:       f7 f9                   idiv   %ecx
    1459:       01 ea                   add    %ebp,%edx
    145b:       89 d0                   mov    %edx,%eax
    145d:       29 d8                   sub    %ebx,%eax
    145f:       01 c7                   add    %eax,%edi
    1461:       40 80 c7 ff             add    $0xff,%dil
    1465:       85 c0                   test   %eax,%eax
    1467:       40 0f b6 c7             movzbl %dil,%eax
    146b:       0f 4e c2                cmovle %edx,%eax
    146e:       88 04 34                mov    %al,(%rsp,%rsi,1)
    1471:       48 83 c6 01             add    $0x1,%rsi
    1475:       48 83 fe 0a             cmp    $0xa,%rsi
    1479:       75 a5                   jne    1420 <function_d+0x40>
    147b:       41 83 e7 0f             and    $0xf,%r15d
    147f:       e8 3c fc ff ff          call   10c0 <__ctype_b_loc@plt>
    1484:       4c 8b 10                mov    (%rax),%r10
    1487:       31 f6                   xor    %esi,%esi
    1489:       41 b8 39 00 00 00       mov    $0x39,%r8d
    148f:       41 b9 30 00 00 00       mov    $0x30,%r9d
    1495:       66 2e 0f 1f 84 00 00    cs nopw 0x0(%rax,%rax,1)
    149c:       00 00 00 
    149f:       90                      nop
    14a0:       49 0f be 5c 35 0a       movsbq 0xa(%r13,%rsi,1),%rbx
    14a6:       41 0f b7 04 5a          movzwl (%r10,%rbx,2),%eax
    14ab:       31 ff                   xor    %edi,%edi
    14ad:       a9 00 01 00 00          test   $0x100,%eax
    14b2:       40 0f 94 c7             sete   %dil
    14b6:       c1 e7 05                shl    $0x5,%edi
    14b9:       8d 4f 5a                lea    0x5a(%rdi),%ecx
    14bc:       83 cf 41                or     $0x41,%edi
    14bf:       a9 00 08 00 00          test   $0x800,%eax
    14c4:       41 0f 45 c8             cmovne %r8d,%ecx
    14c8:       41 0f 45 f9             cmovne %r9d,%edi
    14cc:       89 cd                   mov    %ecx,%ebp
    14ce:       29 fd                   sub    %edi,%ebp
    14d0:       83 c5 01                add    $0x1,%ebp
    14d3:       44 89 f8                mov    %r15d,%eax
    14d6:       31 d2                   xor    %edx,%edx
    14d8:       f7 fd                   idiv   %ebp
    14da:       01 da                   add    %ebx,%edx
    14dc:       89 d0                   mov    %edx,%eax
    14de:       29 c8                   sub    %ecx,%eax
    14e0:       01 c7                   add    %eax,%edi
    14e2:       40 80 c7 ff             add    $0xff,%dil
    14e6:       85 c0                   test   %eax,%eax
    14e8:       40 0f b6 c7             movzbl %dil,%eax
    14ec:       0f 4e c2                cmovle %edx,%eax
    14ef:       88 44 34 0a             mov    %al,0xa(%rsp,%rsi,1)
    14f3:       48 83 c6 01             add    $0x1,%rsi
    14f7:       48 83 fe 0a             cmp    $0xa,%rsi
    14fb:       75 a3                   jne    14a0 <function_d+0xc0>
    14fd:       c6 44 24 14 00          movb   $0x0,0x14(%rsp)
    1502:       48 89 e6                mov    %rsp,%rsi
    1505:       4c 89 f7                mov    %r14,%rdi
    1508:       e8 83 fb ff ff          call   1090 <strcmp@plt>
    150d:       31 c9                   xor    %ecx,%ecx
    150f:       85 c0                   test   %eax,%eax
    1511:       0f 94 c1                sete   %cl
    1514:       89 c8                   mov    %ecx,%eax
    1516:       48 83 c4 18             add    $0x18,%rsp
    151a:       5b                      pop    %rbx
    151b:       41 5c                   pop    %r12
    151d:       41 5d                   pop    %r13
    151f:       41 5e                   pop    %r14
    1521:       41 5f                   pop    %r15
    1523:       5d                      pop    %rbp
    1524:       c3                      ret    
    1525:       66 2e 0f 1f 84 00 00    cs nopw 0x0(%rax,%rax,1)
    152c:       00 00 00 
    152f:       90                      nop

0000000000001530 <function_a>:
    1530:       48 b8 4c 6e 73 53 34    movabs $0x4e453453736e4c,%rax
    1537:       45 4e 00 
    153a:       48 89 47 0d             mov    %rax,0xd(%rdi)
    153e:       0f 10 05 0a 0b 00 00    movups 0xb0a(%rip),%xmm0        # 204f <_IO_stdin_used+0x4f>
    1545:       0f 11 07                movups %xmm0,(%rdi)
    1548:       c6 47 14 00             movb   $0x0,0x14(%rdi)
    154c:       c7 06 83 00 00 00       movl   $0x83,(%rsi)
    1552:       c3                      ret    
    1553:       66 2e 0f 1f 84 00 00    cs nopw 0x0(%rax,%rax,1)
    155a:       00 00 00 
    155d:       0f 1f 00                nopl   (%rax)

0000000000001560 <main>:
    1560:       55                      push   %rbp
    1561:       41 57                   push   %r15
    1563:       41 56                   push   %r14
    1565:       53                      push   %rbx
    1566:       48 81 ec c8 00 00 00    sub    $0xc8,%rsp
    156d:       48 b8 4c 6e 73 53 34    movabs $0x4e453453736e4c,%rax
    1574:       45 4e 00 
    1577:       48 89 44 24 2d          mov    %rax,0x2d(%rsp)
    157c:       0f 10 05 cc 0a 00 00    movups 0xacc(%rip),%xmm0        # 204f <_IO_stdin_used+0x4f>
    1583:       0f 29 44 24 20          movaps %xmm0,0x20(%rsp)
    1588:       c6 44 24 34 00          movb   $0x0,0x34(%rsp)
    158d:       48 8d 3d d0 0a 00 00    lea    0xad0(%rip),%rdi        # 2064 <_IO_stdin_used+0x64>
    1594:       48 8d 35 d7 0a 00 00    lea    0xad7(%rip),%rsi        # 2072 <_IO_stdin_used+0x72>
    159b:       31 c0                   xor    %eax,%eax
    159d:       e8 be fa ff ff          call   1060 <printf@plt>
    15a2:       48 8d 3d 99 17 00 00    lea    0x1799(%rip),%rdi        # 2d42 <_IO_stdin_used+0xd42>
    15a9:       48 8d 35 bc 17 00 00    lea    0x17bc(%rip),%rsi        # 2d6c <_IO_stdin_used+0xd6c>
    15b0:       31 c0                   xor    %eax,%eax
    15b2:       e8 a9 fa ff ff          call   1060 <printf@plt>
    15b7:       48 8d 3d b9 17 00 00    lea    0x17b9(%rip),%rdi        # 2d77 <_IO_stdin_used+0xd77>
    15be:       31 c0                   xor    %eax,%eax
    15c0:       e8 9b fa ff ff          call   1060 <printf@plt>
    15c5:       48 8b 05 14 3a 00 00    mov    0x3a14(%rip),%rax        # 4fe0 <stdin@GLIBC_2.2.5>
    15cc:       48 8b 10                mov    (%rax),%rdx
    15cf:       48 8d 7c 24 40          lea    0x40(%rsp),%rdi
    15d4:       be 80 00 00 00          mov    $0x80,%esi
    15d9:       e8 a2 fa ff ff          call   1080 <fgets@plt>
    15de:       48 85 c0                test   %rax,%rax
    15e1:       0f 84 8f 01 00 00       je     1776 <main+0x216>
    15e7:       48 8d 35 b6 17 00 00    lea    0x17b6(%rip),%rsi        # 2da4 <_IO_stdin_used+0xda4>
    15ee:       48 8d 5c 24 40          lea    0x40(%rsp),%rbx
    15f3:       48 89 df                mov    %rbx,%rdi
    15f6:       e8 75 fa ff ff          call   1070 <strcspn@plt>
    15fb:       c6 44 04 40 00          movb   $0x0,0x40(%rsp,%rax,1)
    1600:       48 8d 3d 8d 17 00 00    lea    0x178d(%rip),%rdi        # 2d94 <_IO_stdin_used+0xd94>
    1607:       48 89 de                mov    %rbx,%rsi
    160a:       31 c0                   xor    %eax,%eax
    160c:       e8 4f fa ff ff          call   1060 <printf@plt>
    1611:       48 8d 3d 8e 17 00 00    lea    0x178e(%rip),%rdi        # 2da6 <_IO_stdin_used+0xda6>
    1618:       31 c0                   xor    %eax,%eax
    161a:       e8 41 fa ff ff          call   1060 <printf@plt>
    161f:       48 8b 1d b2 39 00 00    mov    0x39b2(%rip),%rbx        # 4fd8 <stdout@GLIBC_2.2.5>
    1626:       48 8b 3b                mov    (%rbx),%rdi
    1629:       e8 72 fa ff ff          call   10a0 <fflush@plt>
    162e:       66 bd fd ff             mov    $0xfffd,%bp
    1632:       66 2e 0f 1f 84 00 00    cs nopw 0x0(%rax,%rax,1)
    1639:       00 00 00 
    163c:       0f 1f 40 00             nopl   0x0(%rax)
    1640:       bf 40 42 0f 00          mov    $0xf4240,%edi
    1645:       e8 86 fa ff ff          call   10d0 <usleep@plt>
    164a:       bf 2e 00 00 00          mov    $0x2e,%edi
    164f:       e8 dc f9 ff ff          call   1030 <putchar@plt>
    1654:       48 8b 3b                mov    (%rbx),%rdi
    1657:       e8 44 fa ff ff          call   10a0 <fflush@plt>
    165c:       66 ff c5                inc    %bp
    165f:       75 df                   jne    1640 <main+0xe0>
    1661:       48 8d 3d dc 09 00 00    lea    0x9dc(%rip),%rdi        # 2044 <_IO_stdin_used+0x44>
    1668:       31 c0                   xor    %eax,%eax
    166a:       e8 f1 f9 ff ff          call   1060 <printf@plt>
    166f:       bf 0a 00 00 00          mov    $0xa,%edi
    1674:       e8 b7 f9 ff ff          call   1030 <putchar@plt>
    1679:       48 8d 7c 24 40          lea    0x40(%rsp),%rdi
    167e:       e8 ad fc ff ff          call   1330 <function_e>
    1683:       bb 16 00 00 00          mov    $0x16,%ebx
    1688:       85 c0                   test   %eax,%eax
    168a:       0f 84 bf 00 00 00       je     174f <main+0x1ef>
    1690:       48 8d 3d 4c 17 00 00    lea    0x174c(%rip),%rdi        # 2de3 <_IO_stdin_used+0xde3>
    1697:       31 c0                   xor    %eax,%eax
    1699:       e8 c2 f9 ff ff          call   1060 <printf@plt>
    169e:       49 89 e7                mov    %rsp,%r15
    16a1:       4c 8d 74 24 40          lea    0x40(%rsp),%r14
    16a6:       ba 04 00 00 00          mov    $0x4,%edx
    16ab:       4c 89 ff                mov    %r15,%rdi
    16ae:       4c 89 f6                mov    %r14,%rsi
    16b1:       e8 8a f9 ff ff          call   1040 <strncpy@plt>
    16b6:       48 8d 7c 24 04          lea    0x4(%rsp),%rdi
    16bb:       48 8d 74 24 45          lea    0x45(%rsp),%rsi
    16c0:       ba 04 00 00 00          mov    $0x4,%edx
    16c5:       e8 76 f9 ff ff          call   1040 <strncpy@plt>
    16ca:       48 8d 7c 24 08          lea    0x8(%rsp),%rdi
    16cf:       48 8d 74 24 4a          lea    0x4a(%rsp),%rsi
    16d4:       ba 04 00 00 00          mov    $0x4,%edx
    16d9:       e8 62 f9 ff ff          call   1040 <strncpy@plt>
    16de:       48 8d 7c 24 0c          lea    0xc(%rsp),%rdi
    16e3:       48 8d 74 24 4f          lea    0x4f(%rsp),%rsi
    16e8:       ba 04 00 00 00          mov    $0x4,%edx
    16ed:       e8 4e f9 ff ff          call   1040 <strncpy@plt>
    16f2:       48 8d 7c 24 10          lea    0x10(%rsp),%rdi
    16f7:       48 8d 74 24 54          lea    0x54(%rsp),%rsi
    16fc:       ba 04 00 00 00          mov    $0x4,%edx
    1701:       e8 3a f9 ff ff          call   1040 <strncpy@plt>
    1706:       c6 44 24 14 00          movb   $0x0,0x14(%rsp)
    170b:       ba 14 00 00 00          mov    $0x14,%edx
    1710:       4c 89 f7                mov    %r14,%rdi
    1713:       4c 89 fe                mov    %r15,%rsi
    1716:       e8 25 f9 ff ff          call   1040 <strncpy@plt>
    171b:       c6 44 24 54 00          movb   $0x0,0x54(%rsp)
    1720:       48 8d 74 24 20          lea    0x20(%rsp),%rsi
    1725:       4c 89 f7                mov    %r14,%rdi
    1728:       ba 83 00 00 00          mov    $0x83,%edx
    172d:       e8 ae fc ff ff          call   13e0 <function_d>
    1732:       85 c0                   test   %eax,%eax
    1734:       74 22                   je     1758 <main+0x1f8>
    1736:       48 8d 3d 02 17 00 00    lea    0x1702(%rip),%rdi        # 2e3f <_IO_stdin_used+0xe3f>
    173d:       31 c0                   xor    %eax,%eax
    173f:       e8 1c f9 ff ff          call   1060 <printf@plt>
    1744:       48 8d 3d 12 17 00 00    lea    0x1712(%rip),%rdi        # 2e5d <_IO_stdin_used+0xe5d>
    174b:       31 db                   xor    %ebx,%ebx
    174d:       eb 10                   jmp    175f <main+0x1ff>
    174f:       48 8d 3d 5a 16 00 00    lea    0x165a(%rip),%rdi        # 2db0 <_IO_stdin_used+0xdb0>
    1756:       eb 07                   jmp    175f <main+0x1ff>
    1758:       48 8d 3d a1 16 00 00    lea    0x16a1(%rip),%rdi        # 2e00 <_IO_stdin_used+0xe00>
    175f:       31 c0                   xor    %eax,%eax
    1761:       e8 fa f8 ff ff          call   1060 <printf@plt>
    1766:       89 d8                   mov    %ebx,%eax
    1768:       48 81 c4 c8 00 00 00    add    $0xc8,%rsp
    176f:       5b                      pop    %rbx
    1770:       41 5e                   pop    %r14
    1772:       41 5f                   pop    %r15
    1774:       5d                      pop    %rbp
    1775:       c3                      ret    
    1776:       31 ff                   xor    %edi,%edi
    1778:       e8 33 f9 ff ff          call   10b0 <exit@plt>

Disassembly of section .fini:

0000000000001780 <_fini>:
    1780:       f3 0f 1e fa             endbr64 
    1784:       48 83 ec 08             sub    $0x8,%rsp
    1788:       48 83 c4 08             add    $0x8,%rsp
    178c:       c3                      ret    

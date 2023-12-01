   0x0000000000001330 <+0>:     push   rbx
   0x0000000000001331 <+1>:     mov    rbx,rdi
   0x0000000000001334 <+4>:     call   0x1050 <strlen@plt>
   0x0000000000001339 <+9>:     mov    rcx,rax
   0x000000000000133c <+12>:    xor    eax,eax
   0x000000000000133e <+14>:    cmp    rcx,0x18
   0x0000000000001342 <+18>:    jne    0x13d3 <function_e+163>
   0x0000000000001348 <+24>:    call   0x10c0 <__ctype_b_loc@plt>
   0x000000000000134d <+29>:    mov    rcx,QWORD PTR [rax]
   0x0000000000001350 <+32>:    xor    eax,eax
   0x0000000000001352 <+34>:    lea    r8,[rip+0xcab]        # 0x2004
   0x0000000000001359 <+41>:    xor    esi,esi
   0x000000000000135b <+43>:    jmp    0x1370 <function_e+64>
   0x000000000000135d <+45>:    nop    DWORD PTR [rax]
   0x0000000000001360 <+48>:    cmp    dil,0x2d
   0x0000000000001364 <+52>:    jne    0x13d3 <function_e+163>
   0x0000000000001366 <+54>:    add    rsi,0x1
   0x000000000000136a <+58>:    cmp    rsi,0x18
   0x000000000000136e <+62>:    je     0x13ce <function_e+158>
   0x0000000000001370 <+64>:    movsx  rdi,BYTE PTR [rbx+rsi*1]
   0x0000000000001375 <+69>:    test   BYTE PTR [rcx+rdi*2+0x1],0xc
   0x000000000000137a <+74>:    jne    0x1382 <function_e+82>
   0x000000000000137c <+76>:    cmp    dil,0x2d
   0x0000000000001380 <+80>:    jne    0x13d3 <function_e+163>
   0x0000000000001382 <+82>:    lea    edx,[rsi-0x4]
   0x0000000000001385 <+85>:    cmp    edx,0xf
   0x0000000000001388 <+88>:    ja     0x1366 <function_e+54>
   0x000000000000138a <+90>:    movsxd rdx,DWORD PTR [r8+rdx*4]
   0x000000000000138e <+94>:    add    rdx,r8
   0x0000000000001391 <+97>:    jmp    rdx
   0x0000000000001393 <+99>:    cmp    dil,0x2d
   0x0000000000001397 <+103>:   jne    0x13d3 <function_e+163>
   0x0000000000001399 <+105>:   cmp    esi,0x13
   0x000000000000139c <+108>:   je     0x1360 <function_e+48>
   0x000000000000139e <+110>:   cmp    esi,0xe
   0x00000000000013a1 <+113>:   je     0x13c0 <function_e+144>
   0x00000000000013a3 <+115>:   cmp    esi,0x9
   0x00000000000013a6 <+118>:   jne    0x1366 <function_e+54>
   0x00000000000013a8 <+120>:   nop    DWORD PTR [rax+rax*1+0x0]
   0x00000000000013b0 <+128>:   cmp    dil,0x2d
   0x00000000000013b4 <+132>:   jne    0x13d3 <function_e+163>
   0x00000000000013b6 <+134>:   cmp    esi,0x13
   0x00000000000013b9 <+137>:   je     0x1360 <function_e+48>
   0x00000000000013bb <+139>:   cmp    esi,0xe
   0x00000000000013be <+142>:   jne    0x1366 <function_e+54>
   0x00000000000013c0 <+144>:   cmp    dil,0x2d
   0x00000000000013c4 <+148>:   jne    0x13d3 <function_e+163>
   0x00000000000013c6 <+150>:   cmp    rsi,0x13
   0x00000000000013ca <+154>:   je     0x1360 <function_e+48>
   0x00000000000013cc <+156>:   jmp    0x1366 <function_e+54>
   0x00000000000013ce <+158>:   mov    eax,0x1
   0x00000000000013d3 <+163>:   pop    rbx
   0x00000000000013d4 <+164>:   ret 
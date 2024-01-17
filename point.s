init:
        push  {lr}
        sub   sp, sp, #8

        str   r1, [sp]
        str   r2, [sp, #4]

        ldmia sp, {r1, r2}
        stmia r0, {r1, r2}

        add   sp, sp, #8
        pop   {pc}

zero:
        push  {lr}
        sub   sp, sp, #8

        mov   r3, #0
        str   r3, [sp]
        str   r3, [sp, #4]

        ldmia sp, {r1, r2}
        stmia r0, {r1, r2}

        add   sp, sp, #8
        pop   {pc}

.global main
main:
        push   {lr}
        sub    sp, sp, #8 @ make room for the point struct

        mov    r0, sp
        mov    r1, #34
        mov    r2, #-3
        bl     init

        ldr    r0, =fmtstr1
        ldr    r1, [sp]
        ldr    r2, [sp, #4]
        bl     printf

        mov    r0, sp
        bl     zero

        ldr    r0, =fmtstr1
        ldr    r1, [sp]
        ldr    r2, [sp, #4]
        bl     printf

        add    sp, sp, #8
        pop    {pc}

fmtstr1:
        .ascii "The members of the structure dot are %d, %d\012\000"	

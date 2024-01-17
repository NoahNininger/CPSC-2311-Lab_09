/* Noah Nininger
   CPSC 2311 Widman
   06/18/2023 (given the 6/18 extension)
   Lab 09
*/

box_init:
        push  {lr}
        sub   sp, sp, #12

        str   r1, [sp]              @ store width, height, and depth
        str   r2, [sp, #4]
        str   r3, [sp, #8]

        ldmia sp, {r1, r2, r3}      @ load arguments
        stmia r0, {r1, r2, r3}      @ store arguments

        add   sp, sp, #12           @ Deallocate space
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
        sub    sp, sp, #20 @ make room for the point and box structs

        mov    r0, sp
        mov    r1, #34
        mov    r2, #-3
        bl     box_init

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

        mov    r0, sp
        mov    r1, #45
        mov    r2, #17
        mov    r3, #3
        bl     box_init

        ldr    r0, =fmtstr2         @ load width, height, and depth
        ldr    r1, [sp, #8]
        ldr    r2, [sp, #12]
        ldr    r3, [sp, #16]
        bl     printf

        add    sp, sp, #20          @ Deallocate space
        pop    {pc}

fmtstr1:
        .ascii "The members of the structure dot are %d, %d\n\000"

fmtstr2:
        .ascii "The members of the structure box are %d, %d, %d\n\000"

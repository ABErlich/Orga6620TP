.abicalls
.text
.align  2




















.globl  print
.ent    print
print:
        .frame  $fp,40,$ra
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    sp,sp,40
        .cprestore 16
        sw      ra,32($sp)
        sw      fp,28($sp)
        sw      gp,24($sp)
        move    $fp,$sp
        sw      a0,40($fp)
        lw      a0,40($fp)
        la      t9,printf
        jal     ra,t9
        move    sp,$fp
        lw      ra,32(sp)
        lw      $fp,28(sp)
        addu    sp,sp,40
        j       ra
        .end    print
        .size   print, .-print
        .ident  "GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"

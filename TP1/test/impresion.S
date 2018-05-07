.data


$LC0:
        .ascii  "Hello world!\000"

.text

main:
        .set    noreorder
        .cpload t9
        .set    reorder
        subu    sp,sp,40
        .cprestore 16
        sw      ra,32(sp)
        sw      $fp,28(sp)
        sw      gp,24(sp)
        move    $fp,sp
        la      a0,$LC0
        la      t9,printf
        jal     ra,t9
        move    sp,$fp
        lw      ra,32(sp)
        lw      $fp,28(sp)
        addu    sp,sp,40
        j       ra
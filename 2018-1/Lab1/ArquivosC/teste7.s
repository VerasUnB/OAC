.data
.LC0:
	.asciz	"Digite um numero:"
.LC1:
	.asciz	""
.LC2:
	.asciz	"O resultado eh "
.text
	
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	addi	a5,s0,-24
	mv	a1,a5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	scanf
	lw	a5,-24(s0)
	andi	a5,a5,1
	bnez	a5,.L2
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	fcvt.s.w	fa5,a5
	fsw	fa5,-20(s0)
	j	.L3
.L2:
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,3
	add	a5,a5,a4
	fcvt.s.w	fa5,a5
	fsw	fa5,-20(s0)
.L3:
	flw	fa0,-20(s0)
	call	__extendsfdf2
	mv	a5,a0
	mv	a6,a1
	mv	a2,a5
	mv	a3,a6
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	printf
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"

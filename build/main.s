	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0	sdk_version 15, 2
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	w0, #264                        ; =0x108
	bl	_malloc
	cbz	x0, LBB0_3
; %bb.1:
	mov	x19, x0
	bl	_initQueue
	mov	x0, x19
	mov	w1, #10                         ; =0xa
	bl	_enqueue
	mov	x0, x19
	bl	_printq
	mov	x0, x19
	mov	w1, #20                         ; =0x14
	bl	_enqueue
	mov	x0, x19
	bl	_printq
	mov	x0, x19
	mov	w1, #30                         ; =0x1e
	bl	_enqueue
	mov	x0, x19
	bl	_printq
	mov	x0, x19
	bl	_dequeue
	mov	x0, x19
	bl	_printq
	mov	x0, x19
	bl	_dequeue
	mov	x0, x19
	bl	_printq
	mov	x0, x19
	bl	_dequeue
	mov	x0, x19
	bl	_printq
	mov	x0, x19
	bl	_free
	mov	w0, #0                          ; =0x0
LBB0_2:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB0_3:
Lloh0:
	adrp	x0, l_.str@PAGE
Lloh1:
	add	x0, x0, l_.str@PAGEOFF
	bl	_perror
	mov	w0, #1                          ; =0x1
	b	LBB0_2
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"malloc failed"

.subsections_via_symbols

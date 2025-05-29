	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0	sdk_version 15, 2
	.globl	_initQueue                      ; -- Begin function initQueue
	.p2align	2
_initQueue:                             ; @initQueue
	.cfi_startproc
; %bb.0:
	str	xzr, [x0, #256]
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_isEmpty                        ; -- Begin function isEmpty
	.p2align	2
_isEmpty:                               ; @isEmpty
	.cfi_startproc
; %bb.0:
	ldr	w8, [x0, #256]
	ldr	w9, [x0, #260]
	cmp	w8, w9
	cset	w0, eq
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_isFull                         ; -- Begin function isFull
	.p2align	2
_isFull:                                ; @isFull
	.cfi_startproc
; %bb.0:
	ldr	w8, [x0, #260]
	add	w8, w8, #1
	negs	w9, w8
	and	w9, w9, #0x3f
	and	w8, w8, #0x3f
	csneg	w8, w8, w9, mi
	ldr	w9, [x0, #256]
	cmp	w8, w9
	cset	w0, eq
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_enqueue                        ; -- Begin function enqueue
	.p2align	2
_enqueue:                               ; @enqueue
	.cfi_startproc
; %bb.0:
	ldrsw	x8, [x0, #260]
	add	w9, w8, #1
	negs	w10, w9
	and	w10, w10, #0x3f
	and	w9, w9, #0x3f
	csneg	w9, w9, w10, mi
	ldr	w10, [x0, #256]
	cmp	w9, w10
	b.ne	LBB3_2
; %bb.1:
Lloh0:
	adrp	x0, l_str@PAGE
Lloh1:
	add	x0, x0, l_str@PAGEOFF
	b	_puts
LBB3_2:
	str	w1, [x0, x8, lsl #2]
	ldr	w8, [x0, #260]
	add	w8, w8, #1
	negs	w9, w8
	and	w9, w9, #0x3f
	and	w8, w8, #0x3f
	csneg	w8, w8, w9, mi
	str	w8, [x0, #260]
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.globl	_dequeue                        ; -- Begin function dequeue
	.p2align	2
_dequeue:                               ; @dequeue
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldrsw	x9, [x0, #256]
	ldr	w8, [x0, #260]
	cmp	w9, w8
	b.ne	LBB4_2
; %bb.1:
Lloh2:
	adrp	x0, l_str.6@PAGE
Lloh3:
	add	x0, x0, l_str.6@PAGEOFF
	bl	_puts
	mov	w8, #-1                         ; =0xffffffff
	b	LBB4_3
LBB4_2:
	ldr	w8, [x0, x9, lsl #2]
	add	w9, w9, #1
	negs	w10, w9
	and	w10, w10, #0x3f
	and	w9, w9, #0x3f
	csneg	w9, w9, w10, mi
	str	w9, [x0, #256]
LBB4_3:
	mov	x0, x8
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh2, Lloh3
	.cfi_endproc
                                        ; -- End function
	.globl	_printq                         ; -- Begin function printq
	.p2align	2
_printq:                                ; @printq
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	ldr	w8, [x0, #256]
	ldr	w9, [x0, #260]
	cmp	w8, w9
	b.ne	LBB5_2
; %bb.1:
Lloh4:
	adrp	x0, l_str.6@PAGE
Lloh5:
	add	x0, x0, l_str.6@PAGEOFF
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	b	_puts
LBB5_2:
	mov	x19, x0
Lloh6:
	adrp	x0, l_.str.2@PAGE
Lloh7:
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	ldr	w21, [x19, #256]
	ldr	w8, [x19, #260]
	cmp	w21, w8
	b.eq	LBB5_5
; %bb.3:
Lloh8:
	adrp	x20, l_.str.3@PAGE
Lloh9:
	add	x20, x20, l_.str.3@PAGEOFF
LBB5_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [x19, w21, sxtw #2]
	str	x8, [sp]
	mov	x0, x20
	bl	_printf
	add	w8, w21, #1
	negs	w9, w8
	and	w9, w9, #0x3f
	and	w8, w8, #0x3f
	csneg	w21, w8, w9, mi
	ldr	w8, [x19, #260]
	cmp	w21, w8
	b.ne	LBB5_4
LBB5_5:
	mov	w0, #10                         ; =0xa
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	b	_putchar
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh8, Lloh9
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str.2:                               ; @.str.2
	.asciz	"Queue: "

l_.str.3:                               ; @.str.3
	.asciz	"%d "

l_str:                                  ; @str
	.asciz	"Queue is full!"

l_str.6:                                ; @str.6
	.asciz	"Queue is empty!"

.subsections_via_symbols

extern cos
extern sin
extern fabs

extern printf


section .data
n_one: dq -1.0
dbg: db "%d %d new %d %d", 10, 0

section .text

global rotate
rotate:
	push	rbp
	mov		rbp, rsp

    sub     rsp, 160

	;rdi = width
	;rsi = height
	;rdx = channels
	;rcx = image 
	;	xmm0  = radians
	;r8  = new_w
	;r9  = new_h
	;+0  = rotated_image

    mov     [rbp-128], r12
    mov     [rbp-136], r13
    mov     [rbp-144], r14
    mov     [rbp-152], r15
    mov     [rbp-160], rbx

	mov		[rbp-72], rdx
	mov		[rbp-80], rcx
	mov		[rbp-96], r8
	mov		[rbp-104], r9
    mov     [rbp-112], rdi ; -112=width
    mov     [rbp-120], rsi ; -120=height

    movsd   qword [rbp-8], xmm0
    call    cos
    movsd   qword [rbp-16], xmm0 ;rbp-16=cos(phi)
    movsd   xmm0, qword [rbp-8]
    call    sin
    movsd   qword [rbp-24], xmm0 ;rbp-24=sin(phi)

	mov		r13, qword [rbp-120]	; r13=height
    cvtsi2sd xmm1, r13
    mulsd   xmm0, xmm1
    call    fabs
	movsd	qword [rbp-32], xmm0 ;abs(h*sin(phi))

	mov		r12, qword [rbp-112]	; r12=width
	movsd	xmm0, [rbp-16]
	cvtsi2sd xmm1, r12
	mulsd	xmm0, xmm1
	call	fabs
	addsd	xmm0, qword [rbp-32]
	cvttsd2si rax, xmm0
	mov		qword [rbp-32], rax ;new_width

	movsd	xmm0, [rbp-24]
	cvtsi2sd xmm1, r12
	mulsd	xmm0, xmm1
	call	fabs
	movsd	qword [rbp-40], xmm0

	movsd	xmm0, [rbp-16]
	cvtsi2sd xmm1, r13
	mulsd	xmm0, xmm1
	call	fabs
	addsd	xmm0, qword [rbp-40]
	cvttsd2si rax, xmm0
	mov		qword [rbp-40], rax ;new_height

	mov		r14, qword [rbp-32]
	shr		r14, 1 ;r14 = new_w / 2
	mov		r15, qword [rbp-40]
	shr		r15, 1 ;r15 = new_h / 2

	mov		qword [rbp-48], 0 ; y=0..new_height
.loopY_core:
	mov		rax, [rbp-48]
	cmp		rax, qword [rbp-40]
	jl		.loopY_core_success
	jmp		.cleanUp

.loopY_core_success:
	mov		qword [rbp-56], 0 ; x=0..new_width

.loopX_core:
	mov		rax, [rbp-56]
	cmp		rax, qword [rbp-32]
	jl		.loopX_core_success
	jmp		.loopY_core_finally

.loopX_core_success:
	call	getOldY
	mov		rbx, rax
	call	getOldX

;;;;;;;;;;;;;;;debug
;   push rax
;   push    rdi
;   push    rsi
;   push    rdx
;   push    rcx
;   push    r8

;   mov     rdi, dbg
;   mov     rsi, qword [rbp-48]
;   mov     rdx, qword [rbp-56]
;   mov     rcx, rbx
;   mov     r8,  rax
;   sub     rsp, 8
;   call    printf
;   pop r8
;   pop rcx
;   pop rdx
;   pop rsi
;   pop rdi
;   pop rax
;    add rsp, 8
;;;;;;;;;;;;;;;debug

	cmp		rax, 0
	jl		.loopX_core_finally
	cmp		rax, r12
	jge		.loopX_core_finally
	cmp		rbx, 0
	jl		.loopX_core_finally
	cmp		rbx, r13
	jge		.loopX_core_finally

	imul	rbx, r12
	add		rbx, rax
	imul	rbx, [rbp-72] ;channels
	mov		rax, [rbp-80] ;image
	lea		rbx, [rax+rbx];rbx = pixel

	mov		rax, [rbp-32] ;new_w
	imul	rax, [rbp-48] ;new_w*y
	add		rax, [rbp-56] ;new_w*y+x
	imul	rax, [rbp-72] ;(new_w*y+x)*channels
	mov		rcx, [rbp+16] ;rotated_image
	add		rcx, rax	  ;rotated_pixel

	mov		qword [rbp-88], 0
.loopColor_core:
	mov		rax, [rbp-88]
	cmp		rax, [rbp-72]
	jge		.loopX_core_finally
	movzx   rdx, byte rbx[rax] ;rdx = pixel[c]
	mov		byte rcx[rax], dl
	inc		qword [rbp-88]
	jmp		.loopColor_core

.loopX_core_finally:
	inc		qword [rbp-56]
	jmp		.loopX_core

.loopY_core_finally:
	inc		qword [rbp-48]
	jmp		.loopY_core

.cleanUp:
	mov		rax, [rbp-96]
    mov     rbx, [rbp-32]
	mov		dword [rax], ebx

	mov		rax, [rbp-104]
    mov     rbx, [rbp-40]
	mov		dword [rax], ebx

    mov     r12, [rbp-128]
    mov     r13, [rbp-136]
    mov     r14, [rbp-144]
    mov     r15, [rbp-152]
    mov     rbx, [rbp-160]

	leave
	ret

getOldX:
    ;-16 cos -24 sin

	;-48 y 
	;-56 x

	;r14 = new_w/2
	;r15 = new_h/2
	;-32 new_w
	;-40 new_h

	mov		rax, [rbp-56]
	sub		rax, r14
	cvtsi2sd xmm0, rax
	movsd	xmm1, qword [rbp-16]
	mulsd	xmm0, xmm1
	movsd	qword [rbp-64], xmm0

	mov		rax, [rbp-48]
	sub		rax, r15
	cvtsi2sd xmm0, rax
	movsd	xmm1, qword [rbp-24]
	mulsd	xmm0, xmm1
    
    movsd   xmm2, qword [rbp-64]
	addsd	xmm2, xmm0

	mov		rax, r12
	shr		rax, 1
	cvtsi2sd xmm0, rax
	addsd	xmm0, xmm2
	cvttsd2si rax, xmm0
	ret

getOldY:
    ;-16 cos -24 sin

	;-56 x 
	;-48 y

	;r14 = new_w/2
	;r15 = new_h/2
	;-32 new_w
	;-40 new_h

	mov		rax, [rbp-56]
	sub		rax, r14
	cvtsi2sd xmm0, rax
	movsd	xmm1, qword [rbp-24]
	mulsd	xmm1, [n_one]
	mulsd	xmm0, xmm1
	movsd	qword [rbp-64], xmm0

	mov		rax, [rbp-48]
	sub		rax, r15
	cvtsi2sd xmm0, rax
	movsd	xmm1, qword [rbp-16]
	mulsd	xmm0, xmm1

    movsd   xmm2, qword [rbp-64]
	addsd	xmm2, xmm0

	mov		rax, r13
	shr		rax, 1
	cvtsi2sd xmm0, rax
	addsd	xmm0, xmm2
	cvttsd2si rax, xmm0
	ret

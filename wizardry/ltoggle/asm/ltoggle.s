
	.thumb

	.global LToggleHook
	.type   LToggleHook, function

LToggleHook:
	ldr   r1, =gKeySt
	ldr   r1, [r1]
	ldrh  r1, [r1, #0x04] @ r1 = gKeySt->held

	mov   r2, #1
	lsl   r2, #9 @ r2 = (1 << 9)

	tst   r1, r2
	beq   end @ do not change battle anim type if L not held

	@ r0:
	@  1 <=> no anim
	@  2 <=> forbidden (means "solo anim")
	@  3 <=> yes anim

	cmp   r0, #1
	beq   enable_anim

	mov   r0, #1

end:
	pop   {r1}
	bx    r1

enable_anim:
	mov   r0, #3
	b     end


.macro fun addr, name
	.global \name
	.type   \name, function
	.set    \name, \addr
.endm

.macro dat addr, name
	.global \name
	.type   \name, object
	.set    \name, \addr
.endm

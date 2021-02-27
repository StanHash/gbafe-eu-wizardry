
.include "common.inc"

dat 0x0202BBF8, gPlaySt
@ ...
dat 0x0203A3D8, gBattleSt
dat 0x0203A3F0, gBattleUnitA
dat 0x0203A470, gBattleUnitB

fun 0x08000E11, RandNext_100
fun 0x08000E3D, RandNext
fun 0x08000E6D, RandRoll
fun 0x08000E91, RandRoll2Rn
@ ...
fun 0x0802A9E5, GetBattleAnimType

dat 0x08C47B6C, gKeySt

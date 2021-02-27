
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
fun 0x08017639, GetItemUses
@ ...
fun 0x08029B55, GetStatIncrease
@ ...
fun 0x08029BDD, CheckBattleUnitLevelUp
fun 0x08029D95, ApplyUnitDefaultPromotion
@ ...
fun 0x0802A185, HasBattleUnitGainedWeaponLevel
fun 0x0802A1C1, UpdateUnitFromBattle
fun 0x0802A2A9, UpdateUnitDuringBattle
fun 0x0802A2D5, UpdateBallistaFromBattle
@ ...
fun 0x0802A965, StartBattleAnimations
fun 0x0802A9C1, GetUnitSoloBattleAnimType
fun 0x0802A9E9, GetBattleAnimType
@ ...
fun 0x0809C901, GetTrap

dat 0x08C7EFDC, gKeySt

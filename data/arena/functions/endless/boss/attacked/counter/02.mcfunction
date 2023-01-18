# ボス位置をランダムなプレイヤーと入れ替え

# 攻撃していないプレイヤーから抽選, Pos取得
tag @r[tag=Arena.Player,advancements={arena:boss/attacked_last_boss=false},distance=..32] add Arena.Boss.SwapTarget
data modify storage arena: Temp.Boss.Swap set from entity @a[tag=Arena.Boss.SwapTarget,limit=1] Pos

# tp
tp @a[tag=Arena.Boss.SwapTarget] @s
data modify entity @s Pos set from storage arena: Temp.Boss.Swap

# タグ除去
tag @a remove Arena.Boss.SwapTarget

# 演出
playsound entity.enderman.teleport master @a ~ ~ ~ 3 0.5
playsound entity.enderman.teleport master @a ~ ~ ~ 3 2

playsound entity.player.hurt master @a ~ ~ ~ 3 0.5

# 被攻撃時処理

# 被ダメージ量計算
execute store result score $DamageDealt ArenaBoss.Temp run data get entity @e[tag=ArenaBoss.Hitbox,limit=1] Health 100
scoreboard players remove $DamageDealt ArenaBoss.Temp 102400

scoreboard players operation $DamageDealt ArenaBoss.Temp /= #2 Constant

# 体力から減算
execute store result score $Health ArenaBoss.Temp run data get storage arena-boss: Health 100
scoreboard players operation $Health ArenaBoss.Temp -= $DamageDealt ArenaBoss.Temp

# 体力に適用
execute store result storage arena-boss: Health float 0.01 run scoreboard players get $Health ArenaBoss.Temp

# 演出
execute at @e[tag=ArenaBoss.Core] run playsound entity.blaze.hurt master @a ~ ~ ~ 2 0.8
execute at @e[tag=ArenaBoss.Core] run playsound entity.blaze.hurt master @a ~ ~ ~ 2 0.75

execute at @e[tag=ArenaBoss.Core] run particle block blackstone ~ ~1.5 ~ 0.125 0.125 0.125 0.25 32

# ノックバック
# Motion値計算
# 座標取得
data modify storage arena-boss:temp PlayerPos set from entity @s Pos
data modify storage arena-boss:temp BossPos set from entity @e[tag=ArenaBoss.Core,limit=1] Pos

execute store result score $PosX1 ArenaBoss.Temp run data get storage arena-boss:temp PlayerPos[0] 100
execute store result score $PosZ1 ArenaBoss.Temp run data get storage arena-boss:temp PlayerPos[2] 100

execute store result score $PosX2 ArenaBoss.Temp run data get storage arena-boss:temp BossPos[0] 100
execute store result score $PosZ2 ArenaBoss.Temp run data get storage arena-boss:temp BossPos[2] 100

# 差分計算
scoreboard players operation $PosX2 ArenaBoss.Temp -= $PosX1 ArenaBoss.Temp
scoreboard players operation $PosZ2 ArenaBoss.Temp -= $PosZ1 ArenaBoss.Temp

# Motionに代入
data modify storage arena-boss:temp Motion set value [0.0d, 0.25d, 0.0d]

execute store result storage arena-boss:temp Motion[0] double 0.00075 run scoreboard players get $PosX2 ArenaBoss.Temp
execute store result storage arena-boss:temp Motion[2] double 0.00075 run scoreboard players get $PosZ2 ArenaBoss.Temp

data modify entity @e[tag=ArenaBoss.Motion,limit=1] Motion set from storage arena-boss:temp Motion

# プレイヤーの方向く
execute positioned as @e[tag=ArenaBoss.Core] run tp @e[tag=ArenaBoss.Core] ~ ~ ~ facing entity @s

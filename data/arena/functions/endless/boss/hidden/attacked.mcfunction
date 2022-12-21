# 攻撃されたとき
# 受けたダメージ計算
execute store result score $Temp.DealtDamage Arena run data get entity @e[tag=Arena.LastBoss.Hitbox,limit=1] Health
data modify entity @e[tag=Arena.LastBoss.Hitbox,limit=1] Health set value 1024.0f

scoreboard players remove $Temp.DealtDamage Arena 1024
scoreboard players operation $Temp.DealtDamage Arena *= #-1 Arena
scoreboard players operation $Temp.DealtDamage Arena /= #2 Arena

execute store result score $Temp.Health Arena run data get storage arena: Boss.Health
scoreboard players operation $Temp.Health Arena -= $Temp.DealtDamage Arena

execute store result storage arena: Boss.Health float 1 run scoreboard players get $Temp.Health Arena

execute store result bossbar arena:boss value run data get storage arena: Boss.Health

# ハメ防止
scoreboard players add $AttackedCount Arena 1

execute if score $AttackedCount Arena matches 8 at @e[tag=Arena.LastBoss.Core] run particle reverse_portal ~ ~ ~ 0.25 1 0.25 0.1 600
execute if score $AttackedCount Arena matches 8 at @e[tag=Arena.LastBoss.Core] run playsound entity.enderman.scream master @a ~ ~ ~ 1 0.86
execute if score $AttackedCount Arena matches 8 as @e[tag=Arena.LastBoss.Core] at @s run tp @s @e[tag=Arena.SummonPoint,sort=random,limit=1,distance=10..20]

# Motion
data modify storage arena: Boss.Motion.Name set value "Block"

execute if score $AttackedCount Arena matches 8 run scoreboard players set $AttackedCount Arena 0

# 演出
execute at @e[tag=Arena.LastBoss.Core] run playsound entity.enderman.hurt master @a ~ ~ ~ 1 2
execute at @e[tag=Arena.LastBoss.Core] run playsound entity.wither.hurt master @a ~ ~ ~ 1 2

execute at @e[tag=Arena.LastBoss.Core] run particle ash ~ ~ ~ 0.25 1.5 0.25 1 30

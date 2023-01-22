# 攻撃されたとき
# 受けたダメージ計算
execute store result score $Temp.DealtDamage Arena run data get entity @e[tag=Arena.LastBoss.Hitbox,limit=1] Health
data modify entity @e[tag=Arena.LastBoss.Hitbox,limit=1] Health set value 1024.0f

scoreboard players remove $Temp.DealtDamage Arena 1024
scoreboard players operation $Temp.DealtDamage Arena *= #-1 Arena
scoreboard players operation $Temp.DealtDamage Arena /= #2 Arena

execute store result score $Temp.Health Arena run data get storage arena:boss Health
scoreboard players operation $Temp.Health Arena -= $Temp.DealtDamage Arena

execute store result storage arena:boss Health float 1 run scoreboard players get $Temp.Health Arena

execute store result bossbar arena:boss value run data get storage arena:boss Health

# ハメ対策
scoreboard players add $AttackedCount Arena 1
execute if score $AttackedCount Arena matches 8 run data modify storage arena:boss Motion.Name set value "Tp"
execute if score $AttackedCount Arena matches 8 run scoreboard players set $AttackedCount Arena 0

# Motion
execute if data storage arena: {Boss:{Motion:{Name:"none"}}} run data modify storage arena:boss Motion.Name set value "Block"

# 演出
execute at @e[tag=Arena.LastBoss.Core] run playsound entity.enderman.hurt master @a ~ ~ ~ 1 2
execute at @e[tag=Arena.LastBoss.Core] run playsound entity.wither.hurt master @a ~ ~ ~ 1 2

execute at @e[tag=Arena.LastBoss.Core] run particle ash ~ ~ ~ 0.25 1.5 0.25 1 30

# 死亡時
execute if score $Temp.Health Arena matches ..0 run data modify storage arena:boss Motion.Name set value "Death"

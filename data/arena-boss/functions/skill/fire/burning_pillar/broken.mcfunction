# 柱破壊時
# トリガー除去
advancement revoke @s only arena-boss:fire/broke_burning_pillar

# 演出
particle explosion_emitter ~ ~ ~ 0 0 0 1 1
particle lava ~ ~ ~ 0 0.25 0 1 20

playsound entity.generic.explode master @a ~ ~ ~ 5 0.5

playsound block.fire.extinguish master @a ~ ~ ~ 5 1.5
playsound block.fire.extinguish master @a ~ ~ ~ 5 0.7

# ボスにダメージ
execute store result score $Health ArenaBoss.Temp run data get storage arena-boss: Health
scoreboard players remove $Health ArenaBoss.Temp 50

execute store result storage arena-boss: Health float 1 run scoreboard players get $Health ArenaBoss.Temp

execute if score $Health ArenaBoss.Temp matches ..-1 run bossbar remove arena-boss:

function arena-boss:attacked/fire

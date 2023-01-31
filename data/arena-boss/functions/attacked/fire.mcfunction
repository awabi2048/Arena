# Fire
# 演出
execute at @e[tag=ArenaBoss.Core] run playsound entity.blaze.hurt master @a ~ ~ ~ 2 0.8
execute at @e[tag=ArenaBoss.Core] run playsound entity.blaze.hurt master @a ~ ~ ~ 2 0.75

execute at @e[tag=ArenaBoss.Core] run particle block blackstone ~ ~1.5 ~ 0.125 0.125 0.125 0.25 32

# プレイヤーの方向く
execute positioned as @e[tag=ArenaBoss.Part08] run tp @e[tag=ArenaBoss.Part08] ~ ~ ~ facing entity @s

# kill
execute if score $Health ArenaBoss.Temp matches ..-1 run function arena-boss:killed/fire


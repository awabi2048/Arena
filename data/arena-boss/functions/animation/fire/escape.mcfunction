# ハメられてたら退避
# タイマー増加
scoreboard players add $AnimationTimer ArenaBoss 1

# ここからアニメーション
#
# 回転
execute if score $AnimationTimer ArenaBoss matches 1..20 run function arena-boss:animation/fire/body_spin/fast

# 演出
execute if score $AnimationTimer ArenaBoss matches 1 run playsound entity.blaze.ambient master @a ~ ~ ~ 1 0.66
execute if score $AnimationTimer ArenaBoss matches 1 run playsound entity.blaze.hurt master @a ~ ~ ~ 1 0.5

execute if score $AnimationTimer ArenaBoss matches 10 run playsound block.beacon.deactivate master @a ~ ~ ~ 1 0.75

execute if score $AnimationTimer ArenaBoss matches 20 run playsound entity.enderman.teleport master @a ~ ~ ~ 1 0.6

# tp & 置き土産(デバフ爆弾)
execute if score $AnimationTimer ArenaBoss matches 20 run tp @e[tag=ArenaBoss.Core] @e[tag=ArenaBoss.EscapeTo,sort=random,limit=1]

execute if score $AnimationTimer ArenaBoss matches 20 run effect give @a[tag=Arena.Player,distance=..4] slowness 20 3
execute if score $AnimationTimer ArenaBoss matches 20 run effect give @a[tag=Arena.Player,distance=..4] darkness 10 2
execute if score $AnimationTimer ArenaBoss matches 20 run effect give @a[tag=Arena.Player,distance=..4] poison 10 2

execute if score $AnimationTimer ArenaBoss matches 20 run particle dust_color_transition 0 0.25 0 1 0 0.5 0.125 ~ ~ ~ 2 0 2 1 100

# トリガー用タイマーリセット
execute if score $AnimationTimer ArenaBoss matches 20 run scoreboard players set $PlayerCloseTime ArenaBoss 0

# リセット
execute if score $AnimationTimer ArenaBoss matches 20 run function arena-boss:animation/reset

# その他
function arena-boss:animation/fire/particle/regular

# 動き停止
execute if score $AnimationTimer ArenaBoss matches 1 run data modify storage arena-boss: Animation.Flag.NoMove set value true

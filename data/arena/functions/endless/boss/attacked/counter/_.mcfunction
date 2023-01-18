# ボスが攻撃を受けたときにカウンター
execute store result score $Boss.Health Arena run bossbar get arena:boss value

execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:"BetaExtra"}}} store result score $Boss.Health Arena run bossbar get arena_beta:extra_boss value

# 人数取得
execute store result score $PlayerCount Arena.Temp if entity @a[tag=Arena.Player,scores={Arena=-1}]

# カウンターの種類を乱数で決定
function arena:rng

    # カウンター01
    execute if score $Random Arena matches 0..50 as @e[tag=Arena.Boss] at @s run function arena:endless/boss/attacked/counter/01

    # カウンター02
    execute if score $Random Arena matches 51..99 if score $PlayerCount Arena.Temp matches 2.. as @e[tag=Arena.Boss] at @s run function arena:endless/boss/attacked/counter/02

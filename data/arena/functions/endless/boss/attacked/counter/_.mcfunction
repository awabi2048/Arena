# ボスが攻撃を受けたときにカウンター
execute store result score $Boss.Health Arena run bossbar get arena:boss value

# カウンターの種類を乱数で決定
    summon area_effect_cloud ~ ~ ~ {Tags:["Arena.Random"]}
    execute store result score $Boss.Random Arena run data get entity @e[tag=Arena.Random,limit=1] UUID[0]
    scoreboard players operation $Boss.Random Arena %= #100 Arena

        # カウンター01
        execute if score $Boss.Random Arena matches 0..50 as @e[tag=Arena.Boss] at @s run function arena:endless/boss/attacked/counter/01

        # カウンター02
        execute unless score $Boss.Random Arena matches ..100 if score $Boss.Random Arena matches 51..99 as @e[tag=Arena.Boss] at @s run function arena:endless/boss/attacked/counter/02
        execute if score $Boss.Random Arena matches ..100 if score $Boss.Random Arena matches 76..99 as @e[tag=Arena.Boss] at @s run function arena:endless/boss/attacked/counter/02

advancement revoke @a only arena:boss/attacked_last_boss


# ボス攻撃受けたときのカウンター
# カウンターするか乱数で決定
    summon area_effect_cloud ~ ~ ~ {Tags:["Arena.Random"]}
    execute store result score $Boss.Random Arena run data get entity @e[tag=Arena.Random,limit=1] UUID[0]
    scoreboard players operation $Boss.Random Arena %= #100 Arena

execute if score $Boss.Random Arena matches ..12 run function arena:endless/boss/attacked/counter/_

# 一定ダメージ以下の攻撃は通さない
function arena:endless/boss/attacked/shield/_

advancement revoke @a only arena:boss/attacked_last_boss

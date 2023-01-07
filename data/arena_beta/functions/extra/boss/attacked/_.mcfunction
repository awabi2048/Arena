# ボスが攻撃受けたときの処理
    # カウンターするか乱数で決定
    summon area_effect_cloud ~ ~ ~ {Tags:["Arena.Random"]}
    execute store result score $Temp.Random Arena run data get entity @e[tag=Arena.Random,limit=1] UUID[0]
    scoreboard players operation $Temp.Random Arena %= #100 Arena

execute if score $Temp.Random Arena matches ..12 run function arena:endless/boss/attacked/counter/_

# 一定ダメージ以下の攻撃は通さない
function arena:endless/boss/attacked/shield/_

# ボスの体力によってボスバーの色変更
execute store result score $Boss.Health Arena run data get entity @e[tag=Arena.LastBoss,limit=1] Health
execute if score $Boss.Health Arena matches 667..1000 run bossbar set arena:boss color white
execute if score $Boss.Health Arena matches 334..666 run bossbar set arena:boss color yellow
execute if score $Boss.Health Arena matches 1..334 run bossbar set arena:boss color red

advancement revoke @a only arena:boss/attacked_last_boss

# 隠しエンドレス用: 一定時間攻撃受けないと高速回復
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} run scoreboard players set $Boss.LastAttackedTime Arena 0


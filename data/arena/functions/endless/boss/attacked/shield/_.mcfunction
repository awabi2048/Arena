# ボスが展開するシールド(指定ダメージ以下を無効に)
execute store result score $Boss.LastHealth Arena.Temp run data get storage arena:boss LastHealth
execute store result score $Boss.CurrentHealth Arena.Temp run data get entity @e[tag=Arena.LastBoss,limit=1] Health

# ボスの体力減少量計算
scoreboard players operation $Boss.DamageAmount Arena.Temp = $Boss.LastHealth Arena.Temp
scoreboard players operation $Boss.DamageAmount Arena.Temp -= $Boss.CurrentHealth Arena.Temp

# 最小ダメージ値設定
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:BetaExtra}}} run scoreboard players set $Boss.MinDamageAmount Arena.Temp 15

execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run scoreboard players set $Boss.MinDamageAmount Arena.Temp 30
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} run scoreboard players set $Boss.MinDamageAmount Arena.Temp 50

scoreboard players operation $Boss.DamageAmount Arena.Temp -= $Boss.MinDamageAmount Arena.Temp

execute store success storage arena:temp BossAttackBlocked byte 1 if score $Boss.DamageAmount Arena.Temp matches 1..

    # 最小ダメージ値以下
    execute if data storage arena:temp {BossAttackBlocked:true} at @e[tag=Arena.LastBoss] run function arena:endless/boss/attacked/shield/block

    # 最小ダメージ値以上 (最小ダメージ値を引いた値を実ダメージとする)
    execute if data storage arena:temp {BossAttackBlocked:false} run scoreboard players operation $Boss.LastHealth Arena.Temp -= $Boss.DamageAmount Arena.Temp

# LastHealthの値を適応
execute store result storage arena:boss LastHealth double 1 run scoreboard players get $Boss.LastHealth Arena
data modify entity @e[tag=Arena.LastBoss,limit=1] Health set from storage arena:boss LastHealth


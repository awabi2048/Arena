function arena:endless/boss/reset

summon vindicator ~ ~2 ~ {Tags:["Arena.Boss","Arena.LastBoss","Arena.Mob"],Attributes:[{Name:"generic.attack_damage",Base:1.0d},{Name:"generic.max_health",Base:1.0d},{Name:"generic.max_health",Base:1.0d}],Health:1024.0f,HandItems:[{id:"minecraft:golden_sword",Count:1b},{}],DeathLootTable:"arena:boss/last_boss",CustomName:'{"text":"アリーナマスター","color":"gold","bold": true}',CustomNameVisible:1b,HandDropChances:[0.0f,0.0f]}

# エフェクト
effect give @e[tag=Arena.LastBoss] fire_resistance 86400 1 true

# ボスバー設定
bossbar add arena:boss {"text":"アリーナマスター","bold": true,"color": "gold"}
bossbar set arena:boss max 1000
bossbar set arena:boss players @a[tag=Arena.Player,distance=..20]

# 通常エンドレスのAttributes設定
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run data modify entity @e[tag=Arena.LastBoss,sort=nearest,limit=1] Attributes[{Name:"minecraft:generic.max_health"}].Base set value 1000.0d
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run data modify entity @e[tag=Arena.LastBoss,sort=nearest,limit=1] Attributes[{Name:"minecraft:generic.attack_damage"}].Base set value 62.5d
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run data modify entity @e[tag=Arena.LastBoss,sort=nearest,limit=1] Attributes[{Name:"minecraft:generic.armor"}].Base set value 20.0d

# 隠しエンドレスのAttributes設定
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} run data modify entity @e[tag=Arena.LastBoss,sort=nearest,limit=1] Attributes[{Name:"minecraft:generic.max_health"}].Base set value 1000.0d
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} run data modify entity @e[tag=Arena.LastBoss,sort=nearest,limit=1] Attributes[{Name:"minecraft:generic.attack_damage"}].Base set value 125.0d
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} run data modify entity @e[tag=Arena.LastBoss,sort=nearest,limit=1] Attributes[{Name:"minecraft:generic.armor"}].Base set value 30.0d

# シールド関連
scoreboard players set $Boss.Temp.LastHealth Arena 1000

# 演出
playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 5 0.75
playsound entity.lightning_bolt.impact master @a ~ ~ ~ 5 1.25

particle end_rod ~ ~1 ~ 0 0 0 0.125 100
particle flame ~ ~1 ~ 0 0 0 0.125 100

effect give @a blindness 1 1 true


# 中ボス召喚
summon vindicator ~ ~3 ~ {Tags:["Arena.Boss","Arena.MidBoss","Arena.Mob"],Attributes:[{Name:"generic.max_health",Base:1.0d},{Name:"generic.attack_damage",Base:1.0d},{Name:"generic.armor",Base:1.0d}],HandItems:[{id:"minecraft:golden_sword",Count:1b},{}],CustomName:'{"text":"中ボス","color":"gold","bold": true}',ActiveEffects:[{Id:12,Amplifier:0b,Duration:1728000,ShowParticles:0b}],CustomNameVisible:1b}

bossbar add arena:mid_boss {"text":"中ボス","bold": true,"color": "yellow"}
bossbar set arena:mid_boss players @a[tag=Arena.Player,distance=..32]

# 通常エンドレスのAttributes設定
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run data modify entity @e[tag=Arena.MidBoss,sort=nearest,limit=1] Attributes[{Name:"minecraft:generic.max_health"}].Base set value 1000.0d
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run data modify entity @e[tag=Arena.MidBoss,sort=nearest,limit=1] Attributes[{Name:"minecraft:generic.attack_damage"}].Base set value 50.0d
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run data modify entity @e[tag=Arena.MidBoss,sort=nearest,limit=1] Attributes[{Name:"minecraft:generic.armor"}].Base set value 0.0d
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run bossbar set arena:mid_boss max 1000

# 隠しエンドレスのAttributes設定
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} run data modify entity @e[tag=Arena.MidBoss,sort=nearest,limit=1] Attributes[{Name:"minecraft:generic.max_health"}].Base set value 1000.0d
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} run data modify entity @e[tag=Arena.MidBoss,sort=nearest,limit=1] Attributes[{Name:"minecraft:generic.attack_damage"}].Base set value 100.0d
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} run data modify entity @e[tag=Arena.MidBoss,sort=nearest,limit=1] Attributes[{Name:"minecraft:generic.armor"}].Base set value 5.0d
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} run bossbar set arena:mid_boss max 1000

data modify entity @e[tag=Arena.MidBoss,limit=1] Health set value 1000.0d

playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 5 0.75
playsound entity.lightning_bolt.impact master @a ~ ~ ~ 5 1.25

# ボタン押せないように
execute at @e[tag=Arena.Core,sort=nearest,limit=1] run setblock ~ ~ ~ air

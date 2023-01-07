# 直接召喚
# 本体, Core, 当たり判定を召喚
summon marker ~ ~ ~ {Tags:["Arena.LastBoss.Core","Arena.Mob"]}
summon armor_stand ~ ~ ~ {Tags:["Arena.LastBoss.Upper","Arena.LastBoss.Body"],Invisible:1b,Marker:1b,ArmorItems:[{},{},{},{id:"minecraft:stick",tag:{CustomModelData:11101},Count:1b}]}
summon armor_stand ~ ~ ~ {Tags:["Arena.LastBoss.Lower","Arena.LastBoss.Body"],Invisible:1b,Marker:1b,ArmorItems:[{},{},{},{id:"minecraft:stick",tag:{CustomModelData:11201},Count:1b}]}
summon armor_stand ~ ~ ~ {Tags:["Arena.LastBoss.Sword","Arena.LastBoss.Body"],Invisible:1b,Marker:1b,ArmorItems:[{},{},{},{id:"minecraft:stick",tag:{CustomModelData:11001},Count:1b}]}

summon skeleton ~ ~ ~ {Tags:["Arena.LastBoss.Hitbox","Arena.LastBoss.Body"],NoAI:1b,Silent:1b,ActiveEffects:[{Ambient:0b,Id:14,Duration:2100000000,ShowParticles:0b},{Ambient:0b,Id:12,Duration:2100000000,ShowParticles:0b}],Attributes:[{Name:"generic.max_health",Base:1024.0d}],Health:1024.0f,ArmorItems:[{},{},{},{id:"minecraft:stick",Count:1b,tag:{CustomModelData:11999}}]}

# 体力等値設定
data modify storage arena: Boss.Health set value 1000.0f

# ボスバー
bossbar add arena:boss {"text":"アリーナマスター","color": "white","bold": true}
bossbar set arena:boss color red
bossbar set arena:boss max 1000

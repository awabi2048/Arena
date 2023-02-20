# 召喚
# 本体
summon marker ~ ~ ~ {Tags:["ArenaBoss.Core","ArenaBoss.Element"],data:{ArenaBoss:{Name:"Water"}}}

# 見た目
# 頭
summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part01-1","ArenaBoss.Part01","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:500101},Count:1b}],Pose:{Head:[0.1f,0.1f,0.1f]}}
summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part01-2","ArenaBoss.Part01","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:500102},Count:1b}],Pose:{Head:[0.1f,0.1f,0.1f]}}
summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part01-3","ArenaBoss.Part01","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:500103},Count:1b}],Pose:{Head:[0.1f,0.1f,0.1f]}}

summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part02","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:510101},Count:1b}]}
summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part03","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:520101},Count:1b}]}
summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part04","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:530101},Count:1b}]}
summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part05","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:540101},Count:1b}]}

summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part06","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:550101},Count:1b}]}
summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part07","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:560101},Count:1b}]}
summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part08","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:570101},Count:1b}]}

summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part09","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:580101},Count:1b}]}

summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part10","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:590101},Count:1b}]}

# 当たり判定
summon wither_skeleton ~ ~ ~ {Tags:["ArenaBoss.Hitbox","ArenaBoss.Element"],Silent:true,NoAI:true,PersistenceRequired:true,ActiveEffects:[{Id:14,Duration:2147483647,ShowParticles:false}],Attributes:[{Name:"minecraft:generic.max_health",Base:1024.0d}],DeathLootTable:"empty",Health:1024.0f,CustomName:'{"text":"ガーディアン?","bold": true,"color": "blue"}'}

# ふわふわ
summon marker ~ ~ ~ {Tags:["ArenaBoss.Extra01","ArenaBoss.Element"]}


# Health
data modify storage arena-boss: Health set value 4000.0f
data modify storage arena-boss: MaxHealth set from storage arena-boss: Health 

bossbar add arena-boss: [{"text":"【","bold": true,"color": "blue"},{"text":"ガーディアン?(仮)","color": "aqua"},{"text":"】","bold": true,"color": "blue"}]

bossbar set arena-boss: players @a[tag=Arena.Player,distance=..32]
bossbar set arena-boss: max 4000
bossbar set arena-boss: value 4000

bossbar set arena-boss: color blue
bossbar set arena-boss: style notched_10

# 攻撃行動
data modify storage arena-boss: Name set value "Water"
schedule function arena-boss:behavior/_ 2s

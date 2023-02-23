# 召喚
# 本体
summon marker ~ ~ ~ {Tags:["ArenaBoss.Core","ArenaBoss.Element"],data:{ArenaBoss:{Name:"Fire"}}}

# 見た目
summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part01","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:410101},Count:1b}]}
summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part02","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:420101},Count:1b}]}
summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part03","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:430101},Count:1b}]}
summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part04","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:440101},Count:1b}]}

summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part05","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:450101},Count:1b}]}
summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part06","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:460101},Count:1b}]}

summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part07","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:470101},Count:1b}]}

summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part08","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:480101},Count:1b}]}

# 当たり判定
summon wither_skeleton ~ ~ ~ {Tags:["ArenaBoss.Hitbox","ArenaBoss.Element"],Silent:true,NoAI:true,PersistenceRequired:true,ActiveEffects:[{Id:14,Duration:2147483647,ShowParticles:false}],Attributes:[{Name:"minecraft:generic.max_health",Base:1024.0d}],DeathLootTable:"empty",Health:1024.0f,CustomName:'{"text":"キングブレイズ","bold": true,"color": "orange"}'}

# ふわふわ
summon marker ~ ~ ~ {Tags:["ArenaBoss.Extra01","ArenaBoss.Element"]}


# Health
data modify storage arena-boss: Health set value 2500.0f
data modify storage arena-boss: MaxHealth set from storage arena-boss: Health 

bossbar add arena-boss: [{"text":"【","bold": true},{"text":"キングブレイズ","color": "gold","bold": true,"obfuscated": false},{"text":"】","bold": true}]

bossbar set arena-boss: players @a[tag=Arena.Player,distance=..32]
bossbar set arena-boss: max 2500
bossbar set arena-boss: value 2500

bossbar set arena-boss: color yellow
bossbar set arena-boss: style notched_10

# 攻撃行動
data modify storage arena-boss: Name set value "Fire"
schedule function arena-boss:behavior/_ 2s

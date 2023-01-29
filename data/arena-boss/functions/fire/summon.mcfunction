# 召喚
# 本体
summon marker ~ ~ ~ {Tags:["ArenaBoss.Core","ArenaBoss.Element"],data:{ArenaBoss:{Name:"Fire"}}}

# 見た目
summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part01","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:stick",tag:{CustomModelData:910110101},Count:1b}]}
summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part02","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:stick",tag:{CustomModelData:910120101},Count:1b}]}
summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part03","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:stick",tag:{CustomModelData:910130101},Count:1b}]}
summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part04","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:stick",tag:{CustomModelData:910140101},Count:1b}]}

summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part05","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:stick",tag:{CustomModelData:910150101},Count:1b}]}
summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part06","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:stick",tag:{CustomModelData:910160101},Count:1b}]}

summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part07","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:stick",tag:{CustomModelData:910170101},Count:1b}]}

summon armor_stand ~ ~ ~ {Tags:["ArenaBoss.Part08","ArenaBoss.Element","ArenaBoss.Element-Parts"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:stick",tag:{CustomModelData:910180101},Count:1b}]}

# 当たり判定
summon wither_skeleton ~ ~ ~ {Tags:["ArenaBoss.Hitbox","ArenaBoss.Element"],Silent:true,NoAI:true,AbsorptionAmount:1024.0f,ActiveEffects:[{Id:14,Duration:2147483647,ShowParticles:false}],DeathLootTable:"empty"}

# ふわふわ
summon marker ~ ~ ~ {Tags:["ArenaBoss.Extra01","ArenaBoss.Element"]}


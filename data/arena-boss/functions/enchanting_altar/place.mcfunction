# 召喚
# 本体
summon marker ~ ~ ~ {Tags:["ArenaBoss.Altar.Core","ArenaBoss.Altar.Element"]}

# 見た目
summon armor_stand ~ ~-0 ~ {Tags:["ArenaBoss.Altar.Part01","ArenaBoss.Altar.Element"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:1000001},Count:1b}]}

summon armor_stand ~ ~-0.5 ~ {Tags:["ArenaBoss.Altar.Part02","ArenaBoss.Altar.Element"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:1000002},Count:1b}]}

summon armor_stand ~ ~-0.5 ~ {Tags:["ArenaBoss.Altar.Part03","ArenaBoss.Altar.Element","ArenaBoss.Altar.Element-Ring"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:1000003},Count:1b}]}
summon armor_stand ~ ~-0.5 ~ {Tags:["ArenaBoss.Altar.Part04","ArenaBoss.Altar.Element","ArenaBoss.Altar.Element-Ring"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:1000004},Count:1b}]}
summon armor_stand ~ ~-0.5 ~ {Tags:["ArenaBoss.Altar.Part05","ArenaBoss.Altar.Element","ArenaBoss.Altar.Element-Ring"],Invisible:true,Marker:true,ArmorItems:[{},{},{},{id:"minecraft:orange_dye",tag:{CustomModelData:1000005},Count:1b}]}

# メニュー
summon chest_minecart ~ ~-0.25 ~ {Tags:["ArenaBoss.Altar.Menu","ArenaBoss.Altar.Element"],Silent:true,CustomDisplayTile:true,DisplayState:{Name:"minecraft:air"},CustomName:'[{"text":"|||","color": "black","bold": true,"obfuscated": true},{"text":" エンチャントの祭壇 ","color": "dark_purple","bold": true,"obfuscated": false},{"text":"|||","color": "black","bold": true,"obfuscated": true}]',NoGravity:true}

# トロッコが動かないように設定
setblock ~ ~ ~ rail
setblock ~1 ~ ~ black_carpet
setblock ~ ~ ~1 black_carpet
setblock ~ ~ ~-1 black_carpet
setblock ~-1 ~ ~ black_carpet

# tellraw
tellraw @s [{"text": " ["},{"text": "Arena","color": "red"},{"text": "] "},{"text": "エンチャントの祭壇を設置しました。"}]

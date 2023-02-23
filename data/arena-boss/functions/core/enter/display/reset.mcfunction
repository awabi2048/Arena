## 選択表示のリセット
# kill
kill @e[tag=ArenaBoss.StageSelector.Display-0]

kill @e[tag=ArenaBoss.StageSelector.Display-1-0]
kill @e[tag=ArenaBoss.StageSelector.Display-1-1]

kill @e[tag=ArenaBoss.StageSelector.Display-2-0]
kill @e[tag=ArenaBoss.StageSelector.Display-2-1]

kill @e[tag=ArenaBoss.StageSelector.PagePrev]
kill @e[tag=ArenaBoss.StageSelector.PageNext]

kill @e[tag=ArenaBoss.StageSelector.Display-Note]
kill @e[tag=ArenaBoss.StageSelector.Display-Page]

kill @e[tag=ArenaBoss.StageSelector.Confirm]
kill @e[tag=ArenaBoss.StageSelector.Display-Confirm]

# 再summon
execute at @e[tag=ArenaBoss.StageSelector.Core] run summon armor_stand ~ ~0.4 ~ {Tags:["ArenaBoss.StageSelector.Display-0"],Marker:true,Invisible:true,CustomNameVisible:true}


execute at @e[tag=ArenaBoss.StageSelector.Core] run summon armor_stand ~0.2 ~0.12 ~ {Tags:["ArenaBoss.StageSelector.Display-1-0"],Marker:true,Invisible:true,CustomNameVisible:true}
execute at @e[tag=ArenaBoss.StageSelector.Core] run summon armor_stand ~-0.5 ~0.12 ~ {Tags:["ArenaBoss.StageSelector.Display-1-1"],Marker:true,Invisible:true,CustomNameVisible:true}

execute at @e[tag=ArenaBoss.StageSelector.Core] run summon armor_stand ~0.4875 ~-0.22 ~ {Tags:["ArenaBoss.StageSelector.Display-2-0"],Marker:true,Invisible:true,CustomNameVisible:true}
execute at @e[tag=ArenaBoss.StageSelector.Core] run summon armor_stand ~-0.5 ~-0.22 ~ {Tags:["ArenaBoss.StageSelector.Display-2-1"],Marker:true,Invisible:true,CustomNameVisible:true}


execute at @e[tag=ArenaBoss.StageSelector.Core] run summon armor_stand ~ ~0.9 ~ {Tags:["ArenaBoss.StageSelector.Display-Note"],Marker:true,Invisible:true,CustomNameVisible:true}

execute at @e[tag=ArenaBoss.StageSelector.Core] run summon slime ~-1 ~-0.5 ~ {Tags:["ArenaBoss.StageSelector.PagePrev"],CustomNameVisible:true,ActiveEffects:[{Id:14,ShowParticles:false,Duration:2147483647}],NoAI:true,NoGravity:true,Silent:true,Health:1024.0f,Attributes:[{Base:1024.0d,Name:"minecraft:generic.max_health"}],PersistenceRequired:true}
execute at @e[tag=ArenaBoss.StageSelector.Core] run summon slime ~1 ~-0.5 ~ {Tags:["ArenaBoss.StageSelector.PageNext"],CustomNameVisible:true,ActiveEffects:[{Id:14,ShowParticles:false,Duration:2147483647}],NoAI:true,NoGravity:true,Silent:true,Health:1024.0f,Attributes:[{Base:1024.0d,Name:"minecraft:generic.max_health"}],PersistenceRequired:true}

execute at @e[tag=ArenaBoss.StageSelector.Core] run summon slime ~ ~-0.5 ~ {Tags:["ArenaBoss.StageSelector.Confirm"],CustomNameVisible:true,ActiveEffects:[{Id:14,ShowParticles:false,Duration:2147483647}],NoAI:true,NoGravity:true,Silent:true,Health:1024.0f,Attributes:[{Base:1024.0d,Name:"minecraft:generic.max_health"}],PersistenceRequired:true}

execute at @e[tag=ArenaBoss.StageSelector.Core] run summon armor_stand ~-1 ~-0.66 ~ {Tags:["ArenaBoss.StageSelector.Display-Page"],Marker:true,Invisible:true,CustomNameVisible:true,CustomName:'{"text":">>","color": "white","bold": true}'}
execute at @e[tag=ArenaBoss.StageSelector.Core] run summon armor_stand ~1 ~-0.66 ~ {Tags:["ArenaBoss.StageSelector.Display-Page"],Marker:true,Invisible:true,CustomNameVisible:true,CustomName:'{"text":"<<","color": "white","bold": true}'}

execute at @e[tag=ArenaBoss.StageSelector.Core] run summon armor_stand ~ ~-0.66 ~ {Tags:["ArenaBoss.StageSelector.Display-Confirm"],Marker:true,Invisible:true,CustomNameVisible:true,CustomName:'{"text": "［決定］", "color": "green", "bold": true}'}

# 表示データ設定
# 数値データをresolve
execute in minecraft:overworld run setblock 0 -64 0 oak_sign{Text1:'{"nbt": "Boss.StageInfo[0].TicketRequired","storage": "arena:core","color": "aqua","bold": true}'}
execute in minecraft:overworld run setblock 0 -63 0 oak_sign{Text1:'{"nbt": "Boss.StageInfo[0].MaxPlayerCount","storage": "arena:core","color": "aqua","bold": true}'}

# 直接指定のものはそのまま代入
data modify entity @e[tag=ArenaBoss.StageSelector.Display-Note,limit=1] CustomName set value '{"text": "［入場ステージを選択］", "color": "red", "bold": true}'
data modify entity @e[tag=ArenaBoss.StageSelector.Display-1-0,limit=1] CustomName set value '{"text": "必要AP:", "color": "white", "bold": true}'
data modify entity @e[tag=ArenaBoss.StageSelector.Display-2-0,limit=1] CustomName set value '{"text": "最大入場者数:", "color": "white", "bold": true}'

# 変数を代入
data modify entity @e[tag=ArenaBoss.StageSelector.Display-0,limit=1] CustomName set from storage arena:core Boss.StageInfo[0].DisplayData.Name

execute in minecraft:overworld run data modify entity @e[tag=ArenaBoss.StageSelector.Display-1-1,limit=1] CustomName set from block 0 -64 0 Text1
execute in minecraft:overworld run data modify entity @e[tag=ArenaBoss.StageSelector.Display-2-1,limit=1] CustomName set from block 0 -63 0 Text1

# リセット
fill 0 -64 0 0 -63 0 air

# ページ繰り用データの設定
data modify storage arena:temp Boss.StageInfo set from storage arena:core Boss.StageInfo

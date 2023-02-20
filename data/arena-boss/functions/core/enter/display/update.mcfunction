## 表示内容を更新
# 現在表示中のデータを保存
data modify entity @e[tag=ArenaBoss.StageSelector.Core,limit=1] data.Arena.StageInfo.MaxPlayerCount set from storage arena:temp Boss.StageInfo[0].MaxPlayerCount
data modify entity @e[tag=ArenaBoss.StageSelector.Core,limit=1] data.Arena.StageInfo.TicketRequired set from storage arena:temp Boss.StageInfo[0].TicketRequired
data modify entity @e[tag=ArenaBoss.StageSelector.Core,limit=1] data.Arena.StageInfo.StageID set from storage arena:temp Boss.StageInfo[0].StageID

# 数値データをresolve
execute in minecraft:overworld run setblock 0 -64 0 oak_sign{Text1:'{"nbt": "Boss.StageInfo[0].TicketRequired","storage": "arena:temp","color": "aqua","bold": true}'}
execute in minecraft:overworld run setblock 0 -63 0 oak_sign{Text1:'{"nbt": "Boss.StageInfo[0].MaxPlayerCount","storage": "arena:temp","color": "aqua","bold": true}'}

# 変数を代入
data modify entity @e[tag=ArenaBoss.StageSelector.Display-0,limit=1] CustomName set from storage arena:temp Boss.StageInfo[0].DisplayData.Name

execute in minecraft:overworld run data modify entity @e[tag=ArenaBoss.StageSelector.Display-1-1,limit=1] CustomName set from block 0 -64 0 Text1
execute in minecraft:overworld run data modify entity @e[tag=ArenaBoss.StageSelector.Display-2-1,limit=1] CustomName set from block 0 -63 0 Text1

# リセット
execute in minecraft:overworld run fill 0 -64 0 0 -63 0 air


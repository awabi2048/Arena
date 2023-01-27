# プレイヤーに通知
tellraw @a[tag=Arena.Player,distance=..32] [{"text":"[","color": "white"},{"text":"Arena","color": "red"},{"text":"] ","color": "white"},{"text":"報酬が配布されました！もう一度ボタンを押すと退出します","color":"yellow"}]
playsound entity.player.levelup master @a[tag=Arena.Player,distance=..32] ~ ~ ~ 1 1.75

# 報酬配布
data modify storage arena:temp Reward.Difficulty set from entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Difficulty
data modify storage arena:temp Reward.MobType set from entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.MobType

# 配布枚数の決定
execute if data storage arena:temp {Reward:{MobType:0}} run scoreboard players set $TicketCount Arena.Temp 1
execute if data storage arena:temp {Reward:{MobType:1}} run scoreboard players set $TicketCount Arena.Temp 2
execute if data storage arena:temp {Reward:{MobType:2}} run scoreboard players set $TicketCount Arena.Temp 2
execute if data storage arena:temp {Reward:{MobType:3}} run scoreboard players set $TicketCount Arena.Temp 4
execute if data storage arena:temp {Reward:{MobType:4}} run scoreboard players set $TicketCount Arena.Temp 3
execute if data storage arena:temp {Reward:{MobType:5}} run scoreboard players set $TicketCount Arena.Temp 2
execute if data storage arena:temp {Reward:{MobType:6}} run scoreboard players set $TicketCount Arena.Temp 4

# 配布
execute if data storage arena:temp {Reward:{Difficulty:0}} run loot give @a[tag=Arena.Player,distance=..32] loot arena:ticket/easy
execute if data storage arena:temp {Reward:{Difficulty:1}} run loot give @a[tag=Arena.Player,distance=..32] loot arena:ticket/normal
execute if data storage arena:temp {Reward:{Difficulty:2}} run loot give @a[tag=Arena.Player,distance=..32] loot arena:ticket/hard

# 討伐の称号の配布
execute if data storage arena:temp {Reward:{MobType:0,Difficulty:2}} if predicate arena:drop_chance/title run loot give @a[tag=Arena.Player,distance=..32] loot arena:title/zombie
execute if data storage arena:temp {Reward:{MobType:1,Difficulty:2}} if predicate arena:drop_chance/title run loot give @a[tag=Arena.Player,distance=..32] loot arena:title/skeleton
execute if data storage arena:temp {Reward:{MobType:2,Difficulty:2}} if predicate arena:drop_chance/title run loot give @a[tag=Arena.Player,distance=..32] loot arena:title/blaze
execute if data storage arena:temp {Reward:{MobType:3,Difficulty:2}} if predicate arena:drop_chance/title run loot give @a[tag=Arena.Player,distance=..32] loot arena:title/spider
execute if data storage arena:temp {Reward:{MobType:4,Difficulty:2}} if predicate arena:drop_chance/title run loot give @a[tag=Arena.Player,distance=..32] loot arena:title/slime
execute if data storage arena:temp {Reward:{MobType:5,Difficulty:2}} if predicate arena:drop_chance/title run loot give @a[tag=Arena.Player,distance=..32] loot arena:title/creeper
execute if data storage arena:temp {Reward:{MobType:6,Difficulty:2}} if predicate arena:drop_chance/title run loot give @a[tag=Arena.Player,distance=..32] loot arena:title/guardian

# クリアタイムの取得
execute store result score $StartTime Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.StartTime
execute store result score $Time:tick Arena.Temp run time query gametime

scoreboard players operation $Time:tick Arena.Temp -= $StartTime Arena.Temp

function arena:record/calc_time
data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.DisplayTime set from storage arena:temp TimeDisplay.Combined
execute store result entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.TickTime int 1 run scoreboard players get $Time:tick Arena.Temp

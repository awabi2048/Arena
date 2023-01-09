# プレイヤーに通知
tellraw @a[tag=Arena.Player,distance=..32] {"text":"報酬が配布されました！もう一度ボタンを押すと退出します","color":"aqua"}
playsound entity.player.levelup master @a[tag=Arena.Player,distance=..32] ~ ~ ~ 1 1.75

# 報酬配布
data modify storage arena:temp Reward.Difficulty set from entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Difficulty
data modify storage arena:temp Reward.MobType set from entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.MobType

# 配布枚数の決定
execute if data storage arena:temp {Reward:{MobType:0}} run scoreboard players set $TicketCount Arena 1
execute if data storage arena:temp {Reward:{MobType:1}} run scoreboard players set $TicketCount Arena 2
execute if data storage arena:temp {Reward:{MobType:2}} run scoreboard players set $TicketCount Arena 2
execute if data storage arena:temp {Reward:{MobType:3}} run scoreboard players set $TicketCount Arena 4
execute if data storage arena:temp {Reward:{MobType:4}} run scoreboard players set $TicketCount Arena 3
execute if data storage arena:temp {Reward:{MobType:5}} run scoreboard players set $TicketCount Arena 2
execute if data storage arena:temp {Reward:{MobType:6}} run scoreboard players set $TicketCount Arena 4

# 配布
execute if data storage arena:temp {Reward:{Difficulty:0}} run loot give @a[tag=Arena.Player,distance=..32] loot arena:ticket/easy
execute if data storage arena:temp {Reward:{Difficulty:1}} run loot give @a[tag=Arena.Player,distance=..32] loot arena:ticket/normal
execute if data storage arena:temp {Reward:{Difficulty:2}} run loot give @a[tag=Arena.Player,distance=..32] loot arena:ticket/hard

# 討伐の称号の配布
execute if data storage arena:temp {Reward:{MobType:0,Difficulty:2}} if predicate arena:drop_chance/title run give @a[tag=Arena.Player,distance=..32] shield{BlockEntityTag:{Base:11,Patterns:[{Color:13,Pattern:"sku"},{Color:9,Pattern:"hhb"},{Color:11,Pattern:"bo"}],id:"minecraft:banner"},Damage:0,display:{Lore:['{"text":"MOB:ゾンビ","italic": false}','{"text":"※エンチャントを付与するとクラフトができなくなります！","color": "red","italic": false}'],Name:'{"extra":[{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"color":"gold","text":"アリーナ討伐の称号"}],"text":""}'},RepairCost:40}
execute if data storage arena:temp {Reward:{MobType:1,Difficulty:2}} if predicate arena:drop_chance/title run give @a[tag=Arena.Player,distance=..32] shield{BlockEntityTag:{Base:8,Patterns:[{Color:15,Pattern:"sku"}],id:"minecraft:banner"},Damage:0,display:{Lore:['{"text":"MOB:スケルトン","italic": false}','{"text":"※エンチャントを付与するとクラフトができなくなります！","color": "red","italic": false}'],Name:'{"extra":[{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"color":"gold","text":"アリーナ討伐の称号"}],"text":""}'},RepairCost:40}
execute if data storage arena:temp {Reward:{MobType:2,Difficulty:2}} if predicate arena:drop_chance/title run give @a[tag=Arena.Player,distance=..32] shield{BlockEntityTag:{Base:1,Patterns:[{Color:4,Pattern:"ss"},{Color:1,Pattern:"hh"},{Color:4,Pattern:"sku"},{Color:4,Pattern:"cre"},{Color:14,Pattern:"bo"}],id:"minecraft:banner"},Damage:0,display:{Lore:['{"text":"MOB:ブレイズ","italic": false}','{"text":"※エンチャントを付与するとクラフトができなくなります！","color": "red","italic": false}'],Name:'{"extra":[{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"color":"gold","text":"アリーナ討伐の称号"}],"text":""}'},RepairCost:40}
execute if data storage arena:temp {Reward:{MobType:3,Difficulty:2}} if predicate arena:drop_chance/title run give @a[tag=Arena.Player,distance=..32] shield{BlockEntityTag:{Base:15,Patterns:[{Color:14,Pattern:"ss"},{Color:15,Pattern:"cbo"},{Color:15,Pattern:"mr"},{Color:14,Pattern:"flo"}],id:"minecraft:banner"},Damage:0,display:{Lore:['{"text":"MOB:スパイダー","italic": false}','{"text":"※エンチャントを付与するとクラフトができなくなります！","color": "red","italic": false}'],Name:'{"extra":[{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"color":"gold","text":"アリーナ討伐の称号"}],"text":""}'},RepairCost:40}
execute if data storage arena:temp {Reward:{MobType:4,Difficulty:2}} if predicate arena:drop_chance/title run give @a[tag=Arena.Player,distance=..32] shield{BlockEntityTag:{Base:5,Patterns:[{Color:13,Pattern:"glb"}],id:"minecraft:banner"},Damage:0,display:{Lore:['{"text":"MOB:スライム","italic": false}','{"text":"※エンチャントを付与するとクラフトができなくなります！","color": "red","italic": false}'],Name:'{"extra":[{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"color":"gold","text":"アリーナ討伐の称号"}],"text":""}'},RepairCost:40}
execute if data storage arena:temp {Reward:{MobType:5,Difficulty:2}} if predicate arena:drop_chance/title run give @a[tag=Arena.Player,distance=..32] shield{BlockEntityTag:{Base:5,Patterns:[{Color:15,Pattern:"cre"}],id:"minecraft:banner"},Damage:0,display:{Lore:['{"text":"MOB:クリーパー","italic": false}','{"text":"※エンチャントを付与するとクラフトができなくなります！","color": "red","italic": false}'],Name:'{"extra":[{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"color":"gold","text":"アリーナ討伐の称号"}],"text":""}'},RepairCost:40}
execute if data storage arena:temp {Reward:{MobType:6,Difficulty:2}} if predicate arena:drop_chance/title run give @a[tag=Arena.Player,distance=..32] shield{BlockEntityTag:{Base:9,Patterns:[{Color:0,Pattern:"flo"},{Color:14,Pattern:"mc"},{Color:1,Pattern:"tts"},{Color:1,Pattern:"bts"},{Color:9,Pattern:"cbo"},{Color:0,Pattern:"bo"}],id:"minecraft:banner"},Damage:0,display:{Lore:['{"text":"MOB:ガーディアン","italic": false}','{"text":"※エンチャントを付与するとクラフトができなくなります！","color": "red","italic": false}'],Name:'{"extra":[{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"color":"gold","text":"アリーナ討伐の称号"}],"text":""}'},RepairCost:40}

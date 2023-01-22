# クリア通知
# 告知内容の設定
data modify storage arena:temp NoticeDisplay.Difficulty set from entity @s data.Arena.Difficulty
data modify storage arena:temp NoticeDisplay.MobType set from entity @s data.Arena.MobType

# 難易度
execute if data storage arena:temp {NoticeDisplay:{Difficulty:0}} run data modify storage arena:temp NoticeDisplay.Difficulty set value "イージー"
execute if data storage arena:temp {NoticeDisplay:{Difficulty:1}} run data modify storage arena:temp NoticeDisplay.Difficulty set value "ノーマル"
execute if data storage arena:temp {NoticeDisplay:{Difficulty:2}} run data modify storage arena:temp NoticeDisplay.Difficulty set value "ハード"

# モブ種類
execute if data storage arena:temp {NoticeDisplay:{MobType:0}} run data modify storage arena:temp NoticeDisplay.MobType set value "ゾンビ"
execute if data storage arena:temp {NoticeDisplay:{MobType:1}} run data modify storage arena:temp NoticeDisplay.MobType set value "スケルトン"
execute if data storage arena:temp {NoticeDisplay:{MobType:2}} run data modify storage arena:temp NoticeDisplay.MobType set value "ブレイズ"
execute if data storage arena:temp {NoticeDisplay:{MobType:3}} run data modify storage arena:temp NoticeDisplay.MobType set value "スパイダー"
execute if data storage arena:temp {NoticeDisplay:{MobType:4}} run data modify storage arena:temp NoticeDisplay.MobType set value "スライム"
execute if data storage arena:temp {NoticeDisplay:{MobType:5}} run data modify storage arena:temp NoticeDisplay.MobType set value "クリーパー"
execute if data storage arena:temp {NoticeDisplay:{MobType:6}} run data modify storage arena:temp NoticeDisplay.MobType set value "ガーディアン"

# 経過時間計算, 分と秒に変換
execute store result score $StartTime Arena.Temp run data get entity @s data.Arena.StartTime
execute store result score $ElapsedTime:tick Arena.Temp run time query gametime

scoreboard players operation $ElapsedTime:tick Arena.Temp -= $StartTime Arena.Temp
scoreboard players operation $ElapsedTime:tick Arena.Temp /= #20 Constant

scoreboard players operation $ElapsedTime:second Arena.Temp = $ElapsedTime:tick Arena.Temp
scoreboard players operation $ElapsedTime:minute Arena.Temp = $ElapsedTime:tick Arena.Temp

scoreboard players operation $ElapsedTime:second Arena.Temp %= #60 Constant
scoreboard players operation $ElapsedTime:minute Arena.Temp /= #60 Constant

# クリアタイム通知
execute if score $ElapsedTime:second Arena.Temp matches ..9 run tellraw @a[tag=Arena.Player,distance=..32] [{"text":"[","color": "white"},{"text":"Arena","color": "red"},{"text":"] ","color": "white"},{"text":"クリアタイム: ","color": "white","bold": true},{"score":{"name": "$ElapsedTime:minute","objective": "Arena.Temp"},"color": "aqua","bold": true},{"text":"分0","color": "aqua","bold": true},{"score":{"name": "$ElapsedTime:second","objective": "Arena.Temp"},"color": "aqua","bold": true},{"text":"秒","color": "aqua","bold": true}]
execute unless score $ElapsedTime:second Arena.Temp matches ..9 run tellraw @a[tag=Arena.Player,distance=..32] [{"text":"[","color": "white"},{"text":"Arena","color": "red"},{"text":"] ","color": "white"},{"text":"クリアタイム: ","color": "white","bold": true},{"score":{"name": "$ElapsedTime:minute","objective": "Arena.Temp"},"color": "aqua","bold": true},{"text":"分","color": "aqua","bold": true},{"score":{"name": "$ElapsedTime:second","objective": "Arena.Temp"},"color": "aqua","bold": true},{"text":"秒","color": "aqua","bold": true}]

# 難易度別で色分け
execute if data storage arena:temp {NoticeDisplay:{Difficulty:"イージー"}} run tellraw @a[tag=Arena.Notice] [{"storage":"arena:temp","nbt":"NoticeDisplay.Difficulty","color": "aqua","bold": true},{"text":"・","bold": false,"color": "aqua"},{"storage":"arena:temp","nbt":"NoticeDisplay.MobType","color": "aqua","bold": true},{"text":"アリーナ","bold": true,"color": "aqua"},{"text":"を","bold": false,"color": "white"},{"selector":"@a[tag=Arena.Player,distance=..32]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": false,"color": "white"}]
execute if data storage arena:temp {NoticeDisplay:{Difficulty:"ノーマル"}} run tellraw @a[tag=Arena.Notice] [{"storage":"arena:temp","nbt":"NoticeDisplay.Difficulty","color": "green","bold": true},{"text":"・","bold": false,"color": "green"},{"storage":"arena:temp","nbt":"NoticeDisplay.MobType","color": "green","bold": true},{"text":"アリーナ","bold": true,"color": "green"},{"text":"を","bold": false,"color": "white"},{"selector":"@a[tag=Arena.Player,distance=..32]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": false,"color": "white"}]
execute if data storage arena:temp {NoticeDisplay:{Difficulty:"ハード"}} run tellraw @a[tag=Arena.Notice] [{"storage":"arena:temp","nbt":"NoticeDisplay.Difficulty","color": "red","bold": true},{"text":"・","bold": false,"color": "red"},{"storage":"arena:temp","nbt":"NoticeDisplay.MobType","color": "red","bold": true},{"text":"アリーナ","bold": true,"color": "red"},{"text":"を","bold": false,"color": "white"},{"selector":"@a[tag=Arena.Player,distance=..32]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": false,"color": "white"}]

# 実績解除検知
    ## 初クリア
    execute if data storage arena:temp {NoticeDisplay:{Difficulty:"イージー"}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/first_clear/easy
    execute if data storage arena:temp {NoticeDisplay:{Difficulty:"ノーマル"}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/first_clear/normal
    execute if data storage arena:temp {NoticeDisplay:{Difficulty:"ハード"}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/first_clear/hard

    ## 単独クリア
    execute if data entity @s {data:{Arena:{MobType:0,Difficulty:2,Solo:true}}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/solo_clear/zombie
    execute if data entity @s {data:{Arena:{MobType:1,Difficulty:2,Solo:true}}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/solo_clear/skeleton
    execute if data entity @s {data:{Arena:{MobType:2,Difficulty:2,Solo:true}}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/solo_clear/blaze
    execute if data entity @s {data:{Arena:{MobType:3,Difficulty:2,Solo:true}}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/solo_clear/spider
    execute if data entity @s {data:{Arena:{MobType:4,Difficulty:2,Solo:true}}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/solo_clear/slime
    execute if data entity @s {data:{Arena:{MobType:5,Difficulty:2,Solo:true}}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/solo_clear/creeper
    execute if data entity @s {data:{Arena:{MobType:6,Difficulty:2,Solo:true}}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/solo_clear/guardian

# 待機所にtp
execute as @e[tag=Arena.Lobby] if score @s Arena = @e[tag=Arena.Core,sort=nearest,limit=1] Arena run tp @a[tag=Arena.Player,distance=..32] @s 

# リセット
execute as @a[tag=Arena.Player] if score @s Arena = @e[tag=Arena.Core,sort=nearest,limit=1] Arena run tag @s remove Arena.Player
function arena:reset

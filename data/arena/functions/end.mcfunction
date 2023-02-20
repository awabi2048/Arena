# クリア通知
# 告知内容の設定
data modify storage arena:temp NoticeInfo.Difficulty set from entity @s data.Arena.Difficulty
data modify storage arena:temp NoticeInfo.Name set from entity @s data.Arena.MobType

# 難易度
execute if data storage arena:temp {NoticeInfo:{Difficulty:0}} run data modify storage arena:temp NoticeInfo.Difficulty set value "イージー"
execute if data storage arena:temp {NoticeInfo:{Difficulty:1}} run data modify storage arena:temp NoticeInfo.Difficulty set value "ノーマル"
execute if data storage arena:temp {NoticeInfo:{Difficulty:2}} run data modify storage arena:temp NoticeInfo.Difficulty set value "ハード"

# モブ種類
execute if data storage arena:temp {NoticeInfo:{Name:0}} run data modify storage arena:temp NoticeInfo.Name set value "ゾンビ"
execute if data storage arena:temp {NoticeInfo:{Name:1}} run data modify storage arena:temp NoticeInfo.Name set value "スケルトン"
execute if data storage arena:temp {NoticeInfo:{Name:2}} run data modify storage arena:temp NoticeInfo.Name set value "ブレイズ"
execute if data storage arena:temp {NoticeInfo:{Name:3}} run data modify storage arena:temp NoticeInfo.Name set value "スパイダー"
execute if data storage arena:temp {NoticeInfo:{Name:4}} run data modify storage arena:temp NoticeInfo.Name set value "スライム"
execute if data storage arena:temp {NoticeInfo:{Name:5}} run data modify storage arena:temp NoticeInfo.Name set value "クリーパー"
execute if data storage arena:temp {NoticeInfo:{Name:6}} run data modify storage arena:temp NoticeInfo.Name set value "ガーディアン"

# クリアタイム通知
tellraw @a[tag=Arena.Player,distance=..32] [{"translate":"arena.game.message.prefix"},{"translate":"arena.game.message.clear_time","with":[{"nbt":"data.Arena.DisplayTime","entity":"@s","interpret":true,"color": "aqua","bold": true}]}]

# ソロなら記録リストに追加
execute if data entity @s {data:{Arena:{Solo:true}}} if data storage arena:temp {NoticeInfo:{Difficulty:"ハード"}} run function arena:record/add

# 難易度別で色分け
execute if data storage arena:temp {NoticeInfo:{Difficulty:"イージー"}} run tellraw @a[tag=Arena.Notice] [{"translate":"arena.game.message.clear_announce","with":[{"selector":"@a[tag=Arena.Player,distance=..32]","bold": true,"color": "gold"},{"storage":"arena:temp","nbt":"NoticeInfo.Difficulty","color": "green","bold": true},{"storage":"arena:temp","nbt":"NoticeInfo.Name","color": "green","bold": true}]}]
execute if data storage arena:temp {NoticeInfo:{Difficulty:"ノーマル"}} run tellraw @a[tag=Arena.Notice] [{"translate":"arena.game.message.clear_announce","with":[{"selector":"@a[tag=Arena.Player,distance=..32]","bold": true,"color": "gold"},{"storage":"arena:temp","nbt":"NoticeInfo.Difficulty","color": "yellow","bold": true},{"storage":"arena:temp","nbt":"NoticeInfo.Name","color": "yellow","bold": true}]}]
execute if data storage arena:temp {NoticeInfo:{Difficulty:"ハード"}} run tellraw @a[tag=Arena.Notice] [{"translate":"arena.game.message.clear_announce","with":[{"selector":"@a[tag=Arena.Player,distance=..32]","bold": true,"color": "gold"},{"storage":"arena:temp","nbt":"NoticeInfo.Difficulty","color": "red","bold": true},{"storage":"arena:temp","nbt":"NoticeInfo.Name","color": "red","bold": true}]}]

# 実績解除検知
    ## 初クリア
    execute if data storage arena:temp {NoticeInfo:{Difficulty:"イージー"}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/first_clear/easy
    execute if data storage arena:temp {NoticeInfo:{Difficulty:"ノーマル"}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/first_clear/normal
    execute if data storage arena:temp {NoticeInfo:{Difficulty:"ハード"}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/first_clear/hard

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

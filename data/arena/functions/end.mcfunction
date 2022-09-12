# クリア通知
execute if data entity @s {data:{MobType:0,Difficulty:0}} run tellraw @a[tag=Arena.Notice] [{"text":"イージー・ゾンビアリーナ","bold": true,"color": "blue"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]
execute if data entity @s {data:{MobType:0,Difficulty:1}} run tellraw @a[tag=Arena.Notice] [{"text":"ノーマル・ゾンビアリーナ","bold": true,"color": "green"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]
execute if data entity @s {data:{MobType:0,Difficulty:2}} run tellraw @a[tag=Arena.Notice] [{"text":"ハード・ゾンビアリーナ","bold": true,"color": "red"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]

execute if data entity @s {data:{MobType:1,Difficulty:0}} run tellraw @a[tag=Arena.Notice] [{"text":"イージー・スケルトンアリーナ","bold": true,"color": "blue"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]
execute if data entity @s {data:{MobType:1,Difficulty:1}} run tellraw @a[tag=Arena.Notice] [{"text":"ノーマル・スケルトンアリーナ","bold": true,"color": "green"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]
execute if data entity @s {data:{MobType:1,Difficulty:2}} run tellraw @a[tag=Arena.Notice] [{"text":"ハード・スケルトンアリーナ","bold": true,"color": "red"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]

execute if data entity @s {data:{MobType:2,Difficulty:0}} run tellraw @a[tag=Arena.Notice] [{"text":"イージー・ブレイズアリーナ","bold": true,"color": "blue"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]
execute if data entity @s {data:{MobType:2,Difficulty:1}} run tellraw @a[tag=Arena.Notice] [{"text":"ノーマル・ブレイズアリーナ","bold": true,"color": "green"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]
execute if data entity @s {data:{MobType:2,Difficulty:2}} run tellraw @a[tag=Arena.Notice] [{"text":"ハード・ブレイズアリーナ","bold": true,"color": "red"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]

execute if data entity @s {data:{MobType:3,Difficulty:0}} run tellraw @a[tag=Arena.Notice] [{"text":"イージー・スパイダーアリーナ","bold": true,"color": "blue"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]
execute if data entity @s {data:{MobType:3,Difficulty:1}} run tellraw @a[tag=Arena.Notice] [{"text":"ノーマル・スパイダーアリーナ","bold": true,"color": "green"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]
execute if data entity @s {data:{MobType:3,Difficulty:2}} run tellraw @a[tag=Arena.Notice] [{"text":"ハード・スパイダーアリーナ","bold": true,"color": "red"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]

execute if data entity @s {data:{MobType:4,Difficulty:0}} run tellraw @a[tag=Arena.Notice] [{"text":"イージー・スライムアリーナ","bold": true,"color": "blue"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]
execute if data entity @s {data:{MobType:4,Difficulty:1}} run tellraw @a[tag=Arena.Notice] [{"text":"ノーマル・スライムアリーナ","bold": true,"color": "green"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]
execute if data entity @s {data:{MobType:4,Difficulty:2}} run tellraw @a[tag=Arena.Notice] [{"text":"ハード・スライムアリーナ","bold": true,"color": "red"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]

execute if data entity @s {data:{MobType:5,Difficulty:0}} run tellraw @a[tag=Arena.Notice] [{"text":"イージー・クリーパーアリーナ","bold": true,"color": "blue"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]
execute if data entity @s {data:{MobType:5,Difficulty:1}} run tellraw @a[tag=Arena.Notice] [{"text":"ノーマル・クリーパーアリーナ","bold": true,"color": "green"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]
execute if data entity @s {data:{MobType:5,Difficulty:2}} run tellraw @a[tag=Arena.Notice] [{"text":"ハード・クリーパーアリーナ","bold": true,"color": "red"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]

execute if data entity @s {data:{MobType:6,Difficulty:0}} run tellraw @a[tag=Arena.Notice] [{"text":"イージー・ガーディアンアリーナ","bold": true,"color": "blue"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]
execute if data entity @s {data:{MobType:6,Difficulty:1}} run tellraw @a[tag=Arena.Notice] [{"text":"ノーマル・ガーディアンアリーナ","bold": true,"color": "green"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]
execute if data entity @s {data:{MobType:6,Difficulty:2}} run tellraw @a[tag=Arena.Notice] [{"text":"ハード・ガーディアンアリーナ","bold": true,"color": "red"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..16]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]

# 実績解除検知
    ## 初クリア
    execute if data entity @s {data:{Difficulty:0}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/first_clear/easy
    execute if data entity @s {data:{Difficulty:1}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/first_clear/normal
    execute if data entity @s {data:{Difficulty:2}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/first_clear/hard

    ## 単独クリア
    execute store result score $Temp.PlayerCount Arena if entity @a[tag=Arena.Player,distance=..32]

    execute if score $Temp.PlayerCount Arena matches 1 if data entity @s {data:{MobType:0,Difficulty:2}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/solo_clear/zombie
    execute if score $Temp.PlayerCount Arena matches 1 if data entity @s {data:{MobType:1,Difficulty:2}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/solo_clear/skeleton
    execute if score $Temp.PlayerCount Arena matches 1 if data entity @s {data:{MobType:2,Difficulty:2}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/solo_clear/blaze
    execute if score $Temp.PlayerCount Arena matches 1 if data entity @s {data:{MobType:3,Difficulty:2}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/solo_clear/spider
    execute if score $Temp.PlayerCount Arena matches 1 if data entity @s {data:{MobType:4,Difficulty:2}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/solo_clear/slime
    execute if score $Temp.PlayerCount Arena matches 1 if data entity @s {data:{MobType:5,Difficulty:2}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/solo_clear/creeper
    execute if score $Temp.PlayerCount Arena matches 1 if data entity @s {data:{MobType:6,Difficulty:2}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/solo_clear/guardian

# 待機所にtp
execute as @e[tag=Arena.Lobby] if score @s Arena = @e[tag=Arena.Core,sort=nearest,limit=1] Arena run tp @a[tag=Arena.Player,distance=..20] @s 

# リセット
execute as @a[tag=Arena.Player] if score @s Arena = @e[tag=Arena.Core,sort=nearest,limit=1] Arena run tag @s remove Arena.Player
function arena:reset


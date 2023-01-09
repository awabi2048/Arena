# ランキング表示
# 表示をリセット
kill @e[tag=Arena.RankingDisplay-Note]

kill @e[tag=Arena.RankingDisplay-1]
kill @e[tag=Arena.RankingDisplay-2]
kill @e[tag=Arena.RankingDisplay-3]

execute at @e[tag=Arena.RankingCore] run summon armor_stand ~ ~1.85 ~ {Tags:["Arena.RankingDisplay-Note"],Marker:1b,Small:1b,Invisible:1b,CustomName:'{"text":"エンドレスアリーナ","color": "red","bold": true}',CustomNameVisible:true}
execute at @e[tag=Arena.RankingCore] run summon armor_stand ~ ~1.6 ~ {Tags:["Arena.RankingDisplay-Note"],Marker:1b,Small:1b,Invisible:1b,CustomName:'{"text":"最高到達ウェーブランキング","color": "gold","bold": true}',CustomNameVisible:true}

execute at @e[tag=Arena.RankingCore] run summon armor_stand ~ ~1.2 ~ {Tags:["Arena.RankingDisplay-1"],Marker:1b,Small:1b,Invisible:1b,CustomName:'',CustomNameVisible:true}
execute at @e[tag=Arena.RankingCore] run summon armor_stand ~ ~0.75 ~ {Tags:["Arena.RankingDisplay-2"],Marker:1b,Small:1b,Invisible:1b,CustomName:'',CustomNameVisible:true}
execute at @e[tag=Arena.RankingCore] run summon armor_stand ~ ~0.3 ~ {Tags:["Arena.RankingDisplay-3"],Marker:1b,Small:1b,Invisible:1b,CustomName:'',CustomNameVisible:true}

# 最高到達ウェーブをソート
execute as @a if score @s Arena.MaxStageReached matches 1.. run scoreboard players operation @s Arena.Temp = @s Arena.MaxStageReached

scoreboard players operation $Rank1st Arena.Temp > @a Arena.Temp
execute as @a if score @s Arena.Temp = $Rank1st Arena.Temp run scoreboard players reset @s Arena.Temp

scoreboard players operation $Rank2nd Arena.Temp > @a Arena.Temp
execute as @a if score @s Arena.Temp = $Rank2nd Arena.Temp run scoreboard players reset @s Arena.Temp

scoreboard players operation $Rank3rd Arena.Temp > @a Arena.Temp
execute as @a if score @s Arena.Temp = $Rank3rd Arena.Temp run scoreboard players reset @s Arena.Temp

scoreboard players reset @a Arena.Temp

# 表示データを作成
    # 1st
    scoreboard players set $Rank Arena.Temp 1
    execute as @a if score @s Arena.MaxStageReached = $Rank1st Arena.Temp run tag @s add Arena.Temp.Ranked

    setblock 0 -64 0 oak_sign{Text1:'[{"text":"1位 ","color": "white","bold": true},{"selector":"@a[tag=Arena.Temp.Ranked]","color": "yellow","bold": true},{"text": " (Wave ","color": "aqua","bold": true},{"score":{"name": "$Rank1st","objective": "Arena.Temp"},"color": "aqua","bold": true},{"text": ")","color": "aqua","bold": true}]'} replace
    execute in minecraft:overworld run data modify entity @e[tag=Arena.RankingDisplay-1,limit=1] CustomName set from block 0 -64 0 Text1

    execute unless score $Rank1st Arena.Temp matches 1.. run kill @e[tag=Arena.RankingDisplay-1]

    setblock 0 -64 0 bedrock
    tag @a[tag=Arena.Temp.Ranked] remove Arena.Temp.Ranked

    # 2nd
    scoreboard players set $Rank Arena.Temp 2
    execute as @a if score @s Arena.MaxStageReached = $Rank2nd Arena.Temp run tag @s add Arena.Temp.Ranked

    setblock 0 -64 0 oak_sign{Text1:'[{"text":"2位 ","color": "white","bold": true},{"selector":"@a[tag=Arena.Temp.Ranked]","color": "yellow","bold": true},{"text": " (Wave ","color": "aqua","bold": true},{"score":{"name": "$Rank2nd","objective": "Arena.Temp"},"color": "aqua","bold": true},{"text": ")","color": "aqua","bold": true}]'} replace
    execute in minecraft:overworld run data modify entity @e[tag=Arena.RankingDisplay-2,limit=1] CustomName set from block 0 -64 0 Text1

    execute unless score $Rank2nd Arena.Temp matches 1.. run kill @e[tag=Arena.RankingDisplay-2]

    setblock 0 -64 0 bedrock
    tag @a[tag=Arena.Temp.Ranked] remove Arena.Temp.Ranked

    # 3rd
    scoreboard players set $Rank Arena.Temp 3
    execute as @a if score @s Arena.MaxStageReached = $Rank3rd Arena.Temp run tag @s add Arena.Temp.Ranked

    setblock 0 -64 0 oak_sign{Text1:'[{"text":"3位 ","color": "white","bold": true},{"selector":"@a[tag=Arena.Temp.Ranked]","color": "yellow","bold": true},{"text": " (Wave ","color": "aqua","bold": true},{"score":{"name": "$Rank3rd","objective": "Arena.Temp"},"color": "aqua","bold": true},{"text": ")","color": "aqua","bold": true}]'} replace
    execute in minecraft:overworld run data modify entity @e[tag=Arena.RankingDisplay-3,limit=1] CustomName set from block 0 -64 0 Text1

    execute unless score $Rank3rd Arena.Temp matches 1.. run kill @e[tag=Arena.RankingDisplay-3]

    setblock 0 -64 0 bedrock
    tag @a[tag=Arena.Temp.Ranked] remove Arena.Temp.Ranked




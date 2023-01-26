# ランキング表示
# 最高到達ウェーブをソート
    # 1st
    execute as @a if score @s Arena.MaxStageReached matches 1.. run scoreboard players operation @s Arena.Temp = @s Arena.MaxStageReached

    scoreboard players operation $Rank1st Arena.Temp > @a Arena.Temp
    execute as @a if score @s Arena.Temp = $Rank1st Arena.Temp run scoreboard players reset @s Arena.Temp

    # 2nd
    scoreboard players operation $Rank2nd Arena.Temp > @a Arena.Temp
    execute as @a if score @s Arena.Temp = $Rank2nd Arena.Temp run scoreboard players reset @s Arena.Temp

    # 3rd
    scoreboard players operation $Rank3rd Arena.Temp > @a Arena.Temp
    execute as @a if score @s Arena.Temp = $Rank3rd Arena.Temp run scoreboard players reset @s Arena.Temp

    # リセット
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


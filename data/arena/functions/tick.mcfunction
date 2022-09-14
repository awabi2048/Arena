# モブの情報変更時
execute as @a[tag=Arena.DisplayMobInfo] if score $DisplayMobInfo Arena matches 0.. run function arena:mob_data/detail

# スライム分裂時にタグ
tag @e[type=slime,tag=!Arena.Mob] add Arena.Mob

# エンドレス
execute as @e[tag=Arena.Core] if score @s Arena matches -1 at @s run function arena:endless/boss/tick
execute as @e[tag=Arena.Core] if score @s Arena matches 1.. unless data entity @s {data:{Arena:{StageType:Normal}}} run data modify entity @s data.Arena.StageType set value "Normal"

# 会場から離れたプレイヤーのタグ除去, スコアリセット
execute at @e[tag=Arena.Core] as @a[tag=Arena.Player] if score @s Arena = @e[tag=Arena.Core,sort=nearest,limit=1] Arena unless score @s Arena matches 0 run tag @s[distance=32..] remove Arena.Player
execute as @a[tag=!Arena.Player] run scoreboard players set @s Arena 0

# デバッグ用 
execute as @a[tag=Arena.Debug] at @s run title @s actionbar ["MT: ",{"nbt":"data.Arena.MobType","entity": "@e[tag=Arena.Core,sort=nearest,limit=1]"}," WV: ",{"nbt":"data.Arena.Wave","entity": "@e[tag=Arena.Core,sort=nearest,limit=1]"}," DF: ",{"nbt":"data.Arena.Difficulty","entity": "@e[tag=Arena.Core,sort=nearest,limit=1]"}," T: ",{"score":{"name": "$Boss.SkillInterval","objective": "Arena"}},", ",{"score":{"name": "$Boss.SkillTimer","objective": "Arena"}}," S: ",{"score":{"name": "$Boss.Skill","objective": "Arena"}}]

# モブの情報変更時
execute as @a[tag=Arena.DisplayMobInfo] if score $DisplayMobInfo Arena matches 0.. run function arena:mob_data/detail

# プレイヤー数が変化した場合に
execute at @a[tag=Arena.Player] as @e[tag=Arena.Core,distance=..32] if data entity @s {data:{Arena:{Solo:true}}} if entity @a[tag=!Arena.Player,distance=..32] run data modify entity @s data.Arena.Solo set value false

# スライム分裂時にタグ
tag @e[type=slime,tag=!Arena.Mob] add Arena.Mob

# 看板クールダウン設定用
execute as @e[tag=Arena.Timer] if data entity @s {PortalCooldown:0} run kill @s

# エンドレス
#execute as @e[tag=Arena.Core] if score @s Arena matches -1 at @s run function arena:endless/boss/tick
execute as @e[tag=Arena.Core] if score @s Arena matches 99 at @s run function arena_beta:extra/boss/tick

#execute as @e[tag=Arena.Core] if score @s Arena matches 1.. unless data entity @s {data:{Arena:{StageType:Normal}}} unless data entity @s {data:{Arena:{StageType:BetaExtra}}} run data modify entity @s data.Arena.StageType set value "Normal"

# 会場から離れたプレイヤーのタグ除去, スコアリセット
execute at @e[tag=Arena.Core] as @a[tag=Arena.Player] if score @s Arena = @e[tag=Arena.Core,sort=nearest,limit=1] Arena unless score @s Arena matches 0 run tag @s[distance=32..] remove Arena.Player
execute as @a[tag=!Arena.Player] run scoreboard players set @s Arena 0

# デバッグ用
## 情報表示
execute as @a[tag=Arena.Debug] at @s run title @s actionbar ["MT: ",{"nbt":"data.Arena.MobType","entity": "@e[tag=Arena.Core,sort=nearest,limit=1]"}," WV: ",{"nbt":"data.Arena.Wave","entity": "@e[tag=Arena.Core,sort=nearest,limit=1]"}," DF: ",{"nbt":"data.Arena.Difficulty","entity": "@e[tag=Arena.Core,sort=nearest,limit=1]"}," T: ",{"score":{"name": "$Boss.SkillInterval","objective": "Arena"}},", ",{"score":{"name": "$Boss.SkillTimer","objective": "Arena"}}]

## デバッグツール
execute at @a[tag=Arena.Debug] as @e[type=potion,distance=..2.5] if data entity @s {Item:{tag:{Arena:{Item:DebugTool}}}} as @p[tag=Arena.Debug] run function arena:debug/tool/used_general

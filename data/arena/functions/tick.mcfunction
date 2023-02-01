# モブの情報変更時
execute as @a[tag=Arena.DisplayMobInfo] if score $DisplayMobInfo Arena matches 0.. run function arena:mob_data/detail

# プレイヤー数が変化した場合に
execute at @a[tag=Arena.Player] as @e[tag=Arena.Core,distance=..32] at @s if data entity @s {data:{Arena:{Solo:true}}} as @a[distance=..32] unless score @s Arena = @e[tag=Arena.Core,sort=nearest,limit=1] Arena run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Solo set value false

# スライム分裂時にタグ
execute at @e[tag=Arena.Core] as @e[type=slime,distance=..32,tag=!Arena.Mob] run tag @s add Arena.Mob

# 看板クールダウン設定用
execute as @e[tag=Arena.Timer] if data entity @s {PortalCooldown:0} run kill @s

# 会場から離れたプレイヤーのタグ除去, スコアリセット
execute at @e[tag=Arena.Core] as @a[tag=Arena.Player] if score @s Arena = @e[tag=Arena.Core,sort=nearest,limit=1] Arena unless score @s Arena matches 0 run tag @s[distance=32..] remove Arena.Player
execute as @a[tag=!Arena.Player] run scoreboard players set @s Arena 0

# デバッグ用
## 情報表示
execute as @a[tag=Arena.Debug] at @s run title @s actionbar ["MT: ",{"nbt":"data.Arena.MobType","entity": "@e[tag=Arena.Core,sort=nearest,limit=1]"}," WV: ",{"nbt":"data.Arena.Wave","entity": "@e[tag=Arena.Core,sort=nearest,limit=1]"}," DF: ",{"nbt":"data.Arena.Difficulty","entity": "@e[tag=Arena.Core,sort=nearest,limit=1]"},"Skill: ",{"nbt":"Animation.Name","storage": "arena-boss:"}]

## デバッグツール
execute at @a[tag=Arena.Debug] as @e[type=potion,distance=..2.5] if data entity @s {Item:{tag:{Arena:{Item:DebugTool}}}} as @p[tag=Arena.Debug] run function arena:debug/tool/used_general

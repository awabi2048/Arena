# 入場中のプレイヤーが倒されたらタグ除去
tag @s remove Arena.Player
advancement revoke @s only arena:player_killed

# 実績解除処理
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless,Wave:-1}}} run advancement grant @s only arena:display/endless/young_challenger

# エンドレス: 死んだ者からデータをマーカーに一時的に保管
tag @s add Arena.DeadPlayer

# 記録作成
    # 現在のウェーブを記録
    execute as @e[tag=Arena.Core] if score @s Arena = @p[tag=Arena.DeadPlayer] Arena store result storage arena:temp DeadPlayerData.weight int 1 run data get entity @s data.Arena.Wave -1

    # Name取得
    execute in minecraft:overworld run setblock 0 -64 0 chest
    execute as @p[tag=Arena.DeadPlayer] in minecraft:overworld run loot replace block 0 -64 0 container.0 loot arena:misc/player_head

    execute in minecraft:overworld run data modify storage arena:temp DeadPlayerData.Name set from block 0 -64 0 Items[0].tag.SkullOwner.Name
    execute in minecraft:overworld run setblock 0 -64 0 bedrock

    # DisplayData作成
    execute in minecraft:overworld run setblock 0 -64 0 bedrock
    execute in minecraft:overworld run setblock 0 -64 0 oak_sign{Text1:'[{"text":"Wave "},{"nbt":"DeadPlayerData.weight","storage":"arena:temp"}]'}
    execute in minecraft:overworld run data modify storage arena:temp DeadPlayerData.DisplayData set from block 0 -64 0 Text1

    execute in minecraft:overworld run setblock 0 -64 0 bedrock

    # Type設定
    data modify storage arena:temp DeadPlayerData.Type set value "エンドレス"

    # タイムスタンプ
    execute store result storage arena:temp DeadPlayerData.TimeStamp int 1 run time query gametime

# マーカーにデータappend
execute as @e[tag=Arena.Core] if score @s Arena = @p[tag=Arena.DeadPlayer] Arena run data modify entity @s data.Arena.DeadPlayerData append from storage arena:temp DeadPlayerData

# 該当アリーナにもう誰もいなければデータマージ処理 & ランキング更新
execute as @e[tag=Arena.Core] if score @s Arena = @p[tag=Arena.DeadPlayer] Arena at @s unless entity @a[tag=Arena.Player,distance=..32] run function arena:record/add_endless


tag @s remove Arena.DeadPlayer

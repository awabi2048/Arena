## 入場時
# トリガー解除
advancement revoke @s only arena-boss:stage_entering/confirm

data modify storage arena:temp Enterable set value true

# 食らったダメージを打ち消し
data modify entity @e[tag=ArenaBoss.StageSelector.Confirm,limit=1] Health set value 1024.0f

# 演出
playsound ui.button.click master @a ~ ~ ~ 1 1

# 入場拒否
    # 人数判定
    execute at @e[tag=ArenaBoss.Entrance,sort=nearest,limit=1] store result score $PlayerCount ArenaBoss.Temp if entity @a[distance=..3.5]
    execute store result score $MaxPlayerCount ArenaBoss.Temp run data get entity @e[tag=ArenaBoss.StageSelector.Core,limit=1] data.Arena.StageInfo.MaxPlayerCount

    execute if score $PlayerCount ArenaBoss.Temp > $MaxPlayerCount ArenaBoss.Temp run data modify storage arena:temp Enterable set value false
    
    execute if data storage arena:temp {Enterable:false} at @e[tag=ArenaBoss.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..3.5] [{"translate":"arena.game.message.prefix"},{"translate":"arena.game.message.error.too_many_players","with":["5"]}]
    execute if data storage arena:temp {Enterable:false} at @e[tag=ArenaBoss.Entrance,sort=nearest,limit=1] run playsound entity.experience_orb.pickup master @a ~ ~ ~ 1 0.5
    execute if data storage arena:temp {Enterable:false} run function arena:stop_process

    # AP足りるか判定
    execute store result score $TicketRequired ArenaBoss.Temp run data get entity @e[tag=ArenaBoss.StageSelector.Core,limit=1] data.Arena.StageInfo.TicketRequired
    execute at @e[tag=ArenaBoss.Entrance,sort=nearest,limit=1] as @a[tag=ArenaBoss.Entrance,distance=..3.5] unless score @s arena >= $TicketRequired ArenaBoss.Temp run data modify storage arena:temp Enterable set value false

    execute if data storage arena:temp {Enterable:false} at @e[tag=ArenaBoss.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..3.5] [{"translate":"arena.game.message.prefix"},{"translate":"arena.game.message.error.not_enough_arena_point"}]
    execute if data storage arena:temp {Enterable:false} at @e[tag=ArenaBoss.Entrance,sort=nearest,limit=1] run playsound entity.experience_orb.pickup master @a ~ ~ ~ 1 0.5
    execute if data storage arena:temp {Enterable:false} run function arena:stop_process

    # 既に入場者がいないか判定
    execute if data storage arena-boss: {Status:{IsPlaying:true}} run data modify storage arena:temp Enterable set value false

    execute if data storage arena:temp {Enterable:false} at @e[tag=ArenaBoss.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..3.5] [{"translate":"arena.game.message.prefix"},{"translate":"arena.game.message.error.someone_already_playing"}]
    execute if data storage arena:temp {Enterable:false} at @e[tag=ArenaBoss.Entrance,sort=nearest,limit=1] run playsound entity.experience_orb.pickup master @a ~ ~ ~ 1 0.5
    execute if data storage arena:temp {Enterable:false} run function arena:stop_process

## 問題なければ入場処理
# 入場ステージの情報を保存
data modify storage arena-boss: Status.ActiveStageInfo set from storage arena:temp Boss.StageInfo[0]

# 入場ステージの番号を取得
execute store result score $StageID ArenaBoss run data get storage arena-boss: Status.ActiveStageInfo.StageID

# フラグを設定
data modify storage arena-boss: Status.IsPlaying set value true

# ステージ番号・タグをプレイヤーに設定
scoreboard players add $StageID ArenaBoss 100

execute at @e[tag=ArenaBoss.Entrance,sort=nearest,limit=1] run scoreboard players operation @a[distance=..3.5] Arena = $StageID ArenaBoss
execute at @e[tag=ArenaBoss.Entrance,sort=nearest,limit=1] run tag @a[distance=..3.5] add Arena.Player

# APを減算
execute at @e[tag=ArenaBoss.Entrance,sort=nearest,limit=1] run scoreboard players operation @a[distance=..3.5] arena -= $TicketRequired ArenaBoss.Temp

# 通知
execute at @e[tag=ArenaBoss.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..3.5] [{"translate":"arena.game.message.prefix"},{"translate":"arena.boss.game.message.start_announce","with":[{"text":"40","color": "gold","bold": true,"underlined": true}]}]

scoreboard players set $StartTimer ArenaBoss 40
scoreboard players operation $StartTimer ArenaBoss *= #20 Constant

# tp, リセット処理諸々
execute as @e[tag=Arena.Core] if score @s Arena = $StageID ArenaBoss at @e[tag=ArenaBoss.Entrance,sort=nearest,limit=1] run tp @a[distance=..3.5] @s

execute as @e[tag=Arena.Core] if score @s Arena = $StageID ArenaBoss at @s run playsound block.enchantment_table.use master @a ~ ~ ~ 1 0.5
execute as @e[tag=Arena.Core] if score @s Arena = $StageID ArenaBoss at @s run playsound entity.illusioner.mirror_move master @a ~ ~ ~ 1 0.75

execute as @e[tag=Arena.Core] if score @s Arena = $StageID ArenaBoss at @e[tag=ArenaBoss.Entrance,sort=nearest,limit=1] run function arena-boss:core/reset


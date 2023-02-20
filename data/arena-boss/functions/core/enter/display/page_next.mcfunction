# ページ送り処理
# トリガー解除
advancement revoke @s only arena-boss:stage_entering/page_next

# ページ数の変更
execute store result score $Page ArenaBoss.Temp run data get entity @e[tag=ArenaBoss.StageSelector.Core,limit=1] data.Arena.Page
scoreboard players add $Page ArenaBoss.Temp 1

execute store result score $StageCount ArenaBoss.Temp run data get storage arena:core Boss.StageInfo
scoreboard players remove $StageCount ArenaBoss.Temp 1

execute if score $Page ArenaBoss.Temp > $StageCount ArenaBoss.Temp run scoreboard players set $Page ArenaBoss.Temp 0

execute store result entity @e[tag=ArenaBoss.StageSelector.Core,limit=1] data.Arena.Page int 1 run scoreboard players get $Page ArenaBoss.Temp

# 表示内容更新
data modify storage arena:temp Boss.StageInfo append from storage arena:temp Boss.StageInfo[0]
data remove storage arena:temp Boss.StageInfo[0]

function arena-boss:core/enter/display/update

# 演出
playsound ui.button.click master @a ~ ~ ~ 1 1

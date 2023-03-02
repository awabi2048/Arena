# ページ戻り処理
# トリガー解除
advancement revoke @s only arena-boss:stage_entering/page_prev

# ページ数の変更
execute store result score $Page ArenaBoss.Temp run data get entity @e[tag=ArenaBoss.StageSelector.Core,limit=1] data.Arena.Page
scoreboard players remove $Page ArenaBoss.Temp 1

execute store result score $StageCount ArenaBoss.Temp run data get storage arena:core Boss.StageInfo
scoreboard players remove $StageCount ArenaBoss.Temp 1

execute if score $Page ArenaBoss.Temp matches -1 run scoreboard players operation $Page ArenaBoss.Temp = $StageCount ArenaBoss.Temp

execute store result entity @e[tag=ArenaBoss.StageSelector.Core,limit=1] data.Arena.Page int 1 run scoreboard players get $Page ArenaBoss.Temp

# 食らったダメージを打ち消し
data modify entity @e[tag=ArenaBoss.StageSelector.PagePrev,limit=1] Health set value 1024.0f

# 表示内容更新
data modify storage arena:temp Boss.StageInfo prepend from storage arena:temp Boss.StageInfo[-1]
data remove storage arena:temp Boss.StageInfo[-1]

function arena-boss:core/enter/display/update

# 演出
playsound ui.button.click master @a ~ ~ ~ 1 1

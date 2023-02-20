## ページ更新時処理 (戻る)
# トリガー解除
advancement revoke @s only arena:misc/ranking_display/page_next

# ページ変更
execute store result score $DisplayPage Arena.Temp run data get entity @e[tag=Arena.RankingDisplay.Core,limit=1] data.Arena.RankingDisplay.Page
scoreboard players add $DisplayPage Arena.Temp 1

execute if score $DisplayPage Arena.Temp matches 8 run scoreboard players set $DisplayPage Arena.Temp 0
execute store result entity @e[tag=Arena.RankingDisplay.Core,limit=1] data.Arena.RankingDisplay.Page int 1 run scoreboard players get $DisplayPage Arena.Temp

# 演出
playsound ui.button.click master @a ~ ~ ~ 1 1

# 表示更新
execute as @e[tag=Arena.RankingDisplay.Core,sort=nearest,limit=1] at @s run function arena:record/display/reflesh

# スライム回復
data modify entity @e[tag=Arena.RankingDisplay.PageNext,limit=1] Health set value 1024.0f

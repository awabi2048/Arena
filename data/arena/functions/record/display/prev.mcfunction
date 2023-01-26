## ページ更新時処理 (戻る)
# トリガー解除
advancement revoke @s only arena:misc/page_prev

# ページを取得
execute store result score $DisplayPage Arena.Temp run data get entity @e[tag=Arena.RankingDisplay.Core,limit=1] data.Arena.RankingDisplay.Page
scoreboard players remove $DisplayPage Arena.Temp 1

execute if score $DisplayPage Arena.Temp matches -1 run scoreboard players set $DisplayPage Arena.Temp 7

# 演出
playsound ui.button.click master @a ~ ~ ~ 1 1
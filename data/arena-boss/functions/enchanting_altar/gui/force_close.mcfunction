# 強制的にGUI閉ざす
execute at @e[tag=Arena.Temp] run tp @e[tag=Arena.CloseGUI] ~ ~ ~ ~ ~

kill @e[tag=Arena.Temp]

tag @a[tag=Arena.CloseGUI] remove Arena.CloseGUI

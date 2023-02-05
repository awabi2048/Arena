# 強制的にGUI閉ざす
execute as @e[tag=Arena.CloseGUI] at @s run tp @s ~ ~-100 ~

tag @a[tag=Arena.CloseGUI] remove Arena.CloseGUI

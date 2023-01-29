# 経過時間計算, 分と秒、小数に変換
scoreboard players operation $Time:second Arena.Temp = $Time:tick Arena.Temp
scoreboard players operation $Time:decimal Arena.Temp = $Time:tick Arena.Temp

# 小数部分
scoreboard players operation $Time:decimal Arena.Temp %= #20 Constant
scoreboard players operation $Time:decimal Arena.Temp *= #5 Constant

# 秒・分
scoreboard players operation $Time:second Arena.Temp /= #20 Constant

scoreboard players operation $Time:minute Arena.Temp = $Time:second Arena.Temp

scoreboard players operation $Time:second Arena.Temp %= #60 Constant
scoreboard players operation $Time:minute Arena.Temp /= #60 Constant

# 表示時に0パディングできるように
data modify storage arena:temp TimeDisplay.Separator set value ["", ":", "."]

execute if score $Time:minute Arena.Temp matches ..9 run data modify storage arena:temp TimeDisplay.Separator[0] set value "0"
execute if score $Time:second Arena.Temp matches ..9 run data modify storage arena:temp TimeDisplay.Separator[1] set value ":0"
execute if score $Time:decimal Arena.Temp matches ..9 run data modify storage arena:temp TimeDisplay.Separator[2] set value ".0"

# データをひとまとまりに
execute in minecraft:overworld run setblock 0 -64 0 bedrock
execute in minecraft:overworld run setblock 0 -64 0 oak_sign{Text1:'[{"nbt":"TimeDisplay.Separator[0]","storage": "arena:temp"},{"score":{"name": "$Time:minute","objective": "Arena.Temp"}},{"nbt":"TimeDisplay.Separator[1]","storage": "arena:temp"},{"score":{"name": "$Time:second","objective": "Arena.Temp"}},{"nbt":"TimeDisplay.Separator[2]","storage": "arena:temp"},{"score":{"name": "$Time:decimal","objective": "Arena.Temp"}}]'}
execute in minecraft:overworld run data modify storage arena:temp TimeDisplay.Combined set from block 0 -64 0 Text1

execute in minecraft:overworld run setblock 0 -64 0 bedrock


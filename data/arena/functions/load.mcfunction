scoreboard objectives add arena dummy
scoreboard objectives add Arena dummy
scoreboard objectives add Arena.Temp dummy
scoreboard objectives add Arena.MaxStageReached dummy

execute unless data storage arena: Core run function arena:setup/mob_attributes

# 定数設定
scoreboard players set #-1 Arena -1
scoreboard players set #2 Arena 2
scoreboard players set #4 Arena 4
scoreboard players set #5 Arena 5
scoreboard players set #6 Arena 6

scoreboard players set #9 Arena 9
scoreboard players set #16 Arena 16

scoreboard players set #10 Arena 10
scoreboard players set #20 Arena 20

scoreboard players set #40 Arena 40

scoreboard players set #50 Arena 50

scoreboard players set #29 Arena 29

scoreboard players set #99 Arena 99
scoreboard players set #100 Arena 100

scoreboard players set #127 Arena 127

scoreboard players set #360 Arena 360

# ランキングの更新
function arena:endless/reflesh_ranking

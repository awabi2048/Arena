scoreboard objectives add arena dummy
scoreboard objectives add Arena dummy
scoreboard objectives add Arena.MaxStageReached dummy {"text":"| 最高到達ウェーブ |","bold":true}

execute unless data storage arena: Core run function arena:setup/mob_attributes

# 定数設定
scoreboard players set #-1 Arena -1
scoreboard players set #2 Arena 2
scoreboard players set #4 Arena 4
scoreboard players set #6 Arena 6

scoreboard players set #9 Arena 9
scoreboard players set #16 Arena 16

scoreboard players set #10 Arena 10
scoreboard players set #20 Arena 20

scoreboard players set #40 Arena 40

scoreboard players set #50 Arena 50
scoreboard players set #100 Arena 100

tag @s add Arena.DisplayMobInfo

tellraw @s [{"text":"[通常ArenaのMob情報について設定できます]","color":"light_purple"}]
tellraw @s ["- ",{"text":"Zombie","color": "green","clickEvent": {"action":"run_command","value": "/scoreboard players set $DisplayMobInfo Arena 0"},"hoverEvent": {"action": "show_text","contents": "クリックして詳細情報を表示"}}]
tellraw @s ["- ",{"text":"Skeleton","color": "green","clickEvent": {"action":"run_command","value": "/scoreboard players set $DisplayMobInfo Arena 1"},"hoverEvent": {"action": "show_text","contents": "クリックして詳細情報を表示"}}]
tellraw @s ["- ",{"text":"Blaze","color": "green","clickEvent": {"action":"run_command","value": "/scoreboard players set $DisplayMobInfo Arena 2"},"hoverEvent": {"action": "show_text","contents": "クリックして詳細情報を表示"}}]
tellraw @s ["- ",{"text":"Spider","color": "green","clickEvent": {"action":"run_command","value": "/scoreboard players set $DisplayMobInfo Arena 3"},"hoverEvent": {"action": "show_text","contents": "クリックして詳細情報を表示"}}]
tellraw @s ["- ",{"text":"Slime","color": "green","clickEvent": {"action":"run_command","value": "/scoreboard players set $DisplayMobInfo Arena 4"},"hoverEvent": {"action": "show_text","contents": "クリックして詳細情報を表示"}}]
tellraw @s ["- ",{"text":"Creeper","color": "green","clickEvent": {"action":"run_command","value": "/scoreboard players set $DisplayMobInfo Arena 5"},"hoverEvent": {"action": "show_text","contents": "クリックして詳細情報を表示"}}]
tellraw @s ["- ",{"text":"Guardian","color": "green","clickEvent": {"action":"run_command","value": "/scoreboard players set $DisplayMobInfo Arena 6"},"hoverEvent": {"action": "show_text","contents": "クリックして詳細情報を表示"}}]

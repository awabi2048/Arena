# モブごとに詳細情報表示
tellraw @s [{"text":"[","color": "white"},{"text":"Arena","color": "red"},{"text":"] ","color": "white"},{"text":"以下の値は現在の設定値です","color":"light_purple","italic":false}]

    # Zombie
    execute if score $DisplayMobInfo Arena matches 0 run tellraw @s ["- ",{"text":"体力: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Zombie.Health","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Zombie.Health set value [15, 20, 25, 30, 35]"}}]
    execute if score $DisplayMobInfo Arena matches 0 run tellraw @s ["- ",{"text":"攻撃力: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Zombie.AttackDamage","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Zombie.AttackDamage set value [3, 4, 4, 5, 5]"}}]
    execute if score $DisplayMobInfo Arena matches 0 run tellraw @s ["- ",{"text":"移動速度: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Zombie.Speed","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Zombie.Speed set value [0.2, 0.225, 0.25, 0.275, 0.3]"}}]
    execute if score $DisplayMobInfo Arena matches 0 run tellraw @s ["- ",{"text":"召喚数: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Zombie.SummonCount","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Zombie.SummonCount set value [12, 16, 20, 24, 32]"}}]

    # Skeleton
    execute if score $DisplayMobInfo Arena matches 1 run tellraw @s ["- ",{"text":"体力: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Skeleton.Health","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Skeleton.Health set value [15, 20, 25, 30, 35]"}}]
    execute if score $DisplayMobInfo Arena matches 1 run tellraw @s ["- ",{"text":"攻撃力: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Skeleton.AttackDamage","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Skeleton.AttackDamage set value [3, 4, 4, 5, 5]"}}]
    execute if score $DisplayMobInfo Arena matches 1 run tellraw @s ["- ",{"text":"移動速度: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Skeleton.Speed","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Skeleton.Speed set value [0.2, 0.225, 0.25, 0.275, 0.3]"}}]
    execute if score $DisplayMobInfo Arena matches 1 run tellraw @s ["- ",{"text":"召喚数: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Skeleton.SummonCount","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Skeleton.SummonCount set value [12, 16, 20, 24, 32]"}}]

    # Blaze
    execute if score $DisplayMobInfo Arena matches 2 run tellraw @s ["- ",{"text":"体力: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Blaze.Health","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Blaze.Health set value [15, 20, 25, 30, 35]"}}]
    execute if score $DisplayMobInfo Arena matches 2 run tellraw @s ["- ",{"text":"攻撃力: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Blaze.AttackDamage","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Blaze.AttackDamage set value [3, 4, 4, 5, 5]"}}]
    execute if score $DisplayMobInfo Arena matches 2 run tellraw @s ["- ",{"text":"移動速度: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Blaze.Speed","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Blaze.Speed set value [0.2, 0.225, 0.25, 0.275, 0.3]"}}]
    execute if score $DisplayMobInfo Arena matches 2 run tellraw @s ["- ",{"text":"召喚数: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Blaze.SummonCount","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Blaze.SummonCount set value [12, 16, 20, 24, 32]"}}]

    # Slime
    execute if score $DisplayMobInfo Arena matches 3 run tellraw @s ["- ",{"text":"体力: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Slime.Health","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Slime.Health set value [15, 20, 25, 30, 35]"}}]
    execute if score $DisplayMobInfo Arena matches 3 run tellraw @s ["- ",{"text":"攻撃力: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Slime.AttackDamage","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Slime.AttackDamage set value [3, 4, 4, 5, 5]"}}]
    execute if score $DisplayMobInfo Arena matches 3 run tellraw @s ["- ",{"text":"移動速度: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Slime.Speed","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Slime.Speed set value [0.2, 0.225, 0.25, 0.275, 0.3]"}}]
    execute if score $DisplayMobInfo Arena matches 3 run tellraw @s ["- ",{"text":"召喚数: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Slime.SummonCount","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Slime.SummonCount set value [12, 16, 20, 24, 32]"}}]
    
    # Spider
    execute if score $DisplayMobInfo Arena matches 4 run tellraw @s ["- ",{"text":"体力: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Slime.Health","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Slime.Health set value [15, 20, 25, 30, 35]"}}]
    execute if score $DisplayMobInfo Arena matches 4 run tellraw @s ["- ",{"text":"攻撃力: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Slime.AttackDamage","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Slime.AttackDamage set value [3, 4, 4, 5, 5]"}}]
    execute if score $DisplayMobInfo Arena matches 4 run tellraw @s ["- ",{"text":"移動速度: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Slime.Speed","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Slime.Speed set value [0.2, 0.225, 0.25, 0.275, 0.3]"}}]
    execute if score $DisplayMobInfo Arena matches 4 run tellraw @s ["- ",{"text":"召喚数: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Slime.SummonCount","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Slime.SummonCount set value [12, 16, 20, 24, 32]"}}]

    # Creeper
    execute if score $DisplayMobInfo Arena matches 5 run tellraw @s ["- ",{"text":"体力: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Creeper.Health","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Creeper.Health set value [15, 20, 25, 30, 35]"}}]
    execute if score $DisplayMobInfo Arena matches 5 run tellraw @s ["- ",{"text":"攻撃力: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Creeper.AttackDamage","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Creeper.AttackDamage set value [3, 4, 4, 5, 5]"}}]
    execute if score $DisplayMobInfo Arena matches 5 run tellraw @s ["- ",{"text":"移動速度: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Creeper.Speed","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Creeper.Speed set value [0.2, 0.225, 0.25, 0.275, 0.3]"}}]
    execute if score $DisplayMobInfo Arena matches 5 run tellraw @s ["- ",{"text":"召喚数: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Creeper.SummonCount","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Creeper.SummonCount set value [12, 16, 20, 24, 32]"}}]

    # Guardian
    execute if score $DisplayMobInfo Arena matches 6 run tellraw @s ["- ",{"text":"体力: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Guardian.Health","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Guardian.Health set value [15, 20, 25, 30, 35]"}}]
    execute if score $DisplayMobInfo Arena matches 6 run tellraw @s ["- ",{"text":"攻撃力: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Guardian.AttackDamage","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Guardian.AttackDamage set value [3, 4, 4, 5, 5]"}}]
    execute if score $DisplayMobInfo Arena matches 6 run tellraw @s ["- ",{"text":"移動速度: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Guardian.Speed","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Guardian.Speed set value [0.2, 0.225, 0.25, 0.275, 0.3]"}}]
    execute if score $DisplayMobInfo Arena matches 6 run tellraw @s ["- ",{"text":"召喚数: ","italic": false,"color": "gold"},{"storage":"arena:","nbt":"Core.MobInfo.Guardian.SummonCount","hoverEvent": {"action":"show_text","contents": "クリックして編集"},"clickEvent": {"action":"suggest_command","value": "/data modify storage arena:core MobInfo.Guardian.SummonCount set value [12, 16, 20, 24, 32]"}}]

tag @s remove Arena.DisplayMobInfo
scoreboard players set $DisplayMobInfo Arena -1

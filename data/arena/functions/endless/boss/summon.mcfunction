function arena:endless/boss/reset

summon vindicator ~ ~2 ~ {Tags:["Arena.Boss","Arena.LastBoss","Arena.Mob"],Attributes:[{Name:"generic.attack_damage",Base:70},{Name:"generic.max_health",Base:1000}],Health:1000f,HandItems:[{id:"minecraft:golden_sword",Count:1b},{}],DeathLootTable:"arena:boss/last_boss",CustomName:'{"text":"アリーナマスター","color":"gold","bold": true}',CustomNameVisible:1b,HandDropChances:[0.0f,0.0f]}

# エフェクト
effect give @e[tag=Arena.LastBoss] fire_resistance 86400 1 true

# ボスバー設定
bossbar add arena:boss {"text":"アリーナマスター","bold": true,"color": "gold"}
bossbar set arena:boss max 1000
bossbar set arena:boss players @a[tag=Arena.Player,distance=..20]

# シールド関連
scoreboard players set $Boss.Temp.LastHealth Arena 1000

# 演出
playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 5 0.75
playsound entity.lightning_bolt.impact master @a ~ ~ ~ 5 1.25

particle end_rod ~ ~1 ~ 0 0 0 0.125 100

effect give @a blindness 1 1 true


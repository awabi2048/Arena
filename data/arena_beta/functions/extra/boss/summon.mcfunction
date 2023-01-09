# リセット
function arena:endless/boss/reset

# 本体召喚
summon vindicator ~ ~2 ~ {Tags:["Arena.ExtraBoss","Arena.Mob"],Attributes:[{Name:"generic.attack_damage",Base:20.0d},{Name:"generic.max_health",Base:800.0d}],HandItems:[{id:"minecraft:golden_sword",Count:1b},{}],Health:800.0f,CustomName:'{"text":"アリーナマスター","color":"gold","bold": true}',CustomNameVisible:1b,HandDropChances:[0.0f,0.0f],DeathLootTable:"empty"}

# エフェクト
effect give @e[tag=Arena.LastBoss] fire_resistance 86400 1 true

# ボスバー設定
bossbar add arena:boss {"text":"アリーナマスター","bold": true,"color": "gold"}
bossbar set arena:boss max 800
bossbar set arena:boss players @a[tag=Arena.Player,distance=..20]

# スキル関連タイマー設定
scoreboard players set $Boss.Temp.LastHealth Arena 800

# 演出
playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 5 0.75
playsound entity.lightning_bolt.impact master @a ~ ~ ~ 5 1.25

particle end_rod ~ ~1 ~ 0 0 0 0.125 100
particle flame ~ ~1 ~ 0 0 0 0.125 100

effect give @a[tag=Arena.Player,distance=..32] blindness 1 1 true

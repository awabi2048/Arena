# リセット
function arena_beta:extra/boss/reset

# 本体召喚
summon vindicator ~ ~2 ~ {Tags:["Arena.LastBoss","Arena.Boss","Arena.Mob"],Attributes:[{Name:"generic.attack_damage",Base:20.0d},{Name:"generic.max_health",Base:800.0d}],HandItems:[{id:"minecraft:golden_sword",Count:1b},{}],Health:800.0f,CustomName:'{"text":"アリーナマスター","color":"gold","bold": true}',CustomNameVisible:1b,HandDropChances:[0.0f,0.0f],DeathLootTable:"empty"}

# エフェクト
effect give @e[tag=Arena.LastBoss] fire_resistance 86400 1 true

# ボスバー設定
bossbar add arena_beta:extra_boss {"text":"アリーナマスター","bold": true,"color": "gold"}
bossbar set arena_beta:extra_boss max 800
bossbar set arena_beta:extra_boss players @a[tag=Arena.Player,distance=..20]

# スキル関連
data modify storage arena:boss LastHealth set value 800.0d

# 演出
playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 5 0.75
playsound entity.lightning_bolt.impact master @a ~ ~ ~ 5 1.25

particle end_rod ~ ~1 ~ 0 0 0 0.125 100
particle flame ~ ~1 ~ 0 0 0 0.125 100

effect give @a[tag=Arena.Player,distance=..32] blindness 1 1 true

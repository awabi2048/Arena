# リセット
function arena:endless/boss/reset

# 召喚時モーション用のセットアップ
scoreboard players set $MotionTimer Arena 0
data modify storage arena:boss Motion.Name set value "Spawning"

# ボスバー設定
bossbar add arena:boss {"text":"アリーナマスター","bold": true,"color": "gold"}
bossbar set arena:boss max 1000
bossbar set arena:boss players @a[tag=Arena.Player,distance=..32]


# スキル関連タイマー設定
scoreboard players set $Boss.Temp.LastHealth Arena 1000
scoreboard players set $Boss.HealCooldown Arena 50

# 演出
playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 5 1.5
playsound entity.lightning_bolt.impact master @a ~ ~ ~ 5 1.25
playsound entity.ender_dragon.ambient master @a ~ ~ ~ 5 1.25

particle end_rod ~ ~1 ~ 0 0 0 0.125 100
particle soul_fire_flame ~ ~1 ~ 0 0 0 0.125 100

effect give @a[tag=Arena.Player,distance=..32] blindness 1 1 true

# トリガー
advancement revoke @s only arena-boss:attacked


# 被攻撃時処理
execute if data entity @e[tag=ArenaBoss.Core,limit=1] {data:{ArenaBoss:{Name:"Fire"}}} run function arena-boss:attacked/fire

# ダメージ与える
    # 被ダメージ量計算
    execute store result score $DamageDealt ArenaBoss.Temp run data get entity @e[tag=ArenaBoss.Hitbox,limit=1] Health 100
    scoreboard players remove $DamageDealt ArenaBoss.Temp 102400

    scoreboard players operation $DamageDealt ArenaBoss.Temp /= #2 Constant

    # 体力から減算
    execute store result score $Health ArenaBoss.Temp run data get storage arena-boss: Health 100
    scoreboard players operation $Health ArenaBoss.Temp += $DamageDealt ArenaBoss.Temp

    # 体力に適用
    execute store result storage arena-boss: Health float 0.01 run scoreboard players get $Health ArenaBoss.Temp

    data modify entity @e[tag=ArenaBoss.Hitbox,limit=1] Health set value 1024.0f

    # ボスバー
    execute store result bossbar arena-boss: value run data get storage arena-boss: Health

    execute if score $Health ArenaBoss.Temp matches ..-1 run bossbar remove arena-boss:

# 個体別処理
function arena-boss:attacked/fire


# アニメーション中なら中断
execute unless data storage arena-boss: {Animation:{Name:"Regular"}} run function arena:stop_process

# ノックバック
# Motion値計算
    # 座標取得
    execute at @e[tag=ArenaBoss.Core] anchored eyes facing entity @s eyes run summon marker ^ ^ ^1 {Tags:["ArenaBoss.Temp"]}
    data modify storage arena-boss:temp MotionPos set from entity @e[tag=ArenaBoss.Temp,limit=1] Pos
    data modify storage arena-boss:temp BossPos set from entity @e[tag=ArenaBoss.Core,limit=1] Pos

    kill @e[tag=ArenaBoss.Temp]

    execute store result score $PosX1 ArenaBoss.Temp run data get storage arena-boss:temp MotionPos[0] 100
    execute store result score $PosZ1 ArenaBoss.Temp run data get storage arena-boss:temp MotionPos[2] 100

    execute store result score $PosX2 ArenaBoss.Temp run data get storage arena-boss:temp BossPos[0] 100
    execute store result score $PosZ2 ArenaBoss.Temp run data get storage arena-boss:temp BossPos[2] 100

    # 差分計算
    scoreboard players operation $PosX2 ArenaBoss.Temp -= $PosX1 ArenaBoss.Temp
    scoreboard players operation $PosZ2 ArenaBoss.Temp -= $PosZ1 ArenaBoss.Temp

    # Motionに代入
    data modify storage arena-boss:temp Motion set value [0.0d, 0.0d, 0.0d]

    execute store result storage arena-boss:temp Motion[0] double 0.0033 run scoreboard players get $PosX2 ArenaBoss.Temp
    execute store result storage arena-boss:temp Motion[2] double 0.0033 run scoreboard players get $PosZ2 ArenaBoss.Temp

data modify entity @e[tag=ArenaBoss.Motion,limit=1] Motion set from storage arena-boss:temp Motion


# アニメーション
data modify storage arena-boss: Animation.Name set value "Attacked"

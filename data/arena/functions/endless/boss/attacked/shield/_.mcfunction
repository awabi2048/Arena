# ボスが展開するシールド(指定ダメージ以下無効)
execute store result score $Boss.Temp.CurrentHealth Arena run data get entity @e[tag=Arena.LastBoss,limit=1] Health

# ボスの体力減少量比較
scoreboard players operation $Boss.Temp.CurrentHealth Arena -= $Boss.Temp.LastHealth Arena
scoreboard players operation $Boss.Temp.CurrentHealth Arena *= #-1 Arena
scoreboard players operation $Boss.Temp.DamageAmount Arena = $Boss.Temp.CurrentHealth Arena 

# 指定ダメージ設定
execute store success score $Boss.Temp.AttackBlocked Arena if score $Boss.Temp.DamageAmount Arena matches ..20

    # 指定ダメージ以下
    execute if score $Boss.Temp.AttackBlocked Arena matches 1 at @e[tag=Arena.LastBoss] run function arena:endless/boss/attacked/shield/block

    # 指定ダメージ以上 (指定ダメージを引いた値分ダメージを与える)
    execute if score $Boss.Temp.AttackBlocked Arena matches 0 run scoreboard players remove $Boss.Temp.DamageAmount Arena 20
    execute if score $Boss.Temp.AttackBlocked Arena matches 0 run scoreboard players operation $Boss.Temp.LastHealth Arena -= $Boss.Temp.DamageAmount Arena
    execute if score $Boss.Temp.AttackBlocked Arena matches 0 store result entity @e[tag=Arena.LastBoss,limit=1] Health float 1 run scoreboard players get $Boss.Temp.LastHealth Arena

# 最後に攻撃された後のボスの体力を取得
execute store result score $Boss.Temp.LastHealth Arena run data get entity @e[tag=Arena.LastBoss,limit=1] Health

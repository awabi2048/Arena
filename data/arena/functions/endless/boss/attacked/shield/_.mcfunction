# ボスが展開するシールド(指定ダメージ以下無効)
execute store result score $Boss.Temp.CurrentHealth Arena run data get entity @e[tag=Arena.LastBoss,limit=1] Health

# ボスの体力減少量比較
scoreboard players operation $Boss.Temp.CurrentHealth Arena -= $Boss.Temp.LastHealth Arena
scoreboard players operation $Boss.Temp.CurrentHealth Arena *= #-1 Arena
scoreboard players operation $Boss.Temp.DamageAmount Arena = $Boss.Temp.CurrentHealth Arena 

# 最小ダメージ設定
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run scoreboard players set $Boss.Temp.MinDamageAmount Arena 20
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run scoreboard players set $Boss.Temp.MinDamageAmount Arena 30
execute store success score $Boss.Temp.AttackBlocked Arena if score $Boss.Temp.DamageAmount Arena <= $Boss.Temp.MinDamageAmount Arena

    # 最小ダメージ以下
    execute if score $Boss.Temp.AttackBlocked Arena matches 1 at @e[tag=Arena.LastBoss] run function arena:endless/boss/attacked/shield/block

    # 最小ダメージ以上 (最小ダメージを引いた値をダメージとする)
    execute if score $Boss.Temp.AttackBlocked Arena matches 0 run scoreboard players operation $Boss.Temp.DamageAmount Arena -= $Boss.Temp.MinDamageAmount Arena
    execute if score $Boss.Temp.AttackBlocked Arena matches 0 run scoreboard players operation $Boss.Temp.LastHealth Arena -= $Boss.Temp.DamageAmount Arena
    execute if score $Boss.Temp.AttackBlocked Arena matches 0 store result entity @e[tag=Arena.LastBoss,limit=1] Health float 1 run scoreboard players get $Boss.Temp.LastHealth Arena

# 最後に攻撃された後のボスの体力を取得
execute store result score $Boss.Temp.LastHealth Arena run data get entity @e[tag=Arena.LastBoss,limit=1] Health

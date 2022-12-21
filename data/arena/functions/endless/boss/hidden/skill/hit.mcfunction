# スキル攻撃的中時に実行
execute if entity @s[tag=Arena.LastBoss.Skill.Slash] run data modify storage score_damage: Argument set value {Damage:5.0d,BypassArmor:true}


# ダメージ付与
execute as @a[tag=Arena.Player,distance=..2] run function score_damage:api/attack

# 後処理
kill @s

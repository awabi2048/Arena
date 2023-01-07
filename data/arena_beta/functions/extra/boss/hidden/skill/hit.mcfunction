# スキル攻撃的中時に実行
execute if entity @e[tag=Arena.LastBoss.Skill.Slash_01,distance=..0.1] run data modify storage score_damage: Argument set value {Damage:5.0d,BypassArmor:true}
execute if entity @e[tag=Arena.LastBoss.Skill.Slash_02,distance=..0.1] run data modify storage score_damage: Argument set value {Damage:10.0d,BypassArmor:true}

# ダメージ付与
function score_damage:api/attack

# 後処理
kill @e[tag=Arena.LastBoss.Skill.Slash,sort=nearest,limit=1]

# 弾が当たった
# 演出
particle flame ~ ~ ~ 0 0 0 0.25 20

# ダメージ & 炎上ダメージ
data modify storage score_damage: Argument set value {Damage:40.0d,DamageType:Fire,DisableParticle:true}
function score_damage:api/attack

function #arena-boss:damage/fire
function #arena-boss:damage/remove_durability

# kill
kill @e[tag=ArenaBoss.Skill01,sort=nearest,limit=1]

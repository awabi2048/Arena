# ビームショット時
# トリガー解除
scoreboard players set $BeamExposured ArenaBoss 0
tag @a remove ArenaBoss.PlayerHit

# ダメージ付与
data modify storage score_damage: Argument set value {Damage:30.0d,BypassResistance:true,DisableParticle:true}
function score_damage:api/attack

# 演出
playsound minecraft:entity.warden.attack_impact master @s ^ ^ ^ 1 0.5
playsound minecraft:entity.illusioner.mirror_move master @a ~ ~ ~ 1 1.7

execute at @e[tag=ArenaBoss.Part01-3] positioned ~ ~1.8 ~ facing entity @s eyes rotated ~ ~2 run function arena-boss:skill/water/shot/beam

# デバフ
effect give @s mining_fatigue 3 2 true


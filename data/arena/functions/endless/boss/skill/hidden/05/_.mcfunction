# 一定時間後にプレイヤーにダメージ+炎上
    # 演出
    execute if score $Boss.SkillTimer Arena matches 0 run particle crimson_spore ~ ~ ~ 5 5 5 1 300

    execute if score $Boss.SkillTimer Arena matches 0 run playsound entity.experience_orb.pickup master @a ~ ~ ~ 3 0.5
    execute if score $Boss.SkillTimer Arena matches 0 run playsound entity.ender_dragon.ambient master @a ~ ~ ~ 3 0.75

    execute if score $Boss.SkillTimer Arena matches 20 run effect give @a[tag=Arena.Player,distance=..20] blindness 1 0 true

    particle crimson_spore ~ ~ ~ 0 0 0 1 100
   
    execute if score $Boss.SkillTimer Arena matches 0..100 positioned ~ ~1 ~ at @a[tag=Arena.Player,distance=..32] facing ~ ~1 ~ at @s run function arena:endless/boss/skill/hidden/05/particle

    # 攻撃
    execute if score $Boss.SkillTimer Arena matches 100 at @a[tag=Arena.Boss.Skill05.Target] run fill ~1 ~ ~1 ~-1 ~ ~-1 lava[level=3] replace air
    execute if score $Boss.SkillTimer Arena matches 100 run data modify storage score_damage: Argument set value {Damage:20.0d,DamageType:Fire}
    execute if score $Boss.SkillTimer Arena matches 100 as @a[tag=Arena.Boss.Skill05.Target] run function score_damage:api/attack

    execute if score $Boss.SkillTimer Arena matches 100 run tag @a[tag=Arena.Boss.SKill05.Target] remove Arena.Boss.Skill05.Target

    # ボスの移動制限
    execute if score $Boss.SkillTimer Arena matches 0 run effect give @e[tag=Arena.Boss] slowness 5 64

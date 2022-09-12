# 中央から円形にスライムorマグマキューブ召喚 => 倒したときにそれぞれ効果発動
# 召喚
execute if score $Boss.SkillTimer Arena matches 2 run summon magma_cube ~-5 ~ ~ {Tags:["Arena.Boss.Skill01.01","Arena.Boss.Skill01","Arena.Mob"],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.1}],Motion:[0.0,0.5,0.0]}
execute if score $Boss.SkillTimer Arena matches 4 run summon slime ~-4 ~ ~-4 {Tags:["Arena.Boss.Skill01.02","Arena.Boss.Skill01","Arena.Mob"],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.1}],Motion:[0.0,0.5,0.0]}
execute if score $Boss.SkillTimer Arena matches 6 run summon magma_cube ~ ~ ~-5 {Tags:["Arena.Boss.Skill01.03","Arena.Boss.Skill01","Arena.Mob"],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.1}],Motion:[0.0,0.5,0.0]}
execute if score $Boss.SkillTimer Arena matches 8 run summon magma_cube ~4 ~ ~-4 {Tags:["Arena.Boss.Skill01.04","Arena.Boss.Skill01","Arena.Mob"],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.1}],Motion:[0.0,0.5,0.0]}

execute if score $Boss.SkillTimer Arena matches 10 run summon slime ~5 ~ ~ {Tags:["Arena.Boss.Skill01.05","Arena.Boss.Skill01","Arena.Mob"],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.1}],Motion:[0.0,0.5,0.0]}
execute if score $Boss.SkillTimer Arena matches 12 run summon magma_cube ~4 ~ ~4 {Tags:["Arena.Boss.Skill01.06","Arena.Boss.Skill01","Arena.Mob"],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.1}],Motion:[0.0,0.5,0.0]}
execute if score $Boss.SkillTimer Arena matches 14 run summon slime ~ ~ ~5 {Tags:["Arena.Boss.Skill01.07","Arena.Boss.Skill01","Arena.Mob"],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.1}],Motion:[0.0,0.5,0.0]}
execute if score $Boss.SkillTimer Arena matches 16 run summon magma_cube ~-4 ~ ~4 {Tags:["Arena.Boss.Skill01.08","Arena.Boss.Skill01","Arena.Mob"],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.1}],Motion:[0.0,0.5,0.0]}

# 演出
    # サウンド
    execute if score $Boss.SkillTimer Arena matches 1 run playsound entity.elder_guardian.curse master @a ~ ~ ~ 3 1
    execute if score $Boss.SkillTimer Arena matches 1 run playsound entity.elder_guardian.curse master @a ~ ~ ~ 3 1.7

    # パーティクル
    execute if score $Boss.SkillTimer Arena matches 1 run particle minecraft:enchant ~-5 ~ ~ 0 0.75 0 0.5 200
    execute if score $Boss.SkillTimer Arena matches 1 run particle minecraft:enchant ~-4 ~ ~-4 0 0.75 0 0.5 200
    execute if score $Boss.SkillTimer Arena matches 1 run particle minecraft:enchant ~ ~ ~-5 0 0.75 0 0.5 200
    execute if score $Boss.SkillTimer Arena matches 1 run particle minecraft:enchant ~4 ~ ~-4 0 0.75 0 0.5 200

    execute if score $Boss.SkillTimer Arena matches 1 run particle minecraft:enchant ~5 ~ ~ 0 0.75 0 0.5 200
    execute if score $Boss.SkillTimer Arena matches 1 run particle minecraft:enchant ~4 ~ ~4 0 0.75 0 0.5 200
    execute if score $Boss.SkillTimer Arena matches 1 run particle minecraft:enchant ~ ~ ~5 0 0.75 0 0.5 200
    execute if score $Boss.SkillTimer Arena matches 1 run particle minecraft:enchant ~-4 ~ ~4 0 0.75 0 0.5 200

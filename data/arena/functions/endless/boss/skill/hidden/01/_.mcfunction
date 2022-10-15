# 中央から円形にブレイズ召喚 => 倒したときにそれぞれ効果発動
# 召喚
execute if score $Boss.SkillTimer Arena matches 30 run summon blaze ~ ~ ~ {Tags:["Arena.Boss.Skill01.01","Arena.Boss.Skill01","Arena.Mob"],Attributes:[{Name:"minecraft:generic.max_health",Base:50.0d}],Motion:[1.0,0.0,0.0],Health:50.0f}
execute if score $Boss.SkillTimer Arena matches 30 run summon blaze ~ ~ ~ {Tags:["Arena.Boss.Skill01.02","Arena.Boss.Skill01","Arena.Mob"],Attributes:[{Name:"minecraft:generic.max_health",Base:50.0d}],Motion:[-1.0,0.0,0.0],Health:50.0f}
execute if score $Boss.SkillTimer Arena matches 30 run summon blaze ~ ~ ~ {Tags:["Arena.Boss.Skill01.03","Arena.Boss.Skill01","Arena.Mob"],Attributes:[{Name:"minecraft:generic.max_health",Base:50.0d}],Motion:[0.0,0.0,1.0],Health:50.0f}
execute if score $Boss.SkillTimer Arena matches 30 run summon blaze ~ ~ ~ {Tags:["Arena.Boss.Skill01.04","Arena.Boss.Skill01","Arena.Mob"],Attributes:[{Name:"minecraft:generic.max_health",Base:50.0d}],Motion:[0.0,0.0,-1.0],Health:50.0f}

execute if score $Boss.SkillTimer Arena matches 30 run summon blaze ~ ~ ~ {Tags:["Arena.Boss.Skill01.05","Arena.Boss.Skill01","Arena.Mob"],Attributes:[{Name:"minecraft:generic.max_health",Base:50.0d}],Motion:[1.0,0.0,1.0],Health:50.0f}
execute if score $Boss.SkillTimer Arena matches 30 run summon blaze ~ ~ ~ {Tags:["Arena.Boss.Skill01.06","Arena.Boss.Skill01","Arena.Mob"],Attributes:[{Name:"minecraft:generic.max_health",Base:50.0d}],Motion:[1.0,0.0,-1.0],Health:50.0f}
execute if score $Boss.SkillTimer Arena matches 30 run summon blaze ~ ~ ~ {Tags:["Arena.Boss.Skill01.07","Arena.Boss.Skill01","Arena.Mob"],Attributes:[{Name:"minecraft:generic.max_health",Base:50.0d}],Motion:[-1.0,0.0,1.0],Health:50.0f}
execute if score $Boss.SkillTimer Arena matches 30 run summon blaze ~ ~ ~ {Tags:["Arena.Boss.Skill01.08","Arena.Boss.Skill01","Arena.Mob"],Attributes:[{Name:"minecraft:generic.max_health",Base:50.0d}],Motion:[-1.0,0.0,-1.0],Health:50.0f}

# 演出
execute if score $Boss.SkillTimer Arena matches 0 run playsound item.firecharge.use master @a ~ ~ ~ 5 0.5
execute if score $Boss.SkillTimer Arena matches 10 run playsound item.firecharge.use master @a ~ ~ ~ 5 0.5

execute if score $Boss.SkillTimer Arena matches 30 run playsound entity.generic.explode master @a ~ ~ ~ 5 1
execute if score $Boss.SkillTimer Arena matches 30 run playsound block.chest.open master @a ~ ~ ~ 5 0.5
execute if score $Boss.SkillTimer Arena matches 30 run playsound entity.elder_guardian.curse master @a ~ ~ ~ 5 1.7

execute if score $Boss.SkillTimer Arena matches 0 run summon marker ~ ~ ~ {Tags:["Arena.Boss.Skill01.Marker","Arena.Boss.Skill01.Marker.Core","Arena.Boss.Marker"]}

execute if score $Boss.SkillTimer Arena matches 0 run summon marker ~ ~ ~ {Tags:["Arena.Boss.Skill01.Marker","Arena.Boss.Skill01.Marker.01","Arena.Boss.Marker"]}
execute if score $Boss.SkillTimer Arena matches 0 run summon marker ~ ~ ~ {Tags:["Arena.Boss.Skill01.Marker","Arena.Boss.Skill01.Marker.02","Arena.Boss.Marker"]}
execute if score $Boss.SkillTimer Arena matches 0 run summon marker ~ ~ ~ {Tags:["Arena.Boss.Skill01.Marker","Arena.Boss.Skill01.Marker.03","Arena.Boss.Marker"]}
execute if score $Boss.SkillTimer Arena matches 0 run summon marker ~ ~ ~ {Tags:["Arena.Boss.Skill01.Marker","Arena.Boss.Skill01.Marker.04","Arena.Boss.Marker"]}

execute as @e[tag=Arena.Boss.Skill01.Marker.Core] at @s run tp @s ~ ~ ~ ~2 ~
execute as @e[tag=Arena.Boss.Skill01.Marker.01] at @s rotated as @e[tag=Arena.Boss.Skill01.Marker.Core] run tp @s ^ ^ ^0.5
execute as @e[tag=Arena.Boss.Skill01.Marker.02] at @s rotated as @e[tag=Arena.Boss.Skill01.Marker.Core] rotated ~90 ~ run tp @s ^ ^ ^-0.5
execute as @e[tag=Arena.Boss.Skill01.Marker.03] at @s rotated as @e[tag=Arena.Boss.Skill01.Marker.Core] rotated ~180 ~ run tp @s ^ ^ ^0.5
execute as @e[tag=Arena.Boss.Skill01.Marker.04] at @s rotated as @e[tag=Arena.Boss.Skill01.Marker.Core] rotated ~270 ~ run tp @s ^ ^ ^-0.5

execute at @e[tag=Arena.Boss.Skill01.Marker,tag=!Arena.Boss.Skill01.Marker.Core] run particle flame ~ ~ ~ 0 0 0 0.05 5

# パーティクル表示
execute at @e[tag=Arena.Boss.Skill01.01] run particle dust 1 0 0 1 ~ ~1 ~ 0.25 0.5 0.25 0.5 5
execute at @e[tag=Arena.Boss.Skill01.02] run particle dust 1 0.5 0 1 ~ ~1 ~ 0.25 0.5 0.25 0.5 5
execute at @e[tag=Arena.Boss.Skill01.03] run particle dust 1 1 0 1 ~ ~1 ~ 0.25 0.5 0.25 0.5 5
execute at @e[tag=Arena.Boss.Skill01.04] run particle dust 0.5 1 0 1 ~ ~1 ~ 0.25 0.5 0.25 0.5 5

execute at @e[tag=Arena.Boss.Skill01.05] run particle dust 0 1 0 1 ~ ~1 ~ 0.25 0.5 0.25 0.5 5
execute at @e[tag=Arena.Boss.Skill01.06] run particle dust 0 1 1 1 ~ ~1 ~ 0.25 0.5 0.25 0.5 5
execute at @e[tag=Arena.Boss.Skill01.07] run particle dust 0 0.5 1 1 ~ ~1 ~ 0.25 0.5 0.25 0.5 5
execute at @e[tag=Arena.Boss.Skill01.08] run particle dust 0 0 1 1 ~ ~ ~1 0.25 0.5 0.25 0.5 5

# kill
execute if score $Boss.SkillTimer Arena matches 40 run kill @e[tag=Arena.Boss.Skill01.Marker]

execute if score $Boss.SkillTimer Arena matches 0 run data modify storage arena: Boss.Skill.01.Killed set value []

# ボスの移動制限
execute if score $Boss.SkillTimer Arena matches 0 run effect give @e[tag=Arena.Boss] slowness 5 64
# 召喚時モーション
execute if score $MotionTimer Arena matches 1..100 run particle portal ~ ~ ~ 0.25 1.5 0.25 0.5 100

execute if score $MotionTimer Arena matches 20 run playsound entity.ender_dragon.ambient master @a ~ ~ ~ 5 0.75

execute if score $MotionTimer Arena matches 30 run playsound entity.wither.break_block master @a ~ ~ ~ 5 0.5
execute if score $MotionTimer Arena matches 30 run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 5 0.75

execute if score $MotionTimer Arena matches 45 run playsound entity.wither.break_block master @a ~ ~ ~ 5 0.5
execute if score $MotionTimer Arena matches 45 run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 5 0.75

execute if score $MotionTimer Arena matches 60 run playsound entity.wither.break_block master @a ~ ~ ~ 5 0.5
execute if score $MotionTimer Arena matches 60 run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 5 0.75

execute if score $MotionTimer Arena matches 30..90 positioned ~ ~-1.4 ~ run function arena_beta:extra/boss/hidden/particle/spawning/01
execute if score $MotionTimer Arena matches 45..90 positioned ~ ~-1.4 ~ run function arena_beta:extra/boss/hidden/particle/spawning/02
execute if score $MotionTimer Arena matches 60..90 positioned ~ ~-1.4 ~ run function arena_beta:extra/boss/hidden/particle/spawning/03

execute if score $MotionTimer Arena matches 100 run playsound minecraft:entity.warden.tendril_clicks master @a ~ ~ ~ 5 0.5
execute if score $MotionTimer Arena matches 100 run playsound entity.wither.death master @a ~ ~ ~ 5 0.75

execute if score $MotionTimer Arena matches 100 positioned ~ ~-1.5 ~ run function arena_beta:extra/boss/hidden/spawn

#execute if score $MotionTimer Arena matches 120 run function arena_beta:extra/boss/hidden/skill/wave

execute if score $MotionTimer Arena matches 160.. run function arena_beta:extra/boss/hidden/skill/wave

execute if score $MotionTimer Arena matches 160.. run function arena_beta:extra/boss/hidden/motion/reset_pose

execute if score $MotionTimer Arena matches 160.. run scoreboard players set $MotionTimer Arena 0

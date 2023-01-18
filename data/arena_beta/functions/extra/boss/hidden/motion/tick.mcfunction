# Motion
execute unless data storage arena: {Boss:{Motion:{Name:"none"}}} run scoreboard players add $MotionTimer Arena 1
execute if data storage arena: {Boss:{Motion:{Name:"none"}}} if score $MotionTimer Arena matches 1.. run scoreboard players set $MotionTimer Arena 0

execute if data storage arena: {Boss:{Motion:{Name:"Spawning"}}} positioned ~ ~1 ~ run function arena_beta:extra/boss/hidden/motion/spawning
execute if data storage arena: {Boss:{Motion:{Name:"Slash_1"}}} run function arena_beta:extra/boss/hidden/motion/slash_1
execute if data storage arena: {Boss:{Motion:{Name:"Slash_2"}}} run function arena_beta:extra/boss/hidden/motion/slash_2
execute if data storage arena: {Boss:{Motion:{Name:"Block"}}} run function arena_beta:extra/boss/hidden/motion/block
execute if data storage arena: {Boss:{Motion:{Name:"Slash_3"}}} run function arena_beta:extra/boss/hidden/motion/slash_3

execute if data storage arena: {Boss:{Motion:{Name:"Death"}}} run function arena_beta:extra/boss/hidden/motion/death

execute if data storage arena: {Boss:{Motion:{Name:"Tp"}}} run function arena_beta:extra/boss/hidden/motion/tp

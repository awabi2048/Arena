# Motion
execute unless data storage arena: {Boss:{Motion:{Name:"none"}}} run scoreboard players add $MotionTimer Arena 1
execute if data storage arena: {Boss:{Motion:{Name:"none"}}} if score $MotionTimer Arena matches 1.. run scoreboard players set $MotionTimer Arena 0

execute if data storage arena: {Boss:{Motion:{Name:"Spawning"}}} positioned ~ ~1 ~ run function arena:endless/boss/hidden/motion/spawning
execute if data storage arena: {Boss:{Motion:{Name:"Slash_1"}}} run function arena:endless/boss/hidden/motion/slash_1
execute if data storage arena: {Boss:{Motion:{Name:"Slash_2"}}} run function arena:endless/boss/hidden/motion/slash_2
execute if data storage arena: {Boss:{Motion:{Name:"Block"}}} run function arena:endless/boss/hidden/motion/block


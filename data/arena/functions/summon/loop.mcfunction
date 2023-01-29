# $Temp.MobType の値で召喚
    # Zombie
    execute if score $MobType Arena.Temp matches 0 if score $Wave Arena.Temp matches 1..5 run summon zombie ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"]}
    execute if score $MobType Arena.Temp matches 0 if score $Wave Arena.Temp matches 2..5 run summon zombie ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"],IsBaby:1b}

    # Skeleton
    execute if score $MobType Arena.Temp matches 1 if score $Wave Arena.Temp matches 1..5 run summon skeleton ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"],HandItems:[{id:"minecraft:bow",Count:1b},{}],ArmorItems:[{},{},{},{"id":"minecraft:leather_helmet",Count:1b}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.0f,0.0f]}
    execute if score $MobType Arena.Temp matches 1 if score $Wave Arena.Temp matches 1..5 run summon skeleton ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"],HandItems:[{id:"minecraft:iron_axe",Count:1b},{}],ArmorItems:[{},{},{},{"id":"minecraft:leather_helmet",Count:1b}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.0f,0.0f]}

    # Blaze
    execute if score $MobType Arena.Temp matches 2 if score $Wave Arena.Temp matches 1..5 run summon blaze ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"]}
    execute if score $MobType Arena.Temp matches 2 if score $Wave Arena.Temp matches 3..5 run summon endermite ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"]}

    # Spider
    execute if score $MobType Arena.Temp matches 3 if score $Wave Arena.Temp matches 1..5 run summon spider ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"]}
    execute if score $MobType Arena.Temp matches 3 if score $Wave Arena.Temp matches 2..5 run summon cave_spider ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"]}

    # Slime
    execute if score $MobType Arena.Temp matches 4 if score $Wave Arena.Temp matches 1..5 run summon slime ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"],Size:2}
    execute if score $MobType Arena.Temp matches 4 if score $Wave Arena.Temp matches 2..5 run summon slime ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"],Size:4}

    # Creeper
    execute if score $MobType Arena.Temp matches 5 if score $Wave Arena.Temp matches 1..5 run summon creeper ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"]}
    execute if score $MobType Arena.Temp matches 5 if score $Wave Arena.Temp matches 2..5 run summon creeper ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"],powered:1b}

    # Guardian
    execute if score $MobType Arena.Temp matches 6 if score $Wave Arena.Temp matches 1..5 run summon guardian ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"]}


# 規定のモブ数より少なければ再帰処理
execute store result score $MobCountCurrent Arena.Temp if entity @e[tag=Arena.Summoned]
scoreboard players operation $MobCountCurrent Arena.Temp *= #4 Constant

execute if score $MobCountCurrent Arena.Temp < $MobCountMax Arena.Temp if data storage arena:temp {SummonPoint:1b} as @e[tag=Arena.SummonPoint] if score @s Arena = @e[tag=Arena.Core,sort=nearest,limit=1] Arena at @s run function arena:summon/loop
execute if score $MobCountCurrent Arena.Temp < $MobCountMax Arena.Temp if data storage arena:temp {SummonPoint:2b} as @e[tag=Arena.SummonPoint2] if score @s Arena = @e[tag=Arena.Core,sort=nearest,limit=1] Arena at @s run function arena:summon/loop


# $Temp.MobType の値で召喚
    # Zombie
    execute if score $Temp.MobType Arena matches 0 if score $Temp.Wave Arena matches 1..5 run summon zombie ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"]}
    execute if score $Temp.MobType Arena matches 0 if score $Temp.Wave Arena matches 2..5 run summon zombie ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"],IsBaby:1b}

    # Skeleton
    execute if score $Temp.MobType Arena matches 1 if score $Temp.Wave Arena matches 1..5 run summon skeleton ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"],HandItems:[{id:"minecraft:bow",Count:1b},{}],ArmorItems:[{},{},{},{"id":"minecraft:leather_helmet",Count:1b}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.0f,0.0f]}
    execute if score $Temp.MobType Arena matches 1 if score $Temp.Wave Arena matches 1..5 run summon skeleton ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"],HandItems:[{id:"minecraft:iron_axe",Count:1b},{}],ArmorItems:[{},{},{},{"id":"minecraft:leather_helmet",Count:1b}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.0f,0.0f]}

    # Blaze
    execute if score $Temp.MobType Arena matches 2 if score $Temp.Wave Arena matches 1..5 run summon blaze ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"]}
    execute if score $Temp.MobType Arena matches 2 if score $Temp.Wave Arena matches 3..5 run summon endermite ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"]}

    # Spider
    execute if score $Temp.MobType Arena matches 3 if score $Temp.Wave Arena matches 1..5 run summon spider ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"]}
    execute if score $Temp.MobType Arena matches 3 if score $Temp.Wave Arena matches 2..5 run summon cave_spider ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"]}

    # Slime
    execute if score $Temp.MobType Arena matches 4 if score $Temp.Wave Arena matches 1..5 run summon slime ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"],Size:2}
    execute if score $Temp.MobType Arena matches 4 if score $Temp.Wave Arena matches 2..5 run summon slime ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"],Size:4}

    # Creeper
    execute if score $Temp.MobType Arena matches 5 if score $Temp.Wave Arena matches 1..5 run summon creeper ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"]}
    execute if score $Temp.MobType Arena matches 5 if score $Temp.Wave Arena matches 2..5 run summon creeper ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"],powered:1b}

    # Guardian
    execute if score $Temp.MobType Arena matches 6 if score $Temp.Wave Arena matches 1..5 run summon guardian ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"]}


# 規定のモブ数より少なければ再帰処理
execute store result score $Temp.MobCountCurrent Arena if entity @e[tag=Arena.Summoned]
scoreboard players operation $Temp.MobCountCurrent Arena *= #4 Arena

execute if score $Temp.MobCountCurrent Arena < $Temp.MobCountMax Arena if score $Temp.SummonPoint Arena matches 1 as @e[tag=Arena.SummonPoint] if score @s Arena = @e[tag=Arena.Core,sort=nearest,limit=1] Arena at @s run function arena:summon/loop
execute if score $Temp.MobCountCurrent Arena < $Temp.MobCountMax Arena if score $Temp.SummonPoint Arena matches 2 as @e[tag=Arena.SummonPoint2] if score @s Arena = @e[tag=Arena.Core,sort=nearest,limit=1] Arena at @s run function arena:summon/loop


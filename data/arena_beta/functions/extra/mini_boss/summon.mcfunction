execute at @e[tag=Arena.SummonPoint,sort=nearest,limit=4,distance=..32] run summon stray ~ ~0.5 ~ {Tags:["Arena.Mob","Arena.MiniBoss","Arena.Summoned"],Health:150.0f,Attributes:[{Name:"generic.max_health",Base:150.0d},{Name:"generic.attack_damage",Base:18.0d},{Name:"generic.movement_speed",Base:0.25d}],HandItems:[{id:"minecraft:golden_sword",Count:1b},{}]}

playsound entity.zombie_villager.cure master @a ~ ~ ~ 1 1.2

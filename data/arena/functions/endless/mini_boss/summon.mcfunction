execute at @e[tag=Arena.SummonPoint,sort=nearest,limit=4,distance=..32] run summon stray ~ ~0.5 ~ {Tags:["Arena.Mob","Arena.MiniBoss","Arena.Summoned"],Attributes:[{Name:"generic.max_health",Base:100d},{Name:"generic.attack_damage",Base:15d},{Name:"generic.movement_speed",Base:0.25d}],Health:100f,HandItems:[{id:"minecraft:golden_sword",Count:1b},{}],DeathLootTable:"arena:boss/mini_boss"}

# 通常時
data modify storage arena:temp MobInfo.Health set value 50.0d
data modify storage arena:temp MobInfo.AttackDamage set value 15.0d
data modify storage arena:temp MobInfo.Speed set value 0.25d

# ボス用
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{Wave:-100}}} run data modify storage arena:temp MobInfo.Health set value 75.0d
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{Wave:-100}}} run data modify storage arena:temp MobInfo.AttackDamage set value 22.5d
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{Wave:-100}}} run data modify storage arena:temp MobInfo.Speed set value 0.3d

function arena:endless/attributes_multiple
function arena:summon/set_attributes
execute as @e[tag=Arena.Summoned,tag=Arena.MiniBoss] run data modify entity @s Health set from storage arena:temp MobInfo.Health

playsound entity.zombie_villager.cure master @a ~ ~ ~ 1 1.2

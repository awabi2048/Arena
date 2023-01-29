# ステージの種類を取得
data modify storage arena:temp StageType set from entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.StageType

# ストレージのデータから対応するAttributesに適応
execute as @e[tag=Arena.Summoned] run data modify entity @s Attributes[{Name:"minecraft:generic.max_health"}].Base set from storage arena:temp MobInfo.Health
execute as @e[tag=Arena.Summoned] run data modify entity @s Attributes[{Name:"minecraft:generic.movement_speed"}].Base set from storage arena:temp MobInfo.Speed
execute as @e[tag=Arena.Summoned] run data modify entity @s Attributes[{Name:"minecraft:generic.attack_damage"}].Base set from storage arena:temp MobInfo.AttackDamage

# エンドレス用: ブレイズなどはAttributesから攻撃力を操作できないため、エフェクトで対応
execute as @e[tag=Arena.Core,sort=nearest,limit=1] if data entity @s {data:{Arena:{StageType:Endless}}} store result score $Wave Arena.Temp run data get entity @s data.Arena.Wave -1

execute unless data storage arena:temp {StageType:Normal} as @e[tag=Arena.Summoned,type=blaze] run effect give @s strength 86400 0 true
execute unless data storage arena:temp {StageType:Normal} as @e[tag=Arena.Summoned,type=skeleton] if data entity @s {HandItems:[{id:"miencraft:bow"}]} run effect give @s strength 86400 0 true

execute as @e[tag=Arena.Summoned] store result entity @s ActiveEffects[{Id:5}].Amplifier byte 0.16 run scoreboard players get $Wave Arena.Temp

# 個別のAttributes設定
execute as @e[tag=Arena.Summoned,type=endermite] store result entity @s Attributes[{Name:"minecraft:generic.max_health"}].Base double 0.33 run data get storage arena:temp MobInfo.Health
execute as @e[tag=Arena.Summoned,type=skeleton] if data entity @s HandItems[{id:"minecraft:iron_axe"}] store result entity @s Attributes[{Name:"minecraft:generic.movement_speed"}].Base double 0.01 run data get storage arena:temp MobInfo.Speed 66

# 固有のデータを設定
execute as @e[tag=Arena.Summoned,type=creeper] if score $Wave Arena.Temp matches ..5 store result entity @s ExplosionRadius byte 1 run scoreboard players get $Wave Arena.Temp
execute as @e[tag=Arena.Summoned,type=creeper] unless score $Wave Arena.Temp matches ..5 store result entity @s ExplosionRadius byte 0.2 run scoreboard players get $Wave Arena.Temp

# 体力を最大体力の値に設定
execute as @e[tag=Arena.Summoned] run data modify entity @s Health set value 1024.0f

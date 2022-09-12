# Arena.Mob のAttributesデータ取得
data modify storage arena: Temp.MobInfo.Attributes.0 set from entity @e[tag=Arena.Summoned,limit=1] Attributes[0].Name
data modify storage arena: Temp.MobInfo.Attributes.1 set from entity @e[tag=Arena.Summoned,limit=1] Attributes[1].Name
data modify storage arena: Temp.MobInfo.Attributes.2 set from entity @e[tag=Arena.Summoned,limit=1] Attributes[2].Name

# ストレージのデータから対応するAttributesに適応
execute as @e[tag=Arena.Summoned] run data modify entity @s Attributes[{Name:"minecraft:generic.max_health"}].Base set from storage arena: Temp.MobInfo.Health
execute as @e[tag=Arena.Summoned] run data modify entity @s Attributes[{Name:"minecraft:generic.movement_speed"}].Base set from storage arena: Temp.MobInfo.Speed
execute as @e[tag=Arena.Summoned] run data modify entity @s Attributes[{Name:"minecraft:generic.attack_damage"}].Base set from storage arena: Temp.MobInfo.AttackDamage

# エンドレス用: ブレイズなどはAttributesから攻撃力を操作できないため、エフェクトで対応
execute store result score $Temp.MobType Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.MobType
execute if data entity @s {data:{Arena:{Endless:1b}}} run effect give @e[tag=Arena.Summoned,type=blaze] strength 86400 0 true
execute if data entity @s {data:{Arena:{Endless:1b}}} run effect give @e[tag=Arena.Summoned,type=skeleton] strength 86400 0 true

execute as @e[tag=Arena.Core,sort=nearest,limit=1] if data entity @s {data:{Arena:{Endless:1b}}} store result score $Temp.Wave Arena run data get entity @s data.Arena.Wave -1
execute as @e[tag=Arena.Summoned] store result entity @s ActiveEffects[{Id:5}].Amplifier byte 0.16 run scoreboard players get $Temp.Wave Arena

# 個別に設定するモブのAttributes設定
execute as @e[tag=Arena.Summoned,type=endermite] store result entity @s Attributes[{Name:"minecraft:generic.max_health"}].Base double 0.33 run data get storage arena: Temp.MobInfo.Health
execute as @e[tag=Arena.Summoned,type=skeleton] if data entity @s HandItems[{id:"minecraft:iron_axe"}] store result entity @s Attributes[{Name:"minecraft:generic.movement_speed"}].Base double 0.01 run data get storage arena: Temp.MobInfo.Speed 75

# 固有のデータを設定
execute as @e[tag=Arena.Summoned,type=creeper] if score $Temp.Wave Arena matches ..5 store result entity @s ExplosionRadius byte 1 run scoreboard players get $Temp.Wave Arena
execute as @e[tag=Arena.Summoned,type=creeper] unless score $Temp.Wave Arena matches ..5 store result entity @s ExplosionRadius byte 0.2 run scoreboard players get $Temp.Wave Arena

# 体力を最大体力の値に設定
execute as @e[tag=Arena.Summoned] run data modify entity @s Health set value 1024f

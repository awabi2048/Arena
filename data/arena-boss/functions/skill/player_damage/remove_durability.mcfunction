# 防具耐久値削り
execute store result score $DurabilityRemoved ArenaBoss.Temp run data get storage score_damage: Arugment.Damage 0.05

# item modify
item modify entity @s armor.head arena-boss:remove_durability
item modify entity @s armor.chest arena-boss:remove_durability
item modify entity @s armor.legs arena-boss:remove_durability
item modify entity @s armor.feet arena-boss:remove_durability

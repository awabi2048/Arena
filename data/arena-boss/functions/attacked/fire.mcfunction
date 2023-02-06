# Fire

# 被ダメージ量計算
    execute store result score $DamageDealt ArenaBoss.Temp run data get entity @e[tag=ArenaBoss.Hitbox,limit=1] Health -100
    scoreboard players add $DamageDealt ArenaBoss.Temp 102400

    # ダメージ軽減
    scoreboard players operation $DamageDealt ArenaBoss.Temp /= #2 Constant

    execute if data storage arena-boss: {Animation:{Name:"Burning_Pillar"}} run scoreboard players operation $DamageDealt ArenaBoss.Temp *= #2 Constant
    execute if data storage arena-boss: {Animation:{Name:"Burning_Pillar"}} run scoreboard players operation $DamageDealt ArenaBoss.Temp /= #3 Constant

    # エンチャントによって変更
    scoreboard players set $DamageMultiple ArenaBoss.Temp 100

    execute store result score $EnchLvl.FireAspect ArenaBoss.Temp run data get entity @s SelectedItem.tag.Enchantments[{id:"minecraft:fire_aspect"}].lvl -10

    execute store result score $EnchLvl.BE:Fire ArenaBoss.Temp if data entity @s {SelectedItem:{tag:{KotaItems:{BossEnchantment:{id:"Fire"}}}}} run data get entity @s SelectedItem.tag.KotaItems.BossEnchantment.lvl -8.571
    execute store result score $EnchLvl.BE:Water ArenaBoss.Temp if data entity @s {SelectedItem:{tag:{KotaItems:{BossEnchantment:{id:"Water"}}}}} run data get entity @s SelectedItem.tag.KotaItems.BossEnchantment.lvl 17.143

    scoreboard players operation $DamageMultiple ArenaBoss.Temp += $EnchLvl.FireAspect ArenaBoss.Temp
    scoreboard players operation $DamageMultiple ArenaBoss.Temp += $EnchLvl.BE:Fire ArenaBoss.Temp
    scoreboard players operation $DamageMultiple ArenaBoss.Temp += $EnchLvl.BE:Water ArenaBoss.Temp

    scoreboard players operation $DamageDealt ArenaBoss.Temp *= $DamageMultiple ArenaBoss.Temp
    scoreboard players operation $DamageDealt ArenaBoss.Temp /= #100 Constant

    # 引き算
    scoreboard players operation $Health ArenaBoss.Temp -= $DamageDealt ArenaBoss.Temp

    # 体力に適用
    execute store result storage arena-boss: Health float 0.01 run scoreboard players get $Health ArenaBoss.Temp

    # ヒットボックス用エンティティの体力回復
    data modify entity @e[tag=ArenaBoss.Hitbox,limit=1] Health set value 1024.0f

# 演出
execute at @e[tag=ArenaBoss.Core] run playsound entity.blaze.hurt master @a ~ ~ ~ 2 0.8
execute at @e[tag=ArenaBoss.Core] run playsound entity.blaze.hurt master @a ~ ~ ~ 2 0.75

execute at @e[tag=ArenaBoss.Core] run particle block blackstone ~ ~1.5 ~ 0.125 0.125 0.125 0.25 32

# プレイヤーの方向く
execute unless data storage arena-boss: {Flag:{NoMove:true}} positioned as @e[tag=ArenaBoss.Part08] run tp @e[tag=ArenaBoss.Part08] ~ ~ ~ facing entity @s

# kill
execute if score $Health ArenaBoss.Temp matches ..-1 run function arena-boss:killed/fire


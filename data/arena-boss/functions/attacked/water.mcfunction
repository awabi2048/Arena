# Water

# 被ダメージ量計算
    execute store result score $DamageDealt ArenaBoss.Temp run data get entity @e[tag=ArenaBoss.Hitbox,limit=1] Health -100
    scoreboard players add $DamageDealt ArenaBoss.Temp 102400

    # ダメージ軽減
    scoreboard players operation $DamageDealt ArenaBoss.Temp *= #4 Constant
    scoreboard players operation $DamageDealt ArenaBoss.Temp /= #10 Constant

    # エンチャントによってダメージ更新
    scoreboard players set $DamageMultiple ArenaBoss.Temp 100

    execute store result score $EnchLvl.BE:Water ArenaBoss.Temp if data entity @s {SelectedItem:{tag:{KotaItems:{BossEnchantment:{id:"Water"}}}}} run data get entity @s SelectedItem.tag.KotaItems.BossEnchantment.lvl -8.571
    execute store result score $EnchLvl.BE:Earth ArenaBoss.Temp if data entity @s {SelectedItem:{tag:{KotaItems:{BossEnchantment:{id:"Earth"}}}}} run data get entity @s SelectedItem.tag.KotaItems.BossEnchantment.lvl 17.143

    scoreboard players operation $DamageMultiple ArenaBoss.Temp += $EnchLvl.BE:Water ArenaBoss.Temp
    scoreboard players operation $DamageMultiple ArenaBoss.Temp += $EnchLvl.BE:Earth ArenaBoss.Temp

    scoreboard players operation $DamageDealt ArenaBoss.Temp *= $DamageMultiple ArenaBoss.Temp
    scoreboard players operation $DamageDealt ArenaBoss.Temp /= #100 Constant

    # 引き算
    scoreboard players operation $Health ArenaBoss.Temp -= $DamageDealt ArenaBoss.Temp

    # 体力に適用
    execute store result storage arena-boss: Health float 0.01 run scoreboard players get $Health ArenaBoss.Temp

    # ヒットボックス用エンティティの体力回復
    execute as @e[tag=ArenaBoss.Hitbox] run data modify entity @s Health set value 1024.0f

# 演出
execute at @e[tag=ArenaBoss.Core] run playsound entity.wither.hurt master @a ~ ~ ~ 0.5 0.8
execute at @e[tag=ArenaBoss.Core] run playsound entity.guardian.hurt master @a ~ ~ ~ 2 0.75

# kill
execute if score $Health ArenaBoss.Temp matches ..-1 run function arena-boss:killed/water


# プレイヤーの周囲に蜘蛛の巣を設置
    # マーカー召喚
    execute if score $Boss.SkillTimer Arena matches 0 at @a[tag=Arena.Player,distance=..20] run summon marker ~ ~ ~ {Tags:["Arena.Boss.Web","Arena.Boss.Marker"]}

    # 演出
    execute if score $Boss.SkillTimer Arena matches 0 run playsound entity.spider.ambient master @a ~ ~ ~ 1 0.5
    execute if score $Boss.SkillTimer Arena matches 0 run playsound entity.spider.hurt master @a ~ ~ ~ 1 0.75

    execute if score $Boss.SkillTimer Arena matches 80 run playsound entity.spider.death master @a ~ ~ ~ 1 1
    execute if score $Boss.SkillTimer Arena matches 80 run playsound entity.spider.death master @a ~ ~ ~ 1 0.75

    # 蜘蛛の巣設置
    execute if score $Boss.SkillTimer Arena matches 0 at @e[tag=Arena.Boss.Web] run fill ~ ~2 ~ ~ ~ ~ cobweb replace air

    # 後処理
    execute if score $Boss.SkillTimer Arena matches 80 run kill @e[tag=Arena.Boss.Web]

    execute if score $Boss.SkillTimer Arena matches 80 run setblock ~ ~-5 ~ redstone_block
    execute if score $Boss.SkillTimer Arena matches 80 run setblock ~ ~-5 ~ air

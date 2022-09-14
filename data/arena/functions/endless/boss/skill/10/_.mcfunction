# 一定間隔で効果音, 接近したプレイヤーにウィザー効果付与
    # 1秒おきに効果音再生
    scoreboard players operation $Boss.SkillTimer_Copy Arena = $Boss.SkillTimer Arena
    scoreboard players operation $Boss.SkillTimer_Copy Arena %= #20 Arena

    execute if score $Boss.SkillTimer_Copy Arena matches 0 run playsound ui.button.click master @a ~ ~ ~ 1 1.2

    # 2秒おきに付近のプレイヤーにウィザー効果付与
    execute run scoreboard players operation $Boss.SkillTimer_Copy Arena = $Boss.SkillTimer Arena
    execute run scoreboard players operation $Boss.SkillTimer_Copy Arena %= #40 Arena

    execute if score $Boss.SkillTimer_Copy Arena matches 0 at @e[tag=Arena.Boss] run effect give @a[distance=..4] wither 3 3 true
    execute if score $Boss.SkillTimer_Copy Arena matches 0 run playsound entity.zombie.infect master @a ~ ~ ~ 1 0.75
    execute if score $Boss.SkillTimer_Copy Arena matches 0 at @e[tag=Arena.Boss] run particle dust_color_transition 0 0 0 1 0.5 0 0.5 ~ ~ ~ 2 0 2 1 100

    execute if score $Boss.SkillTimer Arena matches 80 run scoreboard players reset $Boss.SkillTimer_Copy Arena

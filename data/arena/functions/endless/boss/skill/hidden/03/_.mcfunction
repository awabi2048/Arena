# マーカー兼当たり判定召喚
execute if score $Boss.SkillTimer Arena matches 10 as @e[tag=Arena.SummonPoint,sort=nearest,limit=4] at @s facing entity @e[tag=Arena.Core,sort=nearest,limit=1] eyes run summon creeper ^7 ^ ^2 {DeathLootTable:"empty",NoAI:1b,Silent:1b,Tags:["Arena.Boss.Skill03.Core","Arena.Boss.Marker"],ActiveEffects:[{Id:14,Duration:72000,ShowParticles:0b}],Attributes:[{Name:"generic.max_health",Base:120.0d}],Health:120.0f}
effect give @e[tag=Arena.LastBoss] invisibility 10 0 true

# 演出
execute at @e[tag=Arena.Boss.Skill03.Core] run particle falling_obsidian_tear ~ ~ ~ 0.1 3 0.1 0 3
execute at @e[tag=Arena.Boss.Skill03.Core] run particle dust_color_transition 0 0 0 1 0.25 0 0.25 ~ ~ ~ 0.25 3 0.25 0 20
execute at @e[tag=Arena.Boss.Skill03.Core] run particle dragon_breath ~ ~ ~ 0.5 3 0.5 0 5

execute if score $Boss.SkillTimer Arena matches 0 run playsound block.grindstone.use master @a ~ ~ ~ 5 0.5
execute if score $Boss.SkillTimer Arena matches 10 run playsound block.anvil.land master @a ~ ~ ~ 5 0.5
execute if score $Boss.SkillTimer Arena matches 10 run playsound block.anvil.land master @a ~ ~ ~ 5 0.61

# 最後まで残っているのがいたらその数だけデバフとダメージ
execute if score $Boss.SkillTimer Arena matches 100 store result storage arena:temp Boss.Skill.04.PillarCount int 1 if entity @e[tag=Arena.Boss.Skill03.Core]

execute if score $Boss.SkillTimer Arena matches 100 if data storage arena:temp {Boss:{Skill:{04:{PillarCount:4}}}} run function arena:endless/boss/skill/hidden/03/debuff04
execute if score $Boss.SkillTimer Arena matches 100 if data storage arena:temp {Boss:{Skill:{04:{PillarCount:3}}}} run function arena:endless/boss/skill/hidden/03/debuff03
execute if score $Boss.SkillTimer Arena matches 100 if data storage arena:temp {Boss:{Skill:{04:{PillarCount:2}}}} run function arena:endless/boss/skill/hidden/03/debuff02
execute if score $Boss.SkillTimer Arena matches 100 if data storage arena:temp {Boss:{Skill:{04:{PillarCount:1}}}} run function arena:endless/boss/skill/hidden/03/debuff01
execute if score $Boss.SkillTimer Arena matches 100 if data storage arena:temp {Boss:{Skill:{04:{PillarCount:0}}}} run function arena:endless/boss/skill/hidden/03/bonus

# kill
execute if score $Boss.SkillTimer Arena matches 100 run tp @e[tag=Arena.Boss.Skill03.Core] ~ ~-300 ~
execute if score $Boss.SkillTimer Arena matches 100 run kill @e[tag=Arena.Boss.Skill03.Core]

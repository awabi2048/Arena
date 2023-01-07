# 攻撃
summon marker ^ ^1 ^ {Tags:["Arena.LastBoss.Skill.Slash","Arena.LastBoss.Skill.Slash_01"]}
data modify entity @e[tag=Arena.LastBoss.Skill.Slash,sort=nearest,limit=1] Rotation[0] set from entity @e[tag=Arena.LastBoss.Core,limit=1] Rotation[0]
data modify entity @e[tag=Arena.LastBoss.Skill.Slash,sort=nearest,limit=1] Rotation[1] set value 0.0f

# 音
playsound entity.player.attack.sweep master @a ~ ~ ~ 1 0.8
playsound block.sculk_sensor.clicking master @a ~ ~ ~ 1 1.3
playsound minecraft:block.sculk.charge master @a ~ ~ ~ 1 0.7

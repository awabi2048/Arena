summon vindicator ~ ~3 ~ {Tags:["Arena.Boss","Arena.MidBoss","Arena.Mob"],Attributes:[{Name:"generic.max_health",Base:1000},{Name:"generic.attack_damage",Base:60},{Name:"generic.armor",Base:20}],Health:1000f,HandItems:[{id:"minecraft:golden_sword",Count:1b},{}],DeathLootTable:"arena:boss/mid_boss",CustomName:'{"text":"中ボス","color":"gold","bold": true}',ActiveEffects:[{Id:12,Amplifier:0b,Duration:1728000,ShowParticles:0b}],CustomNameVisible:1b}

bossbar add arena:mid_boss {"text":"中ボス","bold": true,"color": "yellow"}
bossbar set arena:mid_boss max 1000
bossbar set arena:mid_boss players @a[tag=Arena.Player,distance=..20]

playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 5 0.75
playsound entity.lightning_bolt.impact master @a ~ ~ ~ 5 1.25

# ボタン
execute at @e[tag=Arena.Core,sort=nearest,limit=1] run setblock ~ ~ ~ air
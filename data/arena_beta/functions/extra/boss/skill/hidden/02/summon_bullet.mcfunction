summon marker ^ ^ ^ {Tags:["Arena.Boss.Skill02.Bullet","Arena.Boss.Marker"]}
execute positioned ^ ^ ^1 if entity @e[tag=Arena.Core,sort=nearest,limit=1,distance=..14] run function arena:endless/boss/skill/hidden/02/summon_bullet

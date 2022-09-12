# 音
playsound block.anvil.land master @a ~ ~ ~ 0.5 1.75

playsound block.metal.break master @a ~ ~ ~ 3 0.5
playsound block.metal.break master @a ~ ~ ~ 3 1
playsound block.stone.break master @a ~ ~ ~ 3 1.5

playsound entity.shulker.open master @a ~ ~ ~ 3 0.75
playsound item.shield.block master @a ~ ~ ~ 1 1.5

playsound entity.enderman.teleport master @a ~ ~ ~ 3 0.75

# パーティクル
summon marker ~ ~2.5 ~-0.75 {Tags:["Arena.Boss.Shield.X","Arena.Boss.Shield"]}
summon marker ~ ~2.5 ~0.75 {Tags:["Arena.Boss.Shield.X","Arena.Boss.Shield"]}

summon marker ~-0.75 ~2.5 ~ {Tags:["Arena.Boss.Shield.Z","Arena.Boss.Shield"]}
summon marker ~0.75 ~2.5 ~ {Tags:["Arena.Boss.Shield.Z","Arena.Boss.Shield"]}

# 体力減少リセット
execute store result entity @e[tag=Arena.LastBoss,limit=1] Health float 1 run scoreboard players get $Boss.Temp.LastHealth Arena 
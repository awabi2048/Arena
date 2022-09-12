# 落下物をアリーナ場内に落下させる
# マーカー管理
execute if score $Boss.SkillTimer Arena matches 0 run summon marker ~1 ~ ~ {Tags:["Arena.Boss.FallingBlock","Arena.Boss.Marker"],Rotation:[0f,0f]}
execute if score $Boss.SkillTimer Arena matches 0 run summon marker ~-1 ~ ~ {Tags:["Arena.Boss.FallingBlock","Arena.Boss.Marker"],Rotation:[90f,0f]}
execute if score $Boss.SkillTimer Arena matches 0 run summon marker ~ ~ ~1 {Tags:["Arena.Boss.FallingBlock","Arena.Boss.Marker"],Rotation:[180f,0f]}
execute if score $Boss.SkillTimer Arena matches 0 run summon marker ~ ~ ~-1 {Tags:["Arena.Boss.FallingBlock","Arena.Boss.Marker"],Rotation:[270f,0f]}

execute if score $Boss.SkillTimer Arena matches 0 run summon marker ~1 ~ ~1 {Tags:["Arena.Boss.FallingBlock","Arena.Boss.Marker"],Rotation:[45f,0f]}
execute if score $Boss.SkillTimer Arena matches 0 run summon marker ~-1 ~ ~-1 {Tags:["Arena.Boss.FallingBlock","Arena.Boss.Marker"],Rotation:[135f,0f]}
execute if score $Boss.SkillTimer Arena matches 0 run summon marker ~1 ~ ~1 {Tags:["Arena.Boss.FallingBlock","Arena.Boss.Marker"],Rotation:[225f,0f]}
execute if score $Boss.SkillTimer Arena matches 0 run summon marker ~-1 ~ ~-1 {Tags:["Arena.Boss.FallingBlock","Arena.Boss.Marker"],Rotation:[315f,0f]}

execute as @e[tag=Arena.Boss.FallingBlock] at @s run tp @s ^ ^ ^1

# 落下物召喚
execute if score $Boss.SkillTimer Arena matches 2 at @e[tag=Arena.Boss.FallingBlock] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:purple_concrete"},Time:1,DropItem:0b,HurtEntities:1b,FallHurtMax:20,FallHurtAmount:20f}
execute if score $Boss.SkillTimer Arena matches 4 at @e[tag=Arena.Boss.FallingBlock] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:black_concrete"},Time:1,DropItem:0b,HurtEntities:1b,FallHurtMax:20,FallHurtAmount:20f}
execute if score $Boss.SkillTimer Arena matches 6 at @e[tag=Arena.Boss.FallingBlock] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:purple_concrete"},Time:1,DropItem:0b,HurtEntities:1b,FallHurtMax:20,FallHurtAmount:20f}
execute if score $Boss.SkillTimer Arena matches 8 at @e[tag=Arena.Boss.FallingBlock] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:black_concrete"},Time:1,DropItem:0b,HurtEntities:1b,FallHurtMax:20,FallHurtAmount:20f}
execute if score $Boss.SkillTimer Arena matches 10 at @e[tag=Arena.Boss.FallingBlock] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:purple_concrete"},Time:1,DropItem:0b,HurtEntities:1b,FallHurtMax:20,FallHurtAmount:20f}
#サウンド
execute if score $Boss.SkillTimer Arena matches 2 at @s run playsound block.anvil.land master @a ~ ~ ~ 3 0.75
execute if score $Boss.SkillTimer Arena matches 4 at @s run playsound block.anvil.land master @a ~ ~ ~ 3 0.75
execute if score $Boss.SkillTimer Arena matches 6 at @s run playsound block.anvil.land master @a ~ ~ ~ 3 0.75
execute if score $Boss.SkillTimer Arena matches 8 at @s run playsound block.anvil.land master @a ~ ~ ~ 3 0.75
execute if score $Boss.SkillTimer Arena matches 10 at @s run playsound block.anvil.land master @a ~ ~ ~ 3 0.75
#タイマー終了後処理 (リセット)
execute if score $Boss.SkillTimer Arena matches 100 run kill @e[tag=Arena.Boss.FallingBlock]
execute if score $Boss.SkillTimer Arena matches 100 at @e[tag=Arena.Core,sort=nearest,limit=1] run kill @e[type=falling_block,distance=..20]

execute if score $Boss.SkillTimer Arena matches 100 at @e[tag=Arena.Core,sort=nearest,limit=1] run setblock ~ ~-4 ~ air
execute if score $Boss.SkillTimer Arena matches 100 at @e[tag=Arena.Core,sort=nearest,limit=1] run setblock ~ ~-4 ~ structure_block{posX:-19,posY:1,posZ:-19,mode:"LOAD",name:"arena:stage-normal"}
execute if score $Boss.SkillTimer Arena matches 100 at @e[tag=Arena.Core,sort=nearest,limit=1] run setblock ~ ~-5 ~ redstone_block
execute if score $Boss.SkillTimer Arena matches 100 at @e[tag=Arena.Core,sort=nearest,limit=1] run setblock ~ ~-5 ~ air

# mini_bossを召喚
function arena:endless/mini_boss/summon

execute at @e[tag=Arena.SummonPoint,sort=nearest,limit=4,distance=..32] run particle effect ~ ~ ~ 0.5 0 0.5 1 100 

scoreboard players set $Boss.Skill Arena -1

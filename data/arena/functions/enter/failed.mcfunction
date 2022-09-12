execute as @a[distance=..3.5] run tellraw @s [{"text": "すでに入場している人がいます","color": "red"}]
execute as @a[distance=..3.5] run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

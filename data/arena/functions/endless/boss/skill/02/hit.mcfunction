# ホーミング弾着弾時処理
effect give @a[tag=Arena.Player,distance=..1] instant_damage 2 1 true
effect give @a[tag=Arena.Player,distance=..1] levitation 3 1 true

playsound entity.generic.explode master @a ~ ~ ~ 0.5 1.25
kill @s

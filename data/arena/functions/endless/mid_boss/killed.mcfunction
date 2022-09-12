function arena:endless/boss/reset
advancement revoke @a only arena:boss/killed_mid_boss

execute as @a[tag=Arena.Player] if score @s Arena matches -1 run loot give @s loot arena:boss/mid_boss
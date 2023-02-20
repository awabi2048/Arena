# 既に入場している人がいます！
tellraw @s [{"translate":"arena.game.message.prefix"},{"translate":"arena.game.message.error.someone_already_playing"}]
playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

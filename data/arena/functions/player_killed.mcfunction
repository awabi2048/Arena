# 入場中のプレイヤーが倒されたらタグ除去
tag @s remove Arena.Player
advancement revoke @s only arena:player_killed

execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless,Wave:-1}}} run advancement grant @s only arena:display/endless/young_challenger


## 古いチケットを最新のものに変換
# データリセット
data modify storage arena:temp TicketExchange set value {}

# 所持数取得して/lootで交換
    # Easy
    execute store result score $TicketCount Arena.Temp run clear @s paper{Arena:Ticket1} 64
    execute store result storage arena:temp TicketExchange.Easy int 1 run scoreboard players get $TicketCount Arena.Temp

    loot give @s loot arena:ticket/easy

    # Normal
    execute store result score $TicketCount Arena.Temp run clear @s paper{Arena:Ticket2} 64
    execute store result storage arena:temp TicketExchange.Normal int 1 run scoreboard players get $TicketCount Arena.Temp

    loot give @s loot arena:ticket/normal

    # Hard
    execute store result score $TicketCount Arena.Temp run clear @s paper{Arena:Ticket3} 64
    execute store result storage arena:temp TicketExchange.Hard int 1 run scoreboard players get $TicketCount Arena.Temp

    loot give @s loot arena:ticket/hard

# 通知
execute unless data storage arena:temp {TicketExchange:{Easy:0,Normal:0,Hard:0}} run tellraw @s [{"translate": "arena.game.message.prefix"},{"translate": "arena.other.message.ticket_exchange.success","with":[{"nbt":"TicketExchange.Easy","storage":"arena:temp","color": "white","bold": true},{"nbt":"TicketExchange.Normal","storage":"arena:temp","color": "white","bold": true},{"nbt":"TicketExchange.Hard","storage":"arena:temp","color": "white","bold": true}]}]
execute unless data storage arena:temp {TicketExchange:{Easy:0,Normal:0,Hard:0}} run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1.5

execute if data storage arena:temp {TicketExchange:{Easy:0,Normal:0,Hard:0}} run tellraw @s [{"translate": "arena.game.message.prefix"},{"translate": "arena.other.message.ticket_exchange.failed"}]
execute if data storage arena:temp {TicketExchange:{Easy:0,Normal:0,Hard:0}} run playsound ui.button.click master @s ~ ~ ~ 1 0.75


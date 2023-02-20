# load
# スコアボード定義
scoreboard objectives add ArenaBoss dummy
scoreboard objectives add ArenaBoss.Temp dummy

# team
team add NoCollision
team modify NoCollision collisionRule never

# 各種データの設定
data modify storage arena:core Boss.StageInfo set value []

data modify storage arena:core Boss.StageInfo append value {DisplayData:{Name:'{"text": "【キングブレイズ】","color": "gold", "bold": true}'},TicketRequired:3,MaxPlayerCount:5,StageID:1}
data modify storage arena:core Boss.StageInfo append value {DisplayData:{Name:'{"text": "【でかガーディアン(仮)】","color": "blue", "bold": true}'},TicketRequired:4,MaxPlayerCount:6,StageID:2}


# データ取得
# モブごとで場合分け
data modify storage arena:temp PlayerData set from storage arena: PlayerData

execute unless score $DisplayPage Arena.Temp matches 0 run data remove storage arena:temp PlayerData[{Type:"ゾンビ"}]
execute unless score $DisplayPage Arena.Temp matches 1 run data remove storage arena:temp PlayerData[{Type:"スケルトン"}]
execute unless score $DisplayPage Arena.Temp matches 2 run data remove storage arena:temp PlayerData[{Type:"ブレイズ"}]
execute unless score $DisplayPage Arena.Temp matches 3 run data remove storage arena:temp PlayerData[{Type:"スパイダー"}]
execute unless score $DisplayPage Arena.Temp matches 4 run data remove storage arena:temp PlayerData[{Type:"スライム"}]
execute unless score $DisplayPage Arena.Temp matches 5 run data remove storage arena:temp PlayerData[{Type:"クリーパー"}]
execute unless score $DisplayPage Arena.Temp matches 6 run data remove storage arena:temp PlayerData[{Type:"ガーディアン"}]

execute unless score $DisplayPage Arena.Temp matches 7 run data remove storage arena:temp PlayerData[{Type:"エンドレス"}]

# ランキング表示用データ


# 重複データが無いか確認
execute store success storage arena:temp cache.CompareSucceeded byte 1 run data modify storage arena:temp PlayerData[0].Name set from storage arena:temp cache.PlayerData.Name
execute if data storage arena:temp {cache:{CompareSucceeded:false}} store success storage arena:temp cache.CompareSucceeded byte 1 run data modify storage arena:temp PlayerData[0].Type set from storage arena:temp cache.PlayerData.Type

# 成功時 => 別ストレージに避難
execute if data storage arena:temp {cache:{CompareSucceeded:true}} run data modify storage arena:temp cache.ComparedPlayerData append from storage arena:temp PlayerData[0]
execute if data storage arena:temp {cache:{CompareSucceeded:true}} run data remove storage arena:temp PlayerData[0]

# 失敗時(重複データ発見時) => 該当データを削除、残りは全て別ストレージへ移動
execute if data storage arena:temp {cache:{CompareSucceeded:false}} run data remove storage arena:temp PlayerData[0]
execute if data storage arena:temp {cache:{CompareSucceeded:false}} run data modify storage arena:temp cache.ComparedPlayerData append from storage arena:temp PlayerData[]

# まだデータに残りがあり、重複も発見していない場合は再帰
execute if data storage arena:temp {cache:{CompareSucceeded:true}} if data storage arena:temp PlayerData[0] run function arena:record/check_dupes

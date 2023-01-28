# 重複データが無いか確認
data modify storage arena:temp MergingRecord.CompareTarget set from storage arena:temp MergingRecord.PlayerData
execute store success storage arena:temp MergingRecord.CompareSucceeded byte 1 run data modify storage arena:temp MergingRecord.CompareTarget.Name set from storage arena:temp PlayerData[0].Name
execute if data storage arena:temp {MergingRecord:{CompareSucceeded:false}} store success storage arena:temp MergingRecord.CompareSucceeded byte 1 run data modify storage arena:temp MergingRecord.CompareTarget.Type set from storage arena:temp PlayerData[0].Type

# 記録がより高いかどうか検証
execute if data storage arena:temp {MergingRecord:{CompareSucceeded:false}} store result score $DupeCheck.OldData Arena.Temp run data get storage arena:temp PlayerData[0].weight
execute if data storage arena:temp {MergingRecord:{CompareSucceeded:false}} store result score $DupeCheck.NewData Arena.Temp run data get storage arena:temp MergingRecord.CompareTarget.weight

execute if data storage arena:temp {MergingRecord:{CompareSucceeded:false}} if score $DupeCheck.OldData Arena.Temp <= $DupeCheck.NewData Arena.Temp run data modify storage arena:temp MergingRecord.PlayerData set from storage arena:temp PlayerData[0]
execute if data storage arena:temp {MergingRecord:{CompareSucceeded:false}} if score $DupeCheck.OldData Arena.Temp <= $DupeCheck.NewData Arena.Temp run data modify storage arena:temp MergingRecord.CompareSucceeded set value true

# 成功時 => 別ストレージに避難
execute if data storage arena:temp {MergingRecord:{CompareSucceeded:true}} run data modify storage arena:temp MergingRecord.ComparedPlayerData append from storage arena:temp PlayerData[0]
execute if data storage arena:temp {MergingRecord:{CompareSucceeded:true}} run data remove storage arena:temp PlayerData[0]

# 失敗時(重複データ発見時) => 該当データを置き換え、残りは全て別ストレージへ移動
execute if data storage arena:temp {MergingRecord:{CompareSucceeded:false}} run data modify storage arena:temp PlayerData[0] set from storage arena:temp MergingRecord.PlayerData
execute if data storage arena:temp {MergingRecord:{CompareSucceeded:false}} run data modify storage arena:temp MergingRecord.ComparedPlayerData append from storage arena:temp PlayerData[]

# まだデータに残りがあり、重複も発見していない場合は再帰
execute if data storage arena:temp {MergingRecord:{CompareSucceeded:true}} if data storage arena:temp PlayerData[0] run function arena:record/check_dupes

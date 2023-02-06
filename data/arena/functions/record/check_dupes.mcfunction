# 重複データの確認

# 名前と種類それぞれ確認、どちらか異なれば新しいデータとして追加
# 注意: NameとTypeはそれぞれMatchedとなっているが、実際には結果が反転している (合致していたらfalseになる)
data modify storage arena:temp MergingRecord.CompareTarget set from storage arena:temp MergingRecord.PlayerData

execute store success storage arena:temp MergingRecord.NameMatched byte 1 run data modify storage arena:temp MergingRecord.CompareTarget.Name set from storage arena:temp PlayerData[0].Name
execute store success storage arena:temp MergingRecord.TypeMatched byte 1 run data modify storage arena:temp MergingRecord.CompareTarget.Type set from storage arena:temp PlayerData[0].Type

execute store success storage arena:temp MergingRecord.CompareSucceeded byte 1 unless data storage arena:temp {MergingRecord:{NameMatched:false,TypeMatched:false}}

# 成功時 => 別ストレージに避難
execute if data storage arena:temp {MergingRecord:{CompareSucceeded:true}} run data modify storage arena:temp MergingRecord.ComparedPlayerData append from storage arena:temp PlayerData[0]
execute if data storage arena:temp {MergingRecord:{CompareSucceeded:true}} run data remove storage arena:temp PlayerData[0]

# 失敗時(重複データ発見時) => 必要に応じて該当データを置き換え、残りは全て別ストレージへ移動
    # 記録更新時のみデータ置き換え
    execute if data storage arena:temp {MergingRecord:{CompareSucceeded:false}} store result score $DupeCheck.OldData Arena.Temp run data get storage arena:temp PlayerData[0].weight
    execute if data storage arena:temp {MergingRecord:{CompareSucceeded:false}} store result score $DupeCheck.NewData Arena.Temp run data get storage arena:temp MergingRecord.CompareTarget.weight

    execute if data storage arena:temp {MergingRecord:{CompareSucceeded:false}} unless data storage arena:temp {MergingRecord:{PlayerData:{Type:"エンドレス"}}} if score $DupeCheck.OldData Arena.Temp > $DupeCheck.NewData Arena.Temp run data modify storage arena:temp PlayerData[0] set from storage arena:temp MergingRecord.PlayerData
    execute if data storage arena:temp {MergingRecord:{CompareSucceeded:false}} if data storage arena:temp {MergingRecord:{PlayerData:{Type:"エンドレス"}}} if score $DupeCheck.OldData Arena.Temp < $DupeCheck.NewData Arena.Temp run data modify storage arena:temp PlayerData[0] set from storage arena:temp MergingRecord.PlayerData

execute if data storage arena:temp {MergingRecord:{CompareSucceeded:false}} run data modify storage arena:temp MergingRecord.ComparedPlayerData append from storage arena:temp PlayerData[]

# 最後まで重複が発見されなかった場合は追加
execute if data storage arena:temp {MergingRecord:{CompareSucceeded:true}} unless data storage arena:temp PlayerData[0] run data modify storage arena:temp MergingRecord.ComparedPlayerData append from storage arena:temp MergingRecord.PlayerData

# まだデータに残りがあり、重複も発見していない場合は再帰
execute if data storage arena:temp {MergingRecord:{CompareSucceeded:true}} if data storage arena:temp PlayerData[0] run function arena:record/check_dupes

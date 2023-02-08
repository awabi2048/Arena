# 手動でランキングアップデート
# arena:debug UpdateTargetにアップデート対象のモブを入力
data modify storage arena:temp MergingRecord.PlayerData.Type set from storage arena:debug UpdateTarget
function arena:record/update_ranking

execute unless data storage arena:temp {MergingRecord:{PlayerData:{Type:"All"}}} run function arena:stop_process

# Allなら全てアップデート
data modify storage arena:temp MergingRecord.PlayerData.Type set value "ゾンビ"
function arena:record/update_ranking

data modify storage arena:temp MergingRecord.PlayerData.Type set value "スケルトン"
function arena:record/update_ranking

data modify storage arena:temp MergingRecord.PlayerData.Type set value "ブレイズ"
function arena:record/update_ranking

data modify storage arena:temp MergingRecord.PlayerData.Type set value "スパイダー"
function arena:record/update_ranking

data modify storage arena:temp MergingRecord.PlayerData.Type set value "スライム"
function arena:record/update_ranking

data modify storage arena:temp MergingRecord.PlayerData.Type set value "クリーパー"
function arena:record/update_ranking

data modify storage arena:temp MergingRecord.PlayerData.Type set value "ガーディアン"
function arena:record/update_ranking

data modify storage arena:temp MergingRecord.PlayerData.Type set value "エンドレス"
function arena:record/update_ranking

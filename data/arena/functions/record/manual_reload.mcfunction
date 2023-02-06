# 手動でランキングアップデート
# arena:debug UpdateTargetにアップデート対象のモブを入力
data modify storage arena:temp MergingRecord.PlayerData.Type set from storage arena:debug UpdateTarget
function arena:record/update_ranking

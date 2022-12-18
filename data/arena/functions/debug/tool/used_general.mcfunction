# デバッグツール使用時に実行

execute if predicate arena:is_sneaking run function arena:debug/tool/used_kill
execute unless predicate arena:is_sneaking run function arena:debug/tool/used_skip

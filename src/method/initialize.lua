return function (lsp, data)
    lsp._inited = true
    return {
        capabilities = {
            -- 支持“转到定义”
            definitionProvider = true,
            -- 文本同步方式
            textDocumentSync = {
                -- 打开关闭文本时通知
                openClose = true,
                -- 文本改变时完全通知 TODO 支持差量更新（2）
                change = 1,
            }
        }
    }
end

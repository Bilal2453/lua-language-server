local rpc = require 'rpc'
local workspace = require 'workspace'

local function initAfterConfig(lsp, firstScope)
    if firstScope then
        lsp.workspace = workspace(lsp, firstScope.name)
        lsp.workspace:init(firstScope.uri)
    end
    -- 必须动态注册的事件：
    rpc:request('client/registerCapability', {
        registrations = {
            -- 监视文件变化
            {
                id = '0',
                method = 'workspace/didChangeWatchedFiles',
                registerOptions = {
                    watchers = {
                        {
                            globPattern = '**/*.lua',
                            kind = 1 | 4, -- Create | Change | Delete
                        },
                    },
                },
            },
            -- 配置变化
            {
                id = '1',
                method = 'workspace/didChangeConfiguration',
            }
        }
    }, function ()
        log.debug('client/registerCapability Success!')
    end)
end

return function (lsp)
    -- 请求工作目录
    rpc:request('workspace/workspaceFolders', nil, function (folders)
        local firstScope
        if folders then
            firstScope = folders[1]
        end
        -- 请求配置
        rpc:request('workspace/configuration', {
            items = {
                {
                    scopeUri = firstScope and firstScope.uri,
                    section = 'Lua',
                },
            },
        }, function (configs)
            lsp:onUpdateConfig(configs[1])
            initAfterConfig(lsp, firstScope)
        end)
    end)
    return true
end

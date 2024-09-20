local old_ask_ai = function(prompt, context, only_code)
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_set_option_value('filetype', 'markdown', { buf = buf })
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "Thinking..." })
    vim.api.nvim_set_current_buf(buf)

    local provider = "duckduckgo" -- phind by default
    if context ~= nil and #context > 0 then
        prompt = context .. '\n' .. prompt
    end

    local additional = '-q' -- quiet
    if only_code == true then
        additional = '-c'   -- only code (quiet mode doesn't support -c)
    end

    vim.system({ 'tgpt', '--provider', provider, additional, '\'' .. prompt .. '\'' }, { text = true }, function(o)
        if o.code ~= 0 then
            o.stdout = "Failed to execute TGPT: " .. o.stderr
        end
        local lines = vim.split(o.stdout:gsub("\r", ""), "\n")
        vim.schedule(function()
            vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
        end)
    end)
end

local bufnr = 0

local ask_ai = function(prompt, context, only_code)
    if prompt == "" then return end
    if context == nil then context = "" end
    local additional = ''
    if only_code == true then additional = '-c' end

    local provider = "duckduckgo" -- or phind

    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_set_option_value('filetype', 'markdown', { buf = buf })
    vim.api.nvim_set_current_buf(buf)

    local cmd = "cat << EOF | tgpt --disable-input-limit --provider " ..
        provider .. " " .. additional .. " \'" .. prompt .. "\' \n " .. context .. "\nEOF\n"
    print(cmd)
    vim.fn.termopen(cmd)

    bufnr = bufnr + 1
    vim.api.nvim_buf_set_name(buf, "AI answer " .. bufnr)
end

local get_current_selection = function()
    local mode = vim.fn.mode()
    local selection = {}
    if mode == "v" or mode == "V" then
        local vstart = vim.fn.getpos("v")
        local vend = vim.fn.getpos(".")
        if mode == "V" then
            local line_num = vim.fn.line('.')
            vend = { 0, line_num, vim.fn.col('$'), 0 }
        end
        selection = vim.fn.getregion(vstart, vend)
    end
    return table.concat(selection, '\n')
end

local get_lines_cur_buf = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    return table.concat(lines, '\n')
end

local get_cur_sel_or_buf = function()
    local context = get_current_selection()
    if #context == 0 then
        context = get_lines_cur_buf()
    end
    return context
end

local map = vim.keymap.set

-- Ask AI
map("n", "<leader>aq", function()
    local prompt = vim.fn.input("[Ask AI]: ")
    ask_ai(prompt)
end)

-- Ask AI with current buffer or selection context
map({ "n", "v" }, "<leader>ai", function()
    local prompt = vim.fn.input("[AI prompt]: ")
    local context = get_cur_sel_or_buf()
    ask_ai(prompt, context)
end)

-- AI describe selected code
map("v", "<leader>ad", function()
    local prompt = "Describe the following code"
    local context = get_current_selection()
    ask_ai(prompt, context)
end)

-- AI write code
map({ "n", "v" }, "<leader>ac", function()
    local prompt =
    'Implement the code which I indicated using text "HERE". Dont include all of the code, just show me the code you written.'
    local context = get_cur_sel_or_buf()
    ask_ai(prompt, context, true)
end)

-- AI improve code
map({ "n", "v" }, "<leader>am", function()
    local prompt = "How would you improve this code?"
    local context = get_cur_sel_or_buf()
    ask_ai(prompt, context)
end)

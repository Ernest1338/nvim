local aibufnr = 0
local conversation_history = {}
local conversation_buf

local model = "gpt-5-nano-2025-08-07"

-- Helper to strip <think>…</think> sections
local function strip_think_sections(s)
    -- remove any <think>…</think> blocks
    return s:gsub("<think>.-</think>", "")
end

-- Generic API caller
local function call_ai_api(payload, on_complete)
    vim.schedule(function()
        local resp = vim.fn.system(
            "curl -s -X POST -H 'Content-Type: application/json' -d "
            .. vim.fn.shellescape(payload)
            .. " https://api.llm7.io/v1/chat/completions"
        )

        local ok, decoded = pcall(vim.fn.json_decode, resp)
        local content = ok and decoded.choices and decoded.choices[1].message.content or resp

        content = strip_think_sections(content)
        on_complete(content)
    end)
end

local function ask_ai(prompt, context)
    if prompt == "" then return end
    context = context or ""

    -- Merge context and prompt into a single user message
    local text = (context ~= "" and context .. "\n" or "") .. prompt
    local payload = vim.fn.json_encode({
        model    = model,
        messages = { { role = "user", content = text } },
    })

    -- Create the buffer and window
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_set_option_value("filetype", "markdown", { buf = buf })
    aibufnr = aibufnr + 1
    vim.api.nvim_buf_set_name(buf, "AI answer " .. aibufnr)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "AI is thinking..." })
    vim.api.nvim_set_current_buf(buf)

    -- Call the API
    call_ai_api(payload, function(content)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(content, "\n"))
    end)
end

local function chat_ai(prompt)
    if not prompt or prompt == "" then return end
    table.insert(conversation_history, { role = "user", content = prompt })

    local payload = vim.fn.json_encode({
        model    = model,
        messages = conversation_history,
    })

    -- prepare or reuse chat buffer
    if not (conversation_buf and vim.api.nvim_buf_is_valid(conversation_buf)) then
        conversation_buf = vim.api.nvim_create_buf(true, true)
        vim.api.nvim_set_option_value("filetype", "markdown", { buf = conversation_buf })
    end
    local buf = conversation_buf
    aibufnr = aibufnr + 1
    vim.api.nvim_buf_set_name(buf, "AI chat " .. aibufnr)

    -- append user prompt
    vim.api.nvim_buf_set_lines(buf, -1, -1, false, { "", "> " .. prompt, "" })
    vim.api.nvim_set_current_buf(buf)

    -- Call the API
    call_ai_api(payload, function(content)
        table.insert(conversation_history, { role = "assistant", content = content })

        local reply_lines = vim.split(content, "\n", { plain = true })
        vim.api.nvim_buf_set_lines(buf, -1, -1, false, reply_lines)
        vim.api.nvim_buf_set_lines(buf, -1, -1, false, { "" })
    end)
end

local function chat_ai_reset()
    conversation_history = {}
    conversation_buf = nil
    print("AI conversation reset")
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

-- AI describe code
map({ "n", "v" }, "<leader>ad", function()
    local prompt = "Describe the following code"
    local context = get_cur_sel_or_buf()
    ask_ai(prompt, context)
end)

-- AI write code
map({ "n", "v" }, "<leader>ah", function()
    local prompt =
    'Implement the code which I indicated using text "HERE". Dont include all of the code, just show me the code you written.'
    local context = get_cur_sel_or_buf()
    ask_ai(prompt, context)
end)

-- AI improve code
map({ "n", "v" }, "<leader>am", function()
    local prompt = "How would you improve this code?"
    local context = get_cur_sel_or_buf()
    ask_ai(prompt, context)
end)

-- AI conversation
map("n", "<leader>ac", function()
    local p = vim.fn.input("[Chat AI]: ")
    chat_ai(p)
end)

-- AI conversation reset
map("n", "<leader>ar", chat_ai_reset)

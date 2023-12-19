local bit = require('bit')
local imgui = require('imgui')
local state = require('chatty-state')

local BASE_W, BASE_H = imgui.CalcTextSize('W')

local ui = {
    WindowFlags = bit.bor(ImGuiWindowFlags_NoTitleBar),
    IsVisible = { true },
}

---Draws a chat message within the window.
---@param msg table
local function DrawMessage(msg)
    imgui.Text(tostring(msg.Message))
end

---Draws a given tab and its contents.
---@param name     string
---@param messages table[]
local function DrawTab(name, messages)
    if imgui.BeginTabItem(name) then
        local panelName = string.format('chatty_tabs##%s', name)
        imgui.BeginChild(panelName)

        for _, msg in ipairs(messages) do
            DrawMessage(msg)
        end

        -- autoscroll to bottom if you're close; this will keep new messages in
        -- view without manual intervention
        if (imgui.GetScrollMaxY() - imgui.GetScrollY()) <= BASE_H then
            imgui.SetScrollHereY(1.0)
        end

        imgui.EndChild()
        imgui.EndTabItem()
    end
end

---Draws the tab bar and each tab.
local function DrawTabsAndChat()
    if imgui.BeginTabBar('chatty_tabs') then
        -- "all" is a special tab that isn't configurable
        DrawTab('All', state.AllMessages)

        for tabIndex, tabName in ipairs(state.Tabs) do
            local messages = state:GetMessages(tabIndex)
            DrawTab(tabName, messages)
        end

        imgui.EndTabBar()
    end
end

---Displays the chat window.
function ui:Render()
    if imgui.Begin('chatty', self.IsVisible, self.WindowFlags) then
        DrawTabsAndChat()
    end

    imgui.End()
end

return ui

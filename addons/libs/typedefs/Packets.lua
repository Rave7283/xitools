---@meta

---@class ActionPacket
---@field actor_id     integer
---@field target_count integer
---@field category     integer
---@field param        integer
---@field recast       integer
---@field targets      Target[]

---@class Target
---@field id           integer
---@field action_count integer
---@field actions      Action[]

---@class Action
---@field reaction               integer
---@field animation              integer
---@field effect                 integer
---@field stagger                integer
---@field param                  integer
---@field message                integer
---@field unknown                integer
---@field has_add_effect         boolean
---@field add_effect_animation   integer?
---@field add_effect_effect      integer?
---@field add_effect_param       integer?
---@field add_effect_message     integer?
---@field has_spike_effect       boolean
---@field spike_effect_animation integer?
---@field spike_effect_effect    integer?
---@field spike_effect_param     integer?
---@field spike_effect_message   integer?

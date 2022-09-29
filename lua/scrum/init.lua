local Path = require("plenary.path")

local timer_started = false
local data_dir = vim.fn.stdpath("data") .. "/"
local current_timer = {}
local path = data_dir .. "scrum.json"

local M = {}

local function format_json(story_key)
  current_timer["story_key"] = story_key
  current_timer["start_time"] = os.date("%H:%M")
end

local function write_current_timer(story_key)
  format_json(story_key)
  Path:new(path):write(vim.fn.json_encode(current_timer), "w")
  timer_started = true
end

function M.start_timer(story_key)
  if timer_started then
    M.stop_timer(story_key)
  end
  write_current_timer(story_key)
  print("Timer started!")
end

function M.stop_timer(story_key)
  -- TODO
end

function M.pauze_current_timer(story_key)
  if not timer_started then
    print("There is no timer")
    return
  end

  --  TODO(robin): if given story_key does not match current_timer story key,
  --  throw error

  -- TODO
end

function M.resume_current_timer(story_key)
  if not timer_started then
    print("There is no timer")
    return
  end

  --  TODO(robin): if given story_key does not match current_timer story key,
  --  throw error

  -- TODO
end

return M

//
// Language
//

local lang = {
    ["unstuck"] = "You have been unstuck!",
    ["cooldown"] = "You have to wait {1} seconds before using this command again!",
    ["fail"] = "We can't unstuck you, try again later or contact an admin!",
    ["no_perm"] = "You don't have the permission to use this command!",
    ["save_config"] = "Configuration saved, and send to all players!",
    ["show_possible_lang"] = "This are the list of all possible language.",
    ["show_config"] = "This are the current config of unstuck, to edit them do {1}",
    ["invalid_setting"] = "The setting you try to edit do not exist!",
    ["use_cmd_word"] = "To edit this setting use {1} or {2}"
}

//
// Do not edit below unless you know what you are doing !
//

function simpleUnstuck.getTrad(str, opt)
    if (lang[str]) then
        str = lang[str] or str
    end

    if (opt) then
        for k, v in pairs(opt) do
            str = string.Replace(str, "{" .. k .. "}", v)
        end
    end

    return str
end
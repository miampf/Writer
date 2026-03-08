local helpers = {}

function helpers:string_random(length)
    local character_set = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
    local string_sub = string.sub
    local math_random = math.random
    local table_concat = table.concat
    local character_set_amount = #character_set
    local number_one = 1
    local default_length = 10
    local random_string = {}

    for int = number_one, length or default_length do
        local random_number = math_random(number_one, character_set_amount)
        local character = string_sub(character_set, random_number, random_number)

        random_string[#random_string + number_one] = character
    end

    return table_concat(random_string)
end

return helpers

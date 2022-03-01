---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by moqi.
--- DateTime: 2022/2/28 19:42
---

local list = { 1, 60, 0,
               5, 300, 10,
               10, 600, 60,
               20, 0, 1800 }

local threshold_map, fail_map, cooldown_map = {}, {}, {}

for index, value in ipairs(list) do
    if index % 3 == 1 then
        print("aaa:", index, value)
        threshold_map[math.ceil(index / 3)] = value
        fail_map[value] = list[index + 1]
        cooldown_map[value] = list[index + 2]
    end
end

print('------------------')
for i, v in pairs(threshold_map) do
    print(i, v)
end

print('------------------')
for i, v in pairs(fail_map) do
    print(i, v)
end

print('------------------')
for i, v in pairs(cooldown_map) do
    print(i, v)
end

print('------------------')

local fail_count = 1
local fail_ttl = 999

print('------------------')

for i, v in pairs(threshold_map) do
    print(i, v)
    if fail_count == v then
        print('fail_count =' .. v)
        print('expire fail key' .. fail_map[v] .. 'seconds')
        print('expire cooldown key' .. cooldown_map[v] .. 'seconds')
        break
    end
end

print('------------------')

return { fail_count, fail_ttl }

repeat task.wait() until game:IsLoaded()

local function isAdonisAC(table) -- stupid check
	return rawget(table, "Detected") and typeof(rawget(table, "Detected")) == "function" and rawget(table, "RLocked")
end

warn("------------------------------")

for _, v in next, getgc(true) do
	if typeof(v) == "table" and isAdonisAC(v) then
		-- warn(warn, "founded")
		for i, v in next, v do
			warn(print, i, typeof(v))
			if rawequal(i, "Detected") then
				-- warn(warn, "^^^^^^^")
				local old;
				old = hookfunction(v, function(action, info, nocrash)
					if rawequal(action, "_") and rawequal(info, "_") and rawequal(nocrash, true) then
						-- warn("checkup")
						return old(action, info, nocrash)
					end
					-- warn(warn, "detected for :", action, info, nocrash)
					return task.wait(9e9)
				end)
				warn("bypassed adonis ac")
                break
			end
		end
	end
end

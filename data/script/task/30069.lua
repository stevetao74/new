--任务追踪
RoleTaskInfo30069 = {}
--function RoleTaskInfo30069:GetTaskIntroText(uid)
-- local msg = [[title(命运大厅)body(blankline()   在goto(129,118)处支付100文绑银即可进入命运大厅。blankline()   每天可进入2次。blankline()moneyticket(大量)exp(大量)item(26102,0,0))]]

--msg = parseToDesc(msg)
--return msg
--end


function RoleTaskInfo30069:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 30069)
	--dayNum
	table.insert(outvec, 3)
	--dayDoneNum
	table.insert(outvec, s_getVar(uid,101,43))
	--weekNum
	table.insert(outvec, 6)
	--weekDoneNum
	table.insert(outvec, s_getVar(uid,101,44))
end

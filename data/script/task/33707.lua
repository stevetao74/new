--袭击特勤机甲
RoleTaskInfo33707 = {}
function RoleTaskInfo33707:GetCorpsTaskWeekInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 33707)
	--doneNum
	local corps = s_getCorpsId(uid)
	if corps == nil or corps == 0 then
		table.insert(outvec, 0)
	else
		table.insert(outvec,s_getCorpsVar(corps,1,50))
	end
	--totalNum
	table.insert(outvec, CORPS_ACTIVITY_33707)
	--joinNum
	table.insert(outvec, s_getVar(uid,130,8))
end

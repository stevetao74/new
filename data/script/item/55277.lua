--意大利时装礼包
function OnUseItemEvent_55277(uid,thisid)
	if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_55277") ~= VALUE_OK then
		return VALUE_FAIL
	end
	local sex = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SEX)
	if sex == 1 then
		s_addItem(uid,20212,3,1,1,"7-3,1-1,3-604800","意大利球队时装男")
	else
		s_addItem(uid,20228,3,1,1,"7-3,1-1,3-604800","意大利球队时装女")
	end
	return VALUE_OK
end


--花仙（女）召唤器
function OnUseItemEvent_31283(uid,thisid)
	if s_deleteItemByThisID(uid,thisid,1,"使用扣除") ~= VALUE_OK then
		return VALUE_FAIL
	end
	local itemid = s_addItem(uid,41645,0,1,0,"","OnUseItemEvent_31283")
	if itemid == nil then
		itemid = 0
	end
	ShowUserDemonSfx(uid,29,itemid)
	return VALUE_OK
end
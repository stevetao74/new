--超级生命精华-圣
function OnUseItemEvent_26156(userid,thisid,targetid)
	local hp = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HP)
	local maxhp = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXHP)
	if hp == maxhp then
		return VALUE_FAIL
	end
	local add = GetCureHp(userid,20000)
	if add + hp > maxhp then
		add = maxhp - hp
	end
	local count = s_getItemValue(userid,thisid,Item_Attribute_UseCount)
	if count == 319 then
		if s_deleteItemByBaseID(userid,26156,1,"OnUseItemEvent_26156") ~= VALUE_OK then
			return VALUE_FAIL
		end
		s_setItemValue(userid,thisid,Item_Attribute_UseCount,0)
		s_refreshItem(userid,thisid)
	else
		s_setItemValue(userid,thisid,Item_Attribute_UseCount,count + 1)
		s_refreshItem(userid,thisid)
	end
	s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HP,add)
	return VALUE_OK
end

--高级生命精华大
function OnUseItemEvent_26147(userid,thisid,targetid)
	local hp = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HP)
	local maxhp = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXHP)
	if hp == maxhp then
		return VALUE_FAIL
	end
	local add = GetCureHp(userid,5000)
	if add + hp > maxhp then
		add = maxhp - hp
	end
	local count = s_getItemValue(userid,thisid,Item_Attribute_UseCount)
	if count == 79 then
		if s_deleteItemByBaseID(userid,26147,1,"OnUseItemEvent_26147") ~= VALUE_OK then
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

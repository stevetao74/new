
--增加生命值上限

function OnHoldEvent_42(etype,eid,pid,ptype,param1,param2,param3)
	s_debug("-------------ID=42,增加生命值上限=%d=%d=%d------------------",param1,param2,param3) 
	if param1 >= 0 then
		s_addValue(etype,eid,VALUE_TYPE_MAXHP_ADD_EXT,param1)
	else
		s_subValue(etype,eid,VALUE_TYPE_MAXHP_SUB_EXT,math.abs(param1))
	end
end
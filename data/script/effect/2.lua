
--增加体质点数

function OnHoldEvent_2(etype,eid,pid,ptype,param1,param2,param3)
	s_debug("-------------ID=2,增加体质点数=%d=%d=%d------------------",param1,param2,param3) 
	if param1 >= 0 then
		s_addValue(etype,eid,VALUE_TYPE_TIZHI_ADD_EXT,param1)
	else
		s_subValue(etype,eid,VALUE_TYPE_TIZHI_SUB_EXT,math.abs(param1))
	end
end
--升级宝石箱子
function OnUseItemEvent_31174(uid,thisid)
	s_deleteItemByThisID(uid,thisid,1,"使用扣除")
	s_addItem(uid,27108,0,5,0,"1-1","开宝石箱子所得")
	return VALUE_OK
end
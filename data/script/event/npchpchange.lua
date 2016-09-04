--怪物血量变化事件
--检查是否触发减少n%血量事件，单次触发
function CheckHpSubEvent(npcid,percent,originhp,curhp)
	if curhp == 0 then
		return VALUE_FAIL
	end
	local maxhp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP)
	local limit = maxhp - math.floor(maxhp * percent /100);
	if originhp ~= curhp then
		if originhp > limit and curhp <= limit then return VALUE_OK end
	end
	return VALUE_FAIL
end
--检查是否触发每减少n%血量事件，多次触发
function CheckHpSubPerEvent(npcid,percent,originhp,curhp)
	if curhp == 0 then
		return VALUE_FAIL
	end
	local maxhp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP)
	local limit1 = 0
	local limit2 = 0
	local limit = maxhp
	while limit1 == 0 or limit2 == 0 do
		if limit < curhp and limit1 == 0 then
			limit1 = limit
		end
		if limit < originhp and limit2 == 0 then
			limit2 = limit
		end
		if limit > math.floor(maxhp * percent /100) then
			limit = limit - math.floor(maxhp * percent /100)
		else
			limit = 0
		end
		if limit == 0 then
			break
		end
	end
	if limit1 ~= limit2 then
		return VALUE_OK
	end
	return VALUE_FAIL
end
-------------------------------------------------------------------------------------------
--抵抗军士兵罗西
function OnNpcHpChange_60059(npcid,originhp,curhp)
	local maxhp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP)
	if curhp*100 / maxhp <= 50 then
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP,maxhp)
	end
end
-- 军战将军
function OnNpcHpChange_60117(npcid, originhp, curhp)
	if CheckHpSubPerEvent(npcid,10,originhp,curhp) ~= VALUE_OK then
		return
	end
	local sid = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_SCENE_ID)
	local maxhp = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_MAXHP)
	if sid > 0 and maxhp > 0 then
		local armyid = s_getSceneVar(sid,0, ArBattle_RedID)
		local list = s_getArmyEntry(armyid)
		local per = math.floor((curhp * 100.0)/ maxhp)
		local str = "本方守卫将军正在遭受攻击,受损程度" .. per .. "％"
		for i = 1, #list do
			s_sysInfo(list[i], str, ChatPos_Sys + ChatPos_Important)
		end
	end
end
function OnNpcHpChange_60118(npcid, originhp, curhp)
	if CheckHpSubPerEvent(npcid,10,originhp,curhp) ~= VALUE_OK then
		return
	end
	local sid = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_SCENE_ID)
	local maxhp = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_MAXHP)
	if sid > 0 and maxhp > 0 then
		local armyid = s_getSceneVar(sid,0, ArBattle_BlueID)
		local list = s_getArmyEntry(armyid)
		local per = math.floor((curhp * 100.0)/ maxhp)
		local str = "本方守卫将军正在遭受攻击,受损程度" .. per .. "％"
		for i = 1, #list do
			s_sysInfo(list[i], str, ChatPos_Sys + ChatPos_Important)
		end
	end
end
-------------------------------------------------------------------------------------------
--扑克怪
local puke_fun = [[
function OnNpcHpChange_$1(npcid, originhp, curhp)
	local curhp = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_HP)
	local maxhp = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_MAXHP)
	if curhp / maxhp < 100 then
		if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20109) == 0 then
			s_addbuff(SCENE_ENTRY_NPC,npcid,20109,1,5*60)
		end
	end
end
]]
for i = 22901,22913 do
	RegistetFunction(FormatString(puke_fun,i))
end
-------------------------------------------------------------------------------------------
--团突袭破坏
function OnNpcHpChange_45001(npcid, originhp, curhp)
	if CheckHpSubPerEvent(npcid,5,originhp,curhp) ~= VALUE_OK then
		return
	end
	JunXunTask_NpcHpNotify(npcid,curhp, 1)
end
function OnNpcHpChange_45012(npcid, originhp, curhp)
	if CheckHpSubPerEvent(npcid,5,originhp,curhp) ~= VALUE_OK then
		return
	end
	JunXunTask_NpcHpNotify(npcid,curhp, 1)
end
function OnNpcHpChange_45013(npcid, originhp, curhp)
	if CheckHpSubPerEvent(npcid,5,originhp,curhp) ~= VALUE_OK then
		return
	end
	JunXunTask_NpcHpNotify(npcid,curhp, 1)
end
function OnNpcHpChange_45014(npcid, originhp, curhp)
	if CheckHpSubPerEvent(npcid,5,originhp,curhp) ~= VALUE_OK then
		return
	end
	JunXunTask_NpcHpNotify(npcid,curhp, 1)
end
function OnNpcHpChange_45015(npcid, originhp, curhp)
	if CheckHpSubPerEvent(npcid,5,originhp,curhp) ~= VALUE_OK then
		return
	end
	JunXunTask_NpcHpNotify(npcid,curhp, 1)
end
function OnNpcHpChange_45016(npcid, originhp, curhp)
	if CheckHpSubPerEvent(npcid,5,originhp,curhp) ~= VALUE_OK then
		return
	end
	JunXunTask_NpcHpNotify(npcid,curhp, 1)
end
function OnNpcHpChange_45002(npcid, originhp, curhp)
	if CheckHpSubPerEvent(npcid,5,originhp,curhp) ~= VALUE_OK then
		return
	end
	JunXunTask_NpcHpNotify(npcid,curhp, 2)
end
function OnNpcHpChange_45005(npcid, originhp, curhp)
	if CheckHpSubPerEvent(npcid,5,originhp,curhp) ~= VALUE_OK then
		return
	end
	JunXunTask_NpcHpNotify(npcid,curhp, 3)
end
-------------------------------------------------------------------------------------------
--边境守卫者
function OnNpcHpChange_60182(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local country = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_COUNTRY)
	if country == 0 then
		country = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_COUNTRY)
	end
	local etype,eid,lock = s_getEnemy(npcid)
	local ecountry = 0
	if etype == SCENE_ENTRY_PLAYER then
		ecountry = s_getValue(etype,eid,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国占领NPC")
			return
		end
	elseif etype == SCENE_ENTRY_NPC then
		local master = s_getValue(etype,eid,VALUE_TYPE_MASTER)
		ecountry = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国占领NPC")
			return
		end
	end
	local show = VALUE_FAIL
	if CheckHpSubPerEvent(npcid,20,originhp,curhp) == VALUE_OK then
		show = VALUE_OK
	end
	local maxhp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP)
	local per = math.floor((curhp * 100.0)/ maxhp)
	if per >= 80 then
		per = 80
	elseif per < 80 and per > 70 then
		per = 80
	elseif per >= 60 then
		per = 60
	elseif per < 60 and per > 50 then
		per = 60
	elseif per >= 40 then
		per = 40
	elseif per < 40 and per > 30 then
		per = 40
	elseif per >= 20 then
		per = 20
	elseif per < 20 and per > 10 then
		per = 20
	end
	if show == VALUE_OK and curhp ~= 0 then
		s_countryInfo(country,"目前我方的边境战神还有"..per.."%的血，请大家快去守卫，不然就要被对方占领了。",ChatPos_Sys)
		s_countryInfo(ecountry,"目前边境战神还有"..per.."%的血，请大家继续努力，马上就可以占领该边境战神了。",ChatPos_Sys)
	end
end
-------------------------------------------------------------------------------------------
--外城守卫
function OnNpcHpChange_22945(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local country = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_COUNTRY)
	if country == 0 then
		country = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_COUNTRY)
	end
	local etype,eid,lock = s_getEnemy(npcid)
	local ecountry = 0
	if etype == SCENE_ENTRY_PLAYER then
		ecountry = s_getValue(etype,eid,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国占领NPC")
			return
		end
	elseif etype == SCENE_ENTRY_NPC then
		local master = s_getValue(etype,eid,VALUE_TYPE_MASTER)
		ecountry = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国占领NPC")
			return
		end
	end
	local show = VALUE_FAIL
	if CheckHpSubPerEvent(npcid,20,originhp,curhp) == VALUE_OK then
		show = VALUE_OK
	end
	local maxhp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP)
	local per = math.floor((curhp * 100.0)/ maxhp)
	if per >= 80 then
		per = 80
	elseif per < 80 and per > 70 then
		per = 80
	elseif per >= 60 then
		per = 60
	elseif per < 60 and per > 50 then
		per = 60
	elseif per >= 40 then
		per = 40
	elseif per < 40 and per > 30 then
		per = 40
	elseif per >= 20 then
		per = 20
	elseif per < 20 and per > 10 then
		per = 20
	end
	if show == VALUE_OK and curhp ~= 0 then
		s_countryInfo(country,"目前我方的外城守卫还有"..per.."%的血，请大家快去守卫，不然就要被对方占领了。",ChatPos_Sys)
		s_countryInfo(ecountry,"目前外城守卫还有"..per.."%的血，请大家继续努力，马上就可以占领该外城守卫了。",ChatPos_Sys)
	end
end
-------------------------------------------------------------------------------------------
--内城守卫
function OnNpcHpChange_22946(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local country = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_COUNTRY)
	if country == 0 then
		country = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_COUNTRY)
	end
	local etype,eid,lock = s_getEnemy(npcid)
	local ecountry = 0
	if etype == SCENE_ENTRY_PLAYER then
		ecountry = s_getValue(etype,eid,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国占领NPC")
			return
		end
	elseif etype == SCENE_ENTRY_NPC then
		local master = s_getValue(etype,eid,VALUE_TYPE_MASTER)
		ecountry = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国占领NPC")
			return
		end
	end
	local show = VALUE_FAIL
	if CheckHpSubPerEvent(npcid,20,originhp,curhp) == VALUE_OK then
		show = VALUE_OK
	end
	local maxhp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP)
	local per = math.floor((curhp * 100.0)/ maxhp)
	if per >= 80 then
		per = 80
	elseif per < 80 and per > 70 then
		per = 80
	elseif per >= 60 then
		per = 60
	elseif per < 60 and per > 50 then
		per = 60
	elseif per >= 40 then
		per = 40
	elseif per < 40 and per > 30 then
		per = 40
	elseif per >= 20 then
		per = 20
	elseif per < 20 and per > 10 then
		per = 20
	end
	local curcountry = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_COUNTRY)
	if show == VALUE_OK and curhp ~= 0 then
		s_setCountryWarVal(Country_War_Inner_Life_Num, per, curcountry)
		s_countryInfo(country,"目前我方的魔神将军还有"..per.."%的血，请大家快去守卫，不然就要被攻方击倒了！",ChatPos_Sys+ChatPos_Important)
		s_countryInfo(ecountry,"目前魔神将军还有"..per.."%的生命，请大家继续努力，马上就可以击倒它了！。",ChatPos_Sys+ChatPos_Important)
	end
end
-------------------------------------------------------------------------------------------
--天象祭坛
function OnNpcHpChange_22947(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local country = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_COUNTRY)
	local etype,eid,lock = s_getEnemy(npcid)
	local ecountry = 0
	if etype == SCENE_ENTRY_PLAYER then
		ecountry = s_getValue(etype,eid,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国占领NPC")
			return
		end
	elseif etype == SCENE_ENTRY_NPC then
		local master = s_getValue(etype,eid,VALUE_TYPE_MASTER)
		ecountry = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国占领NPC")
			return
		end
	end
	local show = VALUE_FAIL
	if CheckHpSubPerEvent(npcid,20,originhp,curhp) == VALUE_OK then
		show = VALUE_OK
	end
	local maxhp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP)
	local per = math.floor((curhp * 100.0)/ maxhp)
	if per >= 80 then
		per = 80
	elseif per < 80 and per > 70 then
		per = 80
	elseif per >= 60 then
		per = 60
	elseif per < 60 and per > 50 then
		per = 60
	elseif per >= 40 then
		per = 40
	elseif per < 40 and per > 30 then
		per = 40
	elseif per >= 20 then
		per = 20
	elseif per < 20 and per > 10 then
		per = 20
	end
	local curcountry = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_COUNTRY)
	if show == VALUE_OK and curhp ~= 0 then
		s_setCountryWarVal(Country_War_Alter_Life_Num, per, curcountry)
		s_countryInfo(country,"目前我方的天象祭坛还有"..per.."%的血，请大家快去守卫，不然就要被对方攻破了。",ChatPos_Sys)
		s_countryInfo(ecountry,"目前天象祭坛还有"..per.."%的血，请大家继续努力，马上就可以破坏它了。",ChatPos_Sys)
	end
end
--霸者雕像
function OnNpcHpChange_22948(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local country = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_COUNTRY)
	local etype,eid,lock = s_getEnemy(npcid)
	local ecountry = 0
	if etype == SCENE_ENTRY_PLAYER then
		ecountry = s_getValue(etype,eid,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国占领NPC")
			return
		end
	elseif etype == SCENE_ENTRY_NPC then
		local master = s_getValue(etype,eid,VALUE_TYPE_MASTER)
		ecountry = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国占领NPC")
			return
		end
	end
	local show = VALUE_FAIL
	if CheckHpSubPerEvent(npcid,20,originhp,curhp) == VALUE_OK then
		show = VALUE_OK
	end
	local maxhp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP)
	local per = math.floor((curhp * 100.0)/ maxhp)
	if per >= 80 then
		per = 80
	elseif per < 80 and per > 70 then
		per = 80
	elseif per >= 60 then
		per = 60
	elseif per < 60 and per > 50 then
		per = 60
	elseif per >= 40 then
		per = 40
	elseif per < 40 and per > 30 then
		per = 40
	elseif per >= 20 then
		per = 20
	elseif per < 20 and per > 10 then
		per = 20
	end
	local curcountry = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_COUNTRY)
	if show == VALUE_OK and curhp ~= 0 then
		s_setCountryWarVal(Country_War_Statue_Life_Num, per, curcountry)
		s_countryInfo(country,"目前我方的霸者雕像还有"..per.."%的血，请大家快去守卫，不然就要被对方攻破了。",ChatPos_Sys+ChatPos_Important)
		s_countryInfo(ecountry,"目前霸者雕像还有"..per.."%的血，请大家继续努力，马上就可以破坏它了。",ChatPos_Sys+ChatPos_Important)
	end
end
--破损的天象祭坛
function OnNpcHpChange_60595(npcid, originhp, curhp)
	if originhp > curhp then
		return
	end
	local curcountry = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_COUNTRY)
	local maxhp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP)
	if curhp == maxhp then
		local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
		s_clearNpc(npcid)
		s_sysSummon(22947,cid,478,571,1033)
		s_addCountryVar(curcountry,1,42,0)
		s_setCountryWarVal(Country_War_Alter_Life_Num, 100, curcountry)
	end
end
--毁灭神迹
function OnNpcHpChange_5086(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local curcountry = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_COUNTRY)
	if CheckHpSubEvent(npcid,1,originhp,curhp) == VALUE_OK then
		s_countryInfo(curcountry,"<p><n>【系】我国的</n><book bookid='70156' text='[神迹]'/><goto mapid=\"5\" x=\"445\" y=\"715\" cid=\"15\" flagpoint=\"0\" /><n>正在被攻击，目前还有99%的血，请国民快去守卫。</n><book bookid='70156' text='[神>迹]'/></p>",ChatPos_Sys+ChatPos_Important)
	end
	if CheckHpSubPerEvent(npcid,10,originhp,curhp) == VALUE_OK then
		local maxhp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP)
		local per = math.floor((curhp * 100.0)/ maxhp)
		s_countryInfo(curcountry,"<p><n>【系】我国的</n><book bookid='70156' text='[神迹]'/><goto mapid=\"5\" x=\"445\" y=\"715\" cid=\"15\" flagpoint=\"0\" /><n>正在被攻击，目前还有"..per.."</n><n>%的血，请国民快去守卫。</n><book bookid='70156' text='[神迹]'/></p>",ChatPos_Sys+ChatPos_Important)
	end
	if CheckHpSubEvent(npcid,50,originhp,curhp) == VALUE_OK then
		if s_getCountryVar(curcountry,1,109) >= 6 then
			return
		end
		local sid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
		local x = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
		local y = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
		local msg = "国王军的诸位英雄：贵国的神迹正在被进攻，国王陛下很可能会遭受羞辱，是否前往救援？"
		local king = s_getCountryField(curcountry,CountryVar_Marshal)
		if king ~= 0 and king ~= nil then
			local army = s_getArmyID(king)
			if army ~= 0 and army ~= nil then
				s_sysCallUp(Relation_Army,army,sid,x,y,msg,2,king)
				s_addCountryVar(curcountry,1,109,s_getCountryVar(curcountry,1,109)+1)
			end
		end
	end
	if CheckHpSubEvent(npcid,75,originhp,curhp) == VALUE_OK then
		if s_getCountryVar(curcountry,1,109) >= 6 then
			return
		end
		local sid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
		local x = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
		local y = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
		local msg = "国王军的诸位英雄：贵国的神迹正在被进攻，国王陛下很可能会遭受羞辱，是否前往救援？"
		local king = s_getCountryField(curcountry,CountryVar_Marshal)
		if king ~= 0 and king ~= nil then
			local army = s_getArmyID(king)
			if army ~= 0 and army ~= nil then
				s_sysCallUp(Relation_Army,army,sid,x,y,msg,2,king)
				s_addCountryVar(curcountry,1,109,s_getCountryVar(curcountry,1,109)+1)
			end
		end
	end
end

---帝皇雕像
function OnNpcHpChange_5090(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local occupy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_CORPS)
	if occupy == 0 then return end
	if CheckHpSubEvent(npcid,20,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩80%血量，请速速救援！",ChatPos_Sys+ChatPos_Important)
	end
	if CheckHpSubEvent(npcid,50,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩50%血量，请速速救援！",ChatPos_Sys+ChatPos_Important)
	end
	if CheckHpSubEvent(npcid,90,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩10%血量，请火速救援！",ChatPos_Sys+ChatPos_Important)
	end
end

function OnNpcHpChange_5091(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local occupy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_CORPS)
	if occupy == 0 then return end
	if CheckHpSubEvent(npcid,20,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩80%血量，请速速救援！",ChatPos_Sys+ChatPos_Important)
	end
	if CheckHpSubEvent(npcid,50,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩50%血量，请速速救援！",ChatPos_Sys+ChatPos_Important)
	end
	if CheckHpSubEvent(npcid,90,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩10%血量，请火速救援！",ChatPos_Sys+ChatPos_Important)
	end
end

function OnNpcHpChange_5092(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local occupy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_CORPS)
	if occupy == 0 then return end
	if CheckHpSubEvent(npcid,20,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩80%血量，请速速救援！",ChatPos_Sys+ChatPos_Important)
	end
	if CheckHpSubEvent(npcid,50,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩50%血量，请速速救援！",ChatPos_Sys+ChatPos_Important)
	end
	if CheckHpSubEvent(npcid,90,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩10%血量，请火速救援！",ChatPos_Sys+ChatPos_Important)
	end
end

function OnNpcHpChange_5093(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local occupy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_CORPS)
	if occupy == 0 then return end
	if CheckHpSubEvent(npcid,20,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩80%血量，请速速救援！",ChatPos_Sys+ChatPos_Important)
	end
	if CheckHpSubEvent(npcid,50,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩50%血量，请速速救援！",ChatPos_Sys+ChatPos_Important)
	end
	if CheckHpSubEvent(npcid,90,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩10%血量，请火速救援！",ChatPos_Sys+ChatPos_Important)
	end
end

function OnNpcHpChange_5094(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local occupy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_CORPS)
	if occupy == 0 then return end
	if CheckHpSubEvent(npcid,20,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩80%血量，请速速救援！",ChatPos_Sys+ChatPos_Important)
	end
	if CheckHpSubEvent(npcid,50,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩50%血量，请速速救援！",ChatPos_Sys+ChatPos_Important)
	end
	if CheckHpSubEvent(npcid,90,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩10%血量，请火速救援！",ChatPos_Sys+ChatPos_Important)
	end
end

function OnNpcHpChange_5095(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local occupy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_CORPS)
	if occupy == 0 then return end
	if CheckHpSubEvent(npcid,20,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩80%血量，请速速救援！",ChatPos_Sys+ChatPos_Important)
	end
	if CheckHpSubEvent(npcid,50,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩50%血量，请速速救援！",ChatPos_Sys+ChatPos_Important)
	end
	if CheckHpSubEvent(npcid,90,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩10%血量，请火速救援！",ChatPos_Sys+ChatPos_Important)
	end
end

function OnNpcHpChange_5096(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local occupy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_CORPS)
	if occupy == 0 then return end
	if CheckHpSubEvent(npcid,20,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩80%血量，请速速救援！",ChatPos_Sys+ChatPos_Important)
	end
	if CheckHpSubEvent(npcid,50,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩50%血量，请速速救援！",ChatPos_Sys+ChatPos_Important)
	end
	if CheckHpSubEvent(npcid,90,originhp,curhp) == VALUE_OK then
		s_corpsInfo(occupy,"本团的神像正在遭受攻击，还剩10%血量，请火速救援！",ChatPos_Sys+ChatPos_Important)
	end
end

function OnNpcHpChange_60890(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
	if CheckHpSubEvent(npcid,20,originhp,curhp) == VALUE_OK then
		CopySceneInfo_73:SendGroupInfo(2,cid,"西门守将诗蔻迪与敌军发生激战，剩余生命80%，急需支援！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(1,cid,"我军突击西门，与守将诗蔻迪发生激战，其剩余生命80%，请继续加强攻击！",ChatPos_Sys)
	end
	if CheckHpSubEvent(npcid,25,originhp,curhp) == VALUE_OK then
		s_setSceneVar(cid,0,102,75)
		CopySceneInfo_73:SendCopyInfo(cid,0,1,75)
	end
	if CheckHpSubEvent(npcid,50,originhp,curhp) == VALUE_OK then
		CopySceneInfo_73:SendGroupInfo(2,cid,"西门守将诗蔻迪与敌军发生激战，剩余生命50%，急需支援！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(1,cid,"我军突击西门，与守将诗蔻迪发生激战，其剩余生命50%，请继续加强攻击！",ChatPos_Sys)
		s_setSceneVar(cid,0,102,50)
		CopySceneInfo_73:SendCopyInfo(cid,0,1,50)
	end
	if CheckHpSubEvent(npcid,75,originhp,curhp) == VALUE_OK then
		s_setSceneVar(cid,0,102,25)
		CopySceneInfo_73:SendCopyInfo(cid,0,1,25)
	end
	if CheckHpSubEvent(npcid,80,originhp,curhp) == VALUE_OK then
		CopySceneInfo_73:SendGroupInfo(2,cid,"西门守将诗蔻迪与敌军发生激战，剩余生命20%，急需支援！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(1,cid,"我军突击西门，与守将诗蔻迪发生激战，其剩余生命20%，请继续加强攻击！",ChatPos_Sys)
	end
end

function OnNpcHpChange_60891(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
	if CheckHpSubEvent(npcid,20,originhp,curhp) == VALUE_OK then
		CopySceneInfo_73:SendGroupInfo(2,cid,"南门守将贝露丹迪与敌军发生激战，剩余生命80%，急需支援！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(1,cid,"我军突击南门，与守将贝露丹迪发生激战，其剩余生命80%，请继续加强攻击！",ChatPos_Sys)
	end
	if CheckHpSubEvent(npcid,25,originhp,curhp) == VALUE_OK then
		s_setSceneVar(cid,0,103,75)
		CopySceneInfo_73:SendCopyInfo(cid,0,2,75)
	end
	if CheckHpSubEvent(npcid,50,originhp,curhp) == VALUE_OK then
		CopySceneInfo_73:SendGroupInfo(2,cid,"南门守将贝露丹迪与敌军发生激战，剩余生命50%，急需支援！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(1,cid,"我军突击南门，与守将贝露丹迪发生激战，其剩余生命50%，请继续加强攻击！",ChatPos_Sys)
		s_setSceneVar(cid,0,103,50)
		CopySceneInfo_73:SendCopyInfo(cid,0,2,50)
	end
	if CheckHpSubEvent(npcid,75,originhp,curhp) == VALUE_OK then
		s_setSceneVar(cid,0,103,25)
		CopySceneInfo_73:SendCopyInfo(cid,0,2,25)
	end
	if CheckHpSubEvent(npcid,80,originhp,curhp) == VALUE_OK then
		CopySceneInfo_73:SendGroupInfo(2,cid,"南门守将贝露丹迪与敌军发生激战，剩余生命20%，急需支援！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(1,cid,"我军突击南门，与守将贝露丹迪发生激战，其剩余生命20%，请继续加强攻击！",ChatPos_Sys)
	end
end

function OnNpcHpChange_60892(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
	if CheckHpSubEvent(npcid,20,originhp,curhp) == VALUE_OK then
		CopySceneInfo_73:SendGroupInfo(2,cid,"东门守将兀尔德与敌军发生激战，剩余生命80%，急需支援！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(1,cid,"我军突击东门，与守将兀尔德发生激战，其剩余生命80%，请继续加强攻击！",ChatPos_Sys)
	end
	if CheckHpSubEvent(npcid,25,originhp,curhp) == VALUE_OK then
		s_setSceneVar(cid,0,104,75)
		CopySceneInfo_73:SendCopyInfo(cid,0,3,75)
	end
	if CheckHpSubEvent(npcid,50,originhp,curhp) == VALUE_OK then
		CopySceneInfo_73:SendGroupInfo(2,cid,"东门守将兀尔德与敌军发生激战，剩余生命50%，急需支援！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(1,cid,"我军突击东门，与守将兀尔德发生激战，其剩余生命50%，请继续加强攻击！",ChatPos_Sys)
		s_setSceneVar(cid,0,104,50)
		CopySceneInfo_73:SendCopyInfo(cid,0,3,50)
	end
	if CheckHpSubEvent(npcid,75,originhp,curhp) == VALUE_OK then
		s_setSceneVar(cid,0,104,25)
		CopySceneInfo_73:SendCopyInfo(cid,0,3,25)
	end
	if CheckHpSubEvent(npcid,80,originhp,curhp) == VALUE_OK then
		CopySceneInfo_73:SendGroupInfo(2,cid,"东门守将兀尔德与敌军发生激战，剩余生命20%，急需支援！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(1,cid,"我军突击东门，与守将兀尔德发生激战，其剩余生命20%，请继续加强攻击！",ChatPos_Sys)
	end
end

function OnNpcHpChange_60893(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
	if CheckHpSubEvent(npcid,20,originhp,curhp) == VALUE_OK then
		CopySceneInfo_73:SendGroupInfo(1,cid,"敌方的女武神剩余生命80%，请诸将加强攻击，击倒后将获得城内复活点！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(2,cid,"我方的女武神剩余生命80%，请协助她保护帝都内城！",ChatPos_Sys)
	end
	if CheckHpSubEvent(npcid,25,originhp,curhp) == VALUE_OK then
		s_setSceneVar(cid,0,105,75)
		CopySceneInfo_73:SendCopyInfo(cid,0,4,75)
	end
	if CheckHpSubEvent(npcid,50,originhp,curhp) == VALUE_OK then
		CopySceneInfo_73:SendGroupInfo(1,cid,"敌方的女武神剩余生命50%，请诸将加强攻击，击倒后将获得城内复活点！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(2,cid,"我方的女武神剩余生命50%，请协助她保护帝都内城！",ChatPos_Sys)
		s_setSceneVar(cid,0,105,50)
		CopySceneInfo_73:SendCopyInfo(cid,0,4,50)
	end
	if CheckHpSubEvent(npcid,75,originhp,curhp) == VALUE_OK then
		s_setSceneVar(cid,0,105,25)
		CopySceneInfo_73:SendCopyInfo(cid,0,4,25)
	end
	if CheckHpSubEvent(npcid,80,originhp,curhp) == VALUE_OK then
		CopySceneInfo_73:SendGroupInfo(1,cid,"敌方的女武神剩余生命20%，请诸将加强攻击，击倒后将获得城内复活点！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(2,cid,"我方的女武神剩余生命20%，请协助她保护帝都内城！",ChatPos_Sys)
	end
end

function OnNpcHpChange_60894(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
	if CheckHpSubEvent(npcid,20,originhp,curhp) == VALUE_OK then
		CopySceneInfo_73:SendGroupInfo(1,cid,"敌方帝皇雕像剩余生命80%，请加强攻击，击破后将获得象征帝权的权杖！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(2,cid,"我方帝皇雕像剩余生命80%，请速度增援！（若被击破，象征帝权的权杖将落入敌人之手！）",ChatPos_Sys)
	end
	if CheckHpSubEvent(npcid,25,originhp,curhp) == VALUE_OK then
		s_setSceneVar(cid,0,106,75)
		CopySceneInfo_73:SendCopyInfo(cid,0,5,75)
	end
	if CheckHpSubEvent(npcid,50,originhp,curhp) == VALUE_OK then
		CopySceneInfo_73:SendGroupInfo(1,cid,"敌方帝皇雕像剩余生命50%，请加强攻击，击破后将获得象征帝权的权杖！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(2,cid,"我方帝皇雕像剩余生命50%，请速度增援！（若被击破，象征帝权的权杖将落入敌人之手！）",ChatPos_Sys)
		s_setSceneVar(cid,0,106,50)
		CopySceneInfo_73:SendCopyInfo(cid,0,5,50)
	end
	if CheckHpSubEvent(npcid,75,originhp,curhp) == VALUE_OK then
		s_setSceneVar(cid,0,106,25)
		CopySceneInfo_73:SendCopyInfo(cid,0,5,25)
	end
	if CheckHpSubEvent(npcid,80,originhp,curhp) == VALUE_OK then
		CopySceneInfo_73:SendGroupInfo(1,cid,"敌方帝皇雕像剩余生命20%，请加强攻击，击破后将获得象征帝权的权杖！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(2,cid,"我方帝皇雕像剩余生命20%，请速度增援！（若被击破，象征帝权的权杖将落入敌人之手！）",ChatPos_Sys)
	end
end

function OnNpcHpChange_60971(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local master = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER)
	local sid = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_SCENE_ID)
	local x = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_POSX)
	local y = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_POSY)
	local corps = s_getCorpsId(master)
	if corps == 0 then return end
	if CheckHpSubEvent(npcid,1,originhp,curhp) == VALUE_OK then
		s_sysCallUp(Relation_Corps,corps,sid,x,y,"贵团保护的特使正被袭击，是否立即前往救援？",2,master)
	end
	if CheckHpSubEvent(npcid,40,originhp,curhp) == VALUE_OK then
		s_sysCallUp(Relation_Corps,corps,sid,x,y,"贵团保护的特使正被袭击，是否立即前往救援？",2,master)
	end
	if CheckHpSubEvent(npcid,70,originhp,curhp) == VALUE_OK then
		s_sysCallUp(Relation_Corps,corps,sid,x,y,"贵团保护的特使正被袭击，是否立即前往救援？",2,master)
	end
end
--王国金库
function OnNpcHpChange_60997(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local npcPosX = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
	local npcPosY = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
	local map = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_MAP)
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
	-- 金库所在国家id
	local country = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_COUNTRY)
	if country == 0 then
		country = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_COUNTRY)
	end

	-- 对本国发动金库奇袭的国家id
	local enemycountry = s_getCountryVar(country,1,116)
	if enemycountry == 0 or enemycountry == nil then
		return
	end
	local etype,eid,lock = s_getEnemy(npcid)
	local ecountry = 0
	if etype == SCENE_ENTRY_PLAYER then
		ecountry = s_getValue(etype,eid,VALUE_TYPE_HOMELAND)
		if ecountry == country  then
			s_sysInfo(eid, "不可攻击本国王国金库")
			return
		elseif ecountry ~= enemycountry then
			s_sysInfo(eid, "您所在的国家没有对当前国家金库发动奇袭！不可攻击当前国家金库！")
			return
		end
	elseif etype == SCENE_ENTRY_NPC then
		local master = s_getValue(etype,eid,VALUE_TYPE_MASTER)
		ecountry = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_HOMELAND)
		if ecountry == country then
			s_sysInfo(eid, "不可攻击本国王国金库")
			return
		elseif ecountry ~= enemycountry then
			s_sysInfo(eid, "您所在的国家没有对当前国家金库发动奇袭！不可攻击当前国家金库！")
			return
		end
	end

	if CheckHpSubEvent(npcid,10,originhp,curhp) == VALUE_OK then
		local msg = "我国金库正在被袭击，金库受损会使国家当日入库银币减少，是否立刻前往救援？"
		local list = s_getCountryEntry(country)
		s_registerGomapMsgBox(country,country,map,npcPosX,npcPosY,61,msg)

		local wage = s_getCountryField(country,CountryVar_TodayWage) + s_getCountryField(country,CountryVar_ExtWage)
		local moneyLose = math.floor(wage * (0.08))

		-- 本国当前被他国罗宾掠夺银币数量
		s_addCountryVar(country,1,118,s_getCountryVar(country,1,118) + moneyLose)
		-- 本国罗宾当前掠夺银币数量
		s_addCountryVar(enemycountry,1,117,s_getCountryVar(enemycountry,1,117) + moneyLose/2)

		-- 损失的银币一半以10银币卷的形式洒落
		for i = 1, moneyLose/40 do
			s_addSceneItem(5,2,cid,npcPosX,npcPosY,"")
		end
	end

	for i = 2, 9 do
		if CheckHpSubEvent(npcid,i * 10,originhp,curhp) == VALUE_OK then
			local wage = s_getCountryField(country,CountryVar_TodayWage) + s_getCountryField(country,CountryVar_ExtWage)
			local moneyLose = math.floor(wage * 0.08)

			-- 本国当前被他国罗宾掠夺银币数量
			s_addCountryVar(country,1,118,s_getCountryVar(country,1,118) + moneyLose)
			s_countryInfo(country,"我国金库被掠夺一部分银币，请加强保护，击退侠盗罗宾！",ChatPos_Important + ChatPos_Sys)
			-- 本国罗宾当前掠夺银币数量
			s_addCountryVar(enemycountry,1,117,s_getCountryVar(enemycountry,1,117) + moneyLose/2)
			s_countryInfo(enemycountry,"成功掠夺金库的一部分银币，一半当场嘉奖勇士，另半交由罗宾保管！",ChatPos_Important + ChatPos_Sys)
			-- 损失的银币一半以10银币卷的形式洒落
			for i = 1, moneyLose/40 do
				s_addSceneItem(5,2,cid,npcPosX,npcPosY)
			end
		end
	end

	if curhp == 0 then
		local wage = s_getCountryField(country,CountryVar_TodayWage) + s_getCountryField(country,CountryVar_ExtWage)
		local moneyLose = math.floor(wage * (0.28))

		-- 本国当前被他国罗宾掠夺银币数量
		s_addCountryVar(country,1,118,s_getCountryVar(country,1,118) + moneyLose)
		s_countryInfo(country,"<p><n color='GXColorBlueSky'>我国金库被掠夺一部分银币，请加强保护，击退侠盗罗宾！前往</n><goto mapid=\"5\" x=\"384\" y=\"727\" cid=\"15\" flagpoint=\"0\" /><n color='GXColorBlueSky'>救援！</n></p>",ChatPos_Important + ChatPos_Sys)
		-- 本国罗宾当前掠夺银币数量
		s_addCountryVar(enemycountry,1,117,s_getCountryVar(enemycountry,1,117) + moneyLose/2)
		s_countryInfo(enemycountry,"成功掠夺金库的一部分银币，一半当场嘉奖勇士，另半交由罗宾保管！",ChatPos_Important + ChatPos_Sys)
		-- 损失的银币一半以10银币卷的形式洒落
		for i = 1, moneyLose/80 do
			s_addSceneItem(5,4,cid,npcPosX,npcPosY)
		end
	end
end

function OnNpcHpChange_60995(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end

	local etype,eid,lock = s_getEnemy(npcid)
	local curCountry = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_COUNTRY)
	if curCountry ~= 0 and curCountry ~= nil then
		s_addCountryVar(curCountry,1,120,curhp)
	end
end

function OnDiDuGuardHpChange(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end

	local master = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER)
	if master == 0 or master == nil then
		return
	end

	local sid = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_SCENE_ID)
	local x = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
	local y = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
	local country = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_COUNTRY)
	local msg = "您协助的帝都押运车受到攻击，是否立刻前往救援？"
	local call = "DiDuGuardHelpUserAck($1,$2," .. npcid .. ")"
	local button = "确定|3|Enter|取消|4|Esc"
	if CheckHpSubEvent(npcid,1,originhp,curhp) == VALUE_OK then
		--30421任务变量20-24记录接任务时所在队伍的队员uid,30-34记录队员是否协助押运 0 未协助 1 协助
		for i = 30, 34 do
			if (s_getTaskVar(master,30421,i) == 1) then
				local helper = s_getTaskVar(master,30421,i-10)
				s_registerMsgBox(helper,call,button,msg,60)
			end
		end
	end
end

function DiDuGuardHelpUserAck(uid,result,npcid)
	if  npcid == nil or npcid == 0 then
		return
	end
	if result == Button_Yes then
		local country = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_COUNTRY)
		local map = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_MAP)
		local x = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
		local y = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
		s_gomap(uid,country,map,x,y,0,4)
	end
end

function OnNpcHpChange_56019(npcid, originhp, curhp) return OnDiDuGuardHpChange(npcid, originhp, curhp) end
function OnNpcHpChange_56020(npcid, originhp, curhp) return OnDiDuGuardHpChange(npcid, originhp, curhp) end
function OnNpcHpChange_56021(npcid, originhp, curhp) return OnDiDuGuardHpChange(npcid, originhp, curhp) end
function OnNpcHpChange_56022(npcid, originhp, curhp) return OnDiDuGuardHpChange(npcid, originhp, curhp) end
function OnNpcHpChange_56023(npcid, originhp, curhp) return OnDiDuGuardHpChange(npcid, originhp, curhp) end

----------------------------------------------------------宫殿战主神-----------------------------------------
function OnNpcHpChange_22985(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local country = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_COUNTRY)
	local etype,eid,lock = s_getEnemy(npcid)
	local ecountry = 0
	if etype == SCENE_ENTRY_PLAYER then
		ecountry = s_getValue(etype,eid,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国占领NPC")
			return
		end
	elseif etype == SCENE_ENTRY_NPC then
		local master = s_getValue(etype,eid,VALUE_TYPE_MASTER)
		ecountry = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国占领NPC")
			return
		end
	end
	local show = VALUE_FAIL
	if CheckHpSubPerEvent(npcid,20,originhp,curhp) == VALUE_OK then
		show = VALUE_OK
	end
	local maxhp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP)
	local per = math.floor((curhp * 100.0)/ maxhp)
	if per >= 80 then
		per = 80
	elseif per < 80 and per > 70 then
		per = 80
	elseif per >= 60 then
		per = 60
	elseif per < 60 and per > 50 then
		per = 60
	elseif per >= 40 then
		per = 40
	elseif per < 40 and per > 30 then
		per = 40
	elseif per >= 20 then
		per = 20
	elseif per < 20 and per > 10 then
		per = 20
	end
	if show == VALUE_OK and curhp ~= 0 then
		s_setCountryWarVal(Country_War_Palace_Master_Life, per, country)
		s_countryInfo(country,"目前我方的主神还有"..per.."%的血，请大家快去守卫，不然就要被对方攻破了。",ChatPos_Sys+ChatPos_Important)
		s_countryInfo(ecountry,"目前主神还有"..per.."%的血，请大家继续努力，马上就可以破坏它了。",ChatPos_Sys+ChatPos_Important)
	end
end

function OnNpcHpChange_22986(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local country = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_COUNTRY)
	local etype,eid,lock = s_getEnemy(npcid)
	local ecountry = 0
	if etype == SCENE_ENTRY_PLAYER then
		ecountry = s_getValue(etype,eid,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国占领NPC")
			return
		end
	elseif etype == SCENE_ENTRY_NPC then
		local master = s_getValue(etype,eid,VALUE_TYPE_MASTER)
		ecountry = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国占领NPC")
			return
		end
	end
	local show = VALUE_FAIL
	if CheckHpSubPerEvent(npcid,20,originhp,curhp) == VALUE_OK then
		show = VALUE_OK
	end
	local maxhp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP)
	local per = math.floor((curhp * 100.0)/ maxhp)
	if per >= 80 then
		per = 80
	elseif per < 80 and per > 70 then
		per = 80
	elseif per >= 60 then
		per = 60
	elseif per < 60 and per > 50 then
		per = 60
	elseif per >= 40 then
		per = 40
	elseif per < 40 and per > 30 then
		per = 40
	elseif per >= 20 then
		per = 20
	elseif per < 20 and per > 10 then
		per = 20
	end
	if show == VALUE_OK and curhp ~= 0 then
		s_setCountryWarVal(Country_War_Palace_Master_Life, per, country)
		s_countryInfo(country,"目前我方的主神还有"..per.."%的血，请大家快去守卫，不然就要被对方攻破了。",ChatPos_Sys+ChatPos_Important)
		s_countryInfo(ecountry,"目前主神还有"..per.."%的血，请大家继续努力，马上就可以破坏它了。",ChatPos_Sys+ChatPos_Important)
	end
end

function OnNpcHpChange_22987(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local country = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_COUNTRY)
	local etype,eid,lock = s_getEnemy(npcid)
	local ecountry = 0
	if etype == SCENE_ENTRY_PLAYER then
		ecountry = s_getValue(etype,eid,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国占领NPC")
			return
		end
	elseif etype == SCENE_ENTRY_NPC then
		local master = s_getValue(etype,eid,VALUE_TYPE_MASTER)
		ecountry = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国占领NPC")
			return
		end
	end
	local show = VALUE_FAIL
	if CheckHpSubPerEvent(npcid,20,originhp,curhp) == VALUE_OK then
		show = VALUE_OK
	end
	local maxhp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP)
	local per = math.floor((curhp * 100.0)/ maxhp)
	if per >= 80 then
		per = 80
	elseif per < 80 and per > 70 then
		per = 80
	elseif per >= 60 then
		per = 60
	elseif per < 60 and per > 50 then
		per = 60
	elseif per >= 40 then
		per = 40
	elseif per < 40 and per > 30 then
		per = 40
	elseif per >= 20 then
		per = 20
	elseif per < 20 and per > 10 then
		per = 20
	end
	if show == VALUE_OK and curhp ~= 0 then
		s_setCountryWarVal(Country_War_Palace_Master_Life, per, country)
		s_countryInfo(country,"目前我方的主神还有"..per.."%的血，请大家快去守卫，不然就要被对方攻破了。",ChatPos_Sys+ChatPos_Important)
		s_countryInfo(ecountry,"目前主神还有"..per.."%的血，请大家继续努力，马上就可以破坏它了。",ChatPos_Sys+ChatPos_Important)
	end
end

function OnNpcHpChange_22988(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local country = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_COUNTRY)
	local etype,eid,lock = s_getEnemy(npcid)
	local ecountry = 0
	if etype == SCENE_ENTRY_PLAYER then
		ecountry = s_getValue(etype,eid,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国占领NPC")
			return
		end
	elseif etype == SCENE_ENTRY_NPC then
		local master = s_getValue(etype,eid,VALUE_TYPE_MASTER)
		ecountry = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国占领NPC")
			return
		end
	end
	local show = VALUE_FAIL
	if CheckHpSubPerEvent(npcid,20,originhp,curhp) == VALUE_OK then
		show = VALUE_OK
	end
	local maxhp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP)
	local per = math.floor((curhp * 100.0)/ maxhp)
	if per >= 80 then
		per = 80
	elseif per < 80 and per > 70 then
		per = 80
	elseif per >= 60 then
		per = 60
	elseif per < 60 and per > 50 then
		per = 60
	elseif per >= 40 then
		per = 40
	elseif per < 40 and per > 30 then
		per = 40
	elseif per >= 20 then
		per = 20
	elseif per < 20 and per > 10 then
		per = 20
	end
	if show == VALUE_OK and curhp ~= 0 then
		s_setCountryWarVal(Country_War_Palace_Master_Life, per, country)
		s_countryInfo(country,"目前我方的主神还有"..per.."%的血，请大家快去守卫，不然就要被对方攻破了。",ChatPos_Sys+ChatPos_Important)
		s_countryInfo(ecountry,"目前主神还有"..per.."%的血，请大家继续努力，马上就可以破坏它了。",ChatPos_Sys+ChatPos_Important)
	end
end

function OnNpcHpChange_56039(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local country = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_COUNTRY)
	local etype,eid,lock = s_getEnemy(npcid)
	local ecountry = 0
	if etype == SCENE_ENTRY_PLAYER then
		ecountry = s_getValue(etype,eid,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国NPC")
			return
		end
		if s_isFriendCountry(country,ecountry) == VALUE_OK then
			s_sysInfo(eid, "不可攻击盟国NPC")
			return
		end
	elseif etype == SCENE_ENTRY_NPC then
		local master = s_getValue(etype,eid,VALUE_TYPE_MASTER)
		ecountry = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_HOMELAND)
		if country == ecountry then
			s_sysInfo(eid, "不可攻击本国NPC")
			return
		end
		if s_isFriendCountry(country,ecountry) == VALUE_OK then
			s_sysInfo(eid, "不可攻击盟国NPC")
			return
		end
	end
	local show = VALUE_FAIL
	if CheckHpSubPerEvent(npcid,10,originhp,curhp) == VALUE_OK then
		show = VALUE_OK
	end
	local maxhp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP)
	local per = math.floor((curhp * 100.0)/ maxhp)
	if per >= 90 then
		per = 90
	elseif per < 90 and per > 85 then
		per = 90
	elseif per >= 80 then
		per = 80
	elseif per < 80 and per > 75 then
		per = 80
	elseif per >= 70 then
		per = 70
	elseif per < 70 and per > 65 then
		per = 70
	elseif per >= 60 then
		per = 60
	elseif per < 60 and per > 55 then
		per = 60
	elseif per >= 50 then
		per = 50
	elseif per < 50 and per > 45 then
		per = 50
	elseif per >= 40 then
		per = 40
	elseif per < 40 and per > 35 then
		per = 40
	elseif per >= 30 then
		per = 30
	elseif per < 30 and per > 25 then
		per = 30
	elseif per >= 20 then
		per = 20
	elseif per < 20 and per > 15 then
		per = 20
	elseif per >= 10 then
		per = 10
	elseif per < 10 and per > 5 then
		per = 10
	end
	if show == VALUE_OK and curhp ~= 0 then
		local map = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_CURRENT_MAP)--[TODO]
		if per == 90 then
			s_setCountryPostCarVal(COUNTRY_POSTCAR_STATE_NINETY,country,map)
		elseif per == 80 then
			s_setCountryPostCarVal(COUNTRY_POSTCAR_STATE_EIGHTY,country,map)
		elseif per == 70 then
			s_setCountryPostCarVal(COUNTRY_POSTCAR_STATE_SEVENTY,country,map)
		elseif per == 60 then
			s_setCountryPostCarVal(COUNTRY_POSTCAR_STATE_SIXTY,country,map)
		elseif per == 50 then
			s_setCountryPostCarVal(COUNTRY_POSTCAR_STATE_FIFTY,country,map)
		elseif per == 40 then
			s_setCountryPostCarVal(COUNTRY_POSTCAR_STATE_FOUTY,country,map)
		elseif per == 30 then
			s_setCountryPostCarVal(COUNTRY_POSTCAR_STATE_THIRTY,country,map)
			local msg = "水晶押运兽只剩下30%血量啦，本国国民快去防守啊！！水晶押运兽成功抵达后，附近的防守玩家都能获得奖励哦！！"
			local posx = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
			local posy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
			s_registerGomapMsgBox(country,country,map,posx,posy,61,msg)
		elseif per == 20 then
			s_setCountryPostCarVal(COUNTRY_POSTCAR_STATE_TWENTY,country,map)
		elseif per == 10 then
			s_setCountryPostCarVal(COUNTRY_POSTCAR_STATE_TEN,country,map)
		end
	end
end
RoleTaskInfo4051 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{4052, 4053}},
		},
		task = {s_taskRandomTask, {60051}},
		onaccept =
		{
		},
	},
}

-- 物理职业
RoleTaskInfo4052 =
{
	parent = 4051,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionPhysical,{}},
		},
		dropitem =
		{
			{10032, 65, 31055, 0, 18, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60051, 60051}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31055,18,"RoleTaskInfo4051"}},
		},
	},
}

-- 魔法职业
RoleTaskInfo4053 =
{
	parent = 4051,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionMagic,{}},
		},
		dropitem =
		{
			{10032, 65, 31055, 0, 18, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60051, 60051}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31055,18,"RoleTaskInfo4051"}},
		},
	},
}

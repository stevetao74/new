RoleTaskInfo3891 =
{
	subtasknum = 1,
	subtask1 =
	{
		ReQAInfo =
		{
			pass_option = 1,    --该问答有直接跳过去的选项
			talk = "你有什么想问我的么?",
			content = {
				{ question = "燃烧平原的格局。", answer = "人类抵抗军在燃烧平原建有一个临时营地，最高指挥官为情报官Zero。除了军方的人驻扎其中，还有逐利而来的赏金猎人豪斯以及一个神神叨叨叫做察猜的家伙。",},
				{ question = "光明城的现状。", answer = "光明城是人类抵抗军从地底爬出后在丛林中开辟的城市，名义上的最高复杂人为光明女王，军事事物都由抵抗军首领卡尔统帅，每天都有补给车负责为燃烧平原的营地运送补给。想负责运输的话可以去找卡尔...",},
				{ question = "关于我的妻子泰莎。", answer = "虽然她老是吵着要和我离婚，但是个好女人。",},
				{ question = "关于中立区的神秘领域。", answer = "这方面我了解的也不多，这部分区域基本上都在军方的严密控制之中，中有通过光明城的中立区副本传送员才可以到达。",},
			},
		},
		task = {s_taskReQA, {60084}},
		onfinish =
		{
			{s_actionOpenGuide,{3891}},
		},
	},

}

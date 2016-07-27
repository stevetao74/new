﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------
// FILE: 团成就表.xlsm SHEET: Sheet1 KEY: id

#pragma once
#pragma pack(1)
struct CorpsAchieveDataBase
{
	DWORD getUniqueID() const { return usage_id_hash(id); }

	DWORD id; // 编号
	char name[32]; // 名称
	char cond[32]; // 条件
	char next[32]; // 下次成就
	DWORD dwOffer; // 贡献度
	DWORD dwItem; // 道具
	DWORD dwMoney; // 团资金
	DWORD dwGlory; // 繁荣度
	DWORD dwTask; // 任务
};
#pragma pack()

#if false
namespace table
{
	// 团成就表
	struct zCorpsAchieveDataBaseEntry : public zEntry
	{
		DWORD id; // 编号
		char name[32]; // 名称
		char cond[32]; // 条件
		char next[32]; // 下次成就
		DWORD dwOffer; // 贡献度
		DWORD dwItem; // 道具
		DWORD dwMoney; // 团资金
		DWORD dwGlory; // 繁荣度
		DWORD dwTask; // 任务

		virtual const char* getClassName() const { return "团成就表"; }
		static const char* getFileName() { return "CorpsAchieveDataBase.tbl"; }
		void fill(const CorpsAchieveDataBase& base)
		{
			this->id = base.getUniqueID();

			this->id = base.id;
			strncpy(this->name, base.name, 32);
			strncpy(this->cond, base.cond, 32);
			strncpy(this->next, base.next, 32);
			this->dwOffer = base.dwOffer;
			this->dwItem = base.dwItem;
			this->dwMoney = base.dwMoney;
			this->dwGlory = base.dwGlory;
			this->dwTask = base.dwTask;
		}
		void reset()
		{
			this->id = 0;
			this->name[0] = '\0';
			this->cond[0] = '\0';
			this->next[0] = '\0';
			this->dwOffer = 0;
			this->dwItem = 0;
			this->dwMoney = 0;
			this->dwGlory = 0;
			this->dwTask = 0;
		}
	};
	typedef zDataBM<zCorpsAchieveDataBaseEntry, CorpsAchieveDataBase> CorpsAchieveDataBaseManager;
}
#endif


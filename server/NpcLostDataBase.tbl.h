﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------
// FILE: Npc掉落表.xlsm SHEET: Sheet1 KEY: id

#pragma once
#pragma pack(1)
struct NpcLostDataBase
{
	DWORD getUniqueID() const { return usage_id_hash(id); }

	DWORD id; // NPC编号
	DWORD percent; // 大爆概率
	char group1[2048]; // 物品组1
	char group2[2048]; // 物品组2
	char group3[2048]; // 物品组3
	char group4[2048]; // 物品组4
	char group5[2048]; // 物品组5
	char group6[2048]; // 物品组6
	char group7[2048]; // 物品组7
	char group8[2048]; // 物品组8
	char group9[2048]; // 物品组9
	char group10[2048]; // 物品组10
	char group11[2048]; // 物品组11
	char group12[2048]; // 物品组12
	char group13[2048]; // 物品组13
	char group14[2048]; // 物品组14
	char group15[2048]; // 物品组15
};
#pragma pack()

#if false
namespace table
{
	// Npc掉落表
	struct zNpcLostDataBaseEntry : public zEntry
	{
		DWORD id; // NPC编号
		DWORD percent; // 大爆概率
		char group1[2048]; // 物品组1
		char group2[2048]; // 物品组2
		char group3[2048]; // 物品组3
		char group4[2048]; // 物品组4
		char group5[2048]; // 物品组5
		char group6[2048]; // 物品组6
		char group7[2048]; // 物品组7
		char group8[2048]; // 物品组8
		char group9[2048]; // 物品组9
		char group10[2048]; // 物品组10
		char group11[2048]; // 物品组11
		char group12[2048]; // 物品组12
		char group13[2048]; // 物品组13
		char group14[2048]; // 物品组14
		char group15[2048]; // 物品组15

		virtual const char* getClassName() const { return "Npc掉落表"; }
		static const char* getFileName() { return "NpcLostDataBase.tbl"; }
		void fill(const NpcLostDataBase& base)
		{
			this->id = base.getUniqueID();

			this->id = base.id;
			this->percent = base.percent;
			strncpy(this->group1, base.group1, 2048);
			strncpy(this->group2, base.group2, 2048);
			strncpy(this->group3, base.group3, 2048);
			strncpy(this->group4, base.group4, 2048);
			strncpy(this->group5, base.group5, 2048);
			strncpy(this->group6, base.group6, 2048);
			strncpy(this->group7, base.group7, 2048);
			strncpy(this->group8, base.group8, 2048);
			strncpy(this->group9, base.group9, 2048);
			strncpy(this->group10, base.group10, 2048);
			strncpy(this->group11, base.group11, 2048);
			strncpy(this->group12, base.group12, 2048);
			strncpy(this->group13, base.group13, 2048);
			strncpy(this->group14, base.group14, 2048);
			strncpy(this->group15, base.group15, 2048);
		}
		void reset()
		{
			this->id = 0;
			this->percent = 0;
			this->group1[0] = '\0';
			this->group2[0] = '\0';
			this->group3[0] = '\0';
			this->group4[0] = '\0';
			this->group5[0] = '\0';
			this->group6[0] = '\0';
			this->group7[0] = '\0';
			this->group8[0] = '\0';
			this->group9[0] = '\0';
			this->group10[0] = '\0';
			this->group11[0] = '\0';
			this->group12[0] = '\0';
			this->group13[0] = '\0';
			this->group14[0] = '\0';
			this->group15[0] = '\0';
		}
	};
	typedef zDataBM<zNpcLostDataBaseEntry, NpcLostDataBase> NpcLostDataBaseManager;
}
#endif


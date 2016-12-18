with missionNamespace do {
	WEST_TOWNS_FLAG_TEXTURE = "\A3\Data_F\Flags\Flag_blue_CO.paa";

if (CTI_TOWNS_OCCUPATION_WEST == 0) then { 
//--- VANILLA TOWN OCCUPATION
//--- Infantry
	WEST_SOLDIER = "B_Soldier_F";
	WEST_SOLDIER_AA = "B_soldier_AA_F";
	WEST_SOLDIER_AR = "B_Soldier_AR_F";
	WEST_SOLDIER_AT = "B_Soldier_LAT_F";
	WEST_SOLDIER_CREW = "B_crew_F";
	WEST_SOLDIER_LAT = "B_Soldier_LAT_F";
	WEST_SOLDIER_HAT = "B_Soldier_AT_F";
	WEST_SOLDIER_ENGINEER = "B_engineer_F";
	WEST_SOLDIER_EXP = "B_Soldier_exp_F";
	WEST_SOLDIER_GL = "B_Soldier_GL_F";
	WEST_SOLDIER_MEDIC = "B_medic_F";
	WEST_SOLDIER_MG = "B_HeavyGunner_F";
	WEST_SOLDIER_PILOT = "B_helipilot_F";
	WEST_SOLDIER_SNIPER = "B_Soldier_M_F";
	WEST_SOLDIER_TEAMLEADER = "B_Soldier_TL_F";
	WEST_SOLDIER_SQUADLEADER = "B_Soldier_SL_F";
	//--- Naval Units
	WEST_SOLDIER_NAVAL_INFANTRY = "B_diver_F";
	WEST_SOLDIER_NAVAL_SQUADLEADER = "B_diver_TL_F";
	//--- Light Vehicles
	WEST_VEHICLE_LIGHT1 = ["B_G_Offroad_01_armed_F"];
	WEST_VEHICLE_LIGHT2 = ["B_MRAP_01_hmg_F"];
	WEST_VEHICLE_LIGHT3 = ["B_MRAP_01_hmg_F"];
	WEST_VEHICLE_LIGHT4 = ["B_MRAP_01_gmg_F"];
	WEST_VEHICLE_LIGHT5 = ["B_MRAP_01_gmg_F"];
	WEST_VEHICLE_LIGHT6 = ["B_MRAP_01_gmg_F"];
	WEST_VEHICLE_LIGHT7 = ["B_MRAP_01_gmg_F"];
	//--- APCs
	WEST_VEHICLE_APC1 = ["B_APC_Tracked_01_rcws_F"];
	WEST_VEHICLE_APC2 = ["B_APC_Wheeled_01_cannon_F"];
	WEST_VEHICLE_APC3 = ["B_APC_Wheeled_01_cannon_F"];
	//--- Tanks
	WEST_VEHICLE_ARMORED1 = ["B_MBT_01_cannon_F"];	
	WEST_VEHICLE_ARMORED2 = ["B_MBT_01_TUSK_F"];
	WEST_VEHICLE_ARMORED3 = ["B_MBT_01_TUSK_F"];
	//--- AA Vehicles
	WEST_VEHICLE_AA1 = ["B_APC_Tracked_01_AA_F"];
	WEST_VEHICLE_AA2 = ["B_APC_Tracked_01_AA_F"];
	WEST_VEHICLE_AA3 = ["B_APC_Tracked_01_AA_F"];
	//--- Air
	WEST_AIR_HELI1 = ["B_Heli_Light_01_armed_F"]; //pawnee
	WEST_AIR_HELI2 = ["B_Heli_Transport_01_F"]; //ghosthawk
	WEST_AIR_HELI_ATTACK = ["B_Heli_Attack_01_F"];
	WEST_AIR_AA = [""];
	WEST_AIR_CAS = ["B_Plane_CAS_01_F"];
	//--- Boats
	WEST_NAVAL_ASSAULT_BOAT1 = ["B_Boat_Armed_01_minigun_F"];
	WEST_NAVAL_ASSAULT_BOAT2 = ["B_Boat_Armed_01_minigun_F"];
	WEST_NAVAL_MEDIUM_ASSAULT_BOAT = ["B_Boat_Armed_01_minigun_F"];
	WEST_NAVAL_LARGE_ASSAULT_BOAT = ["B_Boat_Armed_01_minigun_F"];
};
if (CTI_TOWNS_OCCUPATION_WEST == 1) then { 
//--- CUP - US Army TOWN OCCUPATION
	//--- Infantry
	WEST_SOLDIER = "CUP_B_US_Soldier";
	WEST_SOLDIER_AA = "CUP_B_US_Soldier_AA";
	WEST_SOLDIER_AR = "CUP_B_US_Soldier_AR";
	WEST_SOLDIER_AT = "CUP_B_US_Soldier_AT";
	WEST_SOLDIER_CREW = "CUP_B_US_Crew";
	WEST_SOLDIER_LAT = "CUP_B_US_Soldier_AT";
	WEST_SOLDIER_HAT = "CUP_B_US_Soldier_HAT";
	WEST_SOLDIER_ENGINEER = "CUP_B_US_Soldier_Engineer_EOD";
	WEST_SOLDIER_EXP = "CUP_B_US_Soldier_Engineer_Sapper";
	WEST_SOLDIER_GL = "CUP_B_US_Soldier_GL";
	WEST_SOLDIER_MEDIC = "CUP_B_US_Medic";
	WEST_SOLDIER_MG = "CUP_B_US_Soldier_AR";
	WEST_SOLDIER_PILOT = "CUP_B_US_Pilot";
	WEST_SOLDIER_SNIPER = "CUP_B_US_Sniper_M107";
	WEST_SOLDIER_TEAMLEADER = "CUP_B_US_Officer";
	WEST_SOLDIER_SQUADLEADER = "CUP_B_US_Officer";
	//--- Naval Units
	WEST_SOLDIER_NAVAL_INFANTRY = "B_diver_F";
	WEST_SOLDIER_NAVAL_SQUADLEADER = "B_diver_TL_F";
	//--- Light Vehicles
	WEST_VEHICLE_LIGHT1 = ["CUP_B_HMMWV_DSHKM_GPK_ACR"];
	WEST_VEHICLE_LIGHT2 = ["CUP_B_Jackal2_L2A1_GB_D"];
	WEST_VEHICLE_LIGHT3 = ["CUP_RG31_M2"];
	WEST_VEHICLE_LIGHT4 = ["CUP_B_Dingo_GL_CZ_Wdl"];
	WEST_VEHICLE_LIGHT5 = ["CUP_B_Ridgback_GMG_GB_D"];
	WEST_VEHICLE_LIGHT6 = ["CUP_B_M1126_ICV_MK19_Desert"];
	WEST_VEHICLE_LIGHT7 = ["CUP_B_LAV25M240_USMC"];
	//--- APCs
	WEST_VEHICLE_APC1 = ["CUP_B_MCV80_GB_D_SLAT"];
	WEST_VEHICLE_APC2 = ["CUP_B_FV510_GB_D_SLAT"];
	WEST_VEHICLE_APC3 = ["CUP_B_M2A3Bradley_USA_D"];
	//--- Tanks
	WEST_VEHICLE_ARMORED1 = ["CUP_B_M1A1_Woodland_US_Army"];	
	WEST_VEHICLE_ARMORED2 = ["CUP_B_M1A2_TUSK_MG_US_Army"];
	WEST_VEHICLE_ARMORED3 = ["CUP_B_M1A2_TUSK_MG_US_Army"];
	//--- AA Vehicles
	WEST_VEHICLE_AA1 = ["CUP_B_HMMWV_Avenger_USMC"];
	WEST_VEHICLE_AA2 = ["CUP_B_ZSU23_CDF"];
	WEST_VEHICLE_AA3 = ["CUP_B_M163_USA"];
	//--- Air
	WEST_AIR_HELI1 = ["CUP_B_UH1D_GER_KSK_Des"];
	WEST_AIR_HELI2 = [""];
	WEST_AIR_HELI_ATTACK = [""];
	WEST_AIR_AA = ["CUP_B_F35B_AA_USMC"];
	WEST_AIR_CAS = ["CUP_B_F35B_LGB_USMC"];
	//--- Boats
	WEST_NAVAL_ASSAULT_BOAT1 = ["CUP_B_RHIB2Turret_USMC"];
	WEST_NAVAL_ASSAULT_BOAT2 = ["B_Boat_Armed_01_minigun_F"];
	WEST_NAVAL_MEDIUM_ASSAULT_BOAT = ["B_Boat_Armed_01_minigun_F"];
	WEST_NAVAL_LARGE_ASSAULT_BOAT = ["sfp_rbb_norrkoping"];
};
if (CTI_TOWNS_OCCUPATION_WEST == 2) then { 
//--- MIXED TOWN OCCUPATION - vanilla/cup/ofps/etc..
	//--- Infantry
	WEST_SOLDIER = "CUP_B_US_Soldier";
	WEST_SOLDIER_AA = "CUP_B_US_Soldier_AA";
	WEST_SOLDIER_AR = "CUP_B_US_Soldier_AR";
	WEST_SOLDIER_AT = "CUP_B_US_Soldier_AT";
	WEST_SOLDIER_CREW = "CUP_B_US_Crew";
	WEST_SOLDIER_LAT = "CUP_B_US_Soldier_AT";
	WEST_SOLDIER_HAT = "CUP_B_US_Soldier_HAT";
	WEST_SOLDIER_ENGINEER = "CUP_B_US_Soldier_Engineer_EOD";
	WEST_SOLDIER_EXP = "CUP_B_US_Soldier_Engineer_Sapper";
	WEST_SOLDIER_GL = "CUP_B_US_Soldier_GL";
	WEST_SOLDIER_MEDIC = "CUP_B_US_Medic";
	WEST_SOLDIER_MG = "CUP_B_US_Soldier_AR";
	WEST_SOLDIER_PILOT = "CUP_B_US_Pilot";
	WEST_SOLDIER_SNIPER = "CUP_B_US_Sniper_M107";
	WEST_SOLDIER_TEAMLEADER = "B_Soldier_TL_F";
	WEST_SOLDIER_SQUADLEADER = "B_Soldier_SL_F";
	//--- Naval Units
	WEST_SOLDIER_NAVAL_INFANTRY = "B_diver_F";
	WEST_SOLDIER_NAVAL_SQUADLEADER = "B_diver_TL_F";
	//--- Light Vehicles
	WEST_VEHICLE_LIGHT1 = ["CUP_B_HMMWV_DSHKM_GPK_ACR"];
	WEST_VEHICLE_LIGHT2 = ["CUP_B_Jackal2_L2A1_GB_D"];
	WEST_VEHICLE_LIGHT3 = ["CUP_RG31_M2"];
	WEST_VEHICLE_LIGHT4 = ["CUP_B_Dingo_GL_CZ_Wdl"];
	WEST_VEHICLE_LIGHT5 = ["CUP_B_Ridgback_GMG_GB_D"];
	WEST_VEHICLE_LIGHT6 = ["CUP_B_M1126_ICV_MK19_Desert"];
	WEST_VEHICLE_LIGHT7 = ["CUP_B_LAV25M240_USMC"];
	//--- APCs
	WEST_VEHICLE_APC1 = ["CUP_B_MCV80_GB_D_SLAT"];
	WEST_VEHICLE_APC2 = ["CUP_B_FV510_GB_D_SLAT"];
	WEST_VEHICLE_APC3 = ["CUP_B_M2A3Bradley_USA_D"];
	//--- Tanks
	WEST_VEHICLE_ARMORED1 = ["CUP_B_M1A1_Woodland_US_Army"];	
	WEST_VEHICLE_ARMORED2 = ["CUP_B_M1A2_TUSK_MG_US_Army"];	
	WEST_VEHICLE_ARMORED3 = ["B_MBT_01_TUSK_F"];
	//--- AA Vehicles
	WEST_VEHICLE_AA1 = ["CUP_B_HMMWV_Avenger_USMC"];
	WEST_VEHICLE_AA2 = ["CUP_B_M163_USA"];
	WEST_VEHICLE_AA3 = ["B_APC_Tracked_01_AA_F"];
	//--- Air
	WEST_AIR_HELI1 = ["CUP_B_UH1D_GER_KSK_Des"];
	WEST_AIR_HELI2 = [""];
	WEST_AIR_HELI_ATTACK = [""];
	WEST_AIR_AA = ["CUP_B_F35B_AA_USMC"];
	WEST_AIR_CAS = ["CUP_B_F35B_LGB_USMC"];
	//--- Boats
	WEST_NAVAL_ASSAULT_BOAT1 = ["CUP_B_RHIB2Turret_USMC"];
	WEST_NAVAL_ASSAULT_BOAT2 = ["B_Boat_Armed_01_minigun_F"];
	WEST_NAVAL_MEDIUM_ASSAULT_BOAT = ["B_Boat_Armed_01_minigun_F"];
	WEST_NAVAL_LARGE_ASSAULT_BOAT = ["sfp_rbb_norrkoping"];
};
if (CTI_TOWNS_OCCUPATION_WEST == 3) then { 
//--- PACIFIC TOWN OCCUPATION - tanoa forces
//--- Infantry
	WEST_SOLDIER = "B_T_Soldier_F";
	WEST_SOLDIER_AA = "B_T_Soldier_AA_F";
	WEST_SOLDIER_AR = "B_T_Soldier_AR_F";
	WEST_SOLDIER_AT = "B_T_Soldier_LAT_F";
	WEST_SOLDIER_CREW = "B_T_Crew_F";
	WEST_SOLDIER_LAT = "B_T_Soldier_LAT_F";
	WEST_SOLDIER_HAT = "B_T_Soldier_AT_F";
	WEST_SOLDIER_ENGINEER = "B_T_Engineer_F";
	WEST_SOLDIER_EXP = "B_T_Soldier_Exp_F";
	WEST_SOLDIER_GL = "B_T_Soldier_GL_F";
	WEST_SOLDIER_MEDIC = "B_T_Medic_F";
	WEST_SOLDIER_MG = "B_T_Support_MG_F";
	WEST_SOLDIER_PILOT = "B_T_Helipilot_F";
	WEST_SOLDIER_SNIPER = "B_T_soldier_M_F";
	WEST_SOLDIER_TEAMLEADER = "B_T_Soldier_TL_F";
	WEST_SOLDIER_SQUADLEADER = "B_T_Soldier_SL_F";
	//--- Naval Units
	WEST_SOLDIER_NAVAL_INFANTRY = "B_T_Diver_F";
	WEST_SOLDIER_NAVAL_SQUADLEADER = "B_T_Diver_TL_F";
	//--- Light Vehicles
	WEST_VEHICLE_LIGHT1 = ["B_G_Offroad_01_armed_F"];
	WEST_VEHICLE_LIGHT2 = ["B_MRAP_01_hmg_F"];
	WEST_VEHICLE_LIGHT3 = ["B_MRAP_01_hmg_F"];
	WEST_VEHICLE_LIGHT4 = ["B_MRAP_01_gmg_F"];
	WEST_VEHICLE_LIGHT5 = ["B_MRAP_01_gmg_F"];
	WEST_VEHICLE_LIGHT6 = ["B_MRAP_01_gmg_F"];
	WEST_VEHICLE_LIGHT7 = ["B_MRAP_01_gmg_F"];
	//--- APCs
	WEST_VEHICLE_APC1 = ["B_APC_Tracked_01_rcws_F"];
	WEST_VEHICLE_APC2 = ["B_APC_Wheeled_01_cannon_F"];
	WEST_VEHICLE_APC3 = ["B_APC_Wheeled_01_cannon_F"];
	//--- Tanks
	WEST_VEHICLE_ARMORED1 = ["B_MBT_01_cannon_F"];	
	WEST_VEHICLE_ARMORED2 = ["B_MBT_01_TUSK_F"];
	WEST_VEHICLE_ARMORED3 = ["B_MBT_01_TUSK_F"];
	//--- AA Vehicles
	WEST_VEHICLE_AA1 = ["B_APC_Tracked_01_AA_F"];
	WEST_VEHICLE_AA2 = ["B_APC_Tracked_01_AA_F"];
	WEST_VEHICLE_AA3 = ["B_APC_Tracked_01_AA_F"];
	//--- Air
	WEST_AIR_HELI1 = ["B_Heli_Light_01_armed_F"]; //pawnee
	WEST_AIR_HELI2 = ["B_Heli_Transport_01_F"]; //ghosthawk
	WEST_AIR_HELI_ATTACK = ["B_Heli_Attack_01_F"];
	WEST_AIR_AA = [""];
	WEST_AIR_CAS = ["B_Plane_CAS_01_F"];
	//--- Boats
	WEST_NAVAL_ASSAULT_BOAT1 = ["B_Boat_Armed_01_minigun_F"];
	WEST_NAVAL_ASSAULT_BOAT2 = ["B_Boat_Armed_01_minigun_F"];
	WEST_NAVAL_MEDIUM_ASSAULT_BOAT = ["B_Boat_Armed_01_minigun_F"];
	WEST_NAVAL_LARGE_ASSAULT_BOAT = ["B_Boat_Armed_01_minigun_F"];
};
if (CTI_TOWNS_OCCUPATION_WEST == 4) then { 
//--- WINTER/SFP TOWN OCCUPATION
//--- Infantry
	WEST_SOLDIER = "sfp_m90s_rifleman_ak5";
	WEST_SOLDIER_AA = "sfp_m90s_aa_specialist_rbs69";
	WEST_SOLDIER_AR = "sfp_m90s_automaticrifleman_ksp90";
	WEST_SOLDIER_AT = "sfp_m90s_at_specialist_pskott86";
	WEST_SOLDIER_CREW = "sfp_m90s_crew";
	WEST_SOLDIER_LAT = "sfp_m90s_at_specialist_pskott86";
	WEST_SOLDIER_HAT = "sfp_m90s_at_specialist_grg86";
	WEST_SOLDIER_ENGINEER = "sfp_m90s_engineer";
	WEST_SOLDIER_EXP = "sfp_m90s_explosive_specialist";
	WEST_SOLDIER_GL = "sfp_m90s_gr";
	WEST_SOLDIER_MEDIC = "sfp_m90s_medic";
	WEST_SOLDIER_MG = "sfp_m90s_machinegunner_ksp58";
	WEST_SOLDIER_PILOT = "sfp_m90s_pilot";
	WEST_SOLDIER_SNIPER = "sfp_m90s_rifleman_ag90";
	WEST_SOLDIER_TEAMLEADER = "sfp_m90s_teamleader";
	WEST_SOLDIER_SQUADLEADER = "sfp_m90s_squadleader";
	//--- Naval Infantry
	WEST_SOLDIER_NAVAL_INFANTRY = "sfp_m90t_combat_diver";
	WEST_SOLDIER_NAVAL_SQUADLEADER = "sfp_m90t_combat_diver_tl";
	//--- Light Vehicles
	WEST_VEHICLE_LIGHT1 = ["sfp_bv206_winter"];
	WEST_VEHICLE_LIGHT2 = ["Meaty_HunterHMG_Sn"];
	WEST_VEHICLE_LIGHT3 = ["Meaty_HunterHMG_Sn"];
	WEST_VEHICLE_LIGHT4 = ["Meaty_HunterHMG_Sn"];
	WEST_VEHICLE_LIGHT5 = ["Meaty_HunterGMG_Sn"];
	WEST_VEHICLE_LIGHT6 = ["Meaty_HunterGMG_Sn"];
	WEST_VEHICLE_LIGHT7 = ["Meaty_HunterGMG_Sn"];
	//--- APCs
	WEST_VEHICLE_APC1 = ["Meaty_Panther_Sn"];
	WEST_VEHICLE_APC2 = ["Meaty_Marshall_Sn"];
	WEST_VEHICLE_APC3 = ["Meaty_Marshall_Sn"];
	//--- Tanks
	WEST_VEHICLE_ARMORED1 = ["sfp_strf90c_snow"];	
	WEST_VEHICLE_ARMORED2 = ["sfp_lvkv90c_snow"];
	WEST_VEHICLE_ARMORED3 = ["sfp_strv122_snow"];
	//--- AA Vehicles
	WEST_VEHICLE_AA1 = ["Meaty_cheetah_Sn"];
	WEST_VEHICLE_AA2 = ["Meaty_cheetah_Sn"];
	WEST_VEHICLE_AA3 = ["Meaty_cheetah_Sn"];
	//--- Air
	WEST_AIR_HELI1 = [""]; //pawnee
	WEST_AIR_HELI2 = [""]; //ghosthawk
	WEST_AIR_HELI_ATTACK = [""];
	WEST_AIR_AA = [""];
	WEST_AIR_CAS = [""];
	//--- Boats
	WEST_NAVAL_ASSAULT_BOAT1 = ["B_Boat_Armed_01_minigun_F"];
	WEST_NAVAL_ASSAULT_BOAT2 = ["B_Boat_Armed_01_minigun_F"];
	WEST_NAVAL_MEDIUM_ASSAULT_BOAT = ["B_Boat_Armed_01_minigun_F"];
	WEST_NAVAL_LARGE_ASSAULT_BOAT = ["B_Boat_Armed_01_minigun_F"];
};
//--- Town Teams Templates
//--- Infantry Squads
WEST_TOWNS_SQUAD_RIFLEMEN1 = [WEST_SOLDIER_SQUADLEADER, WEST_SOLDIER_AR, WEST_SOLDIER, WEST_SOLDIER, WEST_SOLDIER_MEDIC];
WEST_TOWNS_SQUAD_RIFLEMEN2 = [WEST_SOLDIER_SQUADLEADER, WEST_SOLDIER_AR, WEST_SOLDIER_MG, WEST_SOLDIER_EXP, WEST_SOLDIER_MEDIC];
WEST_TOWNS_SQUAD_RIFLEMEN3 = [WEST_SOLDIER_SQUADLEADER, WEST_SOLDIER_AR, WEST_SOLDIER_MG, WEST_SOLDIER_GL, WEST_SOLDIER_MEDIC];
WEST_TOWNS_SQUAD_SNIPER = [WEST_SOLDIER_SQUADLEADER, WEST_SOLDIER_SNIPER, WEST_SOLDIER_SNIPER, WEST_SOLDIER_SNIPER, WEST_SOLDIER_MEDIC];
WEST_TOWNS_SQUAD_AT1 = [WEST_SOLDIER_SQUADLEADER, WEST_SOLDIER_LAT, WEST_SOLDIER_LAT, WEST_SOLDIER_LAT, WEST_SOLDIER_MEDIC];
WEST_TOWNS_SQUAD_AT2 = [WEST_SOLDIER_SQUADLEADER, WEST_SOLDIER_HAT, WEST_SOLDIER_HAT, WEST_SOLDIER_HAT, WEST_SOLDIER_MEDIC];
WEST_TOWNS_SQUAD_AA = [WEST_SOLDIER_SQUADLEADER, WEST_SOLDIER_AA, WEST_SOLDIER_AA, WEST_SOLDIER_AA, WEST_SOLDIER_MEDIC];
WEST_TOWNS_SQUAD_NAVAL1 = [WEST_SOLDIER_NAVAL_SQUADLEADER, WEST_SOLDIER_NAVAL_INFANTRY, WEST_SOLDIER_NAVAL_INFANTRY, WEST_SOLDIER_NAVAL_INFANTRY, WEST_SOLDIER_NAVAL_INFANTRY];
WEST_TOWNS_SQUAD_NAVAL2 = [WEST_SOLDIER_NAVAL_SQUADLEADER, WEST_SOLDIER_NAVAL_INFANTRY, WEST_SOLDIER_NAVAL_INFANTRY, WEST_SOLDIER_HAT, WEST_SOLDIER_AA];
WEST_TOWNS_SQUAD_NAVAL3 = [WEST_SOLDIER_NAVAL_SQUADLEADER,  WEST_SOLDIER_HAT, WEST_SOLDIER_HAT, WEST_SOLDIER_AA, WEST_SOLDIER_AA];
//--- Vehicle Squads
WEST_TOWNS_SQUAD_LIGHT1 = WEST_VEHICLE_LIGHT1 + WEST_VEHICLE_LIGHT1;
WEST_TOWNS_SQUAD_LIGHT2 = WEST_VEHICLE_LIGHT2 + WEST_VEHICLE_LIGHT2;
WEST_TOWNS_SQUAD_LIGHT3 = WEST_VEHICLE_LIGHT3 + WEST_VEHICLE_LIGHT3;
WEST_TOWNS_SQUAD_LIGHT4 = WEST_VEHICLE_LIGHT4 + WEST_VEHICLE_LIGHT4;
WEST_TOWNS_SQUAD_LIGHT5 = WEST_VEHICLE_LIGHT5 + WEST_VEHICLE_LIGHT5;
WEST_TOWNS_SQUAD_LIGHT6 = WEST_VEHICLE_LIGHT6 + WEST_VEHICLE_LIGHT6;
WEST_TOWNS_SQUAD_LIGHT7 = WEST_VEHICLE_LIGHT7 + WEST_VEHICLE_LIGHT7;
WEST_TOWNS_SQUAD_APC1 = WEST_VEHICLE_APC1 + WEST_VEHICLE_APC1;
WEST_TOWNS_SQUAD_APC2 = WEST_VEHICLE_APC2 + WEST_VEHICLE_APC2;
WEST_TOWNS_SQUAD_APC3 = WEST_VEHICLE_APC3 + WEST_VEHICLE_APC3;
WEST_TOWNS_SQUAD_ARMORED1 = WEST_VEHICLE_ARMORED1 + WEST_VEHICLE_ARMORED1;
WEST_TOWNS_SQUAD_ARMORED2 = WEST_VEHICLE_ARMORED2 + WEST_VEHICLE_ARMORED2;
WEST_TOWNS_SQUAD_ARMORED3 = WEST_VEHICLE_ARMORED3 + WEST_VEHICLE_ARMORED3;
WEST_TOWNS_SQUAD_VEHICLE_AA1 = WEST_VEHICLE_AA1 + WEST_VEHICLE_AA1;
WEST_TOWNS_SQUAD_VEHICLE_AA2 = WEST_VEHICLE_AA2 + WEST_VEHICLE_AA2;
WEST_TOWNS_SQUAD_VEHICLE_AA3 = WEST_VEHICLE_AA3 + WEST_VEHICLE_AA3;
WEST_TOWNS_SQUAD_ASSAULT_BOAT1 = WEST_NAVAL_ASSAULT_BOAT1 + WEST_NAVAL_ASSAULT_BOAT1;
WEST_TOWNS_SQUAD_ASSAULT_BOAT2 = WEST_NAVAL_ASSAULT_BOAT2 + WEST_NAVAL_ASSAULT_BOAT2;
WEST_TOWNS_SQUAD_MEDIUM_ASSAULT_BOAT = WEST_NAVAL_MEDIUM_ASSAULT_BOAT + WEST_NAVAL_MEDIUM_ASSAULT_BOAT;
WEST_TOWNS_SQUAD_LARGE_ASSAULT_BOAT = WEST_NAVAL_LARGE_ASSAULT_BOAT;
//--- Mixed Squads
WEST_TOWNS_SQUAD_LIGHT1_MIXED = WEST_VEHICLE_LIGHT1 + WEST_TOWNS_SQUAD_AT1;
WEST_TOWNS_SQUAD_LIGHT2_MIXED = WEST_VEHICLE_LIGHT2 + WEST_TOWNS_SQUAD_AT1;
WEST_TOWNS_SQUAD_LIGHT3_MIXED = WEST_VEHICLE_LIGHT3 + WEST_TOWNS_SQUAD_AT1;
WEST_TOWNS_SQUAD_LIGHT4_MIXED = WEST_VEHICLE_LIGHT4 + WEST_TOWNS_SQUAD_AT1;
WEST_TOWNS_SQUAD_LIGHT5_MIXED = WEST_VEHICLE_LIGHT5 + WEST_TOWNS_SQUAD_AT2;
WEST_TOWNS_SQUAD_LIGHT6_MIXED = WEST_VEHICLE_LIGHT6 + WEST_TOWNS_SQUAD_AT2;
WEST_TOWNS_SQUAD_LIGHT7_MIXED = WEST_VEHICLE_LIGHT7 + WEST_TOWNS_SQUAD_AT2;
WEST_TOWNS_SQUAD_APC1_MIXED = WEST_VEHICLE_APC1 + WEST_TOWNS_SQUAD_AT1;
WEST_TOWNS_SQUAD_APC2_MIXED = WEST_VEHICLE_APC2 + WEST_TOWNS_SQUAD_AT2;
WEST_TOWNS_SQUAD_APC3_MIXED = WEST_VEHICLE_APC3 + WEST_TOWNS_SQUAD_AT2;
WEST_TOWNS_SQUAD_ARMORED1_MIXED = WEST_VEHICLE_ARMORED1 + WEST_TOWNS_SQUAD_AT1;
WEST_TOWNS_SQUAD_ARMORED2_MIXED = WEST_VEHICLE_ARMORED2 + WEST_TOWNS_SQUAD_AT2;
WEST_TOWNS_SQUAD_ARMORED3_MIXED = WEST_VEHICLE_ARMORED3 + WEST_TOWNS_SQUAD_AT2;
WEST_TOWNS_SQUAD_VEHICLE_AA1_MIXED = WEST_VEHICLE_AA1 + WEST_TOWNS_SQUAD_AT1;
WEST_TOWNS_SQUAD_VEHICLE_AA2_MIXED = WEST_VEHICLE_AA2 + WEST_TOWNS_SQUAD_AT2;
WEST_TOWNS_SQUAD_VEHICLE_AA3_MIXED = WEST_VEHICLE_AA3 + WEST_TOWNS_SQUAD_AT2;
};

-- Achievement criteria for The Lich King
-- Bane of the Fallen King (10 player heroic)
-- Realm First! Fall of the Lich King (25 player heroic)
-- The Frozen Throne (10 player)
-- The Frozen Throne (25 player)
-- The Light of Dawn (25 player heroic)
DELETE FROM `achievement_criteria_data` where `criteria_id` IN (12825,12818,12764,12909,12826);
REPLACE INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(12825, 12, 2, 0, ''),
(12818, 12, 3, 0, ''),
(12764, 12, 0, 0, ''),
(12909, 12, 1, 0, ''),
(12826, 12, 3, 0, '');

INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,74074,0,18,1,36597,0,0, '', 'The Lich King - Plague Siphon');


-- Delete Risen Archmage Spawns
DELETE FROM `creature` WHERE `id` = 37868;
-- Correct Valithria Dreamwalker Spawn Location (Source YTDB)
DELETE FROM `creature` WHERE `id` IN (36789, 37950);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(83235, 36789, 631, 15, 1, 0, 0, 4203.65, 2483.89, 364.961, 5.51524, 604800, 0, 0, 6000003, 0, 0, 0, 0, 0, 0),
(NULL, 37950, 631, 15, 16, 0, 0, 4203.65, 2483.89, 390.961, 5.51524, 604800, 0, 0, 6000003, 0, 0, 0, 0, 33540, 8);

-- Sindragosa Creature Location
DELETE FROM `creature` WHERE `id` = 36853;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(NULL, 36853, 631, 15, 1, 30362, 0, 4408.3, 2484.5, 203.5, 3.2, 604800, 0, 0, 13945000, 0, 0, 0, 0, 0, 0);

-- Creature Templates Lich King Script
UPDATE `creature` SET `id` = 36823, `modelid` = 0, `curhealth` = 0, `spawntimesecs` = '604800' WHERE `guid` = 86812;
UPDATE `creature` SET `id` = 36824, `modelid` = 0, `curhealth` = 0, `spawntimesecs` = '604800' WHERE `guid` = 86813;
UPDATE `creature` SET `position_z` = 1040 WHERE `id` = 22515 AND `map` = 631;

-- Make "The Lich King" Invisible
UPDATE `creature_template` SET `flags_extra` = 128 WHERE `entry` = 16980;

-- Creature Script Names
UPDATE `creature_template` SET `ScriptName` = 'boss_valithria_dreamwalker' WHERE `entry` = 36789;
UPDATE `creature_template` SET `ScriptName` = 'npc_blazing_skeleton' WHERE `entry` = 36791;
UPDATE `creature_template` SET `Scriptname` = 'npc_supresser' WHERE `entry` = 37863;
UPDATE `creature_template` SET `ScriptName` = 'npc_risen_archmage' WHERE `entry` = 37868;
UPDATE `creature_template` SET `ScriptName` = 'npc_gluttonous_abomination' WHERE `entry` = 37886;
UPDATE `creature_template` SET `ScriptName` = 'npc_rot_worm' WHERE `entry` = 37907;
UPDATE `creature_template` SET `ScriptName` = 'npc_column_of_frost' WHERE `entry` = 37918;
UPDATE `creature_template` SET `ScriptName` = 'npc_blistering_zombie' WHERE `entry` = 37934;
UPDATE `creature_template` SET `ScriptName` = 'npc_dream_portal' WHERE `entry` IN (38186,37945,38429,38430);
UPDATE `creature_template` SET `ScriptName` = 'npc_mana_void' WHERE `entry` = 38068;
UPDATE `creature_template` SET `ScriptName` = 'boss_the_lich_king' WHERE `entry` = 36597;
UPDATE `creature_template` SET `ScriptName` = 'npc_valithria_alternative' WHERE `entry` = 37950;
UPDATE `creature_template` SET `ScriptName` = 'npc_dreamcloud_icc' WHERE `entry` = 37985;
UPDATE `creature_template` SET `ScriptName` = 'npc_shambling_horror' WHERE `entry` = 37698;
UPDATE `creature_template` SET `ScriptName` = 'npc_tirion_icc' WHERE `entry`= 38995;
UPDATE `creature_template` SET `ScriptName` = 'npc_ice_sphere' WHERE `entry` = 36633;
UPDATE `creature_template` SET `ScriptName` = 'npc_raging_spirit' WHERE `entry` = 36701;
UPDATE `creature_template` SET `ScriptName` = 'npc_valkyr_shadowguard' WHERE `entry` = 36609;
UPDATE `creature_template` SET `ScriptName` = 'npc_terenas_menethil' WHERE `entry` = 36823;
UPDATE `creature_template` SET `ScriptName` = 'npc_dream_cloud' WHERE `entry` IN (37985, 38421);
UPDATE `creature_template` SET `ScriptName` = 'npc_defile' WHERE `entry` = 38757;

-- Valithria Trigger
DELETE FROM `creature_template` WHERE `entry` = 38752;
INSERT INTO `creature_template` VALUES
(38752, 0, 0, 0, 0, 0, 26623, 0, 0, 0, 'Green Dragon Combat Trigger', '', '', 0, 80, 80, 2, 16, 16, 0, 1, 1.14286, 1, 1, 1, 2, 0, 1, 1, 2000, 2000, 1, 32832, 8, 0, 0, 0, 0, 0, 1, 2, 126, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, '', 0, 3, 1.35, 1, 1, 0, 0, 0, 0, 0, 0, 0,  0, 1, 358, 803160063, 0, 'npc_green_dragon_combat_trigger', 12340);
UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `id` IN (38008, 38752);

-- Update Valithria Dreamwalker Faction
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` IN (36789, 38174);
-- UPDATE `creature_template` SET `faction_A` = 1801, `faction_H` = 1801 WHERE `entry` IN (36789, 38174);
-- Dream Cloud
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 37985;
UPDATE `creature_template` SET `minrangedmg` = 313 WHERE `entry` IN (37698, 39299, 39300, 39301);
UPDATE `creature_template` SET `modelid1` = 11686 WHERE `entry` IN (36633, 39305, 39306, 39307);
UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0 WHERE `entry` = 15214;
UPDATE `creature_template` SET `vehicleid` = 533 WHERE `entry` IN (36609, 39120, 39121, 39122);
UPDATE `creature_template` SET `dmg_multiplier` = 35 WHERE `entry` = 36823;
-- Spirit Warden
UPDATE `creature_template` SET `dmg_multiplier` = 52 WHERE `entry` = 36824;
UPDATE `creature_template` SET `difficulty_entry_1` = 39296 WHERE `entry` = 36824;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `exp` = 2, `faction_A` = 14, `faction_H` = 14, `speed_walk` = 1, `speed_run` = 1.14286, `mindmg` = 420, `maxdmg` = 630, `attackpower` = 157, `dmg_multiplier` = 2, `baseattacktime` = 2000, `rangeattacktime` = 2000, `dynamicflags` = 8, `minrangedmg` = 336, `maxrangedmg` = 504, `rangedattackpower` = 126 WHERE `entry` IN (36824, 39296);
UPDATE `creature_template` SET `ScriptName` = 'npc_spirit_warden' WHERE `entry` = 36824;
-- Terenas Menethil
UPDATE `creature_template` SET `speed_walk` = 2, `speed_run` = 1.14286, `mindmg` = 391, `maxdmg` = 585, `attackpower` = 146, `dmg_multiplier` = 2.2, `baseattacktime` = 2000, `rangeattacktime` = 2000, `minrangedmg` = 313, `maxrangedmg` = 468, `rangedattackpower` = 117 WHERE `entry` IN (36824, 39296);

-- Vile Spirit
UPDATE `creature_template` SET `mindmg` = 391, `maxdmg` = 585, `attackpower` = 146, `dmg_multiplier` = 2, `baseattacktime` = 2000, `rangeattacktime` = 2000, `unit_class` = 2, `dynamicflags` = 8, `minrangedmg` = 313, `maxrangedmg` = 468, `rangedattackpower` = 117 WHERE `entry` IN (37799, 39284, 39285, 39286);
UPDATE `creature_template` SET `ScriptName` = 'npc_vile_spirit' WHERE `entry` = 37799;
-- Dream Portal
UPDATE `creature_template` SET `unit_flags` = 33554432 WHERE `entry` = 38429;

-- Cache of Dreamwalker GameObject Spawns
DELETE FROM `gameobject` WHERE `id` IN (201959, 202338, 202339, 202340);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(10793, 202338, 631, 4, 1, 4221.01, 2484.39, 364.872, 6.20305, 0, 0, 0.0400554, -0.999197, -604800, 100, 1),
(10795, 202339, 631, 2, 1, 4221.01, 2484.39, 364.872, 6.20305, 0, 0, 0.0400554, -0.999197, -604800, 100, 1),
(11648, 202340, 631, 8, 1, 4221.01, 2484.39, 364.872, 6.20305, 0, 0, 0.0400554, -0.999197, -604800, 100, 1),
(10678, 201959, 631, 1, 1, 4221.01, 2484.39, 364.872, 6.20305, 0, 0, 0.0400554, -0.999197, -604800, 100, 1);


-- Valithria Creature Texts
DELETE FROM `creature_text` WHERE `entry` = 36789;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(36789, 0, 0, 'Heroes, lend me your aid! I... I cannot hold them off much longer! You must heal my wounds!', 1, 0, 0, 0, 0, 17064, 'Valithria Dreamwalker - SAY_AGGRO'),
(36789, 1, 0, 'I have opened a portal into the Emerald Dream. Your salvation lies within, heroes.', 1, 0, 0, 0, 0, 17068, 'Valithria Dreamwalker - SAY_OPEN_PORTAL'),
(36789, 2, 0, 'My strength is returning! Press on, heroes!', 1, 0, 0, 0, 0, 17070, 'Valithria Dreamwalker - SAY_ABOVE_75'),
(36789, 3, 0, 'I will not last much longer!', 1, 0, 0, 0, 0, 17069, 'Valithria Dreamwalker - SAY_BELOW_25'),
(36789, 4, 0, 'Forgive me for what I do! I... cannot... stop... ONLY NIGHTMARES REMAIN!', 1, 0, 0, 0, 0, 17072, 'Valithria Dreamwalker - SAY_DEATH'),
(36789, 5, 0, 'I am renewed! Ysera grants me the favor to lay these foul creatures to rest!', 1, 0, 0, 0, 0, 17071, 'Valithria Dreamwalker - SAY_END');
-- Script Texts
DELETE FROM `script_texts` WHERE `npc_entry` = 36789;
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(36789, -1666069, 'FAILURES!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17067, 1, 0, 0, 'Valithria Dreamwalker - SAY_BERSERK'),
(36789, -1666068, 'A tragic loss...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17066, 1, 0, 0, 'Valithria Dreamwalker - SAY_PDEATH');

-- Dream State Portal Data
UPDATE `creature_template` SET `npcflag` = 16777216 WHERE `entry` IN (37945, 38430);
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (37945, 38430);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `quest_start`, `quest_start_active`, `quest_end`, `cast_flags`, `aura_required`, `aura_forbidden`, `user_type`) VALUES
(37945, 70766, 0, 0, 0, 3, 0, 0, 0),
(38430, 70766, 0, 0, 0, 3, 0, 0, 0);

DELETE FROM `script_texts` WHERE `entry` IN ('-1810001','-1810002','-1810003','-1810004','-1810005','-1810006','-1810007','-1810008','-1810009','-1810010','-1810011','-1810012','-1810013','-1810014','-1810015','-1810016','-1810017','-1810018','-1810020','-1810021',
'-1810022','-1810023','-1810024','-1810025','-1810026','-1810027','-1810028','-1810029','-1810030','-1810031','-1810032');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(36597, -1810001, 'So...the Light''s vaunted justice has finally arrived. Shall I lay down Frostmourne and throw myself at your mercy, Fordring?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17349, 1, 0, 0, ''),
(38995, -1810002, 'We will grant you a swift death, Arthas. More than can be said for the thousands you''ve tortured and slain.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17390, 1, 0, 0, ''),
(36597, -1810003, 'You will learn of that first hand. When my work is complete, you will beg for mercy -- and I will deny you. Your anguished cries will be testament to my unbridled power.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17350, 1, 0, 0, ''),
(38995, -1810004, 'So be it. Champions, attack!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17391, 1, 0, 0, ''),
(36597, -1810005, 'I''ll keep you alive to witness the end, Fordring. I would not want the Light''s greatest champion to miss seeing this wretched world remade in my image.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17351, 1, 0, 0, ''),
(38995, -1810006, 'Come then champions, feed me your rage!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17352, 1, 0, 0, ''),
(36597, -1810007, 'I will freeze you from within until all that remains is an icy husk!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17369, 1, 0, 0, ''),
(36597, -1810008, 'Apocalypse!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17371, 1, 0, 0, ''),
(36597, -1810009, 'Bow down before your lord and master!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17372, 1, 0, 0, ''),
(36597, -1810010, 'Hope wanes!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17363, 1, 0, 0, ''),
(36597, -1810011, 'The end has come!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17364, 1, 0, 0, ''),
(36597, -1810012, 'Face now your tragic end!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17365, 1, 0, 0, ''),
(36597, -1810013, 'No question remains unanswered. No doubts linger. You are Azeroth''s greatest champions! You overcame every challenge I laid before you. My mightiest servants have fallen before your relentless onslaught, your unbridled fury... Is it truly righteousness that drives you? I wonder.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17353, 1, 0, 0, ''),
(36597, -1810014, 'You trained them well, Fordring. You delivered the greatest fighting force this world has ever known... right into my hands -- exactly as I intended. You shall be rewarded for your unwitting sacrifice.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17355, 1, 0, 0, ''),
(36597, -1810015, 'Watch now as I raise them from the dead to become masters of the Scourge. They will shroud this world in chaos and destruction. Azeroth''s fall will come at their hands -- and you will be the first to die.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17356, 1, 0, 0, ''),
(36597, -1810016, 'I delight in the irony.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17357, 1, 0, 0, ''),
(38995, -1810017, 'LIGHT, GRANT ME ONE FINAL BLESSING. GIVE ME THE STRENGTH... TO SHATTER THESE BONDS!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17392, 1, 0, 0, ''),
(36597, -1810018, 'Impossible...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17358, 1, 0, 0, ''),
(38995, -1810020, 'No more, Arthas! No more lives will be consumed by your hatred!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17393, 1, 0, 0, ''),
(38579, -1810021, 'Free at last! It is over, my son. This is the moment of reckoning.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17397, 1, 0, 0, ''),
(38995, -1810022, 'The Lich King must fall!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17389, 1, 0, 0, ''),
(38579, -1810023, 'Rise up, champions of the Light!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17398, 1, 0, 0, ''),
(36597, -1810024, 'Now I stand, the lion before the lambs... and they do not fear.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17361, 1, 0, 0, ''),
(36597, -1810025, 'They cannot fear.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17362, 1, 0, 0, ''),
(0, -1810026, 'Argh... Frostmourne, obey me!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17367, 1, 0, 0, ''),
(36597, -1810027, 'Frostmourne hungers...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17366, 1, 0, 0, ''),
(0, -1810028, 'Frostmourne feeds on the soul of your fallen ally!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17368, 1, 0, 0, ''),
(36597, -1810029, 'Val''kyr, your master calls!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17373, 1, 0, 0, ''),
(36597, -1810030, 'Watch as the world around you collapses!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17370, 1, 0, 0, ''),
(36597, -1810031, 'You gnats actually hurt me! Perhaps I''ve toyed with you long enough, now taste the vengeance of the grave!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17359, 1, 0, 0, ''),
(36597, -1810032, 'The Lich King begins to cast Defile', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, 0, 0, '');


UPDATE `script_texts` SET `content_loc8` = 'Неужели прибыли наконец хваленые силы Света? Мне бросить Ледяную Скорбь и сдаться на твою милось, Фордринг?' WHERE `npc_entry` = 36597 AND `entry` = -1810001;
UPDATE `script_texts` SET `content_loc8` = 'Мы даруем тебе быструю смерть, Артас. Более быструю, чем ты заслуживаешь за то, что замучал и погубил десятки тысяч душ' WHERE `npc_entry` = 38995 AND `entry` = -1810002;
UPDATE `script_texts` SET `content_loc8` = 'Ты пройдешь через эти мучения сам. И будешь МОЛИТЬ о пощаде, но я не буду слушать. Твои отчаянные крики послужат доказательством моей безграничной мощи.' WHERE `npc_entry` = 36597 AND `entry` = -1810003;
UPDATE `script_texts` SET `content_loc8` = 'Да будет так. Чемпионы, в атаку!' WHERE `npc_entry` = 38995 AND `entry` = -1810004;
UPDATE `script_texts` SET `content_loc8` = 'Я оставлю тебя в живых, чтобы ты увидел финал. Не могу допустить, чтобы величайший служитель Света пропустил рождение МОЕГО МИРА.' WHERE `npc_entry` = 36597 AND `entry` = -1810005;
UPDATE `script_texts` SET `content_loc8` = 'Ну же герои, в вашей ярости моя сила!' WHERE `npc_entry` = 38995 AND `entry` = -1810006;
UPDATE `script_texts` SET `content_loc8` = 'Я проморожу вас насквозь - и вы разлетитесь на ледяные осколки.' WHERE `npc_entry` = 36597 AND `entry` = -1810007;
UPDATE `script_texts` SET `content_loc8` = 'КОНЕЦ СВЕТА!' WHERE `npc_entry` = 36597 AND `entry` = -1810008;
UPDATE `script_texts` SET `content_loc8` = 'Склонись перед своим господином и повелителем!.' WHERE `npc_entry` = 36597 AND `entry` = -1810009;
UPDATE `script_texts` SET `content_loc8` = 'Надежда тает!' WHERE `npc_entry` = 36597 AND `entry` = -1810010;
UPDATE `script_texts` SET `content_loc8` = 'Пришел КОНЕЦ!' WHERE `npc_entry` = 36597 AND `entry` = -1810011;
UPDATE `script_texts` SET `content_loc8` = 'Встречайте трагический финал!' WHERE `npc_entry` = 36597 AND `entry` = -1810012;
UPDATE `script_texts` SET `content_loc8` = 'Сомнений нет, вы величайшие герои Азерота! Вы преодолели все препятствия, которые я воздвиг перед вами. Сильнейшие из моих слуг пали под вашим натиском, сгорели в пламени вашей ярости!' WHERE `npc_entry` = 36597 AND `entry` = -1810013;
UPDATE `script_texts` SET `content_loc8` = 'Ты отлично их обучил, Фордринг! ' WHERE `npc_entry` = 36597 AND `entry` = -1810014;
UPDATE `script_texts` SET `content_loc8` = 'Смотри, как я буду всокрешать их, и превращать в воинов Плети! Они повергнут этот мир в пучину хаоса. Азерот падет от их рук! и ты станешь первой жертвой.' WHERE `npc_entry` = 36597 AND `entry` = -1810015;
UPDATE `script_texts` SET `content_loc8` = 'Мне по душе эта ирония.' WHERE `npc_entry` = 36597 AND `entry` = -1810016;
UPDATE `script_texts` SET `content_loc8` = 'СВЕТ, ДАРУЙ МНЕ ПОСЛЕДНЕЕ БЛАГОСЛОВЛЕНИЕ... ДАЙ МНЕ СИЛЫ РАЗБИТЬ ЭТИ ОКОВЫ!' WHERE `npc_entry` = 38995 AND `entry` = -1810017;
UPDATE `script_texts` SET `content_loc8` = 'Невозможно...' WHERE `npc_entry` = 36597 AND `entry` = -1810018;
UPDATE `script_texts` SET `content_loc8` = 'Хватит, Артас! Твоя ненависть не заберет больше ни одной жизни!' WHERE `npc_entry` = 38995 AND `entry` = -1810020;
UPDATE `script_texts` SET `content_loc8` = 'Наконец я свободен! Всё кончено, сын мой... Настал час расплаты!' WHERE `npc_entry` = 38579 AND `entry` = -1810021;
UPDATE `script_texts` SET `content_loc8` = 'Король-лич падет!' WHERE `npc_entry` = 38995 AND `entry` = -1810022;
UPDATE `script_texts` SET `content_loc8` = 'Поднимитесь, Воины Света!' WHERE `npc_entry` = 38579 AND `entry` = -1810023;
UPDATE `script_texts` SET `content_loc8` = 'И вот я стою как лев пред агнцами... И не дрожат они.' WHERE `npc_entry` = 36597 AND `entry` = -1810024;
UPDATE `script_texts` SET `content_loc8` = 'Им неведом страх.' WHERE `npc_entry` = 36597 AND `entry` = -1810025;
UPDATE `script_texts` SET `content_loc8` = NULL WHERE `npc_entry` = 0 AND `entry` = -1810026;
UPDATE `script_texts` SET `content_loc8` = 'Ледяная Скорбь жаждет крови!' WHERE `npc_entry` = 36597 AND `entry` = -1810027;
UPDATE `script_texts` SET `content_loc8` = 'Ледяная Скорбь поглотит душу вашего товарища.' WHERE `npc_entry` = 0 AND `entry` = -1810028;
UPDATE `script_texts` SET `content_loc8` = 'Валь''кира, твой гсоподин зовет!' WHERE `npc_entry` = 36597 AND `entry` = -1810029;
UPDATE `script_texts` SET `content_loc8` = 'Смотрите как мир рушится вокруг вас!' WHERE `npc_entry` = 36597 AND `entry` = -1810030;
UPDATE `script_texts` SET `content_loc8` = NULL WHERE `npc_entry` = 36597 AND `entry` = -1810031;
UPDATE `script_texts` SET `content_loc8` = NULL WHERE `npc_entry` = 36597 AND `entry` = -1810032;

-- Additional Lich King Script Data
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(-70337, 70338, 0, 'The Lich King: Necrotic plague initial cast'),
(-70337, 72846, 0, 'The Lich King: Necrotic plague immun'),
(-70338, 70338, 0, 'The Lich King: Necrotic jump'),
(-69200, 69201, 0, 'The Lich King: Raging Spirit'),
(-70338, 74074, 0, 'The Licg King: Plague Siphon');

INSERT INTO `spell_scripts` VALUE
(72429, 0, 3, 15, 72423, 0, 0, 0, 0, 0, 0);

-- Spell Script Names
DELETE FROM `spell_script_names` WHERE `spell_id` IN (68576, 68980, 68981, 69030, 69110, 70338, 70498, 70500, 70501, 70534, 70541, 70766, 70873, 71941, 72133, 72262, 72429, 72743, 73779, 73780, 73781, 73785, 73786, 73787, 73788, 73789, 73790, 74115, 74270, 74271, 74272, 74325, 74361, 74506);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(68576, 'spell_valkyr_eject_passenger'),
(68980, 'spell_lich_king_harvest_soul'),
(68981, 'spell_lich_king_winter'),
(69030, 'spell_valkyr_target_search'),
(69110, 'spell_ice_burst_distance_check'),
(70338, 'spell_lich_king_necrotic_plague'),
(70498, 'spell_lich_king_vile_spirit_summon'),
(70500, 'spell_lich_king_vile_spirit_summon_visual'),
(70501, 'spell_vile_spirit_target_search'),
(70534, 'spell_vile_spirit_distance_check'),
(70541, 'spell_lich_king_infection'),
(70766, 'spell_dream_state'),
(70873, 'spell_valithria_vigor'),
(71941, 'spell_valithria_vigor'),
(72133, 'spell_lich_king_pain_and_suffering_effect'),
(72262, 'spell_lich_king_quake'),
(72429, 'spell_lich_king_tirion_mass_resurrection'),
(72743, 'spell_lich_king_defile'),
(73779, 'spell_lich_king_infection'),
(73780, 'spell_lich_king_infection'),
(73781, 'spell_lich_king_infection'),
(73785, 'spell_lich_king_necrotic_plague'),
(73786, 'spell_lich_king_necrotic_plague'),
(73787, 'spell_lich_king_necrotic_plague'),
(73788, 'spell_lich_king_pain_and_suffering_effect'),
(73789, 'spell_lich_king_pain_and_suffering_effect'),
(73790, 'spell_lich_king_pain_and_suffering_effect'),
(74115, 'spell_lich_king_pain_and_suffering'),
(74270, 'spell_lich_king_winter'),
(74271, 'spell_lich_king_winter'),
(74272, 'spell_lich_king_winter'),
(74325, 'spell_lich_king_harvest_soul'),
(74361, 'spell_lich_king_valkyr_summon'),
(74506, 'spell_valkyr_carry_can_cast');

UPDATE `spell_target_position` SET `target_position_z` = `target_position_z` + 10 WHERE `id` = 70860;

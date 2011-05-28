DROP TABLE IF EXISTS `moderator_add`;
CREATE TABLE `moderator_add` (
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0', -- 0 = item, 1 = spell
  `id` int(10) unsigned NOT NULL DEFAULT '0', -- item or spell id,
  `class` int(10) unsigned NOT NULL DEFAULT '0', -- restricted character class,
  `description` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='';

-- CLASS_WARRIOR       = 1,
-- CLASS_PALADIN       = 2,
-- CLASS_HUNTER        = 3,
-- CLASS_ROGUE         = 4,
-- CLASS_PRIEST        = 5,
-- CLASS_DEATH_KNIGHT  = 6,
-- CLASS_SHAMAN        = 7,
-- CLASS_MAGE          = 8,
-- CLASS_WARLOCK       = 9,
-- CLASS_DRUID         = 11
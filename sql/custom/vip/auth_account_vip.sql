CREATE TABLE IF NOT EXISTS `account_vip` (
  `id` int(11) NOT NULL default '0' COMMENT 'Account id',
  `setdate` bigint(40) NOT NULL default '0',
  `unsetdate` bigint(40) NOT NULL default '0',
  `gm` varchar(12) NOT NULL default '',
  `active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`,`setdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='VIP Accounts';

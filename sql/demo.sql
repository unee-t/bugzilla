/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.2.9-MariaDB-10.2.9+maria~jessie : Database - bugzilla
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/*Table structure for table `attach_data` */

DROP TABLE IF EXISTS `attach_data`;

CREATE TABLE `attach_data` (
  `id` mediumint(9) NOT NULL,
  `thedata` longblob NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_attach_data_id_attachments_attach_id` FOREIGN KEY (`id`) REFERENCES `attachments` (`attach_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 MAX_ROWS=100000 AVG_ROW_LENGTH=1000000;

/*Data for the table `attach_data` */

/*Table structure for table `attachments` */

DROP TABLE IF EXISTS `attachments`;

CREATE TABLE `attachments` (
  `attach_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `bug_id` mediumint(9) NOT NULL,
  `creation_ts` datetime NOT NULL,
  `modification_time` datetime NOT NULL,
  `description` tinytext NOT NULL,
  `mimetype` tinytext NOT NULL,
  `ispatch` tinyint(4) NOT NULL DEFAULT 0,
  `filename` varchar(255) NOT NULL,
  `submitter_id` mediumint(9) NOT NULL,
  `isobsolete` tinyint(4) NOT NULL DEFAULT 0,
  `isprivate` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`attach_id`),
  KEY `attachments_bug_id_idx` (`bug_id`),
  KEY `attachments_creation_ts_idx` (`creation_ts`),
  KEY `attachments_modification_time_idx` (`modification_time`),
  KEY `attachments_submitter_id_idx` (`submitter_id`,`bug_id`),
  CONSTRAINT `fk_attachments_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_attachments_submitter_id_profiles_userid` FOREIGN KEY (`submitter_id`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `attachments` */

/*Table structure for table `audit_log` */

DROP TABLE IF EXISTS `audit_log`;

CREATE TABLE `audit_log` (
  `user_id` mediumint(9) DEFAULT NULL,
  `class` varchar(255) NOT NULL,
  `object_id` int(11) NOT NULL,
  `field` varchar(64) NOT NULL,
  `removed` mediumtext DEFAULT NULL,
  `added` mediumtext DEFAULT NULL,
  `at_time` datetime NOT NULL,
  KEY `audit_log_class_idx` (`class`,`at_time`),
  KEY `fk_audit_log_user_id_profiles_userid` (`user_id`),
  CONSTRAINT `fk_audit_log_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `audit_log` */

insert  into `audit_log`(`user_id`,`class`,`object_id`,`field`,`removed`,`added`,`at_time`) values 
(2,'Bugzilla::Group',32,'__create__',NULL,'Test Unit 1 A','2017-10-22 14:37:38'),
(2,'Bugzilla::Group',33,'__create__',NULL,'Test Unit 1 A #1 - Agent - Created by: Leonel - My Real Estate Agency','2017-10-22 14:37:38'),
(2,'Bugzilla::Component',1,'__create__',NULL,'Agent','2017-10-22 14:37:38'),
(2,'Bugzilla::Group',34,'__create__',NULL,'Test Unit 1 A #1 - list stakeholder','2017-10-22 14:37:38'),
(2,'Bugzilla::Group',35,'__create__',NULL,'Test Unit 1 A #1 - see stakeholders','2017-10-22 14:37:38'),
(2,'Bugzilla::Group',36,'__create__',NULL,'Test Unit 1 A #1 - Owner/Landlord - Created by: Leonel - My Real Estate Agency','2017-10-22 14:37:39'),
(2,'Bugzilla::Component',2,'__create__',NULL,'Owner/Landlord','2017-10-22 14:37:39'),
(2,'Bugzilla::Group',37,'__create__',NULL,'Test Unit 1 A #1 - Tenant - Created by: Leonel - My Real Estate Agency','2017-10-22 14:37:39'),
(2,'Bugzilla::Group',38,'__create__',NULL,'Test Unit 1 A #1 - Occupant - Created by: Leonel - My Real Estate Agency','2017-10-22 14:37:39'),
(2,'Bugzilla::Component',3,'__create__',NULL,'Tenant','2017-10-22 14:37:39'),
(8,'Bugzilla::Group',39,'__create__',NULL,'Test Unit 1 A #1 - Management Company - Created by: Team Bravo','2017-10-22 14:37:39'),
(8,'Bugzilla::Component',4,'__create__',NULL,'Management Company','2017-10-22 14:37:39');

/*Table structure for table `bug_cf_ipi_clust_3_roadbook_for` */

DROP TABLE IF EXISTS `bug_cf_ipi_clust_3_roadbook_for`;

CREATE TABLE `bug_cf_ipi_clust_3_roadbook_for` (
  `bug_id` mediumint(9) NOT NULL,
  `value` varchar(64) NOT NULL,
  UNIQUE KEY `bug_cf_roadbook_for_bug_id_idx` (`bug_id`,`value`),
  KEY `fk_bug_cf_roadbook_for_value_cf_roadbook_for_value` (`value`),
  CONSTRAINT `fk_bug_cf_roadbook_for_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bug_cf_roadbook_for_value_cf_roadbook_for_value` FOREIGN KEY (`value`) REFERENCES `cf_ipi_clust_3_roadbook_for` (`value`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bug_cf_ipi_clust_3_roadbook_for` */

/*Table structure for table `bug_cf_ipi_clust_9_acct_action` */

DROP TABLE IF EXISTS `bug_cf_ipi_clust_9_acct_action`;

CREATE TABLE `bug_cf_ipi_clust_9_acct_action` (
  `bug_id` mediumint(9) NOT NULL,
  `value` varchar(64) NOT NULL,
  UNIQUE KEY `bug_cf_accounting_action_bug_id_idx` (`bug_id`,`value`),
  KEY `fk_bug_cf_accounting_action_value_cf_accounting_action_value` (`value`),
  CONSTRAINT `fk_bug_cf_accounting_action_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bug_cf_accounting_action_value_cf_accounting_action_value` FOREIGN KEY (`value`) REFERENCES `cf_ipi_clust_9_acct_action` (`value`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bug_cf_ipi_clust_9_acct_action` */

/*Table structure for table `bug_group_map` */

DROP TABLE IF EXISTS `bug_group_map`;

CREATE TABLE `bug_group_map` (
  `bug_id` mediumint(9) NOT NULL,
  `group_id` mediumint(9) NOT NULL,
  UNIQUE KEY `bug_group_map_bug_id_idx` (`bug_id`,`group_id`),
  KEY `bug_group_map_group_id_idx` (`group_id`),
  CONSTRAINT `fk_bug_group_map_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bug_group_map_group_id_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bug_group_map` */

/*Table structure for table `bug_see_also` */

DROP TABLE IF EXISTS `bug_see_also`;

CREATE TABLE `bug_see_also` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `bug_id` mediumint(9) NOT NULL,
  `value` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bug_see_also_bug_id_idx` (`bug_id`,`value`),
  CONSTRAINT `fk_bug_see_also_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bug_see_also` */

/*Table structure for table `bug_severity` */

DROP TABLE IF EXISTS `bug_severity`;

CREATE TABLE `bug_severity` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT 0,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bug_severity_value_idx` (`value`),
  KEY `bug_severity_sortkey_idx` (`sortkey`,`value`),
  KEY `bug_severity_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `bug_severity` */

insert  into `bug_severity`(`id`,`value`,`sortkey`,`isactive`,`visibility_value_id`) values 
(1,'DEAL BREAKER!',100,1,NULL),
(2,'critical',200,1,NULL),
(3,'major',300,1,NULL),
(4,'normal',400,1,NULL),
(5,'minor',500,1,NULL);

/*Table structure for table `bug_status` */

DROP TABLE IF EXISTS `bug_status`;

CREATE TABLE `bug_status` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT 0,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  `visibility_value_id` smallint(6) DEFAULT NULL,
  `is_open` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bug_status_value_idx` (`value`),
  KEY `bug_status_sortkey_idx` (`sortkey`,`value`),
  KEY `bug_status_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `bug_status` */

insert  into `bug_status`(`id`,`value`,`sortkey`,`isactive`,`visibility_value_id`,`is_open`) values 
(1,'UNCONFIRMED',10,1,NULL,1),
(2,'CONFIRMED',20,1,NULL,1),
(3,'IN_PROGRESS',30,1,NULL,1),
(4,'RESOLVED',60,1,NULL,0),
(5,'VERIFIED',70,1,NULL,0),
(6,'REOPENED',40,1,NULL,1),
(7,'STAND BY',50,1,NULL,1),
(8,'CLOSED',80,1,NULL,0);

/*Table structure for table `bug_tag` */

DROP TABLE IF EXISTS `bug_tag`;

CREATE TABLE `bug_tag` (
  `bug_id` mediumint(9) NOT NULL,
  `tag_id` mediumint(9) NOT NULL,
  UNIQUE KEY `bug_tag_bug_id_idx` (`bug_id`,`tag_id`),
  KEY `fk_bug_tag_tag_id_tag_id` (`tag_id`),
  CONSTRAINT `fk_bug_tag_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bug_tag_tag_id_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bug_tag` */

/*Table structure for table `bug_user_last_visit` */

DROP TABLE IF EXISTS `bug_user_last_visit`;

CREATE TABLE `bug_user_last_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) NOT NULL,
  `bug_id` mediumint(9) NOT NULL,
  `last_visit_ts` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bug_user_last_visit_idx` (`user_id`,`bug_id`),
  KEY `bug_user_last_visit_last_visit_ts_idx` (`last_visit_ts`),
  KEY `fk_bug_user_last_visit_bug_id_bugs_bug_id` (`bug_id`),
  CONSTRAINT `fk_bug_user_last_visit_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bug_user_last_visit_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bug_user_last_visit` */

/*Table structure for table `bugs` */

DROP TABLE IF EXISTS `bugs`;

CREATE TABLE `bugs` (
  `bug_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `assigned_to` mediumint(9) NOT NULL,
  `bug_file_loc` mediumtext NOT NULL,
  `bug_severity` varchar(64) NOT NULL,
  `bug_status` varchar(64) NOT NULL,
  `creation_ts` datetime DEFAULT NULL,
  `delta_ts` datetime NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `op_sys` varchar(64) NOT NULL,
  `priority` varchar(64) NOT NULL,
  `product_id` smallint(6) NOT NULL,
  `rep_platform` varchar(64) NOT NULL,
  `reporter` mediumint(9) NOT NULL,
  `version` varchar(64) NOT NULL,
  `component_id` mediumint(9) NOT NULL,
  `resolution` varchar(64) NOT NULL DEFAULT '',
  `target_milestone` varchar(64) NOT NULL DEFAULT '---',
  `qa_contact` mediumint(9) DEFAULT NULL,
  `status_whiteboard` mediumtext NOT NULL,
  `lastdiffed` datetime DEFAULT NULL,
  `everconfirmed` tinyint(4) NOT NULL,
  `reporter_accessible` tinyint(4) NOT NULL DEFAULT 1,
  `cclist_accessible` tinyint(4) NOT NULL DEFAULT 1,
  `estimated_time` decimal(7,2) NOT NULL DEFAULT 0.00,
  `remaining_time` decimal(7,2) NOT NULL DEFAULT 0.00,
  `deadline` datetime DEFAULT NULL,
  `cf_ipi_clust_4_status_in_progress` varchar(64) NOT NULL DEFAULT '---',
  `cf_ipi_clust_4_status_standby` varchar(64) NOT NULL DEFAULT '---',
  `cf_ipi_clust_6_claim_type` varchar(64) NOT NULL DEFAULT '---',
  `cf_ipi_clust_1_solution` mediumtext NOT NULL,
  `cf_ipi_clust_3_nber_field_visits` int(11) NOT NULL DEFAULT 0,
  `cf_ipi_clust_1_next_step_by` datetime DEFAULT NULL,
  `cf_ipi_clust_1_next_step` mediumtext NOT NULL,
  `cf_ipi_clust_3_field_action_from` datetime DEFAULT NULL,
  `cf_ipi_clust_3_field_action_until` datetime DEFAULT NULL,
  `cf_ipi_clust_3_action_type` varchar(64) NOT NULL DEFAULT '---',
  `cf_ipi_clust_3_field_action` mediumtext NOT NULL,
  `cf_ipi_clust_5_action_purchase_list` mediumtext NOT NULL,
  `cf_ipi_clust_5_budget` varchar(255) NOT NULL DEFAULT '',
  `cf_ipi_clust_5_approved_budget` varchar(255) NOT NULL DEFAULT '',
  `cf_ipi_clust_5_contractor` varchar(255) NOT NULL DEFAULT '',
  `cf_ipi_clust_5_approval_for` mediumtext NOT NULL,
  `cf_ipi_clust_5_approval_comment` mediumtext NOT NULL,
  `cf_ipi_clust_7_payment_type` varchar(64) NOT NULL DEFAULT '---',
  `cf_ipi_clust_7_contractor_payment` mediumtext NOT NULL,
  `cf_ipi_clust_7_bill_number` varchar(255) NOT NULL DEFAULT '',
  `cf_ipi_clust_5_purchase_cost` varchar(255) NOT NULL DEFAULT '',
  `cf_ipi_clust_9_inv_ll` varchar(255) NOT NULL DEFAULT '',
  `cf_ipi_clust_9_inv_cust` varchar(255) NOT NULL DEFAULT '',
  `cf_ipi_clust_9_inv_det_cust` mediumtext NOT NULL,
  `cf_ipi_clust_9_inv_det_ll` mediumtext NOT NULL,
  `cf_ipi_clust_2_room` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`bug_id`),
  KEY `bugs_assigned_to_idx` (`assigned_to`),
  KEY `bugs_creation_ts_idx` (`creation_ts`),
  KEY `bugs_delta_ts_idx` (`delta_ts`),
  KEY `bugs_bug_severity_idx` (`bug_severity`),
  KEY `bugs_bug_status_idx` (`bug_status`),
  KEY `bugs_op_sys_idx` (`op_sys`),
  KEY `bugs_priority_idx` (`priority`),
  KEY `bugs_product_id_idx` (`product_id`),
  KEY `bugs_reporter_idx` (`reporter`),
  KEY `bugs_version_idx` (`version`),
  KEY `bugs_component_id_idx` (`component_id`),
  KEY `bugs_resolution_idx` (`resolution`),
  KEY `bugs_target_milestone_idx` (`target_milestone`),
  KEY `bugs_qa_contact_idx` (`qa_contact`),
  CONSTRAINT `fk_bugs_assigned_to_profiles_userid` FOREIGN KEY (`assigned_to`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_bugs_component_id_components_id` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_bugs_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_bugs_qa_contact_profiles_userid` FOREIGN KEY (`qa_contact`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_bugs_reporter_profiles_userid` FOREIGN KEY (`reporter`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bugs` */

/*Table structure for table `bugs_activity` */

DROP TABLE IF EXISTS `bugs_activity`;

CREATE TABLE `bugs_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_id` mediumint(9) NOT NULL,
  `attach_id` mediumint(9) DEFAULT NULL,
  `who` mediumint(9) NOT NULL,
  `bug_when` datetime NOT NULL,
  `fieldid` mediumint(9) NOT NULL,
  `added` varchar(255) DEFAULT NULL,
  `removed` varchar(255) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bugs_activity_bug_id_idx` (`bug_id`),
  KEY `bugs_activity_who_idx` (`who`),
  KEY `bugs_activity_bug_when_idx` (`bug_when`),
  KEY `bugs_activity_fieldid_idx` (`fieldid`),
  KEY `bugs_activity_added_idx` (`added`),
  KEY `bugs_activity_removed_idx` (`removed`),
  KEY `fk_bugs_activity_comment_id_longdescs_comment_id` (`comment_id`),
  KEY `fk_bugs_activity_attach_id_attachments_attach_id` (`attach_id`),
  CONSTRAINT `fk_bugs_activity_attach_id_attachments_attach_id` FOREIGN KEY (`attach_id`) REFERENCES `attachments` (`attach_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bugs_activity_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bugs_activity_comment_id_longdescs_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `longdescs` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bugs_activity_fieldid_fielddefs_id` FOREIGN KEY (`fieldid`) REFERENCES `fielddefs` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_bugs_activity_who_profiles_userid` FOREIGN KEY (`who`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bugs_activity` */

/*Table structure for table `bugs_aliases` */

DROP TABLE IF EXISTS `bugs_aliases`;

CREATE TABLE `bugs_aliases` (
  `alias` varchar(40) NOT NULL,
  `bug_id` mediumint(9) DEFAULT NULL,
  UNIQUE KEY `bugs_aliases_alias_idx` (`alias`),
  KEY `bugs_aliases_bug_id_idx` (`bug_id`),
  CONSTRAINT `fk_bugs_aliases_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bugs_aliases` */

/*Table structure for table `bugs_fulltext` */

DROP TABLE IF EXISTS `bugs_fulltext`;

CREATE TABLE `bugs_fulltext` (
  `bug_id` mediumint(9) NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `comments` mediumtext DEFAULT NULL,
  `comments_noprivate` mediumtext DEFAULT NULL,
  PRIMARY KEY (`bug_id`),
  FULLTEXT KEY `bugs_fulltext_short_desc_idx` (`short_desc`),
  FULLTEXT KEY `bugs_fulltext_comments_idx` (`comments`),
  FULLTEXT KEY `bugs_fulltext_comments_noprivate_idx` (`comments_noprivate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bugs_fulltext` */

/*Table structure for table `bz_schema` */

DROP TABLE IF EXISTS `bz_schema`;

CREATE TABLE `bz_schema` (
  `schema_data` longblob NOT NULL,
  `version` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bz_schema` */

insert  into `bz_schema`(`schema_data`,`version`) values 
('$VAR1 = {\r\n          \'attach_data\' => {\r\n                             \'FIELDS\' => [\r\n                                           \'id\',\r\n                                           {\r\n                                             \'NOTNULL\' => 1,\r\n                                             \'PRIMARYKEY\' => 1,\r\n                                             \'REFERENCES\' => {\r\n                                                               \'COLUMN\' => \'attach_id\',\r\n                                                               \'DELETE\' => \'CASCADE\',\r\n                                                               \'TABLE\' => \'attachments\',\r\n                                                               \'created\' => 1\r\n                                                             },\r\n                                             \'TYPE\' => \'INT3\'\r\n                                           },\r\n                                           \'thedata\',\r\n                                           {\r\n                                             \'NOTNULL\' => 1,\r\n                                             \'TYPE\' => \'LONGBLOB\'\r\n                                           }\r\n                                         ]\r\n                           },\r\n          \'attachments\' => {\r\n                             \'FIELDS\' => [\r\n                                           \'attach_id\',\r\n                                           {\r\n                                             \'NOTNULL\' => 1,\r\n                                             \'PRIMARYKEY\' => 1,\r\n                                             \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                           },\r\n                                           \'bug_id\',\r\n                                           {\r\n                                             \'NOTNULL\' => 1,\r\n                                             \'REFERENCES\' => {\r\n                                                               \'COLUMN\' => \'bug_id\',\r\n                                                               \'DELETE\' => \'CASCADE\',\r\n                                                               \'TABLE\' => \'bugs\',\r\n                                                               \'created\' => 1\r\n                                                             },\r\n                                             \'TYPE\' => \'INT3\'\r\n                                           },\r\n                                           \'creation_ts\',\r\n                                           {\r\n                                             \'NOTNULL\' => 1,\r\n                                             \'TYPE\' => \'DATETIME\'\r\n                                           },\r\n                                           \'modification_time\',\r\n                                           {\r\n                                             \'NOTNULL\' => 1,\r\n                                             \'TYPE\' => \'DATETIME\'\r\n                                           },\r\n                                           \'description\',\r\n                                           {\r\n                                             \'NOTNULL\' => 1,\r\n                                             \'TYPE\' => \'TINYTEXT\'\r\n                                           },\r\n                                           \'mimetype\',\r\n                                           {\r\n                                             \'NOTNULL\' => 1,\r\n                                             \'TYPE\' => \'TINYTEXT\'\r\n                                           },\r\n                                           \'ispatch\',\r\n                                           {\r\n                                             \'DEFAULT\' => \'FALSE\',\r\n                                             \'NOTNULL\' => 1,\r\n                                             \'TYPE\' => \'BOOLEAN\'\r\n                                           },\r\n                                           \'filename\',\r\n                                           {\r\n                                             \'NOTNULL\' => 1,\r\n                                             \'TYPE\' => \'varchar(255)\'\r\n                                           },\r\n                                           \'submitter_id\',\r\n                                           {\r\n                                             \'NOTNULL\' => 1,\r\n                                             \'REFERENCES\' => {\r\n                                                               \'COLUMN\' => \'userid\',\r\n                                                               \'TABLE\' => \'profiles\',\r\n                                                               \'created\' => 1\r\n                                                             },\r\n                                             \'TYPE\' => \'INT3\'\r\n                                           },\r\n                                           \'isobsolete\',\r\n                                           {\r\n                                             \'DEFAULT\' => \'FALSE\',\r\n                                             \'NOTNULL\' => 1,\r\n                                             \'TYPE\' => \'BOOLEAN\'\r\n                                           },\r\n                                           \'isprivate\',\r\n                                           {\r\n                                             \'DEFAULT\' => \'FALSE\',\r\n                                             \'NOTNULL\' => 1,\r\n                                             \'TYPE\' => \'BOOLEAN\'\r\n                                           }\r\n                                         ],\r\n                             \'INDEXES\' => [\r\n                                            \'attachments_bug_id_idx\',\r\n                                            [\r\n                                              \'bug_id\'\r\n                                            ],\r\n                                            \'attachments_creation_ts_idx\',\r\n                                            [\r\n                                              \'creation_ts\'\r\n                                            ],\r\n                                            \'attachments_modification_time_idx\',\r\n                                            [\r\n                                              \'modification_time\'\r\n                                            ],\r\n                                            \'attachments_submitter_id_idx\',\r\n                                            [\r\n                                              \'submitter_id\',\r\n                                              \'bug_id\'\r\n                                            ]\r\n                                          ]\r\n                           },\r\n          \'audit_log\' => {\r\n                           \'FIELDS\' => [\r\n                                         \'user_id\',\r\n                                         {\r\n                                           \'REFERENCES\' => {\r\n                                                             \'COLUMN\' => \'userid\',\r\n                                                             \'DELETE\' => \'SET NULL\',\r\n                                                             \'TABLE\' => \'profiles\',\r\n                                                             \'created\' => 1\r\n                                                           },\r\n                                           \'TYPE\' => \'INT3\'\r\n                                         },\r\n                                         \'class\',\r\n                                         {\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'varchar(255)\'\r\n                                         },\r\n                                         \'object_id\',\r\n                                         {\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'INT4\'\r\n                                         },\r\n                                         \'field\',\r\n                                         {\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'varchar(64)\'\r\n                                         },\r\n                                         \'removed\',\r\n                                         {\r\n                                           \'TYPE\' => \'MEDIUMTEXT\'\r\n                                         },\r\n                                         \'added\',\r\n                                         {\r\n                                           \'TYPE\' => \'MEDIUMTEXT\'\r\n                                         },\r\n                                         \'at_time\',\r\n                                         {\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'DATETIME\'\r\n                                         }\r\n                                       ],\r\n                           \'INDEXES\' => [\r\n                                          \'audit_log_class_idx\',\r\n                                          [\r\n                                            \'class\',\r\n                                            \'at_time\'\r\n                                          ]\r\n                                        ]\r\n                         },\r\n          \'bug_cf_ipi_clust_3_roadbook_for\' => {\r\n                                     \'FIELDS\' => [\r\n                                                   \'bug_id\',\r\n                                                   {\r\n                                                     \'NOTNULL\' => 1,\r\n                                                     \'REFERENCES\' => {\r\n                                                                       \'COLUMN\' => \'bug_id\',\r\n                                                                       \'DELETE\' => \'CASCADE\',\r\n                                                                       \'TABLE\' => \'bugs\',\r\n                                                                       \'created\' => 1\r\n                                                                     },\r\n                                                     \'TYPE\' => \'INT3\'\r\n                                                   },\r\n                                                   \'value\',\r\n                                                   {\r\n                                                     \'NOTNULL\' => 1,\r\n                                                     \'REFERENCES\' => {\r\n                                                                       \'COLUMN\' => \'value\',\r\n                                                                       \'TABLE\' => \'cf_ipi_clust_3_roadbook_for\',\r\n                                                                       \'created\' => 1\r\n                                                                     },\r\n                                                     \'TYPE\' => \'varchar(64)\'\r\n                                                   }\r\n                                                 ],\r\n                                     \'INDEXES\' => [\r\n                                                    \'bug_cf_ipi_clust_3_roadbook_for_bug_id_idx\',\r\n                                                    {\r\n                                                      \'FIELDS\' => [\r\n                                                                    \'bug_id\',\r\n                                                                    \'value\'\r\n                                                                  ],\r\n                                                      \'TYPE\' => \'UNIQUE\'\r\n                                                    }\r\n                                                  ]\r\n                                   },\r\n          \'bug_cf_ipi_clust_9_acct_action\' => {\r\n                                          \'FIELDS\' => [\r\n                                                        \'bug_id\',\r\n                                                        {\r\n                                                          \'NOTNULL\' => 1,\r\n                                                          \'REFERENCES\' => {\r\n                                                                            \'COLUMN\' => \'bug_id\',\r\n                                                                            \'DELETE\' => \'CASCADE\',\r\n                                                                            \'TABLE\' => \'bugs\',\r\n                                                                            \'created\' => 1\r\n                                                                          },\r\n                                                          \'TYPE\' => \'INT3\'\r\n                                                        },\r\n                                                        \'value\',\r\n                                                        {\r\n                                                          \'NOTNULL\' => 1,\r\n                                                          \'REFERENCES\' => {\r\n                                                                            \'COLUMN\' => \'value\',\r\n                                                                            \'TABLE\' => \'cf_ipi_clust_9_acct_action\',\r\n                                                                            \'created\' => 1\r\n                                                                          },\r\n                                                          \'TYPE\' => \'varchar(64)\'\r\n                                                        }\r\n                                                      ],\r\n                                          \'INDEXES\' => [\r\n                                                         \'bug_cf_ipi_clust_9_acct_action_bug_id_idx\',\r\n                                                         {\r\n                                                           \'FIELDS\' => [\r\n                                                                         \'bug_id\',\r\n                                                                         \'value\'\r\n                                                                       ],\r\n                                                           \'TYPE\' => \'UNIQUE\'\r\n                                                         }\r\n                                                       ]\r\n                                        },\r\n          \'bug_group_map\' => {\r\n                               \'FIELDS\' => [\r\n                                             \'bug_id\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'REFERENCES\' => {\r\n                                                                 \'COLUMN\' => \'bug_id\',\r\n                                                                 \'DELETE\' => \'CASCADE\',\r\n                                                                 \'TABLE\' => \'bugs\',\r\n                                                                 \'created\' => 1\r\n                                                               },\r\n                                               \'TYPE\' => \'INT3\'\r\n                                             },\r\n                                             \'group_id\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'REFERENCES\' => {\r\n                                                                 \'COLUMN\' => \'id\',\r\n                                                                 \'DELETE\' => \'CASCADE\',\r\n                                                                 \'TABLE\' => \'groups\',\r\n                                                                 \'created\' => 1\r\n                                                               },\r\n                                               \'TYPE\' => \'INT3\'\r\n                                             }\r\n                                           ],\r\n                               \'INDEXES\' => [\r\n                                              \'bug_group_map_bug_id_idx\',\r\n                                              {\r\n                                                \'FIELDS\' => [\r\n                                                              \'bug_id\',\r\n                                                              \'group_id\'\r\n                                                            ],\r\n                                                \'TYPE\' => \'UNIQUE\'\r\n                                              },\r\n                                              \'bug_group_map_group_id_idx\',\r\n                                              [\r\n                                                \'group_id\'\r\n                                              ]\r\n                                            ]\r\n                             },\r\n          \'bug_see_also\' => {\r\n                              \'FIELDS\' => [\r\n                                            \'id\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'PRIMARYKEY\' => 1,\r\n                                              \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                            },\r\n                                            \'bug_id\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'REFERENCES\' => {\r\n                                                                \'COLUMN\' => \'bug_id\',\r\n                                                                \'DELETE\' => \'CASCADE\',\r\n                                                                \'TABLE\' => \'bugs\',\r\n                                                                \'created\' => 1\r\n                                                              },\r\n                                              \'TYPE\' => \'INT3\'\r\n                                            },\r\n                                            \'value\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'TYPE\' => \'varchar(255)\'\r\n                                            },\r\n                                            \'class\',\r\n                                            {\r\n                                              \'DEFAULT\' => \'\\\'\\\'\',\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'TYPE\' => \'varchar(255)\'\r\n                                            }\r\n                                          ],\r\n                              \'INDEXES\' => [\r\n                                             \'bug_see_also_bug_id_idx\',\r\n                                             {\r\n                                               \'FIELDS\' => [\r\n                                                             \'bug_id\',\r\n                                                             \'value\'\r\n                                                           ],\r\n                                               \'TYPE\' => \'UNIQUE\'\r\n                                             }\r\n                                           ]\r\n                            },\r\n          \'bug_severity\' => {\r\n                              \'FIELDS\' => [\r\n                                            \'id\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'PRIMARYKEY\' => 1,\r\n                                              \'TYPE\' => \'SMALLSERIAL\'\r\n                                            },\r\n                                            \'value\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'TYPE\' => \'varchar(64)\'\r\n                                            },\r\n                                            \'sortkey\',\r\n                                            {\r\n                                              \'DEFAULT\' => 0,\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'TYPE\' => \'INT2\'\r\n                                            },\r\n                                            \'isactive\',\r\n                                            {\r\n                                              \'DEFAULT\' => \'TRUE\',\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'TYPE\' => \'BOOLEAN\'\r\n                                            },\r\n                                            \'visibility_value_id\',\r\n                                            {\r\n                                              \'TYPE\' => \'INT2\'\r\n                                            }\r\n                                          ],\r\n                              \'INDEXES\' => [\r\n                                             \'bug_severity_value_idx\',\r\n                                             {\r\n                                               \'FIELDS\' => [\r\n                                                             \'value\'\r\n                                                           ],\r\n                                               \'TYPE\' => \'UNIQUE\'\r\n                                             },\r\n                                             \'bug_severity_sortkey_idx\',\r\n                                             [\r\n                                               \'sortkey\',\r\n                                               \'value\'\r\n                                             ],\r\n                                             \'bug_severity_visibility_value_id_idx\',\r\n                                             [\r\n                                               \'visibility_value_id\'\r\n                                             ]\r\n                                           ]\r\n                            },\r\n          \'bug_status\' => {\r\n                            \'FIELDS\' => [\r\n                                          \'id\',\r\n                                          {\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'PRIMARYKEY\' => 1,\r\n                                            \'TYPE\' => \'SMALLSERIAL\'\r\n                                          },\r\n                                          \'value\',\r\n                                          {\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'TYPE\' => \'varchar(64)\'\r\n                                          },\r\n                                          \'sortkey\',\r\n                                          {\r\n                                            \'DEFAULT\' => 0,\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'TYPE\' => \'INT2\'\r\n                                          },\r\n                                          \'isactive\',\r\n                                          {\r\n                                            \'DEFAULT\' => \'TRUE\',\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'TYPE\' => \'BOOLEAN\'\r\n                                          },\r\n                                          \'visibility_value_id\',\r\n                                          {\r\n                                            \'TYPE\' => \'INT2\'\r\n                                          },\r\n                                          \'is_open\',\r\n                                          {\r\n                                            \'DEFAULT\' => \'TRUE\',\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'TYPE\' => \'BOOLEAN\'\r\n                                          }\r\n                                        ],\r\n                            \'INDEXES\' => [\r\n                                           \'bug_status_value_idx\',\r\n                                           {\r\n                                             \'FIELDS\' => [\r\n                                                           \'value\'\r\n                                                         ],\r\n                                             \'TYPE\' => \'UNIQUE\'\r\n                                           },\r\n                                           \'bug_status_sortkey_idx\',\r\n                                           [\r\n                                             \'sortkey\',\r\n                                             \'value\'\r\n                                           ],\r\n                                           \'bug_status_visibility_value_id_idx\',\r\n                                           [\r\n                                             \'visibility_value_id\'\r\n                                           ]\r\n                                         ]\r\n                          },\r\n          \'bug_tag\' => {\r\n                         \'FIELDS\' => [\r\n                                       \'bug_id\',\r\n                                       {\r\n                                         \'NOTNULL\' => 1,\r\n                                         \'REFERENCES\' => {\r\n                                                           \'COLUMN\' => \'bug_id\',\r\n                                                           \'DELETE\' => \'CASCADE\',\r\n                                                           \'TABLE\' => \'bugs\',\r\n                                                           \'created\' => 1\r\n                                                         },\r\n                                         \'TYPE\' => \'INT3\'\r\n                                       },\r\n                                       \'tag_id\',\r\n                                       {\r\n                                         \'NOTNULL\' => 1,\r\n                                         \'REFERENCES\' => {\r\n                                                           \'COLUMN\' => \'id\',\r\n                                                           \'DELETE\' => \'CASCADE\',\r\n                                                           \'TABLE\' => \'tag\',\r\n                                                           \'created\' => 1\r\n                                                         },\r\n                                         \'TYPE\' => \'INT3\'\r\n                                       }\r\n                                     ],\r\n                         \'INDEXES\' => [\r\n                                        \'bug_tag_bug_id_idx\',\r\n                                        {\r\n                                          \'FIELDS\' => [\r\n                                                        \'bug_id\',\r\n                                                        \'tag_id\'\r\n                                                      ],\r\n                                          \'TYPE\' => \'UNIQUE\'\r\n                                        }\r\n                                      ]\r\n                       },\r\n          \'bug_user_last_visit\' => {\r\n                                     \'FIELDS\' => [\r\n                                                   \'id\',\r\n                                                   {\r\n                                                     \'NOTNULL\' => 1,\r\n                                                     \'PRIMARYKEY\' => 1,\r\n                                                     \'TYPE\' => \'INTSERIAL\'\r\n                                                   },\r\n                                                   \'user_id\',\r\n                                                   {\r\n                                                     \'NOTNULL\' => 1,\r\n                                                     \'REFERENCES\' => {\r\n                                                                       \'COLUMN\' => \'userid\',\r\n                                                                       \'DELETE\' => \'CASCADE\',\r\n                                                                       \'TABLE\' => \'profiles\',\r\n                                                                       \'created\' => 1\r\n                                                                     },\r\n                                                     \'TYPE\' => \'INT3\'\r\n                                                   },\r\n                                                   \'bug_id\',\r\n                                                   {\r\n                                                     \'NOTNULL\' => 1,\r\n                                                     \'REFERENCES\' => {\r\n                                                                       \'COLUMN\' => \'bug_id\',\r\n                                                                       \'DELETE\' => \'CASCADE\',\r\n                                                                       \'TABLE\' => \'bugs\',\r\n                                                                       \'created\' => 1\r\n                                                                     },\r\n                                                     \'TYPE\' => \'INT3\'\r\n                                                   },\r\n                                                   \'last_visit_ts\',\r\n                                                   {\r\n                                                     \'NOTNULL\' => 1,\r\n                                                     \'TYPE\' => \'DATETIME\'\r\n                                                   }\r\n                                                 ],\r\n                                     \'INDEXES\' => [\r\n                                                    \'bug_user_last_visit_idx\',\r\n                                                    {\r\n                                                      \'FIELDS\' => [\r\n                                                                    \'user_id\',\r\n                                                                    \'bug_id\'\r\n                                                                  ],\r\n                                                      \'TYPE\' => \'UNIQUE\'\r\n                                                    },\r\n                                                    \'bug_user_last_visit_last_visit_ts_idx\',\r\n                                                    [\r\n                                                      \'last_visit_ts\'\r\n                                                    ]\r\n                                                  ]\r\n                                   },\r\n          \'bugs\' => {\r\n                      \'FIELDS\' => [\r\n                                    \'bug_id\',\r\n                                    {\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'PRIMARYKEY\' => 1,\r\n                                      \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                    },\r\n                                    \'assigned_to\',\r\n                                    {\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'REFERENCES\' => {\r\n                                                        \'COLUMN\' => \'userid\',\r\n                                                        \'TABLE\' => \'profiles\',\r\n                                                        \'created\' => 1\r\n                                                      },\r\n                                      \'TYPE\' => \'INT3\'\r\n                                    },\r\n                                    \'bug_file_loc\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'MEDIUMTEXT\'\r\n                                    },\r\n                                    \'bug_severity\',\r\n                                    {\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(64)\'\r\n                                    },\r\n                                    \'bug_status\',\r\n                                    {\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(64)\'\r\n                                    },\r\n                                    \'creation_ts\',\r\n                                    {\r\n                                      \'TYPE\' => \'DATETIME\'\r\n                                    },\r\n                                    \'delta_ts\',\r\n                                    {\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'DATETIME\'\r\n                                    },\r\n                                    \'short_desc\',\r\n                                    {\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(255)\'\r\n                                    },\r\n                                    \'op_sys\',\r\n                                    {\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(64)\'\r\n                                    },\r\n                                    \'priority\',\r\n                                    {\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(64)\'\r\n                                    },\r\n                                    \'product_id\',\r\n                                    {\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'REFERENCES\' => {\r\n                                                        \'COLUMN\' => \'id\',\r\n                                                        \'TABLE\' => \'products\',\r\n                                                        \'created\' => 1\r\n                                                      },\r\n                                      \'TYPE\' => \'INT2\'\r\n                                    },\r\n                                    \'rep_platform\',\r\n                                    {\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(64)\'\r\n                                    },\r\n                                    \'reporter\',\r\n                                    {\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'REFERENCES\' => {\r\n                                                        \'COLUMN\' => \'userid\',\r\n                                                        \'TABLE\' => \'profiles\',\r\n                                                        \'created\' => 1\r\n                                                      },\r\n                                      \'TYPE\' => \'INT3\'\r\n                                    },\r\n                                    \'version\',\r\n                                    {\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(64)\'\r\n                                    },\r\n                                    \'component_id\',\r\n                                    {\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'REFERENCES\' => {\r\n                                                        \'COLUMN\' => \'id\',\r\n                                                        \'TABLE\' => \'components\',\r\n                                                        \'created\' => 1\r\n                                                      },\r\n                                      \'TYPE\' => \'INT3\'\r\n                                    },\r\n                                    \'resolution\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(64)\'\r\n                                    },\r\n                                    \'target_milestone\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'---\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(64)\'\r\n                                    },\r\n                                    \'qa_contact\',\r\n                                    {\r\n                                      \'REFERENCES\' => {\r\n                                                        \'COLUMN\' => \'userid\',\r\n                                                        \'TABLE\' => \'profiles\',\r\n                                                        \'created\' => 1\r\n                                                      },\r\n                                      \'TYPE\' => \'INT3\'\r\n                                    },\r\n                                    \'status_whiteboard\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'MEDIUMTEXT\'\r\n                                    },\r\n                                    \'lastdiffed\',\r\n                                    {\r\n                                      \'TYPE\' => \'DATETIME\'\r\n                                    },\r\n                                    \'everconfirmed\',\r\n                                    {\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'BOOLEAN\'\r\n                                    },\r\n                                    \'reporter_accessible\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'TRUE\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'BOOLEAN\'\r\n                                    },\r\n                                    \'cclist_accessible\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'TRUE\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'BOOLEAN\'\r\n                                    },\r\n                                    \'estimated_time\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'0\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'decimal(7,2)\'\r\n                                    },\r\n                                    \'remaining_time\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'0\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'decimal(7,2)\'\r\n                                    },\r\n                                    \'deadline\',\r\n                                    {\r\n                                      \'TYPE\' => \'DATETIME\'\r\n                                    },\r\n                                    \'cf_ipi_clust_4_status_in_progress\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'---\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(64)\'\r\n                                    },\r\n                                    \'cf_ipi_clust_4_status_standby\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'---\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(64)\'\r\n                                    },\r\n                                    \'cf_ipi_clust_6_claim_type\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'---\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(64)\'\r\n                                    },\r\n                                    \'cf_ipi_clust_1_solution\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'MEDIUMTEXT\'\r\n                                    },\r\n                                    \'cf_ipi_clust_3_nber_field_visits\',\r\n                                    {\r\n                                      \'DEFAULT\' => 0,\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'INT4\'\r\n                                    },\r\n                                    \'cf_ipi_clust_1_next_step_by\',\r\n                                    {\r\n                                      \'TYPE\' => \'DATETIME\'\r\n                                    },\r\n                                    \'cf_ipi_clust_1_next_step\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'MEDIUMTEXT\'\r\n                                    },\r\n                                    \'cf_ipi_clust_3_field_action_from\',\r\n                                    {\r\n                                      \'TYPE\' => \'DATETIME\'\r\n                                    },\r\n                                    \'cf_ipi_clust_3_field_action_until\',\r\n                                    {\r\n                                      \'TYPE\' => \'DATETIME\'\r\n                                    },\r\n                                    \'cf_ipi_clust_3_action_type\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'---\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(64)\'\r\n                                    },\r\n                                    \'cf_ipi_clust_3_field_action\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'MEDIUMTEXT\'\r\n                                    },\r\n                                    \'cf_ipi_clust_5_action_purchase_list\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'MEDIUMTEXT\'\r\n                                    },\r\n                                    \'cf_ipi_clust_5_budget\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(255)\'\r\n                                    },\r\n                                    \'cf_ipi_clust_5_approved_budget\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(255)\'\r\n                                    },\r\n                                    \'cf_ipi_clust_5_contractor\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(255)\'\r\n                                    },\r\n                                    \'cf_ipi_clust_5_approval_for\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'MEDIUMTEXT\'\r\n                                    },\r\n                                    \'cf_ipi_clust_5_approval_comment\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'MEDIUMTEXT\'\r\n                                    },\r\n                                    \'cf_ipi_clust_7_payment_type\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'---\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(64)\'\r\n                                    },\r\n                                    \'cf_ipi_clust_7_contractor_payment\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'MEDIUMTEXT\'\r\n                                    },\r\n                                    \'cf_ipi_clust_7_bill_number\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(255)\'\r\n                                    },\r\n                                    \'cf_ipi_clust_5_purchase_cost\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(255)\'\r\n                                    },\r\n                                    \'cf_ipi_clust_2_room\',\r\n                                    {\r\n                                      \'DEFAULT\' => \'\\\'\\\'\',\r\n                                      \'NOTNULL\' => 1,\r\n                                      \'TYPE\' => \'varchar(255)\'\r\n                                    }\r\n                                  ],\r\n                      \'INDEXES\' => [\r\n                                     \'bugs_assigned_to_idx\',\r\n                                     [\r\n                                       \'assigned_to\'\r\n                                     ],\r\n                                     \'bugs_creation_ts_idx\',\r\n                                     [\r\n                                       \'creation_ts\'\r\n                                     ],\r\n                                     \'bugs_delta_ts_idx\',\r\n                                     [\r\n                                       \'delta_ts\'\r\n                                     ],\r\n                                     \'bugs_bug_severity_idx\',\r\n                                     [\r\n                                       \'bug_severity\'\r\n                                     ],\r\n                                     \'bugs_bug_status_idx\',\r\n                                     [\r\n                                       \'bug_status\'\r\n                                     ],\r\n                                     \'bugs_op_sys_idx\',\r\n                                     [\r\n                                       \'op_sys\'\r\n                                     ],\r\n                                     \'bugs_priority_idx\',\r\n                                     [\r\n                                       \'priority\'\r\n                                     ],\r\n                                     \'bugs_product_id_idx\',\r\n                                     [\r\n                                       \'product_id\'\r\n                                     ],\r\n                                     \'bugs_reporter_idx\',\r\n                                     [\r\n                                       \'reporter\'\r\n                                     ],\r\n                                     \'bugs_version_idx\',\r\n                                     [\r\n                                       \'version\'\r\n                                     ],\r\n                                     \'bugs_component_id_idx\',\r\n                                     [\r\n                                       \'component_id\'\r\n                                     ],\r\n                                     \'bugs_resolution_idx\',\r\n                                     [\r\n                                       \'resolution\'\r\n                                     ],\r\n                                     \'bugs_target_milestone_idx\',\r\n                                     [\r\n                                       \'target_milestone\'\r\n                                     ],\r\n                                     \'bugs_qa_contact_idx\',\r\n                                     [\r\n                                       \'qa_contact\'\r\n                                     ]\r\n                                   ]\r\n                    },\r\n          \'bugs_activity\' => {\r\n                               \'FIELDS\' => [\r\n                                             \'id\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'PRIMARYKEY\' => 1,\r\n                                               \'TYPE\' => \'INTSERIAL\'\r\n                                             },\r\n                                             \'bug_id\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'REFERENCES\' => {\r\n                                                                 \'COLUMN\' => \'bug_id\',\r\n                                                                 \'DELETE\' => \'CASCADE\',\r\n                                                                 \'TABLE\' => \'bugs\',\r\n                                                                 \'created\' => 1\r\n                                                               },\r\n                                               \'TYPE\' => \'INT3\'\r\n                                             },\r\n                                             \'attach_id\',\r\n                                             {\r\n                                               \'REFERENCES\' => {\r\n                                                                 \'COLUMN\' => \'attach_id\',\r\n                                                                 \'DELETE\' => \'CASCADE\',\r\n                                                                 \'TABLE\' => \'attachments\',\r\n                                                                 \'created\' => 1\r\n                                                               },\r\n                                               \'TYPE\' => \'INT3\'\r\n                                             },\r\n                                             \'who\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'REFERENCES\' => {\r\n                                                                 \'COLUMN\' => \'userid\',\r\n                                                                 \'TABLE\' => \'profiles\',\r\n                                                                 \'created\' => 1\r\n                                                               },\r\n                                               \'TYPE\' => \'INT3\'\r\n                                             },\r\n                                             \'bug_when\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'TYPE\' => \'DATETIME\'\r\n                                             },\r\n                                             \'fieldid\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'REFERENCES\' => {\r\n                                                                 \'COLUMN\' => \'id\',\r\n                                                                 \'TABLE\' => \'fielddefs\',\r\n                                                                 \'created\' => 1\r\n                                                               },\r\n                                               \'TYPE\' => \'INT3\'\r\n                                             },\r\n                                             \'added\',\r\n                                             {\r\n                                               \'TYPE\' => \'varchar(255)\'\r\n                                             },\r\n                                             \'removed\',\r\n                                             {\r\n                                               \'TYPE\' => \'varchar(255)\'\r\n                                             },\r\n                                             \'comment_id\',\r\n                                             {\r\n                                               \'REFERENCES\' => {\r\n                                                                 \'COLUMN\' => \'comment_id\',\r\n                                                                 \'DELETE\' => \'CASCADE\',\r\n                                                                 \'TABLE\' => \'longdescs\',\r\n                                                                 \'created\' => 1\r\n                                                               },\r\n                                               \'TYPE\' => \'INT4\'\r\n                                             }\r\n                                           ],\r\n                               \'INDEXES\' => [\r\n                                              \'bugs_activity_bug_id_idx\',\r\n                                              [\r\n                                                \'bug_id\'\r\n                                              ],\r\n                                              \'bugs_activity_who_idx\',\r\n                                              [\r\n                                                \'who\'\r\n                                              ],\r\n                                              \'bugs_activity_bug_when_idx\',\r\n                                              [\r\n                                                \'bug_when\'\r\n                                              ],\r\n                                              \'bugs_activity_fieldid_idx\',\r\n                                              [\r\n                                                \'fieldid\'\r\n                                              ],\r\n                                              \'bugs_activity_added_idx\',\r\n                                              [\r\n                                                \'added\'\r\n                                              ],\r\n                                              \'bugs_activity_removed_idx\',\r\n                                              [\r\n                                                \'removed\'\r\n                                              ]\r\n                                            ]\r\n                             },\r\n          \'bugs_aliases\' => {\r\n                              \'FIELDS\' => [\r\n                                            \'alias\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'TYPE\' => \'varchar(40)\'\r\n                                            },\r\n                                            \'bug_id\',\r\n                                            {\r\n                                              \'REFERENCES\' => {\r\n                                                                \'COLUMN\' => \'bug_id\',\r\n                                                                \'DELETE\' => \'CASCADE\',\r\n                                                                \'TABLE\' => \'bugs\',\r\n                                                                \'created\' => 1\r\n                                                              },\r\n                                              \'TYPE\' => \'INT3\'\r\n                                            }\r\n                                          ],\r\n                              \'INDEXES\' => [\r\n                                             \'bugs_aliases_bug_id_idx\',\r\n                                             [\r\n                                               \'bug_id\'\r\n                                             ],\r\n                                             \'bugs_aliases_alias_idx\',\r\n                                             {\r\n                                               \'FIELDS\' => [\r\n                                                             \'alias\'\r\n                                                           ],\r\n                                               \'TYPE\' => \'UNIQUE\'\r\n                                             }\r\n                                           ]\r\n                            },\r\n          \'bugs_fulltext\' => {\r\n                               \'FIELDS\' => [\r\n                                             \'bug_id\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'PRIMARYKEY\' => 1,\r\n                                               \'REFERENCES\' => {\r\n                                                                 \'COLUMN\' => \'bug_id\',\r\n                                                                 \'DELETE\' => \'CASCADE\',\r\n                                                                 \'TABLE\' => \'bugs\',\r\n                                                                 \'created\' => 1\r\n                                                               },\r\n                                               \'TYPE\' => \'INT3\'\r\n                                             },\r\n                                             \'short_desc\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'TYPE\' => \'varchar(255)\'\r\n                                             },\r\n                                             \'comments\',\r\n                                             {\r\n                                               \'TYPE\' => \'LONGTEXT\'\r\n                                             },\r\n                                             \'comments_noprivate\',\r\n                                             {\r\n                                               \'TYPE\' => \'LONGTEXT\'\r\n                                             }\r\n                                           ],\r\n                               \'INDEXES\' => [\r\n                                              \'bugs_fulltext_short_desc_idx\',\r\n                                              {\r\n                                                \'FIELDS\' => [\r\n                                                              \'short_desc\'\r\n                                                            ],\r\n                                                \'TYPE\' => \'FULLTEXT\'\r\n                                              },\r\n                                              \'bugs_fulltext_comments_idx\',\r\n                                              {\r\n                                                \'FIELDS\' => [\r\n                                                              \'comments\'\r\n                                                            ],\r\n                                                \'TYPE\' => \'FULLTEXT\'\r\n                                              },\r\n                                              \'bugs_fulltext_comments_noprivate_idx\',\r\n                                              {\r\n                                                \'FIELDS\' => [\r\n                                                              \'comments_noprivate\'\r\n                                                            ],\r\n                                                \'TYPE\' => \'FULLTEXT\'\r\n                                              }\r\n                                            ]\r\n                             },\r\n          \'bz_schema\' => {\r\n                           \'FIELDS\' => [\r\n                                         \'schema_data\',\r\n                                         {\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'LONGBLOB\'\r\n                                         },\r\n                                         \'version\',\r\n                                         {\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'decimal(3,2)\'\r\n                                         }\r\n                                       ]\r\n                         },\r\n          \'category_group_map\' => {\r\n                                    \'FIELDS\' => [\r\n                                                  \'category_id\',\r\n                                                  {\r\n                                                    \'NOTNULL\' => 1,\r\n                                                    \'REFERENCES\' => {\r\n                                                                      \'COLUMN\' => \'id\',\r\n                                                                      \'DELETE\' => \'CASCADE\',\r\n                                                                      \'TABLE\' => \'series_categories\',\r\n                                                                      \'created\' => 1\r\n                                                                    },\r\n                                                    \'TYPE\' => \'INT2\'\r\n                                                  },\r\n                                                  \'group_id\',\r\n                                                  {\r\n                                                    \'NOTNULL\' => 1,\r\n                                                    \'REFERENCES\' => {\r\n                                                                      \'COLUMN\' => \'id\',\r\n                                                                      \'DELETE\' => \'CASCADE\',\r\n                                                                      \'TABLE\' => \'groups\',\r\n                                                                      \'created\' => 1\r\n                                                                    },\r\n                                                    \'TYPE\' => \'INT3\'\r\n                                                  }\r\n                                                ],\r\n                                    \'INDEXES\' => [\r\n                                                   \'category_group_map_category_id_idx\',\r\n                                                   {\r\n                                                     \'FIELDS\' => [\r\n                                                                   \'category_id\',\r\n                                                                   \'group_id\'\r\n                                                                 ],\r\n                                                     \'TYPE\' => \'UNIQUE\'\r\n                                                   }\r\n                                                 ]\r\n                                  },\r\n          \'cc\' => {\r\n                    \'FIELDS\' => [\r\n                                  \'bug_id\',\r\n                                  {\r\n                                    \'NOTNULL\' => 1,\r\n                                    \'REFERENCES\' => {\r\n                                                      \'COLUMN\' => \'bug_id\',\r\n                                                      \'DELETE\' => \'CASCADE\',\r\n                                                      \'TABLE\' => \'bugs\',\r\n                                                      \'created\' => 1\r\n                                                    },\r\n                                    \'TYPE\' => \'INT3\'\r\n                                  },\r\n                                  \'who\',\r\n                                  {\r\n                                    \'NOTNULL\' => 1,\r\n                                    \'REFERENCES\' => {\r\n                                                      \'COLUMN\' => \'userid\',\r\n                                                      \'DELETE\' => \'CASCADE\',\r\n                                                      \'TABLE\' => \'profiles\',\r\n                                                      \'created\' => 1\r\n                                                    },\r\n                                    \'TYPE\' => \'INT3\'\r\n                                  }\r\n                                ],\r\n                    \'INDEXES\' => [\r\n                                   \'cc_bug_id_idx\',\r\n                                   {\r\n                                     \'FIELDS\' => [\r\n                                                   \'bug_id\',\r\n                                                   \'who\'\r\n                                                 ],\r\n                                     \'TYPE\' => \'UNIQUE\'\r\n                                   },\r\n                                   \'cc_who_idx\',\r\n                                   [\r\n                                     \'who\'\r\n                                   ]\r\n                                 ]\r\n                  },\r\n          \'cf_ipi_clust_3_action_type\' => {\r\n                                            \'FIELDS\' => [\r\n                                                          \'id\',\r\n                                                          {\r\n                                                            \'NOTNULL\' => 1,\r\n                                                            \'PRIMARYKEY\' => 1,\r\n                                                            \'TYPE\' => \'SMALLSERIAL\'\r\n                                                          },\r\n                                                          \'value\',\r\n                                                          {\r\n                                                            \'NOTNULL\' => 1,\r\n                                                            \'TYPE\' => \'varchar(64)\'\r\n                                                          },\r\n                                                          \'sortkey\',\r\n                                                          {\r\n                                                            \'DEFAULT\' => 0,\r\n                                                            \'NOTNULL\' => 1,\r\n                                                            \'TYPE\' => \'INT2\'\r\n                                                          },\r\n                                                          \'isactive\',\r\n                                                          {\r\n                                                            \'DEFAULT\' => \'TRUE\',\r\n                                                            \'NOTNULL\' => 1,\r\n                                                            \'TYPE\' => \'BOOLEAN\'\r\n                                                          },\r\n                                                          \'visibility_value_id\',\r\n                                                          {\r\n                                                            \'TYPE\' => \'INT2\'\r\n                                                          }\r\n                                                        ],\r\n                                            \'INDEXES\' => [\r\n                                                           \'cf_ipi_clust_3_action_type_sortkey_idx\',\r\n                                                           [\r\n                                                             \'sortkey\',\r\n                                                             \'value\'\r\n                                                           ],\r\n                                                           \'cf_ipi_clust_3_action_type_visibility_value_id_idx\',\r\n                                                           [\r\n                                                             \'visibility_value_id\'\r\n                                                           ],\r\n                                                           \'cf_ipi_clust_3_action_type_value_idx\',\r\n                                                           {\r\n                                                             \'FIELDS\' => [\r\n                                                                           \'value\'\r\n                                                                         ],\r\n                                                             \'TYPE\' => \'UNIQUE\'\r\n                                                           }\r\n                                                         ]\r\n                                          },\r\n          \'cf_ipi_clust_3_roadbook_for\' => {\r\n                                             \'FIELDS\' => [\r\n                                                           \'id\',\r\n                                                           {\r\n                                                             \'NOTNULL\' => 1,\r\n                                                             \'PRIMARYKEY\' => 1,\r\n                                                             \'TYPE\' => \'SMALLSERIAL\'\r\n                                                           },\r\n                                                           \'value\',\r\n                                                           {\r\n                                                             \'NOTNULL\' => 1,\r\n                                                             \'TYPE\' => \'varchar(64)\'\r\n                                                           },\r\n                                                           \'sortkey\',\r\n                                                           {\r\n                                                             \'DEFAULT\' => 0,\r\n                                                             \'NOTNULL\' => 1,\r\n                                                             \'TYPE\' => \'INT2\'\r\n                                                           },\r\n                                                           \'isactive\',\r\n                                                           {\r\n                                                             \'DEFAULT\' => \'TRUE\',\r\n                                                             \'NOTNULL\' => 1,\r\n                                                             \'TYPE\' => \'BOOLEAN\'\r\n                                                           },\r\n                                                           \'visibility_value_id\',\r\n                                                           {\r\n                                                             \'TYPE\' => \'INT2\'\r\n                                                           }\r\n                                                         ],\r\n                                             \'INDEXES\' => [\r\n                                                            \'cf_ipi_clust_3_roadbook_for_visibility_value_id_idx\',\r\n                                                            [\r\n                                                              \'visibility_value_id\'\r\n                                                            ],\r\n                                                            \'cf_ipi_clust_3_roadbook_for_sortkey_idx\',\r\n                                                            [\r\n                                                              \'sortkey\',\r\n                                                              \'value\'\r\n                                                            ],\r\n                                                            \'cf_ipi_clust_3_roadbook_for_value_idx\',\r\n                                                            {\r\n                                                              \'FIELDS\' => [\r\n                                                                            \'value\'\r\n                                                                          ],\r\n                                                              \'TYPE\' => \'UNIQUE\'\r\n                                                            }\r\n                                                          ]\r\n                                           },\r\n          \'cf_ipi_clust_4_status_in_progress\' => {\r\n                                                   \'FIELDS\' => [\r\n                                                                 \'id\',\r\n                                                                 {\r\n                                                                   \'NOTNULL\' => 1,\r\n                                                                   \'PRIMARYKEY\' => 1,\r\n                                                                   \'TYPE\' => \'SMALLSERIAL\'\r\n                                                                 },\r\n                                                                 \'value\',\r\n                                                                 {\r\n                                                                   \'NOTNULL\' => 1,\r\n                                                                   \'TYPE\' => \'varchar(64)\'\r\n                                                                 },\r\n                                                                 \'sortkey\',\r\n                                                                 {\r\n                                                                   \'DEFAULT\' => 0,\r\n                                                                   \'NOTNULL\' => 1,\r\n                                                                   \'TYPE\' => \'INT2\'\r\n                                                                 },\r\n                                                                 \'isactive\',\r\n                                                                 {\r\n                                                                   \'DEFAULT\' => \'TRUE\',\r\n                                                                   \'NOTNULL\' => 1,\r\n                                                                   \'TYPE\' => \'BOOLEAN\'\r\n                                                                 },\r\n                                                                 \'visibility_value_id\',\r\n                                                                 {\r\n                                                                   \'TYPE\' => \'INT2\'\r\n                                                                 }\r\n                                                               ],\r\n                                                   \'INDEXES\' => [\r\n                                                                  \'cf_ipi_clust_4_status_in_progress_visibility_value_id_idx\',\r\n                                                                  [\r\n                                                                    \'visibility_value_id\'\r\n                                                                  ],\r\n                                                                  \'cf_ipi_clust_4_status_in_progress_sortkey_idx\',\r\n                                                                  [\r\n                                                                    \'sortkey\',\r\n                                                                    \'value\'\r\n                                                                  ],\r\n                                                                  \'cf_ipi_clust_4_status_in_progress_value_idx\',\r\n                                                                  {\r\n                                                                    \'FIELDS\' => [\r\n                                                                                  \'value\'\r\n                                                                                ],\r\n                                                                    \'TYPE\' => \'UNIQUE\'\r\n                                                                  }\r\n                                                                ]\r\n                                                 },\r\n          \'cf_ipi_clust_4_status_standby\' => {\r\n                                               \'FIELDS\' => [\r\n                                                             \'id\',\r\n                                                             {\r\n                                                               \'NOTNULL\' => 1,\r\n                                                               \'PRIMARYKEY\' => 1,\r\n                                                               \'TYPE\' => \'SMALLSERIAL\'\r\n                                                             },\r\n                                                             \'value\',\r\n                                                             {\r\n                                                               \'NOTNULL\' => 1,\r\n                                                               \'TYPE\' => \'varchar(64)\'\r\n                                                             },\r\n                                                             \'sortkey\',\r\n                                                             {\r\n                                                               \'DEFAULT\' => 0,\r\n                                                               \'NOTNULL\' => 1,\r\n                                                               \'TYPE\' => \'INT2\'\r\n                                                             },\r\n                                                             \'isactive\',\r\n                                                             {\r\n                                                               \'DEFAULT\' => \'TRUE\',\r\n                                                               \'NOTNULL\' => 1,\r\n                                                               \'TYPE\' => \'BOOLEAN\'\r\n                                                             },\r\n                                                             \'visibility_value_id\',\r\n                                                             {\r\n                                                               \'TYPE\' => \'INT2\'\r\n                                                             }\r\n                                                           ],\r\n                                               \'INDEXES\' => [\r\n                                                              \'cf_ipi_clust_4_status_standby_value_idx\',\r\n                                                              {\r\n                                                                \'FIELDS\' => [\r\n                                                                              \'value\'\r\n                                                                            ],\r\n                                                                \'TYPE\' => \'UNIQUE\'\r\n                                                              },\r\n                                                              \'cf_ipi_clust_4_status_standby_visibility_value_id_idx\',\r\n                                                              [\r\n                                                                \'visibility_value_id\'\r\n                                                              ],\r\n                                                              \'cf_ipi_clust_4_status_standby_sortkey_idx\',\r\n                                                              [\r\n                                                                \'sortkey\',\r\n                                                                \'value\'\r\n                                                              ]\r\n                                                            ]\r\n                                             },\r\n          \'cf_ipi_clust_6_claim_type\' => {\r\n                                           \'FIELDS\' => [\r\n                                                         \'id\',\r\n                                                         {\r\n                                                           \'NOTNULL\' => 1,\r\n                                                           \'PRIMARYKEY\' => 1,\r\n                                                           \'TYPE\' => \'SMALLSERIAL\'\r\n                                                         },\r\n                                                         \'value\',\r\n                                                         {\r\n                                                           \'NOTNULL\' => 1,\r\n                                                           \'TYPE\' => \'varchar(64)\'\r\n                                                         },\r\n                                                         \'sortkey\',\r\n                                                         {\r\n                                                           \'DEFAULT\' => 0,\r\n                                                           \'NOTNULL\' => 1,\r\n                                                           \'TYPE\' => \'INT2\'\r\n                                                         },\r\n                                                         \'isactive\',\r\n                                                         {\r\n                                                           \'DEFAULT\' => \'TRUE\',\r\n                                                           \'NOTNULL\' => 1,\r\n                                                           \'TYPE\' => \'BOOLEAN\'\r\n                                                         },\r\n                                                         \'visibility_value_id\',\r\n                                                         {\r\n                                                           \'TYPE\' => \'INT2\'\r\n                                                         }\r\n                                                       ],\r\n                                           \'INDEXES\' => [\r\n                                                          \'cf_ipi_clust_6_claim_type_sortkey_idx\',\r\n                                                          [\r\n                                                            \'sortkey\',\r\n                                                            \'value\'\r\n                                                          ],\r\n                                                          \'cf_ipi_clust_6_claim_type_value_idx\',\r\n                                                          {\r\n                                                            \'FIELDS\' => [\r\n                                                                          \'value\'\r\n                                                                        ],\r\n                                                            \'TYPE\' => \'UNIQUE\'\r\n                                                          },\r\n                                                          \'cf_ipi_clust_6_claim_type_visibility_value_id_idx\',\r\n                                                          [\r\n                                                            \'visibility_value_id\'\r\n                                                          ]\r\n                                                        ]\r\n                                         },\r\n          \'cf_ipi_clust_7_payment_type\' => {\r\n                                             \'FIELDS\' => [\r\n                                                           \'id\',\r\n                                                           {\r\n                                                             \'NOTNULL\' => 1,\r\n                                                             \'PRIMARYKEY\' => 1,\r\n                                                             \'TYPE\' => \'SMALLSERIAL\'\r\n                                                           },\r\n                                                           \'value\',\r\n                                                           {\r\n                                                             \'NOTNULL\' => 1,\r\n                                                             \'TYPE\' => \'varchar(64)\'\r\n                                                           },\r\n                                                           \'sortkey\',\r\n                                                           {\r\n                                                             \'DEFAULT\' => 0,\r\n                                                             \'NOTNULL\' => 1,\r\n                                                             \'TYPE\' => \'INT2\'\r\n                                                           },\r\n                                                           \'isactive\',\r\n                                                           {\r\n                                                             \'DEFAULT\' => \'TRUE\',\r\n                                                             \'NOTNULL\' => 1,\r\n                                                             \'TYPE\' => \'BOOLEAN\'\r\n                                                           },\r\n                                                           \'visibility_value_id\',\r\n                                                           {\r\n                                                             \'TYPE\' => \'INT2\'\r\n                                                           }\r\n                                                         ],\r\n                                             \'INDEXES\' => [\r\n                                                            \'cf_ipi_clust_7_payment_type_value_idx\',\r\n                                                            {\r\n                                                              \'FIELDS\' => [\r\n                                                                            \'value\'\r\n                                                                          ],\r\n                                                              \'TYPE\' => \'UNIQUE\'\r\n                                                            },\r\n                                                            \'cf_ipi_clust_7_payment_type_visibility_value_id_idx\',\r\n                                                            [\r\n                                                              \'visibility_value_id\'\r\n                                                            ],\r\n                                                            \'cf_ipi_clust_7_payment_type_sortkey_idx\',\r\n                                                            [\r\n                                                              \'sortkey\',\r\n                                                              \'value\'\r\n                                                            ]\r\n                                                          ]\r\n                                           },\r\n          \'cf_ipi_clust_9_acct_action\' => {\r\n                                      \'FIELDS\' => [\r\n                                                    \'id\',\r\n                                                    {\r\n                                                      \'NOTNULL\' => 1,\r\n                                                      \'PRIMARYKEY\' => 1,\r\n                                                      \'TYPE\' => \'SMALLSERIAL\'\r\n                                                    },\r\n                                                    \'value\',\r\n                                                    {\r\n                                                      \'NOTNULL\' => 1,\r\n                                                      \'TYPE\' => \'varchar(64)\'\r\n                                                    },\r\n                                                    \'sortkey\',\r\n                                                    {\r\n                                                      \'DEFAULT\' => 0,\r\n                                                      \'NOTNULL\' => 1,\r\n                                                      \'TYPE\' => \'INT2\'\r\n                                                    },\r\n                                                    \'isactive\',\r\n                                                    {\r\n                                                      \'DEFAULT\' => \'TRUE\',\r\n                                                      \'NOTNULL\' => 1,\r\n                                                      \'TYPE\' => \'BOOLEAN\'\r\n                                                    },\r\n                                                    \'visibility_value_id\',\r\n                                                    {\r\n                                                      \'TYPE\' => \'INT2\'\r\n                                                    }\r\n                                                  ],\r\n                                      \'INDEXES\' => [\r\n                                                     \'cf_ipi_clust_9_acct_action_visibility_value_id_idx\',\r\n                                                     [\r\n                                                       \'visibility_value_id\'\r\n                                                     ],\r\n                                                     \'cf_ipi_clust_9_acct_action_value_idx\',\r\n                                                     {\r\n                                                       \'FIELDS\' => [\r\n                                                                     \'value\'\r\n                                                                   ],\r\n                                                       \'TYPE\' => \'UNIQUE\'\r\n                                                     },\r\n                                                     \'cf_ipi_clust_9_acct_action_sortkey_idx\',\r\n                                                     [\r\n                                                       \'sortkey\',\r\n                                                       \'value\'\r\n                                                     ]\r\n                                                   ]\r\n                                    },\r\n          \'classifications\' => {\r\n                                 \'FIELDS\' => [\r\n                                               \'id\',\r\n                                               {\r\n                                                 \'NOTNULL\' => 1,\r\n                                                 \'PRIMARYKEY\' => 1,\r\n                                                 \'TYPE\' => \'SMALLSERIAL\'\r\n                                               },\r\n                                               \'name\',\r\n                                               {\r\n                                                 \'NOTNULL\' => 1,\r\n                                                 \'TYPE\' => \'varchar(64)\'\r\n                                               },\r\n                                               \'description\',\r\n                                               {\r\n                                                 \'TYPE\' => \'MEDIUMTEXT\'\r\n                                               },\r\n                                               \'sortkey\',\r\n                                               {\r\n                                                 \'DEFAULT\' => \'0\',\r\n                                                 \'NOTNULL\' => 1,\r\n                                                 \'TYPE\' => \'INT2\'\r\n                                               }\r\n                                             ],\r\n                                 \'INDEXES\' => [\r\n                                                \'classifications_name_idx\',\r\n                                                {\r\n                                                  \'FIELDS\' => [\r\n                                                                \'name\'\r\n                                                              ],\r\n                                                  \'TYPE\' => \'UNIQUE\'\r\n                                                }\r\n                                              ]\r\n                               },\r\n          \'component_cc\' => {\r\n                              \'FIELDS\' => [\r\n                                            \'user_id\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'REFERENCES\' => {\r\n                                                                \'COLUMN\' => \'userid\',\r\n                                                                \'DELETE\' => \'CASCADE\',\r\n                                                                \'TABLE\' => \'profiles\',\r\n                                                                \'created\' => 1\r\n                                                              },\r\n                                              \'TYPE\' => \'INT3\'\r\n                                            },\r\n                                            \'component_id\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'REFERENCES\' => {\r\n                                                                \'COLUMN\' => \'id\',\r\n                                                                \'DELETE\' => \'CASCADE\',\r\n                                                                \'TABLE\' => \'components\',\r\n                                                                \'created\' => 1\r\n                                                              },\r\n                                              \'TYPE\' => \'INT3\'\r\n                                            }\r\n                                          ],\r\n                              \'INDEXES\' => [\r\n                                             \'component_cc_user_id_idx\',\r\n                                             {\r\n                                               \'FIELDS\' => [\r\n                                                             \'component_id\',\r\n                                                             \'user_id\'\r\n                                                           ],\r\n                                               \'TYPE\' => \'UNIQUE\'\r\n                                             }\r\n                                           ]\r\n                            },\r\n          \'components\' => {\r\n                            \'FIELDS\' => [\r\n                                          \'id\',\r\n                                          {\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'PRIMARYKEY\' => 1,\r\n                                            \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                          },\r\n                                          \'name\',\r\n                                          {\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'TYPE\' => \'varchar(64)\'\r\n                                          },\r\n                                          \'product_id\',\r\n                                          {\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'REFERENCES\' => {\r\n                                                              \'COLUMN\' => \'id\',\r\n                                                              \'DELETE\' => \'CASCADE\',\r\n                                                              \'TABLE\' => \'products\',\r\n                                                              \'created\' => 1\r\n                                                            },\r\n                                            \'TYPE\' => \'INT2\'\r\n                                          },\r\n                                          \'initialowner\',\r\n                                          {\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'REFERENCES\' => {\r\n                                                              \'COLUMN\' => \'userid\',\r\n                                                              \'TABLE\' => \'profiles\',\r\n                                                              \'created\' => 1\r\n                                                            },\r\n                                            \'TYPE\' => \'INT3\'\r\n                                          },\r\n                                          \'initialqacontact\',\r\n                                          {\r\n                                            \'REFERENCES\' => {\r\n                                                              \'COLUMN\' => \'userid\',\r\n                                                              \'DELETE\' => \'SET NULL\',\r\n                                                              \'TABLE\' => \'profiles\',\r\n                                                              \'created\' => 1\r\n                                                            },\r\n                                            \'TYPE\' => \'INT3\'\r\n                                          },\r\n                                          \'description\',\r\n                                          {\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'TYPE\' => \'MEDIUMTEXT\'\r\n                                          },\r\n                                          \'isactive\',\r\n                                          {\r\n                                            \'DEFAULT\' => \'TRUE\',\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'TYPE\' => \'BOOLEAN\'\r\n                                          }\r\n                                        ],\r\n                            \'INDEXES\' => [\r\n                                           \'components_product_id_idx\',\r\n                                           {\r\n                                             \'FIELDS\' => [\r\n                                                           \'product_id\',\r\n                                                           \'name\'\r\n                                                         ],\r\n                                             \'TYPE\' => \'UNIQUE\'\r\n                                           },\r\n                                           \'components_name_idx\',\r\n                                           [\r\n                                             \'name\'\r\n                                           ]\r\n                                         ]\r\n                          },\r\n          \'dependencies\' => {\r\n                              \'FIELDS\' => [\r\n                                            \'blocked\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'REFERENCES\' => {\r\n                                                                \'COLUMN\' => \'bug_id\',\r\n                                                                \'DELETE\' => \'CASCADE\',\r\n                                                                \'TABLE\' => \'bugs\',\r\n                                                                \'created\' => 1\r\n                                                              },\r\n                                              \'TYPE\' => \'INT3\'\r\n                                            },\r\n                                            \'dependson\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'REFERENCES\' => {\r\n                                                                \'COLUMN\' => \'bug_id\',\r\n                                                                \'DELETE\' => \'CASCADE\',\r\n                                                                \'TABLE\' => \'bugs\',\r\n                                                                \'created\' => 1\r\n                                                              },\r\n                                              \'TYPE\' => \'INT3\'\r\n                                            }\r\n                                          ],\r\n                              \'INDEXES\' => [\r\n                                             \'dependencies_blocked_idx\',\r\n                                             {\r\n                                               \'FIELDS\' => [\r\n                                                             \'blocked\',\r\n                                                             \'dependson\'\r\n                                                           ],\r\n                                               \'TYPE\' => \'UNIQUE\'\r\n                                             },\r\n                                             \'dependencies_dependson_idx\',\r\n                                             [\r\n                                               \'dependson\'\r\n                                             ]\r\n                                           ]\r\n                            },\r\n          \'duplicates\' => {\r\n                            \'FIELDS\' => [\r\n                                          \'dupe_of\',\r\n                                          {\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'REFERENCES\' => {\r\n                                                              \'COLUMN\' => \'bug_id\',\r\n                                                              \'DELETE\' => \'CASCADE\',\r\n                                                              \'TABLE\' => \'bugs\',\r\n                                                              \'created\' => 1\r\n                                                            },\r\n                                            \'TYPE\' => \'INT3\'\r\n                                          },\r\n                                          \'dupe\',\r\n                                          {\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'PRIMARYKEY\' => 1,\r\n                                            \'REFERENCES\' => {\r\n                                                              \'COLUMN\' => \'bug_id\',\r\n                                                              \'DELETE\' => \'CASCADE\',\r\n                                                              \'TABLE\' => \'bugs\',\r\n                                                              \'created\' => 1\r\n                                                            },\r\n                                            \'TYPE\' => \'INT3\'\r\n                                          }\r\n                                        ]\r\n                          },\r\n          \'email_bug_ignore\' => {\r\n                                  \'FIELDS\' => [\r\n                                                \'user_id\',\r\n                                                {\r\n                                                  \'NOTNULL\' => 1,\r\n                                                  \'REFERENCES\' => {\r\n                                                                    \'COLUMN\' => \'userid\',\r\n                                                                    \'DELETE\' => \'CASCADE\',\r\n                                                                    \'TABLE\' => \'profiles\',\r\n                                                                    \'created\' => 1\r\n                                                                  },\r\n                                                  \'TYPE\' => \'INT3\'\r\n                                                },\r\n                                                \'bug_id\',\r\n                                                {\r\n                                                  \'NOTNULL\' => 1,\r\n                                                  \'REFERENCES\' => {\r\n                                                                    \'COLUMN\' => \'bug_id\',\r\n                                                                    \'DELETE\' => \'CASCADE\',\r\n                                                                    \'TABLE\' => \'bugs\',\r\n                                                                    \'created\' => 1\r\n                                                                  },\r\n                                                  \'TYPE\' => \'INT3\'\r\n                                                }\r\n                                              ],\r\n                                  \'INDEXES\' => [\r\n                                                 \'email_bug_ignore_user_id_idx\',\r\n                                                 {\r\n                                                   \'FIELDS\' => [\r\n                                                                 \'user_id\',\r\n                                                                 \'bug_id\'\r\n                                                               ],\r\n                                                   \'TYPE\' => \'UNIQUE\'\r\n                                                 }\r\n                                               ]\r\n                                },\r\n          \'email_setting\' => {\r\n                               \'FIELDS\' => [\r\n                                             \'user_id\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'REFERENCES\' => {\r\n                                                                 \'COLUMN\' => \'userid\',\r\n                                                                 \'DELETE\' => \'CASCADE\',\r\n                                                                 \'TABLE\' => \'profiles\',\r\n                                                                 \'created\' => 1\r\n                                                               },\r\n                                               \'TYPE\' => \'INT3\'\r\n                                             },\r\n                                             \'relationship\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'TYPE\' => \'INT1\'\r\n                                             },\r\n                                             \'event\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'TYPE\' => \'INT1\'\r\n                                             }\r\n                                           ],\r\n                               \'INDEXES\' => [\r\n                                              \'email_setting_user_id_idx\',\r\n                                              {\r\n                                                \'FIELDS\' => [\r\n                                                              \'user_id\',\r\n                                                              \'relationship\',\r\n                                                              \'event\'\r\n                                                            ],\r\n                                                \'TYPE\' => \'UNIQUE\'\r\n                                              }\r\n                                            ]\r\n                             },\r\n          \'field_visibility\' => {\r\n                                  \'FIELDS\' => [\r\n                                                \'field_id\',\r\n                                                {\r\n                                                  \'REFERENCES\' => {\r\n                                                                    \'COLUMN\' => \'id\',\r\n                                                                    \'DELETE\' => \'CASCADE\',\r\n                                                                    \'TABLE\' => \'fielddefs\',\r\n                                                                    \'created\' => 1\r\n                                                                  },\r\n                                                  \'TYPE\' => \'INT3\'\r\n                                                },\r\n                                                \'value_id\',\r\n                                                {\r\n                                                  \'NOTNULL\' => 1,\r\n                                                  \'TYPE\' => \'INT2\'\r\n                                                }\r\n                                              ],\r\n                                  \'INDEXES\' => [\r\n                                                 \'field_visibility_field_id_idx\',\r\n                                                 {\r\n                                                   \'FIELDS\' => [\r\n                                                                 \'field_id\',\r\n                                                                 \'value_id\'\r\n                                                               ],\r\n                                                   \'TYPE\' => \'UNIQUE\'\r\n                                                 }\r\n                                               ]\r\n                                },\r\n          \'fielddefs\' => {\r\n                           \'FIELDS\' => [\r\n                                         \'id\',\r\n                                         {\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'PRIMARYKEY\' => 1,\r\n                                           \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                         },\r\n                                         \'name\',\r\n                                         {\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'varchar(64)\'\r\n                                         },\r\n                                         \'type\',\r\n                                         {\r\n                                           \'DEFAULT\' => 0,\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'INT2\'\r\n                                         },\r\n                                         \'custom\',\r\n                                         {\r\n                                           \'DEFAULT\' => \'FALSE\',\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'BOOLEAN\'\r\n                                         },\r\n                                         \'description\',\r\n                                         {\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'TINYTEXT\'\r\n                                         },\r\n                                         \'long_desc\',\r\n                                         {\r\n                                           \'DEFAULT\' => \'\\\'\\\'\',\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'varchar(255)\'\r\n                                         },\r\n                                         \'mailhead\',\r\n                                         {\r\n                                           \'DEFAULT\' => \'FALSE\',\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'BOOLEAN\'\r\n                                         },\r\n                                         \'sortkey\',\r\n                                         {\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'INT2\'\r\n                                         },\r\n                                         \'obsolete\',\r\n                                         {\r\n                                           \'DEFAULT\' => \'FALSE\',\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'BOOLEAN\'\r\n                                         },\r\n                                         \'enter_bug\',\r\n                                         {\r\n                                           \'DEFAULT\' => \'FALSE\',\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'BOOLEAN\'\r\n                                         },\r\n                                         \'buglist\',\r\n                                         {\r\n                                           \'DEFAULT\' => \'FALSE\',\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'BOOLEAN\'\r\n                                         },\r\n                                         \'visibility_field_id\',\r\n                                         {\r\n                                           \'REFERENCES\' => {\r\n                                                             \'COLUMN\' => \'id\',\r\n                                                             \'TABLE\' => \'fielddefs\',\r\n                                                             \'created\' => 1\r\n                                                           },\r\n                                           \'TYPE\' => \'INT3\'\r\n                                         },\r\n                                         \'value_field_id\',\r\n                                         {\r\n                                           \'REFERENCES\' => {\r\n                                                             \'COLUMN\' => \'id\',\r\n                                                             \'TABLE\' => \'fielddefs\',\r\n                                                             \'created\' => 1\r\n                                                           },\r\n                                           \'TYPE\' => \'INT3\'\r\n                                         },\r\n                                         \'reverse_desc\',\r\n                                         {\r\n                                           \'TYPE\' => \'TINYTEXT\'\r\n                                         },\r\n                                         \'is_mandatory\',\r\n                                         {\r\n                                           \'DEFAULT\' => \'FALSE\',\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'BOOLEAN\'\r\n                                         },\r\n                                         \'is_numeric\',\r\n                                         {\r\n                                           \'DEFAULT\' => \'FALSE\',\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'BOOLEAN\'\r\n                                         }\r\n                                       ],\r\n                           \'INDEXES\' => [\r\n                                          \'fielddefs_name_idx\',\r\n                                          {\r\n                                            \'FIELDS\' => [\r\n                                                          \'name\'\r\n                                                        ],\r\n                                            \'TYPE\' => \'UNIQUE\'\r\n                                          },\r\n                                          \'fielddefs_sortkey_idx\',\r\n                                          [\r\n                                            \'sortkey\'\r\n                                          ],\r\n                                          \'fielddefs_value_field_id_idx\',\r\n                                          [\r\n                                            \'value_field_id\'\r\n                                          ],\r\n                                          \'fielddefs_is_mandatory_idx\',\r\n                                          [\r\n                                            \'is_mandatory\'\r\n                                          ]\r\n                                        ]\r\n                         },\r\n          \'flagexclusions\' => {\r\n                                \'FIELDS\' => [\r\n                                              \'type_id\',\r\n                                              {\r\n                                                \'NOTNULL\' => 1,\r\n                                                \'REFERENCES\' => {\r\n                                                                  \'COLUMN\' => \'id\',\r\n                                                                  \'DELETE\' => \'CASCADE\',\r\n                                                                  \'TABLE\' => \'flagtypes\',\r\n                                                                  \'created\' => 1\r\n                                                                },\r\n                                                \'TYPE\' => \'INT2\'\r\n                                              },\r\n                                              \'product_id\',\r\n                                              {\r\n                                                \'REFERENCES\' => {\r\n                                                                  \'COLUMN\' => \'id\',\r\n                                                                  \'DELETE\' => \'CASCADE\',\r\n                                                                  \'TABLE\' => \'products\',\r\n                                                                  \'created\' => 1\r\n                                                                },\r\n                                                \'TYPE\' => \'INT2\'\r\n                                              },\r\n                                              \'component_id\',\r\n                                              {\r\n                                                \'REFERENCES\' => {\r\n                                                                  \'COLUMN\' => \'id\',\r\n                                                                  \'DELETE\' => \'CASCADE\',\r\n                                                                  \'TABLE\' => \'components\',\r\n                                                                  \'created\' => 1\r\n                                                                },\r\n                                                \'TYPE\' => \'INT3\'\r\n                                              }\r\n                                            ],\r\n                                \'INDEXES\' => [\r\n                                               \'flagexclusions_type_id_idx\',\r\n                                               {\r\n                                                 \'FIELDS\' => [\r\n                                                               \'type_id\',\r\n                                                               \'product_id\',\r\n                                                               \'component_id\'\r\n                                                             ],\r\n                                                 \'TYPE\' => \'UNIQUE\'\r\n                                               }\r\n                                             ]\r\n                              },\r\n          \'flaginclusions\' => {\r\n                                \'FIELDS\' => [\r\n                                              \'type_id\',\r\n                                              {\r\n                                                \'NOTNULL\' => 1,\r\n                                                \'REFERENCES\' => {\r\n                                                                  \'COLUMN\' => \'id\',\r\n                                                                  \'DELETE\' => \'CASCADE\',\r\n                                                                  \'TABLE\' => \'flagtypes\',\r\n                                                                  \'created\' => 1\r\n                                                                },\r\n                                                \'TYPE\' => \'INT2\'\r\n                                              },\r\n                                              \'product_id\',\r\n                                              {\r\n                                                \'REFERENCES\' => {\r\n                                                                  \'COLUMN\' => \'id\',\r\n                                                                  \'DELETE\' => \'CASCADE\',\r\n                                                                  \'TABLE\' => \'products\',\r\n                                                                  \'created\' => 1\r\n                                                                },\r\n                                                \'TYPE\' => \'INT2\'\r\n                                              },\r\n                                              \'component_id\',\r\n                                              {\r\n                                                \'REFERENCES\' => {\r\n                                                                  \'COLUMN\' => \'id\',\r\n                                                                  \'DELETE\' => \'CASCADE\',\r\n                                                                  \'TABLE\' => \'components\',\r\n                                                                  \'created\' => 1\r\n                                                                },\r\n                                                \'TYPE\' => \'INT3\'\r\n                                              }\r\n                                            ],\r\n                                \'INDEXES\' => [\r\n                                               \'flaginclusions_type_id_idx\',\r\n                                               {\r\n                                                 \'FIELDS\' => [\r\n                                                               \'type_id\',\r\n                                                               \'product_id\',\r\n                                                               \'component_id\'\r\n                                                             ],\r\n                                                 \'TYPE\' => \'UNIQUE\'\r\n                                               }\r\n                                             ]\r\n                              },\r\n          \'flags\' => {\r\n                       \'FIELDS\' => [\r\n                                     \'id\',\r\n                                     {\r\n                                       \'NOTNULL\' => 1,\r\n                                       \'PRIMARYKEY\' => 1,\r\n                                       \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                     },\r\n                                     \'type_id\',\r\n                                     {\r\n                                       \'NOTNULL\' => 1,\r\n                                       \'REFERENCES\' => {\r\n                                                         \'COLUMN\' => \'id\',\r\n                                                         \'DELETE\' => \'CASCADE\',\r\n                                                         \'TABLE\' => \'flagtypes\',\r\n                                                         \'created\' => 1\r\n                                                       },\r\n                                       \'TYPE\' => \'INT2\'\r\n                                     },\r\n                                     \'status\',\r\n                                     {\r\n                                       \'NOTNULL\' => 1,\r\n                                       \'TYPE\' => \'char(1)\'\r\n                                     },\r\n                                     \'bug_id\',\r\n                                     {\r\n                                       \'NOTNULL\' => 1,\r\n                                       \'REFERENCES\' => {\r\n                                                         \'COLUMN\' => \'bug_id\',\r\n                                                         \'DELETE\' => \'CASCADE\',\r\n                                                         \'TABLE\' => \'bugs\',\r\n                                                         \'created\' => 1\r\n                                                       },\r\n                                       \'TYPE\' => \'INT3\'\r\n                                     },\r\n                                     \'attach_id\',\r\n                                     {\r\n                                       \'REFERENCES\' => {\r\n                                                         \'COLUMN\' => \'attach_id\',\r\n                                                         \'DELETE\' => \'CASCADE\',\r\n                                                         \'TABLE\' => \'attachments\',\r\n                                                         \'created\' => 1\r\n                                                       },\r\n                                       \'TYPE\' => \'INT3\'\r\n                                     },\r\n                                     \'creation_date\',\r\n                                     {\r\n                                       \'NOTNULL\' => 1,\r\n                                       \'TYPE\' => \'DATETIME\'\r\n                                     },\r\n                                     \'modification_date\',\r\n                                     {\r\n                                       \'TYPE\' => \'DATETIME\'\r\n                                     },\r\n                                     \'setter_id\',\r\n                                     {\r\n                                       \'NOTNULL\' => 1,\r\n                                       \'REFERENCES\' => {\r\n                                                         \'COLUMN\' => \'userid\',\r\n                                                         \'TABLE\' => \'profiles\',\r\n                                                         \'created\' => 1\r\n                                                       },\r\n                                       \'TYPE\' => \'INT3\'\r\n                                     },\r\n                                     \'requestee_id\',\r\n                                     {\r\n                                       \'REFERENCES\' => {\r\n                                                         \'COLUMN\' => \'userid\',\r\n                                                         \'TABLE\' => \'profiles\',\r\n                                                         \'created\' => 1\r\n                                                       },\r\n                                       \'TYPE\' => \'INT3\'\r\n                                     }\r\n                                   ],\r\n                       \'INDEXES\' => [\r\n                                      \'flags_bug_id_idx\',\r\n                                      [\r\n                                        \'bug_id\',\r\n                                        \'attach_id\'\r\n                                      ],\r\n                                      \'flags_setter_id_idx\',\r\n                                      [\r\n                                        \'setter_id\'\r\n                                      ],\r\n                                      \'flags_requestee_id_idx\',\r\n                                      [\r\n                                        \'requestee_id\'\r\n                                      ],\r\n                                      \'flags_type_id_idx\',\r\n                                      [\r\n                                        \'type_id\'\r\n                                      ]\r\n                                    ]\r\n                     },\r\n          \'flagtypes\' => {\r\n                           \'FIELDS\' => [\r\n                                         \'id\',\r\n                                         {\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'PRIMARYKEY\' => 1,\r\n                                           \'TYPE\' => \'SMALLSERIAL\'\r\n                                         },\r\n                                         \'name\',\r\n                                         {\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'varchar(50)\'\r\n                                         },\r\n                                         \'description\',\r\n                                         {\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'MEDIUMTEXT\'\r\n                                         },\r\n                                         \'cc_list\',\r\n                                         {\r\n                                           \'TYPE\' => \'varchar(200)\'\r\n                                         },\r\n                                         \'target_type\',\r\n                                         {\r\n                                           \'DEFAULT\' => \'\\\'b\\\'\',\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'char(1)\'\r\n                                         },\r\n                                         \'is_active\',\r\n                                         {\r\n                                           \'DEFAULT\' => \'TRUE\',\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'BOOLEAN\'\r\n                                         },\r\n                                         \'is_requestable\',\r\n                                         {\r\n                                           \'DEFAULT\' => \'FALSE\',\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'BOOLEAN\'\r\n                                         },\r\n                                         \'is_requesteeble\',\r\n                                         {\r\n                                           \'DEFAULT\' => \'FALSE\',\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'BOOLEAN\'\r\n                                         },\r\n                                         \'is_multiplicable\',\r\n                                         {\r\n                                           \'DEFAULT\' => \'FALSE\',\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'BOOLEAN\'\r\n                                         },\r\n                                         \'sortkey\',\r\n                                         {\r\n                                           \'DEFAULT\' => \'0\',\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'INT2\'\r\n                                         },\r\n                                         \'grant_group_id\',\r\n                                         {\r\n                                           \'REFERENCES\' => {\r\n                                                             \'COLUMN\' => \'id\',\r\n                                                             \'DELETE\' => \'SET NULL\',\r\n                                                             \'TABLE\' => \'groups\',\r\n                                                             \'created\' => 1\r\n                                                           },\r\n                                           \'TYPE\' => \'INT3\'\r\n                                         },\r\n                                         \'request_group_id\',\r\n                                         {\r\n                                           \'REFERENCES\' => {\r\n                                                             \'COLUMN\' => \'id\',\r\n                                                             \'DELETE\' => \'SET NULL\',\r\n                                                             \'TABLE\' => \'groups\',\r\n                                                             \'created\' => 1\r\n                                                           },\r\n                                           \'TYPE\' => \'INT3\'\r\n                                         }\r\n                                       ]\r\n                         },\r\n          \'group_control_map\' => {\r\n                                   \'FIELDS\' => [\r\n                                                 \'group_id\',\r\n                                                 {\r\n                                                   \'NOTNULL\' => 1,\r\n                                                   \'REFERENCES\' => {\r\n                                                                     \'COLUMN\' => \'id\',\r\n                                                                     \'DELETE\' => \'CASCADE\',\r\n                                                                     \'TABLE\' => \'groups\',\r\n                                                                     \'created\' => 1\r\n                                                                   },\r\n                                                   \'TYPE\' => \'INT3\'\r\n                                                 },\r\n                                                 \'product_id\',\r\n                                                 {\r\n                                                   \'NOTNULL\' => 1,\r\n                                                   \'REFERENCES\' => {\r\n                                                                     \'COLUMN\' => \'id\',\r\n                                                                     \'DELETE\' => \'CASCADE\',\r\n                                                                     \'TABLE\' => \'products\',\r\n                                                                     \'created\' => 1\r\n                                                                   },\r\n                                                   \'TYPE\' => \'INT2\'\r\n                                                 },\r\n                                                 \'entry\',\r\n                                                 {\r\n                                                   \'DEFAULT\' => \'FALSE\',\r\n                                                   \'NOTNULL\' => 1,\r\n                                                   \'TYPE\' => \'BOOLEAN\'\r\n                                                 },\r\n                                                 \'membercontrol\',\r\n                                                 {\r\n                                                   \'DEFAULT\' => \'0\',\r\n                                                   \'NOTNULL\' => 1,\r\n                                                   \'TYPE\' => \'INT1\'\r\n                                                 },\r\n                                                 \'othercontrol\',\r\n                                                 {\r\n                                                   \'DEFAULT\' => \'0\',\r\n                                                   \'NOTNULL\' => 1,\r\n                                                   \'TYPE\' => \'INT1\'\r\n                                                 },\r\n                                                 \'canedit\',\r\n                                                 {\r\n                                                   \'DEFAULT\' => \'FALSE\',\r\n                                                   \'NOTNULL\' => 1,\r\n                                                   \'TYPE\' => \'BOOLEAN\'\r\n                                                 },\r\n                                                 \'editcomponents\',\r\n                                                 {\r\n                                                   \'DEFAULT\' => \'FALSE\',\r\n                                                   \'NOTNULL\' => 1,\r\n                                                   \'TYPE\' => \'BOOLEAN\'\r\n                                                 },\r\n                                                 \'editbugs\',\r\n                                                 {\r\n                                                   \'DEFAULT\' => \'FALSE\',\r\n                                                   \'NOTNULL\' => 1,\r\n                                                   \'TYPE\' => \'BOOLEAN\'\r\n                                                 },\r\n                                                 \'canconfirm\',\r\n                                                 {\r\n                                                   \'DEFAULT\' => \'FALSE\',\r\n                                                   \'NOTNULL\' => 1,\r\n                                                   \'TYPE\' => \'BOOLEAN\'\r\n                                                 }\r\n                                               ],\r\n                                   \'INDEXES\' => [\r\n                                                  \'group_control_map_product_id_idx\',\r\n                                                  {\r\n                                                    \'FIELDS\' => [\r\n                                                                  \'product_id\',\r\n                                                                  \'group_id\'\r\n                                                                ],\r\n                                                    \'TYPE\' => \'UNIQUE\'\r\n                                                  },\r\n                                                  \'group_control_map_group_id_idx\',\r\n                                                  [\r\n                                                    \'group_id\'\r\n                                                  ]\r\n                                                ]\r\n                                 },\r\n          \'group_group_map\' => {\r\n                                 \'FIELDS\' => [\r\n                                               \'member_id\',\r\n                                               {\r\n                                                 \'NOTNULL\' => 1,\r\n                                                 \'REFERENCES\' => {\r\n                                                                   \'COLUMN\' => \'id\',\r\n                                                                   \'DELETE\' => \'CASCADE\',\r\n                                                                   \'TABLE\' => \'groups\',\r\n                                                                   \'created\' => 1\r\n                                                                 },\r\n                                                 \'TYPE\' => \'INT3\'\r\n                                               },\r\n                                               \'grantor_id\',\r\n                                               {\r\n                                                 \'NOTNULL\' => 1,\r\n                                                 \'REFERENCES\' => {\r\n                                                                   \'COLUMN\' => \'id\',\r\n                                                                   \'DELETE\' => \'CASCADE\',\r\n                                                                   \'TABLE\' => \'groups\',\r\n                                                                   \'created\' => 1\r\n                                                                 },\r\n                                                 \'TYPE\' => \'INT3\'\r\n                                               },\r\n                                               \'grant_type\',\r\n                                               {\r\n                                                 \'DEFAULT\' => \'0\',\r\n                                                 \'NOTNULL\' => 1,\r\n                                                 \'TYPE\' => \'INT1\'\r\n                                               }\r\n                                             ],\r\n                                 \'INDEXES\' => [\r\n                                                \'group_group_map_member_id_idx\',\r\n                                                {\r\n                                                  \'FIELDS\' => [\r\n                                                                \'member_id\',\r\n                                                                \'grantor_id\',\r\n                                                                \'grant_type\'\r\n                                                              ],\r\n                                                  \'TYPE\' => \'UNIQUE\'\r\n                                                }\r\n                                              ]\r\n                               },\r\n          \'groups\' => {\r\n                        \'FIELDS\' => [\r\n                                      \'id\',\r\n                                      {\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'PRIMARYKEY\' => 1,\r\n                                        \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                      },\r\n                                      \'name\',\r\n                                      {\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'TYPE\' => \'varchar(255)\'\r\n                                      },\r\n                                      \'description\',\r\n                                      {\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'TYPE\' => \'MEDIUMTEXT\'\r\n                                      },\r\n                                      \'isbuggroup\',\r\n                                      {\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'TYPE\' => \'BOOLEAN\'\r\n                                      },\r\n                                      \'userregexp\',\r\n                                      {\r\n                                        \'DEFAULT\' => \'\\\'\\\'\',\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'TYPE\' => \'TINYTEXT\'\r\n                                      },\r\n                                      \'isactive\',\r\n                                      {\r\n                                        \'DEFAULT\' => \'TRUE\',\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'TYPE\' => \'BOOLEAN\'\r\n                                      },\r\n                                      \'icon_url\',\r\n                                      {\r\n                                        \'TYPE\' => \'TINYTEXT\'\r\n                                      }\r\n                                    ],\r\n                        \'INDEXES\' => [\r\n                                       \'groups_name_idx\',\r\n                                       {\r\n                                         \'FIELDS\' => [\r\n                                                       \'name\'\r\n                                                     ],\r\n                                         \'TYPE\' => \'UNIQUE\'\r\n                                       }\r\n                                     ]\r\n                      },\r\n          \'keyworddefs\' => {\r\n                             \'FIELDS\' => [\r\n                                           \'id\',\r\n                                           {\r\n                                             \'NOTNULL\' => 1,\r\n                                             \'PRIMARYKEY\' => 1,\r\n                                             \'TYPE\' => \'SMALLSERIAL\'\r\n                                           },\r\n                                           \'name\',\r\n                                           {\r\n                                             \'NOTNULL\' => 1,\r\n                                             \'TYPE\' => \'varchar(64)\'\r\n                                           },\r\n                                           \'description\',\r\n                                           {\r\n                                             \'NOTNULL\' => 1,\r\n                                             \'TYPE\' => \'MEDIUMTEXT\'\r\n                                           }\r\n                                         ],\r\n                             \'INDEXES\' => [\r\n                                            \'keyworddefs_name_idx\',\r\n                                            {\r\n                                              \'FIELDS\' => [\r\n                                                            \'name\'\r\n                                                          ],\r\n                                              \'TYPE\' => \'UNIQUE\'\r\n                                            }\r\n                                          ]\r\n                           },\r\n          \'keywords\' => {\r\n                          \'FIELDS\' => [\r\n                                        \'bug_id\',\r\n                                        {\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'REFERENCES\' => {\r\n                                                            \'COLUMN\' => \'bug_id\',\r\n                                                            \'DELETE\' => \'CASCADE\',\r\n                                                            \'TABLE\' => \'bugs\',\r\n                                                            \'created\' => 1\r\n                                                          },\r\n                                          \'TYPE\' => \'INT3\'\r\n                                        },\r\n                                        \'keywordid\',\r\n                                        {\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'REFERENCES\' => {\r\n                                                            \'COLUMN\' => \'id\',\r\n                                                            \'DELETE\' => \'CASCADE\',\r\n                                                            \'TABLE\' => \'keyworddefs\',\r\n                                                            \'created\' => 1\r\n                                                          },\r\n                                          \'TYPE\' => \'INT2\'\r\n                                        }\r\n                                      ],\r\n                          \'INDEXES\' => [\r\n                                         \'keywords_bug_id_idx\',\r\n                                         {\r\n                                           \'FIELDS\' => [\r\n                                                         \'bug_id\',\r\n                                                         \'keywordid\'\r\n                                                       ],\r\n                                           \'TYPE\' => \'UNIQUE\'\r\n                                         },\r\n                                         \'keywords_keywordid_idx\',\r\n                                         [\r\n                                           \'keywordid\'\r\n                                         ]\r\n                                       ]\r\n                        },\r\n          \'login_failure\' => {\r\n                               \'FIELDS\' => [\r\n                                             \'user_id\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'REFERENCES\' => {\r\n                                                                 \'COLUMN\' => \'userid\',\r\n                                                                 \'DELETE\' => \'CASCADE\',\r\n                                                                 \'TABLE\' => \'profiles\',\r\n                                                                 \'created\' => 1\r\n                                                               },\r\n                                               \'TYPE\' => \'INT3\'\r\n                                             },\r\n                                             \'login_time\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'TYPE\' => \'DATETIME\'\r\n                                             },\r\n                                             \'ip_addr\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'TYPE\' => \'varchar(40)\'\r\n                                             }\r\n                                           ],\r\n                               \'INDEXES\' => [\r\n                                              \'login_failure_user_id_idx\',\r\n                                              [\r\n                                                \'user_id\'\r\n                                              ]\r\n                                            ]\r\n                             },\r\n          \'logincookies\' => {\r\n                              \'FIELDS\' => [\r\n                                            \'cookie\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'PRIMARYKEY\' => 1,\r\n                                              \'TYPE\' => \'varchar(16)\'\r\n                                            },\r\n                                            \'userid\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'REFERENCES\' => {\r\n                                                                \'COLUMN\' => \'userid\',\r\n                                                                \'DELETE\' => \'CASCADE\',\r\n                                                                \'TABLE\' => \'profiles\',\r\n                                                                \'created\' => 1\r\n                                                              },\r\n                                              \'TYPE\' => \'INT3\'\r\n                                            },\r\n                                            \'ipaddr\',\r\n                                            {\r\n                                              \'TYPE\' => \'varchar(40)\'\r\n                                            },\r\n                                            \'lastused\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'TYPE\' => \'DATETIME\'\r\n                                            }\r\n                                          ],\r\n                              \'INDEXES\' => [\r\n                                             \'logincookies_lastused_idx\',\r\n                                             [\r\n                                               \'lastused\'\r\n                                             ]\r\n                                           ]\r\n                            },\r\n          \'longdescs\' => {\r\n                           \'FIELDS\' => [\r\n                                         \'comment_id\',\r\n                                         {\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'PRIMARYKEY\' => 1,\r\n                                           \'TYPE\' => \'INTSERIAL\'\r\n                                         },\r\n                                         \'bug_id\',\r\n                                         {\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'REFERENCES\' => {\r\n                                                             \'COLUMN\' => \'bug_id\',\r\n                                                             \'DELETE\' => \'CASCADE\',\r\n                                                             \'TABLE\' => \'bugs\',\r\n                                                             \'created\' => 1\r\n                                                           },\r\n                                           \'TYPE\' => \'INT3\'\r\n                                         },\r\n                                         \'who\',\r\n                                         {\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'REFERENCES\' => {\r\n                                                             \'COLUMN\' => \'userid\',\r\n                                                             \'TABLE\' => \'profiles\',\r\n                                                             \'created\' => 1\r\n                                                           },\r\n                                           \'TYPE\' => \'INT3\'\r\n                                         },\r\n                                         \'bug_when\',\r\n                                         {\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'DATETIME\'\r\n                                         },\r\n                                         \'work_time\',\r\n                                         {\r\n                                           \'DEFAULT\' => \'0\',\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'decimal(7,2)\'\r\n                                         },\r\n                                         \'thetext\',\r\n                                         {\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'LONGTEXT\'\r\n                                         },\r\n                                         \'isprivate\',\r\n                                         {\r\n                                           \'DEFAULT\' => \'FALSE\',\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'BOOLEAN\'\r\n                                         },\r\n                                         \'already_wrapped\',\r\n                                         {\r\n                                           \'DEFAULT\' => \'FALSE\',\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'BOOLEAN\'\r\n                                         },\r\n                                         \'type\',\r\n                                         {\r\n                                           \'DEFAULT\' => \'0\',\r\n                                           \'NOTNULL\' => 1,\r\n                                           \'TYPE\' => \'INT2\'\r\n                                         },\r\n                                         \'extra_data\',\r\n                                         {\r\n                                           \'TYPE\' => \'varchar(255)\'\r\n                                         }\r\n                                       ],\r\n                           \'INDEXES\' => [\r\n                                          \'longdescs_bug_id_idx\',\r\n                                          [\r\n                                            \'bug_id\',\r\n                                            \'work_time\'\r\n                                          ],\r\n                                          \'longdescs_who_idx\',\r\n                                          [\r\n                                            \'who\',\r\n                                            \'bug_id\'\r\n                                          ],\r\n                                          \'longdescs_bug_when_idx\',\r\n                                          [\r\n                                            \'bug_when\'\r\n                                          ]\r\n                                        ]\r\n                         },\r\n          \'longdescs_tags\' => {\r\n                                \'FIELDS\' => [\r\n                                              \'id\',\r\n                                              {\r\n                                                \'NOTNULL\' => 1,\r\n                                                \'PRIMARYKEY\' => 1,\r\n                                                \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                              },\r\n                                              \'comment_id\',\r\n                                              {\r\n                                                \'REFERENCES\' => {\r\n                                                                  \'COLUMN\' => \'comment_id\',\r\n                                                                  \'DELETE\' => \'CASCADE\',\r\n                                                                  \'TABLE\' => \'longdescs\',\r\n                                                                  \'created\' => 1\r\n                                                                },\r\n                                                \'TYPE\' => \'INT4\'\r\n                                              },\r\n                                              \'tag\',\r\n                                              {\r\n                                                \'NOTNULL\' => 1,\r\n                                                \'TYPE\' => \'varchar(24)\'\r\n                                              }\r\n                                            ],\r\n                                \'INDEXES\' => [\r\n                                               \'longdescs_tags_idx\',\r\n                                               {\r\n                                                 \'FIELDS\' => [\r\n                                                               \'comment_id\',\r\n                                                               \'tag\'\r\n                                                             ],\r\n                                                 \'TYPE\' => \'UNIQUE\'\r\n                                               }\r\n                                             ]\r\n                              },\r\n          \'longdescs_tags_activity\' => {\r\n                                         \'FIELDS\' => [\r\n                                                       \'id\',\r\n                                                       {\r\n                                                         \'NOTNULL\' => 1,\r\n                                                         \'PRIMARYKEY\' => 1,\r\n                                                         \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                                       },\r\n                                                       \'bug_id\',\r\n                                                       {\r\n                                                         \'NOTNULL\' => 1,\r\n                                                         \'REFERENCES\' => {\r\n                                                                           \'COLUMN\' => \'bug_id\',\r\n                                                                           \'DELETE\' => \'CASCADE\',\r\n                                                                           \'TABLE\' => \'bugs\',\r\n                                                                           \'created\' => 1\r\n                                                                         },\r\n                                                         \'TYPE\' => \'INT3\'\r\n                                                       },\r\n                                                       \'comment_id\',\r\n                                                       {\r\n                                                         \'REFERENCES\' => {\r\n                                                                           \'COLUMN\' => \'comment_id\',\r\n                                                                           \'DELETE\' => \'CASCADE\',\r\n                                                                           \'TABLE\' => \'longdescs\',\r\n                                                                           \'created\' => 1\r\n                                                                         },\r\n                                                         \'TYPE\' => \'INT4\'\r\n                                                       },\r\n                                                       \'who\',\r\n                                                       {\r\n                                                         \'NOTNULL\' => 1,\r\n                                                         \'REFERENCES\' => {\r\n                                                                           \'COLUMN\' => \'userid\',\r\n                                                                           \'TABLE\' => \'profiles\',\r\n                                                                           \'created\' => 1\r\n                                                                         },\r\n                                                         \'TYPE\' => \'INT3\'\r\n                                                       },\r\n                                                       \'bug_when\',\r\n                                                       {\r\n                                                         \'NOTNULL\' => 1,\r\n                                                         \'TYPE\' => \'DATETIME\'\r\n                                                       },\r\n                                                       \'added\',\r\n                                                       {\r\n                                                         \'TYPE\' => \'varchar(24)\'\r\n                                                       },\r\n                                                       \'removed\',\r\n                                                       {\r\n                                                         \'TYPE\' => \'varchar(24)\'\r\n                                                       }\r\n                                                     ],\r\n                                         \'INDEXES\' => [\r\n                                                        \'longdescs_tags_activity_bug_id_idx\',\r\n                                                        [\r\n                                                          \'bug_id\'\r\n                                                        ]\r\n                                                      ]\r\n                                       },\r\n          \'longdescs_tags_weights\' => {\r\n                                        \'FIELDS\' => [\r\n                                                      \'id\',\r\n                                                      {\r\n                                                        \'NOTNULL\' => 1,\r\n                                                        \'PRIMARYKEY\' => 1,\r\n                                                        \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                                      },\r\n                                                      \'tag\',\r\n                                                      {\r\n                                                        \'NOTNULL\' => 1,\r\n                                                        \'TYPE\' => \'varchar(24)\'\r\n                                                      },\r\n                                                      \'weight\',\r\n                                                      {\r\n                                                        \'NOTNULL\' => 1,\r\n                                                        \'TYPE\' => \'INT3\'\r\n                                                      }\r\n                                                    ],\r\n                                        \'INDEXES\' => [\r\n                                                       \'longdescs_tags_weights_tag_idx\',\r\n                                                       {\r\n                                                         \'FIELDS\' => [\r\n                                                                       \'tag\'\r\n                                                                     ],\r\n                                                         \'TYPE\' => \'UNIQUE\'\r\n                                                       }\r\n                                                     ]\r\n                                      },\r\n          \'mail_staging\' => {\r\n                              \'FIELDS\' => [\r\n                                            \'id\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'PRIMARYKEY\' => 1,\r\n                                              \'TYPE\' => \'INTSERIAL\'\r\n                                            },\r\n                                            \'message\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'TYPE\' => \'LONGBLOB\'\r\n                                            }\r\n                                          ]\r\n                            },\r\n          \'milestones\' => {\r\n                            \'FIELDS\' => [\r\n                                          \'id\',\r\n                                          {\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'PRIMARYKEY\' => 1,\r\n                                            \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                          },\r\n                                          \'product_id\',\r\n                                          {\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'REFERENCES\' => {\r\n                                                              \'COLUMN\' => \'id\',\r\n                                                              \'DELETE\' => \'CASCADE\',\r\n                                                              \'TABLE\' => \'products\',\r\n                                                              \'created\' => 1\r\n                                                            },\r\n                                            \'TYPE\' => \'INT2\'\r\n                                          },\r\n                                          \'value\',\r\n                                          {\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'TYPE\' => \'varchar(64)\'\r\n                                          },\r\n                                          \'sortkey\',\r\n                                          {\r\n                                            \'DEFAULT\' => 0,\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'TYPE\' => \'INT2\'\r\n                                          },\r\n                                          \'isactive\',\r\n                                          {\r\n                                            \'DEFAULT\' => \'TRUE\',\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'TYPE\' => \'BOOLEAN\'\r\n                                          }\r\n                                        ],\r\n                            \'INDEXES\' => [\r\n                                           \'milestones_product_id_idx\',\r\n                                           {\r\n                                             \'FIELDS\' => [\r\n                                                           \'product_id\',\r\n                                                           \'value\'\r\n                                                         ],\r\n                                             \'TYPE\' => \'UNIQUE\'\r\n                                           }\r\n                                         ]\r\n                          },\r\n          \'namedqueries\' => {\r\n                              \'FIELDS\' => [\r\n                                            \'id\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'PRIMARYKEY\' => 1,\r\n                                              \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                            },\r\n                                            \'userid\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'REFERENCES\' => {\r\n                                                                \'COLUMN\' => \'userid\',\r\n                                                                \'DELETE\' => \'CASCADE\',\r\n                                                                \'TABLE\' => \'profiles\',\r\n                                                                \'created\' => 1\r\n                                                              },\r\n                                              \'TYPE\' => \'INT3\'\r\n                                            },\r\n                                            \'name\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'TYPE\' => \'varchar(64)\'\r\n                                            },\r\n                                            \'query\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'TYPE\' => \'LONGTEXT\'\r\n                                            }\r\n                                          ],\r\n                              \'INDEXES\' => [\r\n                                             \'namedqueries_userid_idx\',\r\n                                             {\r\n                                               \'FIELDS\' => [\r\n                                                             \'userid\',\r\n                                                             \'name\'\r\n                                                           ],\r\n                                               \'TYPE\' => \'UNIQUE\'\r\n                                             }\r\n                                           ]\r\n                            },\r\n          \'namedqueries_link_in_footer\' => {\r\n                                             \'FIELDS\' => [\r\n                                                           \'namedquery_id\',\r\n                                                           {\r\n                                                             \'NOTNULL\' => 1,\r\n                                                             \'REFERENCES\' => {\r\n                                                                               \'COLUMN\' => \'id\',\r\n                                                                               \'DELETE\' => \'CASCADE\',\r\n                                                                               \'TABLE\' => \'namedqueries\',\r\n                                                                               \'created\' => 1\r\n                                                                             },\r\n                                                             \'TYPE\' => \'INT3\'\r\n                                                           },\r\n                                                           \'user_id\',\r\n                                                           {\r\n                                                             \'NOTNULL\' => 1,\r\n                                                             \'REFERENCES\' => {\r\n                                                                               \'COLUMN\' => \'userid\',\r\n                                                                               \'DELETE\' => \'CASCADE\',\r\n                                                                               \'TABLE\' => \'profiles\',\r\n                                                                               \'created\' => 1\r\n                                                                             },\r\n                                                             \'TYPE\' => \'INT3\'\r\n                                                           }\r\n                                                         ],\r\n                                             \'INDEXES\' => [\r\n                                                            \'namedqueries_link_in_footer_id_idx\',\r\n                                                            {\r\n                                                              \'FIELDS\' => [\r\n                                                                            \'namedquery_id\',\r\n                                                                            \'user_id\'\r\n                                                                          ],\r\n                                                              \'TYPE\' => \'UNIQUE\'\r\n                                                            },\r\n                                                            \'namedqueries_link_in_footer_userid_idx\',\r\n                                                            [\r\n                                                              \'user_id\'\r\n                                                            ]\r\n                                                          ]\r\n                                           },\r\n          \'namedquery_group_map\' => {\r\n                                      \'FIELDS\' => [\r\n                                                    \'namedquery_id\',\r\n                                                    {\r\n                                                      \'NOTNULL\' => 1,\r\n                                                      \'REFERENCES\' => {\r\n                                                                        \'COLUMN\' => \'id\',\r\n                                                                        \'DELETE\' => \'CASCADE\',\r\n                                                                        \'TABLE\' => \'namedqueries\',\r\n                                                                        \'created\' => 1\r\n                                                                      },\r\n                                                      \'TYPE\' => \'INT3\'\r\n                                                    },\r\n                                                    \'group_id\',\r\n                                                    {\r\n                                                      \'NOTNULL\' => 1,\r\n                                                      \'REFERENCES\' => {\r\n                                                                        \'COLUMN\' => \'id\',\r\n                                                                        \'DELETE\' => \'CASCADE\',\r\n                                                                        \'TABLE\' => \'groups\',\r\n                                                                        \'created\' => 1\r\n                                                                      },\r\n                                                      \'TYPE\' => \'INT3\'\r\n                                                    }\r\n                                                  ],\r\n                                      \'INDEXES\' => [\r\n                                                     \'namedquery_group_map_namedquery_id_idx\',\r\n                                                     {\r\n                                                       \'FIELDS\' => [\r\n                                                                     \'namedquery_id\'\r\n                                                                   ],\r\n                                                       \'TYPE\' => \'UNIQUE\'\r\n                                                     },\r\n                                                     \'namedquery_group_map_group_id_idx\',\r\n                                                     [\r\n                                                       \'group_id\'\r\n                                                     ]\r\n                                                   ]\r\n                                    },\r\n          \'op_sys\' => {\r\n                        \'FIELDS\' => [\r\n                                      \'id\',\r\n                                      {\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'PRIMARYKEY\' => 1,\r\n                                        \'TYPE\' => \'SMALLSERIAL\'\r\n                                      },\r\n                                      \'value\',\r\n                                      {\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'TYPE\' => \'varchar(64)\'\r\n                                      },\r\n                                      \'sortkey\',\r\n                                      {\r\n                                        \'DEFAULT\' => 0,\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'TYPE\' => \'INT2\'\r\n                                      },\r\n                                      \'isactive\',\r\n                                      {\r\n                                        \'DEFAULT\' => \'TRUE\',\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'TYPE\' => \'BOOLEAN\'\r\n                                      },\r\n                                      \'visibility_value_id\',\r\n                                      {\r\n                                        \'TYPE\' => \'INT2\'\r\n                                      }\r\n                                    ],\r\n                        \'INDEXES\' => [\r\n                                       \'op_sys_value_idx\',\r\n                                       {\r\n                                         \'FIELDS\' => [\r\n                                                       \'value\'\r\n                                                     ],\r\n                                         \'TYPE\' => \'UNIQUE\'\r\n                                       },\r\n                                       \'op_sys_sortkey_idx\',\r\n                                       [\r\n                                         \'sortkey\',\r\n                                         \'value\'\r\n                                       ],\r\n                                       \'op_sys_visibility_value_id_idx\',\r\n                                       [\r\n                                         \'visibility_value_id\'\r\n                                       ]\r\n                                     ]\r\n                      },\r\n          \'priority\' => {\r\n                          \'FIELDS\' => [\r\n                                        \'id\',\r\n                                        {\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'PRIMARYKEY\' => 1,\r\n                                          \'TYPE\' => \'SMALLSERIAL\'\r\n                                        },\r\n                                        \'value\',\r\n                                        {\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'varchar(64)\'\r\n                                        },\r\n                                        \'sortkey\',\r\n                                        {\r\n                                          \'DEFAULT\' => 0,\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'INT2\'\r\n                                        },\r\n                                        \'isactive\',\r\n                                        {\r\n                                          \'DEFAULT\' => \'TRUE\',\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'BOOLEAN\'\r\n                                        },\r\n                                        \'visibility_value_id\',\r\n                                        {\r\n                                          \'TYPE\' => \'INT2\'\r\n                                        }\r\n                                      ],\r\n                          \'INDEXES\' => [\r\n                                         \'priority_value_idx\',\r\n                                         {\r\n                                           \'FIELDS\' => [\r\n                                                         \'value\'\r\n                                                       ],\r\n                                           \'TYPE\' => \'UNIQUE\'\r\n                                         },\r\n                                         \'priority_sortkey_idx\',\r\n                                         [\r\n                                           \'sortkey\',\r\n                                           \'value\'\r\n                                         ],\r\n                                         \'priority_visibility_value_id_idx\',\r\n                                         [\r\n                                           \'visibility_value_id\'\r\n                                         ]\r\n                                       ]\r\n                        },\r\n          \'products\' => {\r\n                          \'FIELDS\' => [\r\n                                        \'id\',\r\n                                        {\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'PRIMARYKEY\' => 1,\r\n                                          \'TYPE\' => \'SMALLSERIAL\'\r\n                                        },\r\n                                        \'name\',\r\n                                        {\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'varchar(64)\'\r\n                                        },\r\n                                        \'classification_id\',\r\n                                        {\r\n                                          \'DEFAULT\' => \'1\',\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'REFERENCES\' => {\r\n                                                            \'COLUMN\' => \'id\',\r\n                                                            \'DELETE\' => \'CASCADE\',\r\n                                                            \'TABLE\' => \'classifications\',\r\n                                                            \'created\' => 1\r\n                                                          },\r\n                                          \'TYPE\' => \'INT2\'\r\n                                        },\r\n                                        \'description\',\r\n                                        {\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'MEDIUMTEXT\'\r\n                                        },\r\n                                        \'isactive\',\r\n                                        {\r\n                                          \'DEFAULT\' => 1,\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'BOOLEAN\'\r\n                                        },\r\n                                        \'defaultmilestone\',\r\n                                        {\r\n                                          \'DEFAULT\' => \'\\\'---\\\'\',\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'varchar(64)\'\r\n                                        },\r\n                                        \'allows_unconfirmed\',\r\n                                        {\r\n                                          \'DEFAULT\' => \'TRUE\',\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'BOOLEAN\'\r\n                                        }\r\n                                      ],\r\n                          \'INDEXES\' => [\r\n                                         \'products_name_idx\',\r\n                                         {\r\n                                           \'FIELDS\' => [\r\n                                                         \'name\'\r\n                                                       ],\r\n                                           \'TYPE\' => \'UNIQUE\'\r\n                                         }\r\n                                       ]\r\n                        },\r\n          \'profile_search\' => {\r\n                                \'FIELDS\' => [\r\n                                              \'id\',\r\n                                              {\r\n                                                \'NOTNULL\' => 1,\r\n                                                \'PRIMARYKEY\' => 1,\r\n                                                \'TYPE\' => \'INTSERIAL\'\r\n                                              },\r\n                                              \'user_id\',\r\n                                              {\r\n                                                \'NOTNULL\' => 1,\r\n                                                \'REFERENCES\' => {\r\n                                                                  \'COLUMN\' => \'userid\',\r\n                                                                  \'DELETE\' => \'CASCADE\',\r\n                                                                  \'TABLE\' => \'profiles\',\r\n                                                                  \'created\' => 1\r\n                                                                },\r\n                                                \'TYPE\' => \'INT3\'\r\n                                              },\r\n                                              \'bug_list\',\r\n                                              {\r\n                                                \'NOTNULL\' => 1,\r\n                                                \'TYPE\' => \'MEDIUMTEXT\'\r\n                                              },\r\n                                              \'list_order\',\r\n                                              {\r\n                                                \'TYPE\' => \'MEDIUMTEXT\'\r\n                                              }\r\n                                            ],\r\n                                \'INDEXES\' => [\r\n                                               \'profile_search_user_id_idx\',\r\n                                               [\r\n                                                 \'user_id\'\r\n                                               ]\r\n                                             ]\r\n                              },\r\n          \'profile_setting\' => {\r\n                                 \'FIELDS\' => [\r\n                                               \'user_id\',\r\n                                               {\r\n                                                 \'NOTNULL\' => 1,\r\n                                                 \'REFERENCES\' => {\r\n                                                                   \'COLUMN\' => \'userid\',\r\n                                                                   \'DELETE\' => \'CASCADE\',\r\n                                                                   \'TABLE\' => \'profiles\',\r\n                                                                   \'created\' => 1\r\n                                                                 },\r\n                                                 \'TYPE\' => \'INT3\'\r\n                                               },\r\n                                               \'setting_name\',\r\n                                               {\r\n                                                 \'NOTNULL\' => 1,\r\n                                                 \'REFERENCES\' => {\r\n                                                                   \'COLUMN\' => \'name\',\r\n                                                                   \'DELETE\' => \'CASCADE\',\r\n                                                                   \'TABLE\' => \'setting\',\r\n                                                                   \'created\' => 1\r\n                                                                 },\r\n                                                 \'TYPE\' => \'varchar(32)\'\r\n                                               },\r\n                                               \'setting_value\',\r\n                                               {\r\n                                                 \'NOTNULL\' => 1,\r\n                                                 \'TYPE\' => \'varchar(32)\'\r\n                                               }\r\n                                             ],\r\n                                 \'INDEXES\' => [\r\n                                                \'profile_setting_value_unique_idx\',\r\n                                                {\r\n                                                  \'FIELDS\' => [\r\n                                                                \'user_id\',\r\n                                                                \'setting_name\'\r\n                                                              ],\r\n                                                  \'TYPE\' => \'UNIQUE\'\r\n                                                }\r\n                                              ]\r\n                               },\r\n          \'profiles\' => {\r\n                          \'FIELDS\' => [\r\n                                        \'userid\',\r\n                                        {\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'PRIMARYKEY\' => 1,\r\n                                          \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                        },\r\n                                        \'login_name\',\r\n                                        {\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'varchar(255)\'\r\n                                        },\r\n                                        \'cryptpassword\',\r\n                                        {\r\n                                          \'TYPE\' => \'varchar(128)\'\r\n                                        },\r\n                                        \'realname\',\r\n                                        {\r\n                                          \'DEFAULT\' => \'\\\'\\\'\',\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'varchar(255)\'\r\n                                        },\r\n                                        \'disabledtext\',\r\n                                        {\r\n                                          \'DEFAULT\' => \'\\\'\\\'\',\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'MEDIUMTEXT\'\r\n                                        },\r\n                                        \'disable_mail\',\r\n                                        {\r\n                                          \'DEFAULT\' => \'FALSE\',\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'BOOLEAN\'\r\n                                        },\r\n                                        \'mybugslink\',\r\n                                        {\r\n                                          \'DEFAULT\' => \'TRUE\',\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'BOOLEAN\'\r\n                                        },\r\n                                        \'extern_id\',\r\n                                        {\r\n                                          \'TYPE\' => \'varchar(64)\'\r\n                                        },\r\n                                        \'is_enabled\',\r\n                                        {\r\n                                          \'DEFAULT\' => \'TRUE\',\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'BOOLEAN\'\r\n                                        },\r\n                                        \'last_seen_date\',\r\n                                        {\r\n                                          \'TYPE\' => \'DATETIME\'\r\n                                        }\r\n                                      ],\r\n                          \'INDEXES\' => [\r\n                                         \'profiles_login_name_idx\',\r\n                                         {\r\n                                           \'FIELDS\' => [\r\n                                                         \'login_name\'\r\n                                                       ],\r\n                                           \'TYPE\' => \'UNIQUE\'\r\n                                         },\r\n                                         \'profiles_extern_id_idx\',\r\n                                         {\r\n                                           \'FIELDS\' => [\r\n                                                         \'extern_id\'\r\n                                                       ],\r\n                                           \'TYPE\' => \'UNIQUE\'\r\n                                         }\r\n                                       ]\r\n                        },\r\n          \'profiles_activity\' => {\r\n                                   \'FIELDS\' => [\r\n                                                 \'id\',\r\n                                                 {\r\n                                                   \'NOTNULL\' => 1,\r\n                                                   \'PRIMARYKEY\' => 1,\r\n                                                   \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                                 },\r\n                                                 \'userid\',\r\n                                                 {\r\n                                                   \'NOTNULL\' => 1,\r\n                                                   \'REFERENCES\' => {\r\n                                                                     \'COLUMN\' => \'userid\',\r\n                                                                     \'DELETE\' => \'CASCADE\',\r\n                                                                     \'TABLE\' => \'profiles\',\r\n                                                                     \'created\' => 1\r\n                                                                   },\r\n                                                   \'TYPE\' => \'INT3\'\r\n                                                 },\r\n                                                 \'who\',\r\n                                                 {\r\n                                                   \'NOTNULL\' => 1,\r\n                                                   \'REFERENCES\' => {\r\n                                                                     \'COLUMN\' => \'userid\',\r\n                                                                     \'TABLE\' => \'profiles\',\r\n                                                                     \'created\' => 1\r\n                                                                   },\r\n                                                   \'TYPE\' => \'INT3\'\r\n                                                 },\r\n                                                 \'profiles_when\',\r\n                                                 {\r\n                                                   \'NOTNULL\' => 1,\r\n                                                   \'TYPE\' => \'DATETIME\'\r\n                                                 },\r\n                                                 \'fieldid\',\r\n                                                 {\r\n                                                   \'NOTNULL\' => 1,\r\n                                                   \'REFERENCES\' => {\r\n                                                                     \'COLUMN\' => \'id\',\r\n                                                                     \'TABLE\' => \'fielddefs\',\r\n                                                                     \'created\' => 1\r\n                                                                   },\r\n                                                   \'TYPE\' => \'INT3\'\r\n                                                 },\r\n                                                 \'oldvalue\',\r\n                                                 {\r\n                                                   \'TYPE\' => \'TINYTEXT\'\r\n                                                 },\r\n                                                 \'newvalue\',\r\n                                                 {\r\n                                                   \'TYPE\' => \'TINYTEXT\'\r\n                                                 }\r\n                                               ],\r\n                                   \'INDEXES\' => [\r\n                                                  \'profiles_activity_userid_idx\',\r\n                                                  [\r\n                                                    \'userid\'\r\n                                                  ],\r\n                                                  \'profiles_activity_profiles_when_idx\',\r\n                                                  [\r\n                                                    \'profiles_when\'\r\n                                                  ],\r\n                                                  \'profiles_activity_fieldid_idx\',\r\n                                                  [\r\n                                                    \'fieldid\'\r\n                                                  ]\r\n                                                ]\r\n                                 },\r\n          \'quips\' => {\r\n                       \'FIELDS\' => [\r\n                                     \'quipid\',\r\n                                     {\r\n                                       \'NOTNULL\' => 1,\r\n                                       \'PRIMARYKEY\' => 1,\r\n                                       \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                     },\r\n                                     \'userid\',\r\n                                     {\r\n                                       \'REFERENCES\' => {\r\n                                                         \'COLUMN\' => \'userid\',\r\n                                                         \'DELETE\' => \'SET NULL\',\r\n                                                         \'TABLE\' => \'profiles\',\r\n                                                         \'created\' => 1\r\n                                                       },\r\n                                       \'TYPE\' => \'INT3\'\r\n                                     },\r\n                                     \'quip\',\r\n                                     {\r\n                                       \'NOTNULL\' => 1,\r\n                                       \'TYPE\' => \'varchar(512)\'\r\n                                     },\r\n                                     \'approved\',\r\n                                     {\r\n                                       \'DEFAULT\' => \'TRUE\',\r\n                                       \'NOTNULL\' => 1,\r\n                                       \'TYPE\' => \'BOOLEAN\'\r\n                                     }\r\n                                   ]\r\n                     },\r\n          \'rep_platform\' => {\r\n                              \'FIELDS\' => [\r\n                                            \'id\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'PRIMARYKEY\' => 1,\r\n                                              \'TYPE\' => \'SMALLSERIAL\'\r\n                                            },\r\n                                            \'value\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'TYPE\' => \'varchar(64)\'\r\n                                            },\r\n                                            \'sortkey\',\r\n                                            {\r\n                                              \'DEFAULT\' => 0,\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'TYPE\' => \'INT2\'\r\n                                            },\r\n                                            \'isactive\',\r\n                                            {\r\n                                              \'DEFAULT\' => \'TRUE\',\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'TYPE\' => \'BOOLEAN\'\r\n                                            },\r\n                                            \'visibility_value_id\',\r\n                                            {\r\n                                              \'TYPE\' => \'INT2\'\r\n                                            }\r\n                                          ],\r\n                              \'INDEXES\' => [\r\n                                             \'rep_platform_value_idx\',\r\n                                             {\r\n                                               \'FIELDS\' => [\r\n                                                             \'value\'\r\n                                                           ],\r\n                                               \'TYPE\' => \'UNIQUE\'\r\n                                             },\r\n                                             \'rep_platform_sortkey_idx\',\r\n                                             [\r\n                                               \'sortkey\',\r\n                                               \'value\'\r\n                                             ],\r\n                                             \'rep_platform_visibility_value_id_idx\',\r\n                                             [\r\n                                               \'visibility_value_id\'\r\n                                             ]\r\n                                           ]\r\n                            },\r\n          \'reports\' => {\r\n                         \'FIELDS\' => [\r\n                                       \'id\',\r\n                                       {\r\n                                         \'NOTNULL\' => 1,\r\n                                         \'PRIMARYKEY\' => 1,\r\n                                         \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                       },\r\n                                       \'user_id\',\r\n                                       {\r\n                                         \'NOTNULL\' => 1,\r\n                                         \'REFERENCES\' => {\r\n                                                           \'COLUMN\' => \'userid\',\r\n                                                           \'DELETE\' => \'CASCADE\',\r\n                                                           \'TABLE\' => \'profiles\',\r\n                                                           \'created\' => 1\r\n                                                         },\r\n                                         \'TYPE\' => \'INT3\'\r\n                                       },\r\n                                       \'name\',\r\n                                       {\r\n                                         \'NOTNULL\' => 1,\r\n                                         \'TYPE\' => \'varchar(64)\'\r\n                                       },\r\n                                       \'query\',\r\n                                       {\r\n                                         \'NOTNULL\' => 1,\r\n                                         \'TYPE\' => \'LONGTEXT\'\r\n                                       }\r\n                                     ],\r\n                         \'INDEXES\' => [\r\n                                        \'reports_user_id_idx\',\r\n                                        {\r\n                                          \'FIELDS\' => [\r\n                                                        \'user_id\',\r\n                                                        \'name\'\r\n                                                      ],\r\n                                          \'TYPE\' => \'UNIQUE\'\r\n                                        }\r\n                                      ]\r\n                       },\r\n          \'resolution\' => {\r\n                            \'FIELDS\' => [\r\n                                          \'id\',\r\n                                          {\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'PRIMARYKEY\' => 1,\r\n                                            \'TYPE\' => \'SMALLSERIAL\'\r\n                                          },\r\n                                          \'value\',\r\n                                          {\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'TYPE\' => \'varchar(64)\'\r\n                                          },\r\n                                          \'sortkey\',\r\n                                          {\r\n                                            \'DEFAULT\' => 0,\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'TYPE\' => \'INT2\'\r\n                                          },\r\n                                          \'isactive\',\r\n                                          {\r\n                                            \'DEFAULT\' => \'TRUE\',\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'TYPE\' => \'BOOLEAN\'\r\n                                          },\r\n                                          \'visibility_value_id\',\r\n                                          {\r\n                                            \'TYPE\' => \'INT2\'\r\n                                          }\r\n                                        ],\r\n                            \'INDEXES\' => [\r\n                                           \'resolution_value_idx\',\r\n                                           {\r\n                                             \'FIELDS\' => [\r\n                                                           \'value\'\r\n                                                         ],\r\n                                             \'TYPE\' => \'UNIQUE\'\r\n                                           },\r\n                                           \'resolution_sortkey_idx\',\r\n                                           [\r\n                                             \'sortkey\',\r\n                                             \'value\'\r\n                                           ],\r\n                                           \'resolution_visibility_value_id_idx\',\r\n                                           [\r\n                                             \'visibility_value_id\'\r\n                                           ]\r\n                                         ]\r\n                          },\r\n          \'series\' => {\r\n                        \'FIELDS\' => [\r\n                                      \'series_id\',\r\n                                      {\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'PRIMARYKEY\' => 1,\r\n                                        \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                      },\r\n                                      \'creator\',\r\n                                      {\r\n                                        \'REFERENCES\' => {\r\n                                                          \'COLUMN\' => \'userid\',\r\n                                                          \'DELETE\' => \'CASCADE\',\r\n                                                          \'TABLE\' => \'profiles\',\r\n                                                          \'created\' => 1\r\n                                                        },\r\n                                        \'TYPE\' => \'INT3\'\r\n                                      },\r\n                                      \'category\',\r\n                                      {\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'REFERENCES\' => {\r\n                                                          \'COLUMN\' => \'id\',\r\n                                                          \'DELETE\' => \'CASCADE\',\r\n                                                          \'TABLE\' => \'series_categories\',\r\n                                                          \'created\' => 1\r\n                                                        },\r\n                                        \'TYPE\' => \'INT2\'\r\n                                      },\r\n                                      \'subcategory\',\r\n                                      {\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'REFERENCES\' => {\r\n                                                          \'COLUMN\' => \'id\',\r\n                                                          \'DELETE\' => \'CASCADE\',\r\n                                                          \'TABLE\' => \'series_categories\',\r\n                                                          \'created\' => 1\r\n                                                        },\r\n                                        \'TYPE\' => \'INT2\'\r\n                                      },\r\n                                      \'name\',\r\n                                      {\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'TYPE\' => \'varchar(64)\'\r\n                                      },\r\n                                      \'frequency\',\r\n                                      {\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'TYPE\' => \'INT2\'\r\n                                      },\r\n                                      \'query\',\r\n                                      {\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'TYPE\' => \'MEDIUMTEXT\'\r\n                                      },\r\n                                      \'is_public\',\r\n                                      {\r\n                                        \'DEFAULT\' => \'FALSE\',\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'TYPE\' => \'BOOLEAN\'\r\n                                      }\r\n                                    ],\r\n                        \'INDEXES\' => [\r\n                                       \'series_creator_idx\',\r\n                                       [\r\n                                         \'creator\'\r\n                                       ],\r\n                                       \'series_category_idx\',\r\n                                       {\r\n                                         \'FIELDS\' => [\r\n                                                       \'category\',\r\n                                                       \'subcategory\',\r\n                                                       \'name\'\r\n                                                     ],\r\n                                         \'TYPE\' => \'UNIQUE\'\r\n                                       }\r\n                                     ]\r\n                      },\r\n          \'series_categories\' => {\r\n                                   \'FIELDS\' => [\r\n                                                 \'id\',\r\n                                                 {\r\n                                                   \'NOTNULL\' => 1,\r\n                                                   \'PRIMARYKEY\' => 1,\r\n                                                   \'TYPE\' => \'SMALLSERIAL\'\r\n                                                 },\r\n                                                 \'name\',\r\n                                                 {\r\n                                                   \'NOTNULL\' => 1,\r\n                                                   \'TYPE\' => \'varchar(64)\'\r\n                                                 }\r\n                                               ],\r\n                                   \'INDEXES\' => [\r\n                                                  \'series_categories_name_idx\',\r\n                                                  {\r\n                                                    \'FIELDS\' => [\r\n                                                                  \'name\'\r\n                                                                ],\r\n                                                    \'TYPE\' => \'UNIQUE\'\r\n                                                  }\r\n                                                ]\r\n                                 },\r\n          \'series_data\' => {\r\n                             \'FIELDS\' => [\r\n                                           \'series_id\',\r\n                                           {\r\n                                             \'NOTNULL\' => 1,\r\n                                             \'REFERENCES\' => {\r\n                                                               \'COLUMN\' => \'series_id\',\r\n                                                               \'DELETE\' => \'CASCADE\',\r\n                                                               \'TABLE\' => \'series\',\r\n                                                               \'created\' => 1\r\n                                                             },\r\n                                             \'TYPE\' => \'INT3\'\r\n                                           },\r\n                                           \'series_date\',\r\n                                           {\r\n                                             \'NOTNULL\' => 1,\r\n                                             \'TYPE\' => \'DATETIME\'\r\n                                           },\r\n                                           \'series_value\',\r\n                                           {\r\n                                             \'NOTNULL\' => 1,\r\n                                             \'TYPE\' => \'INT3\'\r\n                                           }\r\n                                         ],\r\n                             \'INDEXES\' => [\r\n                                            \'series_data_series_id_idx\',\r\n                                            {\r\n                                              \'FIELDS\' => [\r\n                                                            \'series_id\',\r\n                                                            \'series_date\'\r\n                                                          ],\r\n                                              \'TYPE\' => \'UNIQUE\'\r\n                                            }\r\n                                          ]\r\n                           },\r\n          \'setting\' => {\r\n                         \'FIELDS\' => [\r\n                                       \'name\',\r\n                                       {\r\n                                         \'NOTNULL\' => 1,\r\n                                         \'PRIMARYKEY\' => 1,\r\n                                         \'TYPE\' => \'varchar(32)\'\r\n                                       },\r\n                                       \'default_value\',\r\n                                       {\r\n                                         \'NOTNULL\' => 1,\r\n                                         \'TYPE\' => \'varchar(32)\'\r\n                                       },\r\n                                       \'is_enabled\',\r\n                                       {\r\n                                         \'DEFAULT\' => \'TRUE\',\r\n                                         \'NOTNULL\' => 1,\r\n                                         \'TYPE\' => \'BOOLEAN\'\r\n                                       },\r\n                                       \'subclass\',\r\n                                       {\r\n                                         \'TYPE\' => \'varchar(32)\'\r\n                                       }\r\n                                     ]\r\n                       },\r\n          \'setting_value\' => {\r\n                               \'FIELDS\' => [\r\n                                             \'name\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'REFERENCES\' => {\r\n                                                                 \'COLUMN\' => \'name\',\r\n                                                                 \'DELETE\' => \'CASCADE\',\r\n                                                                 \'TABLE\' => \'setting\',\r\n                                                                 \'created\' => 1\r\n                                                               },\r\n                                               \'TYPE\' => \'varchar(32)\'\r\n                                             },\r\n                                             \'value\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'TYPE\' => \'varchar(32)\'\r\n                                             },\r\n                                             \'sortindex\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'TYPE\' => \'INT2\'\r\n                                             }\r\n                                           ],\r\n                               \'INDEXES\' => [\r\n                                              \'setting_value_nv_unique_idx\',\r\n                                              {\r\n                                                \'FIELDS\' => [\r\n                                                              \'name\',\r\n                                                              \'value\'\r\n                                                            ],\r\n                                                \'TYPE\' => \'UNIQUE\'\r\n                                              },\r\n                                              \'setting_value_ns_unique_idx\',\r\n                                              {\r\n                                                \'FIELDS\' => [\r\n                                                              \'name\',\r\n                                                              \'sortindex\'\r\n                                                            ],\r\n                                                \'TYPE\' => \'UNIQUE\'\r\n                                              }\r\n                                            ]\r\n                             },\r\n          \'status_workflow\' => {\r\n                                 \'FIELDS\' => [\r\n                                               \'old_status\',\r\n                                               {\r\n                                                 \'REFERENCES\' => {\r\n                                                                   \'COLUMN\' => \'id\',\r\n                                                                   \'DELETE\' => \'CASCADE\',\r\n                                                                   \'TABLE\' => \'bug_status\',\r\n                                                                   \'created\' => 1\r\n                                                                 },\r\n                                                 \'TYPE\' => \'INT2\'\r\n                                               },\r\n                                               \'new_status\',\r\n                                               {\r\n                                                 \'NOTNULL\' => 1,\r\n                                                 \'REFERENCES\' => {\r\n                                                                   \'COLUMN\' => \'id\',\r\n                                                                   \'DELETE\' => \'CASCADE\',\r\n                                                                   \'TABLE\' => \'bug_status\',\r\n                                                                   \'created\' => 1\r\n                                                                 },\r\n                                                 \'TYPE\' => \'INT2\'\r\n                                               },\r\n                                               \'require_comment\',\r\n                                               {\r\n                                                 \'DEFAULT\' => 0,\r\n                                                 \'NOTNULL\' => 1,\r\n                                                 \'TYPE\' => \'INT1\'\r\n                                               }\r\n                                             ],\r\n                                 \'INDEXES\' => [\r\n                                                \'status_workflow_idx\',\r\n                                                {\r\n                                                  \'FIELDS\' => [\r\n                                                                \'old_status\',\r\n                                                                \'new_status\'\r\n                                                              ],\r\n                                                  \'TYPE\' => \'UNIQUE\'\r\n                                                }\r\n                                              ]\r\n                               },\r\n          \'tag\' => {\r\n                     \'FIELDS\' => [\r\n                                   \'id\',\r\n                                   {\r\n                                     \'NOTNULL\' => 1,\r\n                                     \'PRIMARYKEY\' => 1,\r\n                                     \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                   },\r\n                                   \'name\',\r\n                                   {\r\n                                     \'NOTNULL\' => 1,\r\n                                     \'TYPE\' => \'varchar(64)\'\r\n                                   },\r\n                                   \'user_id\',\r\n                                   {\r\n                                     \'NOTNULL\' => 1,\r\n                                     \'REFERENCES\' => {\r\n                                                       \'COLUMN\' => \'userid\',\r\n                                                       \'DELETE\' => \'CASCADE\',\r\n                                                       \'TABLE\' => \'profiles\',\r\n                                                       \'created\' => 1\r\n                                                     },\r\n                                     \'TYPE\' => \'INT3\'\r\n                                   }\r\n                                 ],\r\n                     \'INDEXES\' => [\r\n                                    \'tag_user_id_idx\',\r\n                                    {\r\n                                      \'FIELDS\' => [\r\n                                                    \'user_id\',\r\n                                                    \'name\'\r\n                                                  ],\r\n                                      \'TYPE\' => \'UNIQUE\'\r\n                                    }\r\n                                  ]\r\n                   },\r\n          \'tokens\' => {\r\n                        \'FIELDS\' => [\r\n                                      \'userid\',\r\n                                      {\r\n                                        \'REFERENCES\' => {\r\n                                                          \'COLUMN\' => \'userid\',\r\n                                                          \'DELETE\' => \'CASCADE\',\r\n                                                          \'TABLE\' => \'profiles\',\r\n                                                          \'created\' => 1\r\n                                                        },\r\n                                        \'TYPE\' => \'INT3\'\r\n                                      },\r\n                                      \'issuedate\',\r\n                                      {\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'TYPE\' => \'DATETIME\'\r\n                                      },\r\n                                      \'token\',\r\n                                      {\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'PRIMARYKEY\' => 1,\r\n                                        \'TYPE\' => \'varchar(16)\'\r\n                                      },\r\n                                      \'tokentype\',\r\n                                      {\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'TYPE\' => \'varchar(16)\'\r\n                                      },\r\n                                      \'eventdata\',\r\n                                      {\r\n                                        \'TYPE\' => \'TINYTEXT\'\r\n                                      }\r\n                                    ],\r\n                        \'INDEXES\' => [\r\n                                       \'tokens_userid_idx\',\r\n                                       [\r\n                                         \'userid\'\r\n                                       ]\r\n                                     ]\r\n                      },\r\n          \'ts_error\' => {\r\n                          \'FIELDS\' => [\r\n                                        \'error_time\',\r\n                                        {\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'INT4\'\r\n                                        },\r\n                                        \'jobid\',\r\n                                        {\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'INT4\'\r\n                                        },\r\n                                        \'message\',\r\n                                        {\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'varchar(255)\'\r\n                                        },\r\n                                        \'funcid\',\r\n                                        {\r\n                                          \'DEFAULT\' => 0,\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'INT4\'\r\n                                        }\r\n                                      ],\r\n                          \'INDEXES\' => [\r\n                                         \'ts_error_funcid_idx\',\r\n                                         [\r\n                                           \'funcid\',\r\n                                           \'error_time\'\r\n                                         ],\r\n                                         \'ts_error_error_time_idx\',\r\n                                         [\r\n                                           \'error_time\'\r\n                                         ],\r\n                                         \'ts_error_jobid_idx\',\r\n                                         [\r\n                                           \'jobid\'\r\n                                         ]\r\n                                       ]\r\n                        },\r\n          \'ts_exitstatus\' => {\r\n                               \'FIELDS\' => [\r\n                                             \'jobid\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'PRIMARYKEY\' => 1,\r\n                                               \'TYPE\' => \'INTSERIAL\'\r\n                                             },\r\n                                             \'funcid\',\r\n                                             {\r\n                                               \'DEFAULT\' => 0,\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'TYPE\' => \'INT4\'\r\n                                             },\r\n                                             \'status\',\r\n                                             {\r\n                                               \'TYPE\' => \'INT2\'\r\n                                             },\r\n                                             \'completion_time\',\r\n                                             {\r\n                                               \'TYPE\' => \'INT4\'\r\n                                             },\r\n                                             \'delete_after\',\r\n                                             {\r\n                                               \'TYPE\' => \'INT4\'\r\n                                             }\r\n                                           ],\r\n                               \'INDEXES\' => [\r\n                                              \'ts_exitstatus_funcid_idx\',\r\n                                              [\r\n                                                \'funcid\'\r\n                                              ],\r\n                                              \'ts_exitstatus_delete_after_idx\',\r\n                                              [\r\n                                                \'delete_after\'\r\n                                              ]\r\n                                            ]\r\n                             },\r\n          \'ts_funcmap\' => {\r\n                            \'FIELDS\' => [\r\n                                          \'funcid\',\r\n                                          {\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'PRIMARYKEY\' => 1,\r\n                                            \'TYPE\' => \'INTSERIAL\'\r\n                                          },\r\n                                          \'funcname\',\r\n                                          {\r\n                                            \'NOTNULL\' => 1,\r\n                                            \'TYPE\' => \'varchar(255)\'\r\n                                          }\r\n                                        ],\r\n                            \'INDEXES\' => [\r\n                                           \'ts_funcmap_funcname_idx\',\r\n                                           {\r\n                                             \'FIELDS\' => [\r\n                                                           \'funcname\'\r\n                                                         ],\r\n                                             \'TYPE\' => \'UNIQUE\'\r\n                                           }\r\n                                         ]\r\n                          },\r\n          \'ts_job\' => {\r\n                        \'FIELDS\' => [\r\n                                      \'jobid\',\r\n                                      {\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'PRIMARYKEY\' => 1,\r\n                                        \'TYPE\' => \'INTSERIAL\'\r\n                                      },\r\n                                      \'funcid\',\r\n                                      {\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'TYPE\' => \'INT4\'\r\n                                      },\r\n                                      \'arg\',\r\n                                      {\r\n                                        \'TYPE\' => \'LONGBLOB\'\r\n                                      },\r\n                                      \'uniqkey\',\r\n                                      {\r\n                                        \'TYPE\' => \'varchar(255)\'\r\n                                      },\r\n                                      \'insert_time\',\r\n                                      {\r\n                                        \'TYPE\' => \'INT4\'\r\n                                      },\r\n                                      \'run_after\',\r\n                                      {\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'TYPE\' => \'INT4\'\r\n                                      },\r\n                                      \'grabbed_until\',\r\n                                      {\r\n                                        \'NOTNULL\' => 1,\r\n                                        \'TYPE\' => \'INT4\'\r\n                                      },\r\n                                      \'priority\',\r\n                                      {\r\n                                        \'TYPE\' => \'INT2\'\r\n                                      },\r\n                                      \'coalesce\',\r\n                                      {\r\n                                        \'TYPE\' => \'varchar(255)\'\r\n                                      }\r\n                                    ],\r\n                        \'INDEXES\' => [\r\n                                       \'ts_job_funcid_idx\',\r\n                                       {\r\n                                         \'FIELDS\' => [\r\n                                                       \'funcid\',\r\n                                                       \'uniqkey\'\r\n                                                     ],\r\n                                         \'TYPE\' => \'UNIQUE\'\r\n                                       },\r\n                                       \'ts_job_run_after_idx\',\r\n                                       [\r\n                                         \'run_after\',\r\n                                         \'funcid\'\r\n                                       ],\r\n                                       \'ts_job_coalesce_idx\',\r\n                                       [\r\n                                         \'coalesce\',\r\n                                         \'funcid\'\r\n                                       ]\r\n                                     ]\r\n                      },\r\n          \'ts_note\' => {\r\n                         \'FIELDS\' => [\r\n                                       \'jobid\',\r\n                                       {\r\n                                         \'NOTNULL\' => 1,\r\n                                         \'TYPE\' => \'INT4\'\r\n                                       },\r\n                                       \'notekey\',\r\n                                       {\r\n                                         \'TYPE\' => \'varchar(255)\'\r\n                                       },\r\n                                       \'value\',\r\n                                       {\r\n                                         \'TYPE\' => \'LONGBLOB\'\r\n                                       }\r\n                                     ],\r\n                         \'INDEXES\' => [\r\n                                        \'ts_note_jobid_idx\',\r\n                                        {\r\n                                          \'FIELDS\' => [\r\n                                                        \'jobid\',\r\n                                                        \'notekey\'\r\n                                                      ],\r\n                                          \'TYPE\' => \'UNIQUE\'\r\n                                        }\r\n                                      ]\r\n                       },\r\n          \'user_api_keys\' => {\r\n                               \'FIELDS\' => [\r\n                                             \'id\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'PRIMARYKEY\' => 1,\r\n                                               \'TYPE\' => \'INTSERIAL\'\r\n                                             },\r\n                                             \'user_id\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'REFERENCES\' => {\r\n                                                                 \'COLUMN\' => \'userid\',\r\n                                                                 \'DELETE\' => \'CASCADE\',\r\n                                                                 \'TABLE\' => \'profiles\',\r\n                                                                 \'created\' => 1\r\n                                                               },\r\n                                               \'TYPE\' => \'INT3\'\r\n                                             },\r\n                                             \'api_key\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'TYPE\' => \'VARCHAR(40)\'\r\n                                             },\r\n                                             \'description\',\r\n                                             {\r\n                                               \'TYPE\' => \'VARCHAR(255)\'\r\n                                             },\r\n                                             \'revoked\',\r\n                                             {\r\n                                               \'DEFAULT\' => \'FALSE\',\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'TYPE\' => \'BOOLEAN\'\r\n                                             },\r\n                                             \'last_used\',\r\n                                             {\r\n                                               \'TYPE\' => \'DATETIME\'\r\n                                             }\r\n                                           ],\r\n                               \'INDEXES\' => [\r\n                                              \'user_api_keys_api_key_idx\',\r\n                                              {\r\n                                                \'FIELDS\' => [\r\n                                                              \'api_key\'\r\n                                                            ],\r\n                                                \'TYPE\' => \'UNIQUE\'\r\n                                              },\r\n                                              \'user_api_keys_user_id_idx\',\r\n                                              [\r\n                                                \'user_id\'\r\n                                              ]\r\n                                            ]\r\n                             },\r\n          \'user_group_map\' => {\r\n                                \'FIELDS\' => [\r\n                                              \'user_id\',\r\n                                              {\r\n                                                \'NOTNULL\' => 1,\r\n                                                \'REFERENCES\' => {\r\n                                                                  \'COLUMN\' => \'userid\',\r\n                                                                  \'DELETE\' => \'CASCADE\',\r\n                                                                  \'TABLE\' => \'profiles\',\r\n                                                                  \'created\' => 1\r\n                                                                },\r\n                                                \'TYPE\' => \'INT3\'\r\n                                              },\r\n                                              \'group_id\',\r\n                                              {\r\n                                                \'NOTNULL\' => 1,\r\n                                                \'REFERENCES\' => {\r\n                                                                  \'COLUMN\' => \'id\',\r\n                                                                  \'DELETE\' => \'CASCADE\',\r\n                                                                  \'TABLE\' => \'groups\',\r\n                                                                  \'created\' => 1\r\n                                                                },\r\n                                                \'TYPE\' => \'INT3\'\r\n                                              },\r\n                                              \'isbless\',\r\n                                              {\r\n                                                \'DEFAULT\' => \'FALSE\',\r\n                                                \'NOTNULL\' => 1,\r\n                                                \'TYPE\' => \'BOOLEAN\'\r\n                                              },\r\n                                              \'grant_type\',\r\n                                              {\r\n                                                \'DEFAULT\' => 0,\r\n                                                \'NOTNULL\' => 1,\r\n                                                \'TYPE\' => \'INT1\'\r\n                                              }\r\n                                            ],\r\n                                \'INDEXES\' => [\r\n                                               \'user_group_map_user_id_idx\',\r\n                                               {\r\n                                                 \'FIELDS\' => [\r\n                                                               \'user_id\',\r\n                                                               \'group_id\',\r\n                                                               \'grant_type\',\r\n                                                               \'isbless\'\r\n                                                             ],\r\n                                                 \'TYPE\' => \'UNIQUE\'\r\n                                               }\r\n                                             ]\r\n                              },\r\n          \'versions\' => {\r\n                          \'FIELDS\' => [\r\n                                        \'id\',\r\n                                        {\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'PRIMARYKEY\' => 1,\r\n                                          \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                        },\r\n                                        \'value\',\r\n                                        {\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'varchar(64)\'\r\n                                        },\r\n                                        \'product_id\',\r\n                                        {\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'REFERENCES\' => {\r\n                                                            \'COLUMN\' => \'id\',\r\n                                                            \'DELETE\' => \'CASCADE\',\r\n                                                            \'TABLE\' => \'products\',\r\n                                                            \'created\' => 1\r\n                                                          },\r\n                                          \'TYPE\' => \'INT2\'\r\n                                        },\r\n                                        \'isactive\',\r\n                                        {\r\n                                          \'DEFAULT\' => \'TRUE\',\r\n                                          \'NOTNULL\' => 1,\r\n                                          \'TYPE\' => \'BOOLEAN\'\r\n                                        }\r\n                                      ],\r\n                          \'INDEXES\' => [\r\n                                         \'versions_product_id_idx\',\r\n                                         {\r\n                                           \'FIELDS\' => [\r\n                                                         \'product_id\',\r\n                                                         \'value\'\r\n                                                       ],\r\n                                           \'TYPE\' => \'UNIQUE\'\r\n                                         }\r\n                                       ]\r\n                        },\r\n          \'watch\' => {\r\n                       \'FIELDS\' => [\r\n                                     \'watcher\',\r\n                                     {\r\n                                       \'NOTNULL\' => 1,\r\n                                       \'REFERENCES\' => {\r\n                                                         \'COLUMN\' => \'userid\',\r\n                                                         \'DELETE\' => \'CASCADE\',\r\n                                                         \'TABLE\' => \'profiles\',\r\n                                                         \'created\' => 1\r\n                                                       },\r\n                                       \'TYPE\' => \'INT3\'\r\n                                     },\r\n                                     \'watched\',\r\n                                     {\r\n                                       \'NOTNULL\' => 1,\r\n                                       \'REFERENCES\' => {\r\n                                                         \'COLUMN\' => \'userid\',\r\n                                                         \'DELETE\' => \'CASCADE\',\r\n                                                         \'TABLE\' => \'profiles\',\r\n                                                         \'created\' => 1\r\n                                                       },\r\n                                       \'TYPE\' => \'INT3\'\r\n                                     }\r\n                                   ],\r\n                       \'INDEXES\' => [\r\n                                      \'watch_watcher_idx\',\r\n                                      {\r\n                                        \'FIELDS\' => [\r\n                                                      \'watcher\',\r\n                                                      \'watched\'\r\n                                                    ],\r\n                                        \'TYPE\' => \'UNIQUE\'\r\n                                      },\r\n                                      \'watch_watched_idx\',\r\n                                      [\r\n                                        \'watched\'\r\n                                      ]\r\n                                    ]\r\n                     },\r\n          \'whine_events\' => {\r\n                              \'FIELDS\' => [\r\n                                            \'id\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'PRIMARYKEY\' => 1,\r\n                                              \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                            },\r\n                                            \'owner_userid\',\r\n                                            {\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'REFERENCES\' => {\r\n                                                                \'COLUMN\' => \'userid\',\r\n                                                                \'DELETE\' => \'CASCADE\',\r\n                                                                \'TABLE\' => \'profiles\',\r\n                                                                \'created\' => 1\r\n                                                              },\r\n                                              \'TYPE\' => \'INT3\'\r\n                                            },\r\n                                            \'subject\',\r\n                                            {\r\n                                              \'TYPE\' => \'varchar(128)\'\r\n                                            },\r\n                                            \'body\',\r\n                                            {\r\n                                              \'TYPE\' => \'MEDIUMTEXT\'\r\n                                            },\r\n                                            \'mailifnobugs\',\r\n                                            {\r\n                                              \'DEFAULT\' => \'FALSE\',\r\n                                              \'NOTNULL\' => 1,\r\n                                              \'TYPE\' => \'BOOLEAN\'\r\n                                            }\r\n                                          ]\r\n                            },\r\n          \'whine_queries\' => {\r\n                               \'FIELDS\' => [\r\n                                             \'id\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'PRIMARYKEY\' => 1,\r\n                                               \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                             },\r\n                                             \'eventid\',\r\n                                             {\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'REFERENCES\' => {\r\n                                                                 \'COLUMN\' => \'id\',\r\n                                                                 \'DELETE\' => \'CASCADE\',\r\n                                                                 \'TABLE\' => \'whine_events\',\r\n                                                                 \'created\' => 1\r\n                                                               },\r\n                                               \'TYPE\' => \'INT3\'\r\n                                             },\r\n                                             \'query_name\',\r\n                                             {\r\n                                               \'DEFAULT\' => \'\\\'\\\'\',\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'TYPE\' => \'varchar(64)\'\r\n                                             },\r\n                                             \'sortkey\',\r\n                                             {\r\n                                               \'DEFAULT\' => \'0\',\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'TYPE\' => \'INT2\'\r\n                                             },\r\n                                             \'onemailperbug\',\r\n                                             {\r\n                                               \'DEFAULT\' => \'FALSE\',\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'TYPE\' => \'BOOLEAN\'\r\n                                             },\r\n                                             \'title\',\r\n                                             {\r\n                                               \'DEFAULT\' => \'\\\'\\\'\',\r\n                                               \'NOTNULL\' => 1,\r\n                                               \'TYPE\' => \'varchar(128)\'\r\n                                             }\r\n                                           ],\r\n                               \'INDEXES\' => [\r\n                                              \'whine_queries_eventid_idx\',\r\n                                              [\r\n                                                \'eventid\'\r\n                                              ]\r\n                                            ]\r\n                             },\r\n          \'whine_schedules\' => {\r\n                                 \'FIELDS\' => [\r\n                                               \'id\',\r\n                                               {\r\n                                                 \'NOTNULL\' => 1,\r\n                                                 \'PRIMARYKEY\' => 1,\r\n                                                 \'TYPE\' => \'MEDIUMSERIAL\'\r\n                                               },\r\n                                               \'eventid\',\r\n                                               {\r\n                                                 \'NOTNULL\' => 1,\r\n                                                 \'REFERENCES\' => {\r\n                                                                   \'COLUMN\' => \'id\',\r\n                                                                   \'DELETE\' => \'CASCADE\',\r\n                                                                   \'TABLE\' => \'whine_events\',\r\n                                                                   \'created\' => 1\r\n                                                                 },\r\n                                                 \'TYPE\' => \'INT3\'\r\n                                               },\r\n                                               \'run_day\',\r\n                                               {\r\n                                                 \'TYPE\' => \'varchar(32)\'\r\n                                               },\r\n                                               \'run_time\',\r\n                                               {\r\n                                                 \'TYPE\' => \'varchar(32)\'\r\n                                               },\r\n                                               \'run_next\',\r\n                                               {\r\n                                                 \'TYPE\' => \'DATETIME\'\r\n                                               },\r\n                                               \'mailto\',\r\n                                               {\r\n                                                 \'NOTNULL\' => 1,\r\n                                                 \'TYPE\' => \'INT3\'\r\n                                               },\r\n                                               \'mailto_type\',\r\n                                               {\r\n                                                 \'DEFAULT\' => \'0\',\r\n                                                 \'NOTNULL\' => 1,\r\n                                                 \'TYPE\' => \'INT2\'\r\n                                               }\r\n                                             ],\r\n                                 \'INDEXES\' => [\r\n                                                \'whine_schedules_run_next_idx\',\r\n                                                [\r\n                                                  \'run_next\'\r\n                                                ],\r\n                                                \'whine_schedules_eventid_idx\',\r\n                                                [\r\n                                                  \'eventid\'\r\n                                                ]\r\n                                              ]\r\n                               }\r\n        };',3.00);

/*Table structure for table `category_group_map` */

DROP TABLE IF EXISTS `category_group_map`;

CREATE TABLE `category_group_map` (
  `category_id` smallint(6) NOT NULL,
  `group_id` mediumint(9) NOT NULL,
  UNIQUE KEY `category_group_map_category_id_idx` (`category_id`,`group_id`),
  KEY `fk_category_group_map_group_id_groups_id` (`group_id`),
  CONSTRAINT `fk_category_group_map_category_id_series_categories_id` FOREIGN KEY (`category_id`) REFERENCES `series_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_category_group_map_group_id_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category_group_map` */

/*Table structure for table `cc` */

DROP TABLE IF EXISTS `cc`;

CREATE TABLE `cc` (
  `bug_id` mediumint(9) NOT NULL,
  `who` mediumint(9) NOT NULL,
  UNIQUE KEY `cc_bug_id_idx` (`bug_id`,`who`),
  KEY `cc_who_idx` (`who`),
  CONSTRAINT `fk_cc_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cc_who_profiles_userid` FOREIGN KEY (`who`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cc` */

/*Table structure for table `cf_ipi_clust_3_action_type` */

DROP TABLE IF EXISTS `cf_ipi_clust_3_action_type`;

CREATE TABLE `cf_ipi_clust_3_action_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT 0,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cf_ipi_action_type_value_idx` (`value`),
  KEY `cf_ipi_action_type_sortkey_idx` (`sortkey`,`value`),
  KEY `cf_ipi_action_type_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `cf_ipi_clust_3_action_type` */

insert  into `cf_ipi_clust_3_action_type`(`id`,`value`,`sortkey`,`isactive`,`visibility_value_id`) values 
(1,'---',0,1,NULL),
(2,'Diagnose',10,1,NULL),
(3,'Fix',15,1,NULL),
(4,'Diagnose and Fix',20,1,NULL),
(5,'Supervise',25,1,NULL),
(6,'Deliver',30,1,NULL),
(7,'Collect',35,1,NULL),
(8,'Purchase',40,1,NULL),
(9,'Install',45,1,NULL),
(10,'Check',50,1,NULL),
(11,'Other',55,1,NULL);

/*Table structure for table `cf_ipi_clust_3_roadbook_for` */

DROP TABLE IF EXISTS `cf_ipi_clust_3_roadbook_for`;

CREATE TABLE `cf_ipi_clust_3_roadbook_for` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT 0,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cf_ipi_roadbook_for_value_idx` (`value`),
  KEY `cf_ipi_roadbook_for_visibility_value_id_idx` (`visibility_value_id`),
  KEY `cf_ipi_roadbook_for_sortkey_idx` (`sortkey`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

/*Data for the table `cf_ipi_clust_3_roadbook_for` */

insert  into `cf_ipi_clust_3_roadbook_for`(`id`,`value`,`sortkey`,`isactive`,`visibility_value_id`) values 
(1,'Firdauz (Left 04 Sep 2014)',10000,0,NULL),
(2,'Zayar (left 06/08/10)',10000,0,NULL),
(3,'Joel (left 13/06/11)',10000,0,NULL),
(4,'Hussin',5,1,NULL),
(5,'Nath',15,1,NULL),
(6,'Abigael (left 15/04/11)',10000,0,NULL),
(7,'Hasfa (left 28/02/11)',10000,0,NULL),
(8,'Marivick (Left)',10000,0,NULL),
(9,'Suzana (Left 31/01/2013)',10000,0,NULL),
(10,'Anne',1000,0,NULL),
(11,'Ellen (Left 06/09/11)',10000,0,NULL),
(12,'Mohamed (left 31/05/11)',10000,0,NULL),
(13,'Housekeepers',20,1,NULL),
(14,'Mahendran (left 29/07/11)',10000,0,NULL),
(15,'Vijay (left 19/10/11)',10000,0,NULL),
(16,'Stephane (left 09/09/11)',10000,0,NULL),
(17,'Ahmad (Left 19/09/11)',10000,0,NULL),
(18,'Helene (left 22/04/2013)',10000,0,NULL),
(19,'Gayatri',10,1,NULL),
(20,'Huzir (Left 25/10/11)',10000,0,NULL),
(21,'Sahrin (left 09/11/11)',10000,0,NULL),
(22,'Accounting',20,1,NULL),
(23,'Admin Assistant',20,1,NULL),
(24,'Sales',20,1,NULL),
(25,'Management',25,1,NULL),
(26,'Franck',1000,0,NULL),
(27,'Fauzi (left 02/10/12)',10000,0,NULL),
(28,'Lawrence (left 04/01/12)',10000,0,NULL),
(29,'Alan (left 30/03/2012)',10000,0,NULL),
(30,'Anand (left 31/12/11)',10000,0,NULL),
(31,'Shahbudi (Left 27/12/13)',10000,0,NULL),
(32,'Yazed (left 30/10/12)',10000,0,NULL),
(33,'William (left 04/05/12)',10000,0,NULL),
(34,'Nast',15,1,NULL),
(35,'Uzali (left 13/08/12)',10000,0,NULL),
(36,'Kwok (left 30/06/12)',10000,0,NULL),
(37,'Zad (left 30/06/12)',10000,0,NULL),
(38,'Marc (Left 10/07/2015)',10000,0,NULL),
(39,'Choo (left 22/02/2013)',10000,0,NULL),
(40,'Krishnan (Left 06/11/2016)',10000,0,NULL),
(41,'Julianto (left 30/08/12',10000,0,NULL),
(42,'Peter TAY (left 30/11/12)',10000,0,NULL),
(43,'Tan (Left 31/01/2013)',10000,0,NULL),
(44,'Jhonson',5,1,NULL),
(45,'Lau (Left 30/11/2013)',10000,0,NULL),
(46,'Richard (Left 04/03/2014)',10000,0,NULL),
(47,'Jimmy (Left 26/11/13)',10000,0,NULL),
(64,'Jerry (Left 30/04/15)',10000,0,NULL),
(65,'Leng (Left 24/04/2014)',10000,0,NULL),
(66,'Salim',5,1,NULL),
(67,'Derrick',5,1,NULL),
(68,'Charlene (Left 09/09/2014)',10000,0,NULL),
(69,'Suhaily (LEFT)',10000,0,NULL),
(70,'Nonie (Left 08/07/2016)',10000,0,NULL),
(71,'Ken (Left 04/12/2014)',10000,0,NULL),
(72,'Jasline (Left 12/06/2015)',10000,0,NULL),
(73,'Khairul',5,1,NULL),
(74,'Kamal (Left 30/01/2016)',10000,0,NULL),
(75,'Nurul (Left)',10000,0,NULL),
(76,'Alisa',10,1,NULL);

/*Table structure for table `cf_ipi_clust_4_status_in_progress` */

DROP TABLE IF EXISTS `cf_ipi_clust_4_status_in_progress`;

CREATE TABLE `cf_ipi_clust_4_status_in_progress` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT 0,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cf_status_in_progress_value_idx` (`value`),
  KEY `cf_status_in_progress_visibility_value_id_idx` (`visibility_value_id`),
  KEY `cf_status_in_progress_sortkey_idx` (`sortkey`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `cf_ipi_clust_4_status_in_progress` */

insert  into `cf_ipi_clust_4_status_in_progress`(`id`,`value`,`sortkey`,`isactive`,`visibility_value_id`) values 
(1,'---',0,1,NULL),
(2,'SCHEDULED',10,1,NULL),
(3,'AP NEEDED',20,1,NULL),
(4,'AP GRANTED',30,1,NULL),
(5,'FIELD ACTION',40,1,NULL);

/*Table structure for table `cf_ipi_clust_4_status_standby` */

DROP TABLE IF EXISTS `cf_ipi_clust_4_status_standby`;

CREATE TABLE `cf_ipi_clust_4_status_standby` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT 0,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cf_status_standby_value_idx` (`value`),
  KEY `cf_status_standby_visibility_value_id_idx` (`visibility_value_id`),
  KEY `cf_status_standby_sortkey_idx` (`sortkey`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `cf_ipi_clust_4_status_standby` */

insert  into `cf_ipi_clust_4_status_standby`(`id`,`value`,`sortkey`,`isactive`,`visibility_value_id`) values 
(1,'---',0,1,NULL),
(2,'PENDING PMT',10,1,NULL),
(3,'OTHER',20,1,NULL);

/*Table structure for table `cf_ipi_clust_6_claim_type` */

DROP TABLE IF EXISTS `cf_ipi_clust_6_claim_type`;

CREATE TABLE `cf_ipi_clust_6_claim_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT 0,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cf_claim_type_value_idx` (`value`),
  KEY `cf_claim_type_sortkey_idx` (`sortkey`,`value`),
  KEY `cf_claim_type_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

/*Data for the table `cf_ipi_clust_6_claim_type` */

insert  into `cf_ipi_clust_6_claim_type`(`id`,`value`,`sortkey`,`isactive`,`visibility_value_id`) values 
(1,'---',500,1,NULL),
(2,'Electrical',1005,1,2),
(3,'Plumbing Rep',1010,1,2),
(4,'Aircon Rep',1015,1,2),
(5,'Furniture Rep',1020,1,2),
(6,'Carpentry Rep',1025,1,2),
(7,'Internet Rep',1030,1,2),
(8,'Cable TV Rep',1035,1,2),
(9,'Other Rep',1090,1,2),
(10,'Aircon M',1505,1,3),
(11,'Equipment M',1510,1,3),
(12,'Plumbing M',1515,1,3),
(13,'Battery repl.',1520,1,3),
(14,'Other M',1525,1,3),
(15,'Linens',2005,1,4),
(16,'Textile',2010,1,4),
(17,'Curtains',2015,1,4),
(18,'Cleaning',2020,1,4),
(19,'Other H',2025,1,4),
(20,'Key',2505,1,5),
(21,'Resident Card',2510,1,5),
(22,'Car Transponder',2515,1,5),
(23,'Kitchen Utensils',2520,1,5),
(24,'Furniture D',2525,1,5),
(25,'Safe box',2530,1,5),
(26,'Equipment D',2535,1,5),
(27,'Other D',2540,1,5),
(28,'Structural Defect',3005,1,6),
(29,'Carpentry Ren',3010,1,6),
(30,'Parquet Polishing',3015,1,6),
(31,'Painting',3020,1,6),
(32,'Other Ren',3025,1,6),
(33,'Flat Set Up',3505,1,7),
(34,'Light Renovation',3510,1,7),
(35,'Flat Refurbishing',3515,1,7),
(36,'Hand Over',3520,1,7),
(37,'Basic Check',3525,1,7),
(38,'Store room Clearance',3530,1,7),
(39,'Other CP',3535,1,7),
(40,'Laundry',4005,1,8),
(41,'Ironing',4010,1,8),
(42,'Housekeeping',4015,1,8),
(43,'Cable Channel',4020,1,8),
(44,'Internet Upgrade',4025,1,8),
(45,'Beds',4030,1,8),
(46,'Baby Cot',4035,1,8),
(47,'Airport Transportation',4040,1,8),
(48,'Welcome Basket',4045,1,8),
(49,'Dish Washing',4050,1,8),
(50,'Other ES',4090,1,8),
(51,'NOT SPECIFIED',4095,1,8),
(52,'SP Services',4505,1,9),
(53,'Gas',4510,1,9),
(54,'Meter Reading',4515,1,9),
(55,'Other U',4520,1,9),
(56,'Internet O',5005,1,10),
(57,'Cable TV O',5010,1,10),
(58,'Viewing',5015,1,10),
(59,'Other',5020,1,10),
(60,'Late Check IN/OUT',4055,1,8),
(61,'Early Check IN/OUT',4060,1,8),
(62,'High Chair',4065,1,8),
(63,'Equipment',1040,1,2);

/*Table structure for table `cf_ipi_clust_7_payment_type` */

DROP TABLE IF EXISTS `cf_ipi_clust_7_payment_type`;

CREATE TABLE `cf_ipi_clust_7_payment_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT 0,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cf_ipi_payment_type_value_idx` (`value`),
  KEY `cf_ipi_payment_type_visibility_value_id_idx` (`visibility_value_id`),
  KEY `cf_ipi_payment_type_sortkey_idx` (`sortkey`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `cf_ipi_clust_7_payment_type` */

insert  into `cf_ipi_clust_7_payment_type`(`id`,`value`,`sortkey`,`isactive`,`visibility_value_id`) values 
(1,'---',0,1,NULL),
(2,'Invoice (Wire)',50,1,NULL),
(3,'Cheque on delivery',20,1,NULL),
(4,'Cash',30,1,NULL),
(5,'Invoice (cheque)',40,1,NULL),
(6,'Invoice (unspecif.)',35,1,NULL);

/*Table structure for table `cf_ipi_clust_9_acct_action` */

DROP TABLE IF EXISTS `cf_ipi_clust_9_acct_action`;

CREATE TABLE `cf_ipi_clust_9_acct_action` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT 0,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cf_accounting_action_value_idx` (`value`),
  KEY `cf_accounting_action_visibility_value_id_idx` (`visibility_value_id`),
  KEY `cf_accounting_action_sortkey_idx` (`sortkey`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `cf_ipi_clust_9_acct_action` */

insert  into `cf_ipi_clust_9_acct_action`(`id`,`value`,`sortkey`,`isactive`,`visibility_value_id`) values 
(1,'INVOICE LANDLORD',100,1,NULL),
(2,'INVOICE CUSTOMER',200,1,NULL),
(3,'PAY CONTRACTOR',300,1,NULL),
(4,'---',50,1,NULL);

/*Table structure for table `classifications` */

DROP TABLE IF EXISTS `classifications`;

CREATE TABLE `classifications` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `classifications_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `classifications` */

insert  into `classifications`(`id`,`name`,`description`,`sortkey`) values 
(1,'Test Units','These are TEST units that you have created or where I have been invited',0),
(2,'My Units','These are the units that you have created or where I have been invited',0);

/*Table structure for table `classifications_vanilla` */

DROP TABLE IF EXISTS `classifications_vanilla`;

CREATE TABLE `classifications_vanilla` (
  `id` smallint(6) NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `classifications_vanilla` */

insert  into `classifications_vanilla`(`id`,`name`,`description`,`sortkey`) values 
(1,'Unclassified','Not assigned to any classification',0);

/*Table structure for table `component_cc` */

DROP TABLE IF EXISTS `component_cc`;

CREATE TABLE `component_cc` (
  `user_id` mediumint(9) NOT NULL,
  `component_id` mediumint(9) NOT NULL,
  UNIQUE KEY `component_cc_user_id_idx` (`component_id`,`user_id`),
  KEY `fk_component_cc_user_id_profiles_userid` (`user_id`),
  CONSTRAINT `fk_component_cc_component_id_components_id` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_component_cc_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `component_cc` */

insert  into `component_cc`(`user_id`,`component_id`) values 
(5,3);

/*Table structure for table `components` */

DROP TABLE IF EXISTS `components`;

CREATE TABLE `components` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `product_id` smallint(6) NOT NULL,
  `initialowner` mediumint(9) NOT NULL,
  `initialqacontact` mediumint(9) DEFAULT NULL,
  `description` mediumtext NOT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_product_id_idx` (`product_id`,`name`),
  KEY `components_name_idx` (`name`),
  KEY `fk_components_initialowner_profiles_userid` (`initialowner`),
  KEY `fk_components_initialqacontact_profiles_userid` (`initialqacontact`),
  CONSTRAINT `fk_components_initialowner_profiles_userid` FOREIGN KEY (`initialowner`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_components_initialqacontact_profiles_userid` FOREIGN KEY (`initialqacontact`) REFERENCES `profiles` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_components_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `components` */

insert  into `components`(`id`,`name`,`product_id`,`initialowner`,`initialqacontact`,`description`,`isactive`) values 
(1,'Agent',1,2,2,'An agent \r Leonel - My Real Estate Agency - Phone number: 123 456 7891. For a faster response, please message me directly in Unee-T for this unit',1),
(2,'Owner/Landlord',1,3,3,'The Landlord \r Marley - Profile created by Leonel',1),
(3,'Tenant',1,4,4,'The Tenant \r Michael - Profile created by Leonel \r Sabrina - Profile created by Leonel',1),
(4,'Management Company',1,13,13,'The management Company \r Management Co - We take best care of your unit! ',1);

/*Table structure for table `dependencies` */

DROP TABLE IF EXISTS `dependencies`;

CREATE TABLE `dependencies` (
  `blocked` mediumint(9) NOT NULL,
  `dependson` mediumint(9) NOT NULL,
  UNIQUE KEY `dependencies_blocked_idx` (`blocked`,`dependson`),
  KEY `dependencies_dependson_idx` (`dependson`),
  CONSTRAINT `fk_dependencies_blocked_bugs_bug_id` FOREIGN KEY (`blocked`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dependencies_dependson_bugs_bug_id` FOREIGN KEY (`dependson`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dependencies` */

/*Table structure for table `duplicates` */

DROP TABLE IF EXISTS `duplicates`;

CREATE TABLE `duplicates` (
  `dupe_of` mediumint(9) NOT NULL,
  `dupe` mediumint(9) NOT NULL,
  PRIMARY KEY (`dupe`),
  KEY `fk_duplicates_dupe_of_bugs_bug_id` (`dupe_of`),
  CONSTRAINT `fk_duplicates_dupe_bugs_bug_id` FOREIGN KEY (`dupe`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_duplicates_dupe_of_bugs_bug_id` FOREIGN KEY (`dupe_of`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `duplicates` */

/*Table structure for table `email_bug_ignore` */

DROP TABLE IF EXISTS `email_bug_ignore`;

CREATE TABLE `email_bug_ignore` (
  `user_id` mediumint(9) NOT NULL,
  `bug_id` mediumint(9) NOT NULL,
  UNIQUE KEY `email_bug_ignore_user_id_idx` (`user_id`,`bug_id`),
  KEY `fk_email_bug_ignore_bug_id_bugs_bug_id` (`bug_id`),
  CONSTRAINT `fk_email_bug_ignore_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_email_bug_ignore_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_bug_ignore` */

/*Table structure for table `email_setting` */

DROP TABLE IF EXISTS `email_setting`;

CREATE TABLE `email_setting` (
  `user_id` mediumint(9) NOT NULL,
  `relationship` tinyint(4) NOT NULL,
  `event` tinyint(4) NOT NULL,
  UNIQUE KEY `email_setting_user_id_idx` (`user_id`,`relationship`,`event`),
  CONSTRAINT `fk_email_setting_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_setting` */

/*Table structure for table `field_visibility` */

DROP TABLE IF EXISTS `field_visibility`;

CREATE TABLE `field_visibility` (
  `field_id` mediumint(9) DEFAULT NULL,
  `value_id` smallint(6) NOT NULL,
  UNIQUE KEY `field_visibility_field_id_idx` (`field_id`,`value_id`),
  CONSTRAINT `fk_field_visibility_field_id_fielddefs_id` FOREIGN KEY (`field_id`) REFERENCES `fielddefs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `field_visibility` */

insert  into `field_visibility`(`field_id`,`value_id`) values 
(60,3),
(61,7),
(68,1),
(68,2),
(68,4),
(68,5),
(69,1),
(69,2),
(69,4),
(69,5),
(71,1),
(71,2),
(71,4),
(71,5),
(72,1),
(72,2),
(72,4),
(72,5),
(73,1),
(73,2),
(73,4),
(73,5),
(74,1),
(74,2),
(74,3),
(74,4),
(74,5),
(75,1),
(75,2),
(75,3),
(75,4),
(75,5),
(76,1),
(76,2),
(76,3),
(76,4),
(76,5),
(77,1),
(77,2),
(77,3),
(77,4),
(77,5),
(78,1),
(78,3),
(78,4),
(79,1),
(79,3),
(79,4),
(80,1),
(80,2),
(80,3),
(80,4),
(80,5),
(81,1),
(81,2),
(81,3),
(81,4),
(81,5),
(82,1),
(82,2),
(82,3),
(82,4),
(82,5),
(83,1),
(83,2),
(83,3),
(83,4),
(83,5),
(84,1),
(84,2),
(84,3),
(84,4),
(84,5);

/*Table structure for table `fielddefs` */

DROP TABLE IF EXISTS `fielddefs`;

CREATE TABLE `fielddefs` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT 0,
  `custom` tinyint(4) NOT NULL DEFAULT 0,
  `description` tinytext NOT NULL,
  `long_desc` varchar(255) NOT NULL DEFAULT '',
  `mailhead` tinyint(4) NOT NULL DEFAULT 0,
  `sortkey` smallint(6) NOT NULL,
  `obsolete` tinyint(4) NOT NULL DEFAULT 0,
  `enter_bug` tinyint(4) NOT NULL DEFAULT 0,
  `buglist` tinyint(4) NOT NULL DEFAULT 0,
  `visibility_field_id` mediumint(9) DEFAULT NULL,
  `value_field_id` mediumint(9) DEFAULT NULL,
  `reverse_desc` tinytext DEFAULT NULL,
  `is_mandatory` tinyint(4) NOT NULL DEFAULT 0,
  `is_numeric` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fielddefs_name_idx` (`name`),
  KEY `fielddefs_sortkey_idx` (`sortkey`),
  KEY `fielddefs_value_field_id_idx` (`value_field_id`),
  KEY `fielddefs_is_mandatory_idx` (`is_mandatory`),
  KEY `fk_fielddefs_visibility_field_id_fielddefs_id` (`visibility_field_id`),
  CONSTRAINT `fk_fielddefs_value_field_id_fielddefs_id` FOREIGN KEY (`value_field_id`) REFERENCES `fielddefs` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_fielddefs_visibility_field_id_fielddefs_id` FOREIGN KEY (`visibility_field_id`) REFERENCES `fielddefs` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

/*Data for the table `fielddefs` */

insert  into `fielddefs`(`id`,`name`,`type`,`custom`,`description`,`long_desc`,`mailhead`,`sortkey`,`obsolete`,`enter_bug`,`buglist`,`visibility_field_id`,`value_field_id`,`reverse_desc`,`is_mandatory`,`is_numeric`) values 
(1,'bug_id',0,0,'Case #','',1,100,0,0,1,NULL,NULL,NULL,0,1),
(2,'short_desc',0,0,'Summary','',1,200,0,0,1,NULL,NULL,NULL,1,0),
(3,'classification',2,0,'Building','',1,300,0,0,1,NULL,NULL,NULL,0,0),
(4,'product',2,0,'Unit','',1,400,0,0,1,NULL,NULL,NULL,1,0),
(5,'version',0,0,'Version','',1,500,0,0,1,NULL,NULL,NULL,1,0),
(6,'rep_platform',2,0,'Case Category','',1,600,0,0,1,NULL,NULL,NULL,0,0),
(7,'bug_file_loc',0,0,'URL','',1,700,0,0,1,NULL,NULL,NULL,0,0),
(8,'op_sys',2,0,'Source','',1,800,0,0,1,NULL,NULL,NULL,0,0),
(9,'bug_status',2,0,'Status','',1,900,0,0,1,NULL,NULL,NULL,0,0),
(10,'status_whiteboard',0,0,'Status Whiteboard','',1,1000,0,0,1,NULL,NULL,NULL,0,0),
(11,'keywords',8,0,'Keywords','',1,1100,0,0,1,NULL,NULL,NULL,0,0),
(12,'resolution',2,0,'Resolution','',0,1200,0,0,1,NULL,NULL,NULL,0,0),
(13,'bug_severity',2,0,'Severity','',1,1300,0,0,1,NULL,NULL,NULL,0,0),
(14,'priority',2,0,'Priority','',1,1400,0,0,1,NULL,NULL,NULL,0,0),
(15,'component',2,0,'Stakeholder','',1,1500,0,0,1,NULL,NULL,NULL,1,0),
(16,'assigned_to',0,0,'AssignedTo','',1,1600,0,0,1,NULL,NULL,NULL,0,0),
(17,'reporter',0,0,'ReportedBy','',1,1700,0,0,1,NULL,NULL,NULL,0,0),
(18,'qa_contact',0,0,'QAContact','',1,1800,0,0,1,NULL,NULL,NULL,0,0),
(19,'assigned_to_realname',0,0,'AssignedToName','',0,1900,0,0,1,NULL,NULL,NULL,0,0),
(20,'reporter_realname',0,0,'ReportedByName','',0,2000,0,0,1,NULL,NULL,NULL,0,0),
(21,'qa_contact_realname',0,0,'QAContactName','',0,2100,0,0,1,NULL,NULL,NULL,0,0),
(22,'cc',0,0,'CC','',1,2200,0,0,0,NULL,NULL,NULL,0,0),
(23,'dependson',0,0,'Depends on','',1,2300,0,0,1,NULL,NULL,NULL,0,1),
(24,'blocked',0,0,'Blocks','',1,2400,0,0,1,NULL,NULL,NULL,0,1),
(25,'attachments.description',0,0,'Attachment description','',0,2500,0,0,0,NULL,NULL,NULL,0,0),
(26,'attachments.filename',0,0,'Attachment filename','',0,2600,0,0,0,NULL,NULL,NULL,0,0),
(27,'attachments.mimetype',0,0,'Attachment mime type','',0,2700,0,0,0,NULL,NULL,NULL,0,0),
(28,'attachments.ispatch',0,0,'Attachment is patch','',0,2800,0,0,0,NULL,NULL,NULL,0,1),
(29,'attachments.isobsolete',0,0,'Attachment is obsolete','',0,2900,0,0,0,NULL,NULL,NULL,0,1),
(30,'attachments.isprivate',0,0,'Attachment is private','',0,3000,0,0,0,NULL,NULL,NULL,0,1),
(31,'attachments.submitter',0,0,'Attachment creator','',0,3100,0,0,0,NULL,NULL,NULL,0,0),
(32,'target_milestone',0,0,'Target Milestone','',1,3200,0,0,1,NULL,NULL,NULL,0,0),
(33,'creation_ts',0,0,'Creation date','',0,3300,0,0,1,NULL,NULL,NULL,0,0),
(34,'delta_ts',0,0,'Last changed date','',0,3400,0,0,1,NULL,NULL,NULL,0,0),
(35,'longdesc',0,0,'Comment','',0,3500,0,0,0,NULL,NULL,NULL,0,0),
(36,'longdescs.isprivate',0,0,'Comment is private','',0,3600,0,0,0,NULL,NULL,NULL,0,1),
(37,'longdescs.count',0,0,'Number of Comments','',0,3700,0,0,1,NULL,NULL,NULL,0,1),
(38,'alias',0,0,'Alias','',0,3800,0,0,1,NULL,NULL,NULL,0,0),
(39,'everconfirmed',0,0,'Ever Confirmed','',0,3900,0,0,0,NULL,NULL,NULL,0,1),
(40,'reporter_accessible',0,0,'Reporter Accessible','',0,4000,0,0,0,NULL,NULL,NULL,0,1),
(41,'cclist_accessible',0,0,'CC Accessible','',0,4100,0,0,0,NULL,NULL,NULL,0,1),
(42,'bug_group',0,0,'Group','',1,4200,0,0,0,NULL,NULL,NULL,0,0),
(43,'estimated_time',0,0,'Estimated Hours','',1,4300,0,0,1,NULL,NULL,NULL,0,1),
(44,'remaining_time',0,0,'Remaining Hours','',0,4400,0,0,1,NULL,NULL,NULL,0,1),
(45,'deadline',5,0,'Deadline','',1,4500,0,0,1,NULL,NULL,NULL,0,0),
(46,'commenter',0,0,'Commenter','',0,4600,0,0,0,NULL,NULL,NULL,0,0),
(47,'flagtypes.name',0,0,'Flags','',0,4700,0,0,1,NULL,NULL,NULL,0,0),
(48,'requestees.login_name',0,0,'Flag Requestee','',0,4800,0,0,0,NULL,NULL,NULL,0,0),
(49,'setters.login_name',0,0,'Flag Setter','',0,4900,0,0,0,NULL,NULL,NULL,0,0),
(50,'work_time',0,0,'Hours Worked','',0,5000,0,0,1,NULL,NULL,NULL,0,1),
(51,'percentage_complete',0,0,'Percentage Complete','',0,5100,0,0,1,NULL,NULL,NULL,0,1),
(52,'content',0,0,'Content','',0,5200,0,0,0,NULL,NULL,NULL,0,0),
(53,'attach_data.thedata',0,0,'Attachment data','',0,5300,0,0,0,NULL,NULL,NULL,0,0),
(54,'owner_idle_time',0,0,'Time Since Assignee Touched','',0,5400,0,0,0,NULL,NULL,NULL,0,0),
(55,'see_also',7,0,'See Also','',0,5500,0,0,0,NULL,NULL,NULL,0,0),
(56,'tag',8,0,'Personal Tags','',0,5600,0,0,1,NULL,NULL,NULL,0,0),
(57,'last_visit_ts',5,0,'Last Visit','',0,5700,0,0,1,NULL,NULL,NULL,0,0),
(58,'comment_tag',0,0,'Comment Tag','',0,5800,0,0,0,NULL,NULL,NULL,0,0),
(59,'days_elapsed',0,0,'Days since bug changed','',0,5900,0,0,0,NULL,NULL,NULL,0,0),
(60,'cf_ipi_clust_4_status_in_progress',2,1,'Progression','More information about the case when the status is \"IN PROGRESS\".',1,10,0,1,1,9,NULL,NULL,0,0),
(61,'cf_ipi_clust_4_status_standby',2,1,'Stand By Cause','More information about the case when the status is \"STAND BY\"',0,20,0,0,1,9,NULL,NULL,0,0),
(62,'cf_ipi_clust_6_claim_type',2,1,'Case Type','The Case Type allows us to better organize Cases. It depends on the Case Category.',0,600,0,1,1,NULL,6,NULL,0,0),
(64,'cf_ipi_clust_1_solution',4,1,'Solution','The CURRENT solution that we have to solve this. This could (and in many occasion WILL) change over time. It can also be empty if we don\'t know what the solution is yet. It is different from the NEXT STEP field.',0,3215,0,1,1,NULL,NULL,NULL,0,0),
(65,'cf_ipi_clust_3_nber_field_visits',10,1,'Field Visits','Number of visits or trips done to diagnose and solve this case. DO NOT include the visits by the supervisors/managers for Quality Control purposes. Increases Each time there is a new visit SCHEDULED. Decrease during debrief if cancelled.',0,3205,0,0,1,NULL,NULL,NULL,0,0),
(66,'cf_ipi_clust_1_next_step_by',5,1,'Next Step by','When is the Next step planned to solve this case? This allow us to display all the cases that we need to work on on a specific date. This is different from the DEADLINE (when do we need to solve the case?).',0,3210,0,1,1,NULL,NULL,NULL,0,0),
(67,'cf_ipi_clust_1_next_step',4,1,'Next Step','Detailed description of the next step for the Case ASSIGNEE. This is different from the solution and from the field action.',0,3220,0,0,1,NULL,NULL,NULL,0,0),
(68,'cf_ipi_clust_3_field_action_from',5,1,'Scheduled From','The Start date for the action on the field. It is also possible to add a start time.',0,3225,0,0,1,60,NULL,NULL,0,0),
(69,'cf_ipi_clust_3_field_action_until',5,1,'Scheduled Until','The End date for the action on the field. It is also possible to add an end time.',0,3230,0,0,1,60,NULL,NULL,0,0),
(71,'cf_ipi_clust_3_roadbook_for',3,1,'Action For','In whose roadbook shall Field Action appear? This can change over time. It is possible to choose more than 1 person if needed.',0,3235,0,0,1,60,NULL,NULL,0,0),
(72,'cf_ipi_clust_3_action_type',2,1,'Action Type','What type of action do we need to do on the field?',0,3240,0,0,1,60,NULL,NULL,0,0),
(73,'cf_ipi_clust_3_field_action',4,1,'Action Details','Describe in details what needs to be done. This text will appear in the roadbook.',0,3245,0,0,1,60,NULL,NULL,0,0),
(74,'cf_ipi_clust_5_action_purchase_list',4,1,'Purchase List','Enter the list of things that need to be purchased. If the list is too long, attach a file to the case with the detailed list and only summarize what we need to purchase here.',0,3250,0,0,1,60,NULL,NULL,0,0),
(75,'cf_ipi_clust_5_budget',1,1,'Estimated Budget','The LATEST estimate for the budget we need to fix the problem. This can change with time and might be different than the approved budget as we gather more information.',0,3255,0,0,1,60,NULL,NULL,0,0),
(76,'cf_ipi_clust_5_approved_budget',1,1,'Approved Budget','What is the budget that has been APPROVED to solve this. This can be different from the actual cost of the purchase or total cost for solving the case. This allows us to monitor how good we are when we have to estimate a budget.',0,3275,0,0,1,60,NULL,NULL,0,0),
(77,'cf_ipi_clust_5_contractor',1,1,'Contractor','The name of the contractor that has been assigned to work on this case.',0,3285,0,0,1,60,NULL,NULL,0,0),
(78,'cf_ipi_clust_5_approval_for',4,1,'Approval For','Explain why you require an approval. The approver will use this information to better understand the whole situtation.',0,3265,0,0,1,60,NULL,NULL,0,0),
(79,'cf_ipi_clust_5_approval_comment',4,1,'Approval Comment','This is to explain/comment about the approval/rejection of what was requested.',0,3270,0,0,1,60,NULL,NULL,0,0),
(80,'cf_ipi_clust_7_payment_type',2,1,'Payment Type','How will we pay the contractor? This is important information so that we can prepare the payment accordingly. This will ensure we pay our supplier as fast as possible and minimize the risk of misunderstandings.',0,3290,0,0,1,60,NULL,NULL,0,0),
(81,'cf_ipi_clust_7_contractor_payment',4,1,'Details on Payment','Use this if the supplier has specific requirement about the payment or information about the contractor\'s Terms and conditions for this.',0,3295,0,0,1,60,NULL,NULL,0,0),
(82,'cf_ipi_clust_7_bill_number',1,1,'Bill Number','The bill or invoice number from the contractor or supplier. If you have more than one bill number, we suggest that you create another case for that bill/invoice and use the Depends on/Blocks or the See Also functionality of this tool.',0,3297,0,0,1,60,NULL,NULL,0,0),
(83,'cf_ipi_clust_5_purchase_cost',1,1,'Purchase Cost','What was the ACTUAL purchase cost for the purchases that was done or bill that was paid. This can be (and usually is) slightly different from the approved budget (but NOT higher than the approved budget).',0,3280,0,0,1,60,NULL,NULL,0,0),
(84,'cf_ipi_clust_9_inv_ll',1,1,'Invoice Amount (LL)','What is the amount of the invoice that we need to generate to the LANDLORD for this case?',0,3305,0,0,1,NULL,NULL,NULL,0,0),
(85,'cf_ipi_clust_9_inv_cust',1,1,'Invoice Amount (Cust)','What is the amount of the invoice that we need to generate to the CUSTOMER for this case? ',0,3315,0,0,1,NULL,NULL,NULL,0,0),
(86,'cf_ipi_clust_9_acct_action',3,1,'Accounting Action','Detailed description of the expected action from ACCOUNTING. This is different from the solution, from the field action or the next step. ',0,3325,0,0,1,NULL,NULL,NULL,0,0),
(87,'cf_ipi_clust_9_inv_det_cust',4,1,'Invoice Details (Cust)','Details about the invoice: what do we need to know about this invoice? What is the information/message that we need to send to the customer together with this invoice?',0,3320,0,0,1,NULL,NULL,NULL,0,0),
(88,'cf_ipi_clust_9_inv_det_ll',4,1,'Invoice Details (LL)','Use this if there are has specific requirement on our invoice to the Landlord. Accounting will use this to prepare the invoice and explain to the Lanldord why we have invoiced/paid him that way...',0,3310,0,0,1,NULL,NULL,NULL,0,0),
(89,'cf_ipi_clust_2_room',1,1,'Room(s)','Information about the room(s) where the case is located',0,600,0,1,1,NULL,NULL,NULL,0,0);

/*Table structure for table `flagexclusions` */

DROP TABLE IF EXISTS `flagexclusions`;

CREATE TABLE `flagexclusions` (
  `type_id` smallint(6) NOT NULL,
  `product_id` smallint(6) DEFAULT NULL,
  `component_id` mediumint(9) DEFAULT NULL,
  UNIQUE KEY `flagexclusions_type_id_idx` (`type_id`,`product_id`,`component_id`),
  KEY `fk_flagexclusions_product_id_products_id` (`product_id`),
  KEY `fk_flagexclusions_component_id_components_id` (`component_id`),
  CONSTRAINT `fk_flagexclusions_component_id_components_id` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_flagexclusions_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_flagexclusions_type_id_flagtypes_id` FOREIGN KEY (`type_id`) REFERENCES `flagtypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `flagexclusions` */

/*Table structure for table `flaginclusions` */

DROP TABLE IF EXISTS `flaginclusions`;

CREATE TABLE `flaginclusions` (
  `type_id` smallint(6) NOT NULL,
  `product_id` smallint(6) DEFAULT NULL,
  `component_id` mediumint(9) DEFAULT NULL,
  UNIQUE KEY `flaginclusions_type_id_idx` (`type_id`,`product_id`,`component_id`),
  KEY `fk_flaginclusions_product_id_products_id` (`product_id`),
  KEY `fk_flaginclusions_component_id_components_id` (`component_id`),
  CONSTRAINT `fk_flaginclusions_component_id_components_id` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_flaginclusions_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_flaginclusions_type_id_flagtypes_id` FOREIGN KEY (`type_id`) REFERENCES `flagtypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `flaginclusions` */

insert  into `flaginclusions`(`type_id`,`product_id`,`component_id`) values 
(1,1,NULL),
(2,1,NULL),
(3,1,NULL),
(4,1,NULL),
(5,1,NULL),
(6,1,NULL);

/*Table structure for table `flags` */

DROP TABLE IF EXISTS `flags`;

CREATE TABLE `flags` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `type_id` smallint(6) NOT NULL,
  `status` char(1) NOT NULL,
  `bug_id` mediumint(9) NOT NULL,
  `attach_id` mediumint(9) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` datetime DEFAULT NULL,
  `setter_id` mediumint(9) NOT NULL,
  `requestee_id` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flags_bug_id_idx` (`bug_id`,`attach_id`),
  KEY `flags_setter_id_idx` (`setter_id`),
  KEY `flags_requestee_id_idx` (`requestee_id`),
  KEY `flags_type_id_idx` (`type_id`),
  KEY `fk_flags_attach_id_attachments_attach_id` (`attach_id`),
  CONSTRAINT `fk_flags_attach_id_attachments_attach_id` FOREIGN KEY (`attach_id`) REFERENCES `attachments` (`attach_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_flags_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_flags_requestee_id_profiles_userid` FOREIGN KEY (`requestee_id`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_flags_setter_id_profiles_userid` FOREIGN KEY (`setter_id`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_flags_type_id_flagtypes_id` FOREIGN KEY (`type_id`) REFERENCES `flagtypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `flags` */

/*Table structure for table `flagtypes` */

DROP TABLE IF EXISTS `flagtypes`;

CREATE TABLE `flagtypes` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` mediumtext NOT NULL,
  `cc_list` varchar(200) DEFAULT NULL,
  `target_type` char(1) NOT NULL DEFAULT 'b',
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `is_requestable` tinyint(4) NOT NULL DEFAULT 0,
  `is_requesteeble` tinyint(4) NOT NULL DEFAULT 0,
  `is_multiplicable` tinyint(4) NOT NULL DEFAULT 0,
  `sortkey` smallint(6) NOT NULL DEFAULT 0,
  `grant_group_id` mediumint(9) DEFAULT NULL,
  `request_group_id` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_flagtypes_grant_group_id_groups_id` (`grant_group_id`),
  KEY `fk_flagtypes_request_group_id_groups_id` (`request_group_id`),
  CONSTRAINT `fk_flagtypes_grant_group_id_groups_id` FOREIGN KEY (`grant_group_id`) REFERENCES `groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_flagtypes_request_group_id_groups_id` FOREIGN KEY (`request_group_id`) REFERENCES `groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `flagtypes` */

insert  into `flagtypes`(`id`,`name`,`description`,`cc_list`,`target_type`,`is_active`,`is_requestable`,`is_requesteeble`,`is_multiplicable`,`sortkey`,`grant_group_id`,`request_group_id`) values 
(1,'Test_Unit_1_A_P1_Next_Step','Approval for the Next Step of the case.','','b',1,1,1,1,10,20,19),
(2,'Test_Unit_1_A_P1_Solution','Approval for the Solution of this case.','','b',1,1,1,1,20,22,21),
(3,'Test_Unit_1_A_P1_Budget','Approval for the Budget for this case.','','b',1,1,1,1,30,23,24),
(4,'Test_Unit_1_A_P1_Attachment','Approval for this Attachment.','','a',1,1,1,1,10,26,25),
(5,'Test_Unit_1_A_P1_OK_to_pay','Approval to pay this bill.','','a',1,1,1,1,20,27,28),
(6,'Test_Unit_1_A_P1_is_paid','Confirm if this bill has been paid.','','a',1,1,1,1,30,29,30);

/*Table structure for table `group_control_map` */

DROP TABLE IF EXISTS `group_control_map`;

CREATE TABLE `group_control_map` (
  `group_id` mediumint(9) NOT NULL,
  `product_id` smallint(6) NOT NULL,
  `entry` tinyint(4) NOT NULL DEFAULT 0,
  `membercontrol` tinyint(4) NOT NULL DEFAULT 0,
  `othercontrol` tinyint(4) NOT NULL DEFAULT 0,
  `canedit` tinyint(4) NOT NULL DEFAULT 0,
  `editcomponents` tinyint(4) NOT NULL DEFAULT 0,
  `editbugs` tinyint(4) NOT NULL DEFAULT 0,
  `canconfirm` tinyint(4) NOT NULL DEFAULT 0,
  UNIQUE KEY `group_control_map_product_id_idx` (`product_id`,`group_id`),
  KEY `group_control_map_group_id_idx` (`group_id`),
  CONSTRAINT `fk_group_control_map_group_id_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_group_control_map_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `group_control_map` */

insert  into `group_control_map`(`group_id`,`product_id`,`entry`,`membercontrol`,`othercontrol`,`canedit`,`editcomponents`,`editbugs`,`canconfirm`) values 
(32,1,1,3,3,0,1,1,1),
(33,1,1,1,3,0,0,1,1),
(36,1,1,1,3,0,0,1,1),
(37,1,1,1,3,0,0,1,1),
(38,1,1,1,3,0,0,1,1),
(39,1,1,1,3,0,0,1,1);

/*Table structure for table `group_group_map` */

DROP TABLE IF EXISTS `group_group_map`;

CREATE TABLE `group_group_map` (
  `member_id` mediumint(9) NOT NULL,
  `grantor_id` mediumint(9) NOT NULL,
  `grant_type` tinyint(4) NOT NULL DEFAULT 0,
  UNIQUE KEY `group_group_map_member_id_idx` (`member_id`,`grantor_id`,`grant_type`),
  KEY `fk_group_group_map_grantor_id_groups_id` (`grantor_id`),
  CONSTRAINT `fk_group_group_map_grantor_id_groups_id` FOREIGN KEY (`grantor_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_group_group_map_member_id_groups_id` FOREIGN KEY (`member_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `group_group_map` */

insert  into `group_group_map`(`member_id`,`grantor_id`,`grant_type`) values 
(1,1,0),
(1,1,1),
(1,1,2),
(1,2,0),
(1,2,1),
(1,2,2),
(1,3,0),
(1,3,1),
(1,3,2),
(1,4,0),
(1,4,1),
(1,4,2),
(1,5,0),
(1,5,1),
(1,5,2),
(1,6,0),
(1,6,1),
(1,6,2),
(1,7,0),
(1,7,1),
(1,7,2),
(1,8,0),
(1,8,1),
(1,8,2),
(1,9,0),
(1,9,1),
(1,9,2),
(1,10,0),
(1,10,1),
(1,10,2),
(1,11,0),
(1,11,1),
(1,11,2),
(1,12,0),
(1,12,1),
(1,12,2),
(1,13,0),
(1,13,1),
(1,13,2),
(1,14,0),
(1,14,1),
(1,14,2),
(1,15,0),
(1,15,1),
(1,15,2),
(1,16,0),
(1,16,1),
(1,16,2),
(1,17,0),
(1,17,1),
(1,17,2),
(1,18,0),
(1,18,1),
(1,18,2),
(1,19,0),
(1,19,1),
(1,19,2),
(1,20,0),
(1,20,1),
(1,20,2),
(1,21,0),
(1,21,1),
(1,21,2),
(1,22,0),
(1,22,1),
(1,22,2),
(1,23,0),
(1,23,1),
(1,23,2),
(1,24,0),
(1,24,1),
(1,24,2),
(1,25,0),
(1,25,1),
(1,25,2),
(1,26,0),
(1,26,1),
(1,26,2),
(1,27,0),
(1,27,1),
(1,27,2),
(1,28,0),
(1,28,1),
(1,28,2),
(1,29,0),
(1,29,1),
(1,29,2),
(1,30,0),
(1,30,1),
(1,30,2),
(1,31,0),
(1,31,1),
(1,31,2),
(1,32,0),
(1,32,1),
(1,32,2),
(1,33,1),
(1,33,2),
(1,34,1),
(1,34,2),
(1,35,0),
(1,35,1),
(1,35,2),
(1,36,1),
(1,36,2),
(1,37,1),
(1,37,2),
(1,38,1),
(1,38,2),
(1,39,1),
(1,39,2),
(31,16,0),
(31,17,0),
(31,18,0),
(31,19,0),
(31,20,0),
(31,21,0),
(31,22,0),
(31,23,0),
(31,24,0),
(31,25,0),
(31,26,0),
(31,27,0),
(31,28,0),
(31,29,0),
(31,30,0),
(32,32,0),
(32,32,1),
(32,32,2),
(32,36,0),
(32,36,1),
(32,36,2),
(32,37,0),
(32,37,1),
(32,37,2),
(32,38,0),
(32,38,1),
(32,38,2),
(32,39,0),
(32,39,1),
(32,39,2),
(33,33,0),
(33,33,1),
(33,33,2),
(34,34,0),
(34,34,1),
(34,34,2),
(35,35,1),
(36,36,2),
(37,37,2),
(39,39,2);

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `isbuggroup` tinyint(4) NOT NULL,
  `userregexp` tinytext NOT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  `icon_url` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `groups` */

insert  into `groups`(`id`,`name`,`description`,`isbuggroup`,`userregexp`,`isactive`,`icon_url`) values 
(1,'admin','Administrators',0,'',1,NULL),
(2,'tweakparams','Can change Parameters',0,'',1,NULL),
(3,'editusers','Can edit or disable users',0,'',1,NULL),
(4,'creategroups','Can create and destroy groups',0,'',1,NULL),
(5,'editclassifications','Can create, destroy, and edit classifications',0,'',1,NULL),
(6,'editcomponents','Can create, destroy, and edit components',0,'',1,NULL),
(7,'editkeywords','Can create, destroy, and edit keywords',0,'',1,NULL),
(8,'editbugs','Can edit all bug fields',0,'',1,NULL),
(9,'canconfirm','Can confirm a bug or mark it a duplicate',0,'',1,NULL),
(10,'bz_canusewhineatothers','Can configure whine reports for other users',0,'',1,NULL),
(11,'bz_canusewhines','User can configure whine reports for self',0,'',1,NULL),
(12,'bz_sudoers','Can perform actions as other users',0,'',1,NULL),
(13,'bz_sudo_protect','Can not be impersonated by other users',0,'',1,NULL),
(14,'bz_quip_moderators','Can moderate quips',0,'',1,NULL),
(15,'syst_private_comment','A group to allow user to see the private comments in ALL the activities they are allowed to see. This is for Employees vs external users.',1,'',0,NULL),
(16,'syst_see_timetracking','A group to allow users to see the time tracking information in ALL the activities they are allowed to see.',1,'',0,NULL),
(17,'syst_create_shared_queries','A group for users who can create, save and share search queries.',1,'',0,NULL),
(18,'syst_tag_comments','A group to allow users to tag comments in ALL the activities they are allowed to see.',1,'',0,NULL),
(19,'Test Unit 1 A #1 - RA Next Step','Request approval for the Next step in a case',1,'',0,NULL),
(20,'Test Unit 1 A #1 - GA Next Step','Grant approval for the Next step in a case',1,'',0,NULL),
(21,'Test Unit 1 A #1 - RA Solution','Request approval for the Solution in a case',1,'',0,NULL),
(22,'Test Unit 1 A #1 - GA Solution','Grant approval for the Solution in a case',1,'',0,NULL),
(23,'Test Unit 1 A #1 - GA Budget','Request approval for the Budget in a case',1,'',0,NULL),
(24,'Test Unit 1 A #1 - RA Budget','Request approval for the Budget in a case',1,'',0,NULL),
(25,'Test Unit 1 A #1 - RA Attachment','Request approval for an Attachment in a case',1,'',0,NULL),
(26,'Test Unit 1 A #1 - GA Attachment','Grant approval for an Attachment in a case',1,'',0,NULL),
(27,'Test Unit 1 A #1 - GA OK to Pay','Grant approval to pay (for a bill/attachment)',1,'',0,NULL),
(28,'Test Unit 1 A #1 - RA OK to Pay','Request approval to pay (for a bill/attachment)',1,'',0,NULL),
(29,'Test Unit 1 A #1 - GA is Paid','Confirm that it\'s paid (for a bill/attachment)',1,'',0,NULL),
(30,'Test Unit 1 A #1 - RA is Paid','Ask if it\'s paid (for a bill/attachment)',1,'',0,NULL),
(31,'Test Unit 1 A #1 - Stakeholder','Access to All the groups a stakeholder needs for this unit',1,'',0,NULL),
(32,'Test Unit 1 A #1 - Creator','Unit creator (or it\'s agent) for Test Unit 1 A',1,'',1,NULL),
(33,'Test Unit 1 A #1 - Agent - Created by: Leonel - My Real Estate Agency','Tick to HIDE this case if the user is the Agent for this unit. Untick to Show this case',1,'',1,NULL),
(34,'Test Unit 1 A #1 - list stakeholder','Visibility group Step 1 - list all the users which are stakeholders for this unit',1,'',0,NULL),
(35,'Test Unit 1 A #1 - see stakeholder','Visibility group Step 2 - Can see all the users which are stakeholders for this unit',1,'',0,NULL),
(36,'Test Unit 1 A #1 - Owner/Landlord - Created by: Leonel - My Real Estate Agency','Tick to HIDE this case if the user is the Owner/Landlord for this unit. Untick to Show this case',1,'',1,NULL),
(37,'Test Unit 1 A #1 - Tenant - Created by: Leonel - My Real Estate Agency','Tick to HIDE this case if the user is the Tenant for this unit. Untick to Show this case',1,'',1,NULL),
(38,'Test Unit 1 A #1 - is occupant','Tick to HIDE this case if the user is the Occupant for this unit. Untick to Show this case',1,'',1,NULL),
(39,'Test Unit 1 A #1 - Management Company - Created by: Team Bravo','Tick to HIDE this case if the user is the Management Company for this unit. Untick to Show this case',1,'',1,NULL);

/*Table structure for table `keyworddefs` */

DROP TABLE IF EXISTS `keyworddefs`;

CREATE TABLE `keyworddefs` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyworddefs_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `keyworddefs` */

/*Table structure for table `keywords` */

DROP TABLE IF EXISTS `keywords`;

CREATE TABLE `keywords` (
  `bug_id` mediumint(9) NOT NULL,
  `keywordid` smallint(6) NOT NULL,
  UNIQUE KEY `keywords_bug_id_idx` (`bug_id`,`keywordid`),
  KEY `keywords_keywordid_idx` (`keywordid`),
  CONSTRAINT `fk_keywords_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_keywords_keywordid_keyworddefs_id` FOREIGN KEY (`keywordid`) REFERENCES `keyworddefs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `keywords` */

/*Table structure for table `login_failure` */

DROP TABLE IF EXISTS `login_failure`;

CREATE TABLE `login_failure` (
  `user_id` mediumint(9) NOT NULL,
  `login_time` datetime NOT NULL,
  `ip_addr` varchar(40) NOT NULL,
  KEY `login_failure_user_id_idx` (`user_id`),
  CONSTRAINT `fk_login_failure_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `login_failure` */

/*Table structure for table `logincookies` */

DROP TABLE IF EXISTS `logincookies`;

CREATE TABLE `logincookies` (
  `cookie` varchar(16) NOT NULL,
  `userid` mediumint(9) NOT NULL,
  `ipaddr` varchar(40) DEFAULT NULL,
  `lastused` datetime NOT NULL,
  PRIMARY KEY (`cookie`),
  KEY `logincookies_lastused_idx` (`lastused`),
  KEY `fk_logincookies_userid_profiles_userid` (`userid`),
  CONSTRAINT `fk_logincookies_userid_profiles_userid` FOREIGN KEY (`userid`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `logincookies` */

/*Table structure for table `longdescs` */

DROP TABLE IF EXISTS `longdescs`;

CREATE TABLE `longdescs` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_id` mediumint(9) NOT NULL,
  `who` mediumint(9) NOT NULL,
  `bug_when` datetime NOT NULL,
  `work_time` decimal(7,2) NOT NULL DEFAULT 0.00,
  `thetext` mediumtext NOT NULL,
  `isprivate` tinyint(4) NOT NULL DEFAULT 0,
  `already_wrapped` tinyint(4) NOT NULL DEFAULT 0,
  `type` smallint(6) NOT NULL DEFAULT 0,
  `extra_data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `longdescs_bug_id_idx` (`bug_id`,`work_time`),
  KEY `longdescs_who_idx` (`who`,`bug_id`),
  KEY `longdescs_bug_when_idx` (`bug_when`),
  CONSTRAINT `fk_longdescs_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_longdescs_who_profiles_userid` FOREIGN KEY (`who`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `longdescs` */

/*Table structure for table `longdescs_tags` */

DROP TABLE IF EXISTS `longdescs_tags`;

CREATE TABLE `longdescs_tags` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) DEFAULT NULL,
  `tag` varchar(24) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `longdescs_tags_idx` (`comment_id`,`tag`),
  CONSTRAINT `fk_longdescs_tags_comment_id_longdescs_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `longdescs` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `longdescs_tags` */

/*Table structure for table `longdescs_tags_activity` */

DROP TABLE IF EXISTS `longdescs_tags_activity`;

CREATE TABLE `longdescs_tags_activity` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `bug_id` mediumint(9) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `who` mediumint(9) NOT NULL,
  `bug_when` datetime NOT NULL,
  `added` varchar(24) DEFAULT NULL,
  `removed` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `longdescs_tags_activity_bug_id_idx` (`bug_id`),
  KEY `fk_longdescs_tags_activity_comment_id_longdescs_comment_id` (`comment_id`),
  KEY `fk_longdescs_tags_activity_who_profiles_userid` (`who`),
  CONSTRAINT `fk_longdescs_tags_activity_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_longdescs_tags_activity_comment_id_longdescs_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `longdescs` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_longdescs_tags_activity_who_profiles_userid` FOREIGN KEY (`who`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `longdescs_tags_activity` */

/*Table structure for table `longdescs_tags_weights` */

DROP TABLE IF EXISTS `longdescs_tags_weights`;

CREATE TABLE `longdescs_tags_weights` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `tag` varchar(24) NOT NULL,
  `weight` mediumint(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `longdescs_tags_weights_tag_idx` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `longdescs_tags_weights` */

/*Table structure for table `mail_staging` */

DROP TABLE IF EXISTS `mail_staging`;

CREATE TABLE `mail_staging` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mail_staging` */

/*Table structure for table `milestones` */

DROP TABLE IF EXISTS `milestones`;

CREATE TABLE `milestones` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `product_id` smallint(6) NOT NULL,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT 0,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `milestones_product_id_idx` (`product_id`,`value`),
  CONSTRAINT `fk_milestones_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `milestones` */

insert  into `milestones`(`id`,`product_id`,`value`,`sortkey`,`isactive`) values 
(1,1,'---',0,1);

/*Table structure for table `namedqueries` */

DROP TABLE IF EXISTS `namedqueries`;

CREATE TABLE `namedqueries` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(9) NOT NULL,
  `name` varchar(64) NOT NULL,
  `query` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namedqueries_userid_idx` (`userid`,`name`),
  CONSTRAINT `fk_namedqueries_userid_profiles_userid` FOREIGN KEY (`userid`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `namedqueries` */

/*Table structure for table `namedqueries_link_in_footer` */

DROP TABLE IF EXISTS `namedqueries_link_in_footer`;

CREATE TABLE `namedqueries_link_in_footer` (
  `namedquery_id` mediumint(9) NOT NULL,
  `user_id` mediumint(9) NOT NULL,
  UNIQUE KEY `namedqueries_link_in_footer_id_idx` (`namedquery_id`,`user_id`),
  KEY `namedqueries_link_in_footer_userid_idx` (`user_id`),
  CONSTRAINT `fk_namedqueries_link_in_footer_namedquery_id_namedqueries_id` FOREIGN KEY (`namedquery_id`) REFERENCES `namedqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_namedqueries_link_in_footer_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `namedqueries_link_in_footer` */

/*Table structure for table `namedquery_group_map` */

DROP TABLE IF EXISTS `namedquery_group_map`;

CREATE TABLE `namedquery_group_map` (
  `namedquery_id` mediumint(9) NOT NULL,
  `group_id` mediumint(9) NOT NULL,
  UNIQUE KEY `namedquery_group_map_namedquery_id_idx` (`namedquery_id`),
  KEY `namedquery_group_map_group_id_idx` (`group_id`),
  CONSTRAINT `fk_namedquery_group_map_group_id_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_namedquery_group_map_namedquery_id_namedqueries_id` FOREIGN KEY (`namedquery_id`) REFERENCES `namedqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `namedquery_group_map` */

/*Table structure for table `op_sys` */

DROP TABLE IF EXISTS `op_sys`;

CREATE TABLE `op_sys` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT 0,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `op_sys_value_idx` (`value`),
  KEY `op_sys_sortkey_idx` (`sortkey`,`value`),
  KEY `op_sys_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `op_sys` */

insert  into `op_sys`(`id`,`value`,`sortkey`,`isactive`,`visibility_value_id`) values 
(1,'Customer/Occupant',100,1,NULL),
(2,'Sales Team',200,1,NULL),
(3,'Field Technician',300,1,NULL),
(4,'Sourcing',400,1,NULL),
(5,'Other',10000,1,NULL),
(6,'House Keeper',500,1,NULL),
(7,'Accounting',5000,1,NULL),
(8,'Unspecified',50,1,NULL),
(9,'Management',5000,1,NULL),
(10,'Landlord',600,1,NULL),
(11,'LL Agent',700,1,NULL),
(12,'Mgt Office',550,1,NULL),
(13,'Customer Service',250,1,NULL);

/*Table structure for table `priority` */

DROP TABLE IF EXISTS `priority`;

CREATE TABLE `priority` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT 0,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `priority_value_idx` (`value`),
  KEY `priority_sortkey_idx` (`sortkey`,`value`),
  KEY `priority_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `priority` */

insert  into `priority`(`id`,`value`,`sortkey`,`isactive`,`visibility_value_id`) values 
(1,'P1',100,1,NULL),
(2,'P2',200,1,NULL),
(3,'P3',300,1,NULL);

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `classification_id` smallint(6) NOT NULL DEFAULT 1,
  `description` mediumtext NOT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  `defaultmilestone` varchar(64) NOT NULL DEFAULT '---',
  `allows_unconfirmed` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_name_idx` (`name`),
  KEY `fk_products_classification_id_classifications_id` (`classification_id`),
  CONSTRAINT `fk_products_classification_id_classifications_id` FOREIGN KEY (`classification_id`) REFERENCES `classifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `products` */

insert  into `products`(`id`,`name`,`classification_id`,`description`,`isactive`,`defaultmilestone`,`allows_unconfirmed`) values 
(1,'Test Unit 1 A',1,'Demo unit 1.\r\nThis unit is located at:\r\nProperty A address. \r\nWe can add a few comment about the unit if needed.',1,'---',1);

/*Table structure for table `profile_search` */

DROP TABLE IF EXISTS `profile_search`;

CREATE TABLE `profile_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) NOT NULL,
  `bug_list` mediumtext NOT NULL,
  `list_order` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_search_user_id_idx` (`user_id`),
  CONSTRAINT `fk_profile_search_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `profile_search` */

/*Table structure for table `profile_setting` */

DROP TABLE IF EXISTS `profile_setting`;

CREATE TABLE `profile_setting` (
  `user_id` mediumint(9) NOT NULL,
  `setting_name` varchar(32) NOT NULL,
  `setting_value` varchar(32) NOT NULL,
  UNIQUE KEY `profile_setting_value_unique_idx` (`user_id`,`setting_name`),
  KEY `fk_profile_setting_setting_name_setting_name` (`setting_name`),
  CONSTRAINT `fk_profile_setting_setting_name_setting_name` FOREIGN KEY (`setting_name`) REFERENCES `setting` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_profile_setting_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `profile_setting` */

/*Table structure for table `profiles` */

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `userid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) NOT NULL,
  `cryptpassword` varchar(128) DEFAULT NULL,
  `realname` varchar(255) NOT NULL DEFAULT '',
  `disabledtext` mediumtext NOT NULL,
  `disable_mail` tinyint(4) NOT NULL DEFAULT 0,
  `mybugslink` tinyint(4) NOT NULL DEFAULT 1,
  `extern_id` varchar(64) DEFAULT NULL,
  `is_enabled` tinyint(4) NOT NULL DEFAULT 1,
  `last_seen_date` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `profiles_login_name_idx` (`login_name`),
  UNIQUE KEY `profiles_extern_id_idx` (`extern_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `profiles` */

insert  into `profiles`(`userid`,`login_name`,`cryptpassword`,`realname`,`disabledtext`,`disable_mail`,`mybugslink`,`extern_id`,`is_enabled`,`last_seen_date`) values 
(1,'administrator@example.com','B8AgzURt,NDrX2Bt8stpgXPKsNRYaHmm0V2K1+qhfnt76oLAvN+Q{SHA-256}','Administrator','',0,1,NULL,1,NULL),
(2,'leonel@example.com','uVkp9Jte,ts7kZpZuOcTkMAh1c4iX4IcEZTxpq0Sfr7XraiZoL+g{SHA-256}','Leonel','',0,1,NULL,1,NULL),
(3,'marley@example.com','AMOb0L00,NlJF4wyZVyT+xWuUr3RYgDIYxMhfBJCZxvkSh5cRSVs{SHA-256}','Marley','',0,1,NULL,1,NULL),
(4,'michael@example.com','Tp0jDQnd,kD+mf67/v/ck68nOyRTR4j7JNVpo1XzzDFSIR6U7Lps{SHA-256}','Michael','',0,1,NULL,1,NULL),
(5,'sabrina@example.com','fjeiOOVC,vUkDbdxcfk9snn9J5Vh4r/cujX2FfOKEcBZBAOcMw3k{SHA-256}','Sabrina','',0,1,NULL,1,NULL),
(6,'celeste@example.com','ZAU7m97y,kw6J1Bf2Hw21qELelxM3BbK+4avsmJytG/WzssHMbXE{SHA-256}','Celeste','',0,1,NULL,1,NULL),
(7,'jocelyn@example.com','0ZprH6RJ,zXa/xkkETvkPZ988xpyQQocYYfLAIWdCLCk1wE4QXNA{SHA-256}','Jocelyn','',0,1,NULL,1,NULL),
(8,'marina@example.com','8c2ofNwd,VpZbBAByL89ZKCI3xT7zFjZBb/X7JHW6KjtA9yY8KYo{SHA-256}','Marina','',0,1,NULL,1,NULL),
(9,'regina@example.com','HuM6hVYF,Ev6TBPrrOm4pSu5chsr1Q6Hi6q2Tmm98IbLh7ONqtYs{SHA-256}','Regina','',0,1,NULL,1,NULL),
(10,'marvin@example.com','6kTmgSt9,FI+tK4vrJQa8lInrRGKxmQ0JW2WpVImRk+ylhcMYGKM{SHA-256}','Marvin','',0,1,NULL,1,NULL),
(11,'lawrence@example.com','JqPmW7RA,tJopvIAj1kbeRJ61pZUqjce1dZrGoBpnHMzycgTuTqE{SHA-256}','Lawrence','',0,1,NULL,1,NULL),
(12,'anabelle@example.com','9bgiCNi8,32d10yq/btaTsj/awDksNPjdUDLIrGfkK+vRKWfYbQo{SHA-256}','Anabelle','',0,1,NULL,1,NULL),
(13,'management.co@example.com','C162r0Mo,/V0m+v2cmZqU0JOjQBR8X5Q26xSgKTBs/f/Wke51oSI{SHA-256}','Management Co','',0,1,NULL,1,NULL);

/*Table structure for table `profiles_activity` */

DROP TABLE IF EXISTS `profiles_activity`;

CREATE TABLE `profiles_activity` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(9) NOT NULL,
  `who` mediumint(9) NOT NULL,
  `profiles_when` datetime NOT NULL,
  `fieldid` mediumint(9) NOT NULL,
  `oldvalue` tinytext DEFAULT NULL,
  `newvalue` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profiles_activity_userid_idx` (`userid`),
  KEY `profiles_activity_profiles_when_idx` (`profiles_when`),
  KEY `profiles_activity_fieldid_idx` (`fieldid`),
  KEY `fk_profiles_activity_who_profiles_userid` (`who`),
  CONSTRAINT `fk_profiles_activity_fieldid_fielddefs_id` FOREIGN KEY (`fieldid`) REFERENCES `fielddefs` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_profiles_activity_userid_profiles_userid` FOREIGN KEY (`userid`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_profiles_activity_who_profiles_userid` FOREIGN KEY (`who`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `profiles_activity` */

/*Table structure for table `profiles_vanilla` */

DROP TABLE IF EXISTS `profiles_vanilla`;

CREATE TABLE `profiles_vanilla` (
  `userid` mediumint(9) NOT NULL DEFAULT 0,
  `login_name` varchar(255) NOT NULL,
  `cryptpassword` varchar(128) DEFAULT NULL,
  `realname` varchar(255) NOT NULL DEFAULT '',
  `disabledtext` mediumtext NOT NULL,
  `disable_mail` tinyint(4) NOT NULL DEFAULT 0,
  `mybugslink` tinyint(4) NOT NULL DEFAULT 1,
  `extern_id` varchar(64) DEFAULT NULL,
  `is_enabled` tinyint(4) NOT NULL DEFAULT 1,
  `last_seen_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `profiles_vanilla` */

insert  into `profiles_vanilla`(`userid`,`login_name`,`cryptpassword`,`realname`,`disabledtext`,`disable_mail`,`mybugslink`,`extern_id`,`is_enabled`,`last_seen_date`) values 
(1,'administrator@example.com','B8AgzURt,NDrX2Bt8stpgXPKsNRYaHmm0V2K1+qhfnt76oLAvN+Q{SHA-256}','Administrator','',0,1,NULL,1,'2017-10-19 00:00:00'),
(2,'leonel@example.com','uVkp9Jte,ts7kZpZuOcTkMAh1c4iX4IcEZTxpq0Sfr7XraiZoL+g{SHA-256}','Leonel','',0,1,NULL,1,'2017-06-30 00:00:00'),
(3,'marley@example.com','AMOb0L00,NlJF4wyZVyT+xWuUr3RYgDIYxMhfBJCZxvkSh5cRSVs{SHA-256}','Marley','',0,1,NULL,1,'2017-05-18 00:00:00'),
(4,'michael@example.com','Tp0jDQnd,kD+mf67/v/ck68nOyRTR4j7JNVpo1XzzDFSIR6U7Lps{SHA-256}','Michael','',0,1,NULL,1,'2017-05-18 00:00:00'),
(5,'sabrina@example.com','fjeiOOVC,vUkDbdxcfk9snn9J5Vh4r/cujX2FfOKEcBZBAOcMw3k{SHA-256}','Sabrina','',0,1,NULL,1,NULL),
(6,'celeste@example.com','ZAU7m97y,kw6J1Bf2Hw21qELelxM3BbK+4avsmJytG/WzssHMbXE{SHA-256}','Celeste','',0,1,NULL,1,NULL),
(7,'jocelyn@example.com','0ZprH6RJ,zXa/xkkETvkPZ988xpyQQocYYfLAIWdCLCk1wE4QXNA{SHA-256}','Jocelyn','',0,1,NULL,1,NULL),
(8,'marina@example.com','8c2ofNwd,VpZbBAByL89ZKCI3xT7zFjZBb/X7JHW6KjtA9yY8KYo{SHA-256}','Marina','',0,1,NULL,1,NULL),
(9,'regina@example.com','HuM6hVYF,Ev6TBPrrOm4pSu5chsr1Q6Hi6q2Tmm98IbLh7ONqtYs{SHA-256}','Regina','',0,1,NULL,1,NULL),
(10,'marvin@example.com','6kTmgSt9,FI+tK4vrJQa8lInrRGKxmQ0JW2WpVImRk+ylhcMYGKM{SHA-256}','Marvin','',0,1,NULL,1,NULL),
(11,'lawrence@example.com','JqPmW7RA,tJopvIAj1kbeRJ61pZUqjce1dZrGoBpnHMzycgTuTqE{SHA-256}','Lawrence','',0,1,NULL,1,NULL),
(12,'anabelle@example.com','9bgiCNi8,32d10yq/btaTsj/awDksNPjdUDLIrGfkK+vRKWfYbQo{SHA-256}','Anabelle','',0,1,NULL,1,NULL),
(13,'user.3@domain.com','kbXx24al,vrt1FtHzFY6r1t4P5AmT+b48JqTFOPnvmlMiD0EPVgo{SHA-256}','Reginald Jigins','Inactive for Now',1,1,NULL,0,'2016-06-12 00:00:00'),
(14,'user.4@domain.com','xoTWaOPv,0lwOQiPzbIXVn2ZXnbiISUG0bhPqCXLeu86FERRLA4k{SHA-256}','Reg - Houskeeper','inactive for now',1,1,NULL,0,NULL),
(17,'hendry@iki.fi','ilOHoPUB,mkSk+BdwYGWj6GPbWdvaeXg3HOfgb0XE87QhogpuD28{SHA-256}','','',0,1,NULL,1,'2017-07-28 00:00:00');

/*Table structure for table `quips` */

DROP TABLE IF EXISTS `quips`;

CREATE TABLE `quips` (
  `quipid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(9) DEFAULT NULL,
  `quip` varchar(512) NOT NULL,
  `approved` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`quipid`),
  KEY `fk_quips_userid_profiles_userid` (`userid`),
  CONSTRAINT `fk_quips_userid_profiles_userid` FOREIGN KEY (`userid`) REFERENCES `profiles` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `quips` */

/*Table structure for table `rep_platform` */

DROP TABLE IF EXISTS `rep_platform`;

CREATE TABLE `rep_platform` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT 0,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rep_platform_value_idx` (`value`),
  KEY `rep_platform_sortkey_idx` (`sortkey`,`value`),
  KEY `rep_platform_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `rep_platform` */

insert  into `rep_platform`(`id`,`value`,`sortkey`,`isactive`,`visibility_value_id`) values 
(1,'---',5,1,NULL),
(2,'Repair',10,1,NULL),
(3,'Maintenance',15,1,NULL),
(4,'Housekeeping',20,1,NULL),
(5,'Devices',25,1,NULL),
(6,'Renovation',30,1,NULL),
(7,'Complex Project',35,1,NULL),
(8,'Extra Service',40,1,NULL),
(9,'Utilities',45,1,NULL),
(10,'Other',50,1,NULL);

/*Table structure for table `reports` */

DROP TABLE IF EXISTS `reports`;

CREATE TABLE `reports` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) NOT NULL,
  `name` varchar(64) NOT NULL,
  `query` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reports_user_id_idx` (`user_id`,`name`),
  CONSTRAINT `fk_reports_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `reports` */

/*Table structure for table `resolution` */

DROP TABLE IF EXISTS `resolution`;

CREATE TABLE `resolution` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT 0,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resolution_value_idx` (`value`),
  KEY `resolution_sortkey_idx` (`sortkey`,`value`),
  KEY `resolution_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `resolution` */

insert  into `resolution`(`id`,`value`,`sortkey`,`isactive`,`visibility_value_id`) values 
(1,'',100,1,NULL),
(2,'FIXED',200,1,NULL),
(3,'INVAL`status_workflow`ID',300,1,NULL),
(4,'WONTFIX',400,1,NULL),
(5,'DUPLICATE',500,1,NULL),
(6,'WORKSFORME',600,1,NULL);

/*Table structure for table `series` */

DROP TABLE IF EXISTS `series`;

CREATE TABLE `series` (
  `series_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `creator` mediumint(9) DEFAULT NULL,
  `category` smallint(6) NOT NULL,
  `subcategory` smallint(6) NOT NULL,
  `name` varchar(64) NOT NULL,
  `frequency` smallint(6) NOT NULL,
  `query` mediumtext NOT NULL,
  `is_public` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`series_id`),
  UNIQUE KEY `series_category_idx` (`category`,`subcategory`,`name`),
  KEY `series_creator_idx` (`creator`),
  KEY `fk_series_subcategory_series_categories_id` (`subcategory`),
  CONSTRAINT `fk_series_category_series_categories_id` FOREIGN KEY (`category`) REFERENCES `series_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_series_creator_profiles_userid` FOREIGN KEY (`creator`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_series_subcategory_series_categories_id` FOREIGN KEY (`subcategory`) REFERENCES `series_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `series` */

insert  into `series`(`series_id`,`creator`,`category`,`subcategory`,`name`,`frequency`,`query`,`is_public`) values 
(1,2,1,2,'UNCONFIRMED',1,'bug_status=UNCONFIRMED&product=Test%Unit%1%A',1),
(2,2,1,2,'CONFIRMED',1,'bug_status=CONFIRMED&product=Test%Unit%1%A',1),
(3,2,1,2,'IN_PROGRESS',1,'bug_status=IN_PROGRESS&product=Test%Unit%1%A',1),
(4,2,1,2,'REOPENED',1,'bug_status=REOPENED&product=Test%Unit%1%A',1),
(5,2,1,2,'STAND BY',1,'bug_status=STAND%20BY&product=Test%Unit%1%A',1),
(6,2,1,2,'RESOLVED',1,'bug_status=RESOLVED&product=Test%Unit%1%A',1),
(7,2,1,2,'VERIFIED',1,'bug_status=VERIFIED&product=Test%Unit%1%A',1),
(8,2,1,2,'CLOSED',1,'bug_status=CLOSED&product=Test%Unit%1%A',1),
(9,2,1,2,'FIXED',1,'resolution=FIXED&product=Test%Unit%1%A',1),
(10,2,1,2,'INVAL`status_workflow`ID',1,'resolution=INVAL%60status_workflow%60ID&product=Test%Unit%1%A',1),
(11,2,1,2,'WONTFIX',1,'resolution=WONTFIX&product=Test%Unit%1%A',1),
(12,2,1,2,'DUPLICATE',1,'resolution=DUPLICATE&product=Test%Unit%1%A',1),
(13,2,1,2,'WORKSFORME',1,'resolution=WORKSFORME&product=Test%Unit%1%A',1),
(14,2,1,2,'All Open',1,'bug_status=UNCONFIRMED&bug_status=CONFIRMED&bug_status=IN_PROGRESS&bug_status=REOPENED&bug_status=STAND%20BY&product=Test%Unit%1%A',1),
(15,2,1,3,'All Open',1,'field0-0-0=resolution&type0-0-0=notregexp&value0-0-0=.&product=Test%Unit%1%A&component=Agent',1),
(16,2,1,3,'All Closed',1,'field0-0-0=resolution&type0-0-0=regexp&value0-0-0=.&product=Test%Unit%1%A&component=Agent',1),
(17,3,1,4,'All Open',1,'field0-0-0=resolution&type0-0-0=notregexp&value0-0-0=.&product=Test%Unit%1%A&component=Owner/Landlord',1),
(18,3,1,4,'All Closed',1,'field0-0-0=resolution&type0-0-0=regexp&value0-0-0=.&product=Test%Unit%1%A&component=Owner/Landlord',1),
(19,4,1,5,'All Open',1,'field0-0-0=resolution&type0-0-0=notregexp&value0-0-0=.&product=Test%Unit%1%A&component=Tenant',1),
(20,4,1,5,'All Closed',1,'field0-0-0=resolution&type0-0-0=regexp&value0-0-0=.&product=Test%Unit%1%A&component=Tenant',1),
(21,8,1,6,'All Open',1,'field0-0-0=resolution&type0-0-0=notregexp&value0-0-0=.&product=Test%Unit%1%A&component=Management Company',1),
(22,8,1,6,'All Closed',1,'field0-0-0=resolution&type0-0-0=regexp&value0-0-0=.&product=Test%Unit%1%A&component=Management Company',1);

/*Table structure for table `series_categories` */

DROP TABLE IF EXISTS `series_categories`;

CREATE TABLE `series_categories` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series_categories_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `series_categories` */

insert  into `series_categories`(`id`,`name`) values 
(2,'-All-'),
(1,'Agent_#1'),
(6,'Management Company_P1_U8'),
(4,'Owner/Landlord_P1_U3'),
(5,'Tenant_P1_U4'),
(3,'Test Unit 1 A_#1');

/*Table structure for table `series_data` */

DROP TABLE IF EXISTS `series_data`;

CREATE TABLE `series_data` (
  `series_id` mediumint(9) NOT NULL,
  `series_date` datetime NOT NULL,
  `series_value` mediumint(9) NOT NULL,
  UNIQUE KEY `series_data_series_id_idx` (`series_id`,`series_date`),
  CONSTRAINT `fk_series_data_series_id_series_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `series_data` */

/*Table structure for table `setting` */

DROP TABLE IF EXISTS `setting`;

CREATE TABLE `setting` (
  `name` varchar(32) NOT NULL,
  `default_value` varchar(32) NOT NULL,
  `is_enabled` tinyint(4) NOT NULL DEFAULT 1,
  `subclass` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `setting` */

insert  into `setting`(`name`,`default_value`,`is_enabled`,`subclass`) values 
('bugmail_new_prefix','on',1,NULL),
('comment_box_position','after_comments',1,NULL),
('comment_sort_order','oldest_to_newest',1,NULL),
('csv_colsepchar',',',1,NULL),
('display_quips','off',0,NULL),
('email_format','html',1,NULL),
('lang','en',1,'Lang'),
('possible_duplicates','on',1,NULL),
('post_bug_submit_action','same_bug',1,NULL),
('quicksearch_fulltext','on',1,NULL),
('quote_replies','quoted_reply',1,NULL),
('requestee_cc','on',1,NULL),
('skin','skin',0,'Skin'),
('state_addselfcc','cc_unless_role',1,NULL),
('timezone','local',1,'Timezone'),
('zoom_textareas','on',1,NULL);

/*Table structure for table `setting_value` */

DROP TABLE IF EXISTS `setting_value`;

CREATE TABLE `setting_value` (
  `name` varchar(32) NOT NULL,
  `value` varchar(32) NOT NULL,
  `sortindex` smallint(6) NOT NULL,
  UNIQUE KEY `setting_value_nv_unique_idx` (`name`,`value`),
  UNIQUE KEY `setting_value_ns_unique_idx` (`name`,`sortindex`),
  CONSTRAINT `fk_setting_value_name_setting_name` FOREIGN KEY (`name`) REFERENCES `setting` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `setting_value` */

insert  into `setting_value`(`name`,`value`,`sortindex`) values 
('bugmail_new_prefix','on',5),
('bugmail_new_prefix','off',10),
('comment_box_position','before_comments',5),
('comment_box_position','after_comments',10),
('comment_sort_order','oldest_to_newest',5),
('comment_sort_order','newest_to_oldest',10),
('comment_sort_order','newest_to_oldest_desc_first',15),
('csv_colsepchar',',',5),
('csv_colsepchar',';',10),
('display_quips','on',5),
('display_quips','off',10),
('email_format','html',5),
('email_format','text_only',10),
('possible_duplicates','on',5),
('possible_duplicates','off',10),
('post_bug_submit_action','next_bug',5),
('post_bug_submit_action','same_bug',10),
('post_bug_submit_action','nothing',15),
('quicksearch_fulltext','on',5),
('quicksearch_fulltext','off',10),
('quote_replies','quoted_reply',5),
('quote_replies','simple_reply',10),
('quote_replies','off',15),
('requestee_cc','on',5),
('requestee_cc','off',10),
('state_addselfcc','always',5),
('state_addselfcc','never',10),
('state_addselfcc','cc_unless_role',15),
('zoom_textareas','on',5),
('zoom_textareas','off',10);

/*Table structure for table `status_workflow` */

DROP TABLE IF EXISTS `status_workflow`;

CREATE TABLE `status_workflow` (
  `old_status` smallint(6) DEFAULT NULL,
  `new_status` smallint(6) NOT NULL,
  `require_comment` tinyint(4) NOT NULL DEFAULT 0,
  UNIQUE KEY `status_workflow_idx` (`old_status`,`new_status`),
  KEY `fk_status_workflow_new_status_bug_status_id` (`new_status`),
  CONSTRAINT `fk_status_workflow_new_status_bug_status_id` FOREIGN KEY (`new_status`) REFERENCES `bug_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_status_workflow_old_status_bug_status_id` FOREIGN KEY (`old_status`) REFERENCES `bug_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `status_workflow` */

insert  into `status_workflow`(`old_status`,`new_status`,`require_comment`) values 
(NULL,1,0),
(NULL,2,0),
(NULL,3,0),
(1,2,0),
(1,3,0),
(1,4,0),
(2,3,0),
(2,4,0),
(3,2,0),
(3,4,0),
(4,5,0),
(5,4,0),
(6,4,0),
(7,4,0),
(8,4,0),
(1,7,0),
(2,7,0),
(3,7,0),
(6,3,0),
(6,7,0),
(7,3,0),
(4,6,0),
(4,7,0),
(5,6,0),
(5,8,0),
(8,6,0),
(NULL,7,0);

/*Table structure for table `tag` */

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `user_id` mediumint(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_user_id_idx` (`user_id`,`name`),
  CONSTRAINT `fk_tag_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tag` */

/*Table structure for table `tokens` */

DROP TABLE IF EXISTS `tokens`;

CREATE TABLE `tokens` (
  `userid` mediumint(9) DEFAULT NULL,
  `issuedate` datetime NOT NULL,
  `token` varchar(16) NOT NULL,
  `tokentype` varchar(16) NOT NULL,
  `eventdata` tinytext DEFAULT NULL,
  PRIMARY KEY (`token`),
  KEY `tokens_userid_idx` (`userid`),
  CONSTRAINT `fk_tokens_userid_profiles_userid` FOREIGN KEY (`userid`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tokens` */

/*Table structure for table `ts_error` */

DROP TABLE IF EXISTS `ts_error`;

CREATE TABLE `ts_error` (
  `error_time` int(11) NOT NULL,
  `jobid` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `funcid` int(11) NOT NULL DEFAULT 0,
  KEY `ts_error_funcid_idx` (`funcid`,`error_time`),
  KEY `ts_error_error_time_idx` (`error_time`),
  KEY `ts_error_jobid_idx` (`jobid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ts_error` */

/*Table structure for table `ts_exitstatus` */

DROP TABLE IF EXISTS `ts_exitstatus`;

CREATE TABLE `ts_exitstatus` (
  `jobid` int(11) NOT NULL AUTO_INCREMENT,
  `funcid` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) DEFAULT NULL,
  `completion_time` int(11) DEFAULT NULL,
  `delete_after` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobid`),
  KEY `ts_exitstatus_funcid_idx` (`funcid`),
  KEY `ts_exitstatus_delete_after_idx` (`delete_after`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ts_exitstatus` */

/*Table structure for table `ts_funcmap` */

DROP TABLE IF EXISTS `ts_funcmap`;

CREATE TABLE `ts_funcmap` (
  `funcid` int(11) NOT NULL AUTO_INCREMENT,
  `funcname` varchar(255) NOT NULL,
  PRIMARY KEY (`funcid`),
  UNIQUE KEY `ts_funcmap_funcname_idx` (`funcname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ts_funcmap` */

/*Table structure for table `ts_job` */

DROP TABLE IF EXISTS `ts_job`;

CREATE TABLE `ts_job` (
  `jobid` int(11) NOT NULL AUTO_INCREMENT,
  `funcid` int(11) NOT NULL,
  `arg` longblob DEFAULT NULL,
  `uniqkey` varchar(255) DEFAULT NULL,
  `insert_time` int(11) DEFAULT NULL,
  `run_after` int(11) NOT NULL,
  `grabbed_until` int(11) NOT NULL,
  `priority` smallint(6) DEFAULT NULL,
  `coalesce` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`jobid`),
  UNIQUE KEY `ts_job_funcid_idx` (`funcid`,`uniqkey`),
  KEY `ts_job_run_after_idx` (`run_after`,`funcid`),
  KEY `ts_job_coalesce_idx` (`coalesce`,`funcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ts_job` */

/*Table structure for table `ts_note` */

DROP TABLE IF EXISTS `ts_note`;

CREATE TABLE `ts_note` (
  `jobid` int(11) NOT NULL,
  `notekey` varchar(255) DEFAULT NULL,
  `value` longblob DEFAULT NULL,
  UNIQUE KEY `ts_note_jobid_idx` (`jobid`,`notekey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ts_note` */

/*Table structure for table `user_api_keys` */

DROP TABLE IF EXISTS `user_api_keys`;

CREATE TABLE `user_api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) NOT NULL,
  `api_key` varchar(40) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `revoked` tinyint(4) NOT NULL DEFAULT 0,
  `last_used` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_api_keys_api_key_idx` (`api_key`),
  KEY `user_api_keys_user_id_idx` (`user_id`),
  CONSTRAINT `fk_user_api_keys_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_api_keys` */

/*Table structure for table `user_group_map` */

DROP TABLE IF EXISTS `user_group_map`;

CREATE TABLE `user_group_map` (
  `user_id` mediumint(9) NOT NULL,
  `group_id` mediumint(9) NOT NULL,
  `isbless` tinyint(4) NOT NULL DEFAULT 0,
  `grant_type` tinyint(4) NOT NULL DEFAULT 0,
  UNIQUE KEY `user_group_map_user_id_idx` (`user_id`,`group_id`,`grant_type`,`isbless`),
  KEY `fk_user_group_map_group_id_groups_id` (`group_id`),
  CONSTRAINT `fk_user_group_map_group_id_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_group_map_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_group_map` */

insert  into `user_group_map`(`user_id`,`group_id`,`isbless`,`grant_type`) values 
(1,1,0,0),
(1,1,1,0),
(2,31,0,0),
(2,32,0,0),
(2,33,0,0),
(2,34,0,0),
(2,35,0,0),
(3,31,0,0),
(3,34,0,0),
(3,35,0,0),
(3,36,0,0),
(4,31,0,0),
(4,34,0,0),
(4,35,0,0),
(4,37,0,0),
(4,38,0,0),
(5,31,0,0),
(5,34,0,0),
(5,35,0,0),
(5,37,0,0),
(5,38,0,0),
(6,31,0,0),
(6,39,0,0),
(8,31,0,0),
(8,39,0,0),
(13,34,0,0),
(13,35,0,0),
(13,39,0,0);

/*Table structure for table `ut_group_types` */

DROP TABLE IF EXISTS `ut_group_types`;

CREATE TABLE `ut_group_types` (
  `id_group_type` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'ID in this table',
  `created` datetime DEFAULT NULL COMMENT 'creation ts',
  `groupe_type` varchar(255) NOT NULL COMMENT 'A name for this group type',
  `bz_description` varchar(255) DEFAULT NULL COMMENT 'A short description for BZ which we use when we create the group',
  `description` text DEFAULT NULL COMMENT 'Detailed description of this group type',
  PRIMARY KEY (`id_group_type`,`groupe_type`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `ut_group_types` */

insert  into `ut_group_types`(`id_group_type`,`created`,`groupe_type`,`bz_description`,`description`) values 
(1,'2017-10-22 14:32:13','creator','User has created the unit or has full delegation','The group for the user who has created the unit first and/or his representatives (agent or employee).'),
(2,'2017-10-22 14:32:13','access_to_case_and_unit','User has been invited to the unit. Untick to hide this case from these users','These are product/unit and bug/case visibility groups. \r\nThe groups where we place users so we can grant them accesses and permissions to a unit and the cases in this unit.'),
(3,'2017-10-22 14:32:13','occupant','User is an occupant of the unit','These are also bug visibility groups but based on a different information: is the user an occupant of the unit or not?\r\nA Tenant can also be an occupant (or not)\r\nAn Owner/Landlord can also be an occupant (or not).'),
(4,'2017-10-22 14:32:13','list_stakeholder','List all the users who have a role in this unit','This is a user visibility group (step 1).\r\nAll the users in this group have a role in this unit.'),
(5,'2017-10-22 14:32:13','see_stakeholder','See all the stakeholders','This is a user visibility group (step 2).\r\nIf you are member of this group, you can see all the user in the list_stakeholder group for this unit.'),
(6,'2017-10-22 14:32:13','r_a_case_next_step','Request approval for the Next Step of a case','This is a Flag Request group it is specific to each unit so we do not ask user to grant approval on a case they can\'t access.\r\nIf you are member of this group, you can Ask any user who has a role in the unit to request approval for the Next Step for a case in this unit.'),
(7,'2017-10-22 14:32:13','g_a_case_next_step','Grant approval for the Next Step of a case','This is a Flag Grant group it is specific to each unit so we do not ask user to grant approval on a case they can\'t access.\r\nIf you are member of this group, you can Ask any user who has a role in the unit to grant approval for the Next Step for a case in this unit.'),
(8,'2017-10-22 14:32:13','r_a_case_solution','Request approval for the Solution of a case','This is a Flag Request group it is specific to each unit so we do not ask user to grant approval on a case they can\'t access.\r\nIf you are member of this group, you can Ask any user who has a role in the unit to request approval for the Solution for a case in this unit.'),
(9,'2017-10-22 14:32:13','g_a_case_solution','Grant approval for the Solution of a case','This is a Flag Grant group it is specific to each unit so we do not ask user to grant approval on a case they can\'t access.\r\nIf you are member of this group, you can Ask any user who has a role in the unit to grant approval for the Solution for a case in this unit.'),
(10,'2017-10-22 14:32:13','r_a_case_budget','Request approval for the Budget for a case','This is a Flag Request group it is specific to each unit so we do not ask user to grant approval on a case they can\'t access.\r\nIf you are member of this group, you can Ask any user who has a role in the unit to request approval for the Budget for a case in this unit.'),
(11,'2017-10-22 14:32:13','g_a_case_budget','Grant approval for the Budget for a case','This is a Flag Grant group it is specific to each unit so we do not ask user to grant approval on a case they can\'t access.\r\nIf you are member of this group, you can Ask any user who has a role in the unit to grant approval for the Budget for a case in this unit.'),
(12,'2017-10-22 14:32:13','r_a_attachment_approve','Request approval for the Attachment','This is a Flag Request group it is specific to each unit so we do not ask user to grant approval on an Attachment they can\'t access.\r\nIf you are member of this group, you can Ask any user who has a role in the unit to request approval for an Attachment in this unit.'),
(13,'2017-10-22 14:32:13','g_a_attachment_approve','Grant approval for the Attachment','This is a Flag Grant group it is specific to each unit so we do not ask user to grant approval on an Attachment they can\'t access.\r\nIf you are member of this group, you can Ask any user who has a role in the unit to grant approval for an Attachment in this unit.'),
(14,'2017-10-22 14:32:13','r_a_attachment_ok_to_pay','Request approval to pay a bill','This is a Flag Request group it is specific to each unit so we do not ask user to grant approval on an Attachment they can\'t access.\r\nIf you are member of this group, you can Ask any user who has a role in the unit to request approval to pay a specific bill in this unit.'),
(15,'2017-10-22 14:32:13','g_a_attachment_ok_to_pay','Grant approval to pay a bill','This is a Flag Grant group it is specific to each unit so we do not ask user to grant approval on an Attachment they can\'t access.\r\nIf you are member of this group, you can Ask any user who has a role in the unit to grant approval to pay a specific bill in this unit.'),
(16,'2017-10-22 14:32:13','r_a_attachment_is_paid','Request confirmation if a bill has been paid','This is a Flag Request group it is specific to each unit so we do not ask user to grant approval on an Attachment they can\'t access.\r\nIf you are member of this group, you can Ask any user who has a role in the unit to confirm if a specific bill has been paid in this unit.'),
(17,'2017-10-22 14:32:13','g_a_attachment_is_paid','Confirms if a bill has been paid','This is a Flag Grant group it is specific to each unit so we do not ask user to grant approval on an Attachment they can\'t access.\r\nIf you are member of this group, you can Ask any user who has a role in the unit confirm if a specific bill has been paid in this unit.'),
(18,'2017-10-22 14:32:13','unit_specific','Group of groups for a unit','This is a group that helps us grant all shared accessed and permission in bulk to a user.\r\nIf you are member of this group, you can access all the Flags for a specific unit.'),
(19,'2017-10-22 14:32:13','user_aggregation','Facilitate user management','This is to group user together (users working in the same company for example) so we can give them all the same permissions.');

/*Table structure for table `ut_product_group` */

DROP TABLE IF EXISTS `ut_product_group`;

CREATE TABLE `ut_product_group` (
  `product_id` smallint(6) NOT NULL COMMENT 'id in the table products',
  `group_id` mediumint(9) NOT NULL COMMENT 'id in the table groups',
  `group_type_id` smallint(6) NOT NULL COMMENT 'id in the table ut_group_types',
  `role_type_id` smallint(6) DEFAULT NULL COMMENT 'id in the table ut_role_types',
  `created` datetime DEFAULT NULL COMMENT 'creation ts'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ut_product_group` */

insert  into `ut_product_group`(`product_id`,`group_id`,`group_type_id`,`role_type_id`,`created`) values 
(1,19,6,1,'2017-10-22 14:32:13'),
(1,20,7,1,'2017-10-22 14:32:13'),
(1,21,8,1,'2017-10-22 14:32:13'),
(1,22,9,1,'2017-10-22 14:32:13'),
(1,23,11,1,'2017-10-22 14:32:13'),
(1,24,10,1,'2017-10-22 14:32:13'),
(1,25,12,1,'2017-10-22 14:32:13'),
(1,26,13,1,'2017-10-22 14:32:13'),
(1,27,15,1,'2017-10-22 14:32:13'),
(1,28,14,1,'2017-10-22 14:32:13'),
(1,29,17,1,'2017-10-22 14:32:13'),
(1,30,16,1,'2017-10-22 14:32:13'),
(1,31,18,1,'2017-10-22 14:32:13'),
(1,32,1,5,'2017-10-22 14:37:38'),
(1,33,2,5,'2017-10-22 14:37:38'),
(1,34,4,5,'2017-10-22 14:37:38'),
(1,35,5,5,'2017-10-22 14:37:38'),
(1,36,2,2,'2017-10-22 14:37:39'),
(1,35,4,2,'2017-10-22 14:37:39'),
(1,35,5,2,'2017-10-22 14:37:39'),
(1,37,2,1,'2017-10-22 14:37:39'),
(1,38,3,1,'2017-10-22 14:37:39'),
(1,35,4,1,'2017-10-22 14:37:39'),
(1,35,5,1,'2017-10-22 14:37:39'),
(1,39,2,4,'2017-10-22 14:37:39'),
(1,35,4,4,'2017-10-22 14:37:39'),
(1,35,5,4,'2017-10-22 14:37:39');

/*Table structure for table `ut_role_types` */

DROP TABLE IF EXISTS `ut_role_types`;

CREATE TABLE `ut_role_types` (
  `id_role_type` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'ID in this table',
  `created` datetime DEFAULT NULL COMMENT 'creation ts',
  `role_type` varchar(255) NOT NULL COMMENT 'A name for this role type',
  `bz_description` varchar(255) DEFAULT NULL COMMENT 'A short, generic description that we include each time we create a new BZ unit.',
  `description` text DEFAULT NULL COMMENT 'Detailed description of this group type',
  PRIMARY KEY (`id_role_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `ut_role_types` */

insert  into `ut_role_types`(`id_role_type`,`created`,`role_type`,`bz_description`,`description`) values 
(1,'2017-10-22 14:32:13','Tenant','The Tenant','The person or entity who signed the tenancy agreement.'),
(2,'2017-10-22 14:32:13','Owner/Landlord','The Landlord','The person(s) or entity that are the registered owner of the property.'),
(3,'2017-10-22 14:32:13','Contractor','A contractor','A company or a person that can or will do work in the unit (electricity, plumbing, Aircon Maintenance, Housekeeping, etc...).'),
(4,'2017-10-22 14:32:13','Management Company','The management Company','Is in charge of day to day operations and responsible to fix things if something happens in a unit.'),
(5,'2017-10-22 14:32:13','Agent','An agent','The user who act as either the representative for the Tenant or for the Landlord. It is possible to have 2 agents attached to the same unit.');

/*Table structure for table `versions` */

DROP TABLE IF EXISTS `versions`;

CREATE TABLE `versions` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `product_id` smallint(6) NOT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `versions_product_id_idx` (`product_id`,`value`),
  CONSTRAINT `fk_versions_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `versions` */

insert  into `versions`(`id`,`value`,`product_id`,`isactive`) values 
(1,'---',1,1);

/*Table structure for table `watch` */

DROP TABLE IF EXISTS `watch`;

CREATE TABLE `watch` (
  `watcher` mediumint(9) NOT NULL,
  `watched` mediumint(9) NOT NULL,
  UNIQUE KEY `watch_watcher_idx` (`watcher`,`watched`),
  KEY `watch_watched_idx` (`watched`),
  CONSTRAINT `fk_watch_watched_profiles_userid` FOREIGN KEY (`watched`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_watch_watcher_profiles_userid` FOREIGN KEY (`watcher`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `watch` */

/*Table structure for table `whine_events` */

DROP TABLE IF EXISTS `whine_events`;

CREATE TABLE `whine_events` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `owner_userid` mediumint(9) NOT NULL,
  `subject` varchar(128) DEFAULT NULL,
  `body` mediumtext DEFAULT NULL,
  `mailifnobugs` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_whine_events_owner_userid_profiles_userid` (`owner_userid`),
  CONSTRAINT `fk_whine_events_owner_userid_profiles_userid` FOREIGN KEY (`owner_userid`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `whine_events` */

/*Table structure for table `whine_queries` */

DROP TABLE IF EXISTS `whine_queries`;

CREATE TABLE `whine_queries` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `eventid` mediumint(9) NOT NULL,
  `query_name` varchar(64) NOT NULL DEFAULT '',
  `sortkey` smallint(6) NOT NULL DEFAULT 0,
  `onemailperbug` tinyint(4) NOT NULL DEFAULT 0,
  `title` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `whine_queries_eventid_idx` (`eventid`),
  CONSTRAINT `fk_whine_queries_eventid_whine_events_id` FOREIGN KEY (`eventid`) REFERENCES `whine_events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `whine_queries` */

/*Table structure for table `whine_schedules` */

DROP TABLE IF EXISTS `whine_schedules`;

CREATE TABLE `whine_schedules` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `eventid` mediumint(9) NOT NULL,
  `run_day` varchar(32) DEFAULT NULL,
  `run_time` varchar(32) DEFAULT NULL,
  `run_next` datetime DEFAULT NULL,
  `mailto` mediumint(9) NOT NULL,
  `mailto_type` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `whine_schedules_run_next_idx` (`run_next`),
  KEY `whine_schedules_eventid_idx` (`eventid`),
  CONSTRAINT `fk_whine_schedules_eventid_whine_events_id` FOREIGN KEY (`eventid`) REFERENCES `whine_events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `whine_schedules` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

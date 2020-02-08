use mysqlbdd;

CREATE TABLE `bddrelease` (
  `ReleaseID` int(10) NOT NULL,
  `ReleaseName` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `ToolID` int(11) DEFAULT NULL,
  `ReleaseStartDate` datetime DEFAULT NULL,
  `ReleaseEndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ReleaseID`),
  KEY `fk_almtool_id` (`ToolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `iteration` (
  `IterationID` int(10) NOT NULL,
  `IterationName` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `FromDate` datetime DEFAULT NULL,
  `ToDate` datetime DEFAULT NULL,
  `EstimatedEffort` int(11) DEFAULT NULL,
  `IterationState` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `ReleaseID` int(10) NOT NULL,
  PRIMARY KEY (`IterationID`),
  KEY `fk_release_ReleaseID` (`ReleaseID`),
  CONSTRAINT `fk_release_ReleaseID` FOREIGN KEY (`ReleaseID`) REFERENCES `bddrelease` (`ReleaseID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `userstory` (
  `UserStoryID` varchar(10) COLLATE utf8_bin NOT NULL,
  `UserStoryName` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `UserStoryDescription` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `EstimatedEffort` int(11) DEFAULT NULL,
  `UserStoryState` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `IterationID` int(10) ,
  PRIMARY KEY (`UserStoryID`),
  CONSTRAINT `fk_iteration_id` FOREIGN KEY (`IterationID`) REFERENCES `iteration` (`IterationID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `scenarios` (
  `ScenarioID` int(10) NOT NULL,
  `ScenarioName` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `ScenarioDescription` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `UserStoryID` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ScenarioID`),
  KEY `fk_userstory_id` (`UserStoryID`),
  CONSTRAINT `fk_userstory_id` FOREIGN KEY (`UserStoryID`) REFERENCES `userstory` (`UserStoryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `tasks` (
  `TaskID` varchar(10) COLLATE utf8_bin NOT NULL,
  `TaskName` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `TaskDescription` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `State` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `EstimatedHours` int(11) DEFAULT NULL,
  `HoursRemaining` int(11) DEFAULT NULL,
  `UserStoryID` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`TaskID`),
  KEY `fk_userstory_id1` (`UserStoryID`),
  CONSTRAINT `fk_userstory_id1` FOREIGN KEY (`UserStoryID`) REFERENCES `userstory` (`UserStoryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

commit;

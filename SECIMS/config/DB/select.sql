


SELECT 
  * 
FROM
  SECIMS.`studyplan` p,
  SECIMS.`studyplandetail` d 
WHERE d.`planId` = p.`planId` ;


SELECT * FROM SECIMS.`StudyPlan` s LEFT JOIN SECIMS.`StudyPlanDetail` d
ON s.`planId` = d.`planId` ;







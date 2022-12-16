SELECT COUNT("endDate") AS "currentExperiences" 
FROM experiences
WHERE "endDate" IS NOT NULL;

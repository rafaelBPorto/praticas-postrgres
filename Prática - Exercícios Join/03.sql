SELECT u.id, u.name, c.name AS course, s.name as schools, e."endDate", e.status FROM users u JOIN educations e ON u.id = e."userId" JOIN schools s ON e."schoolId" = s.id JOIN courses c ON e."courseId" = c.id WHERE u.id = 30 and e.status = 'finished';

SELECT MAX(j.salary) AS maximumSalary, r.name
FROM jobs j 
JOIN roles r 
	ON r.id = j."roleId"
WHERE j.active IS TRUE
GROUP BY r.id
ORDER BY maximumSalary DESC;

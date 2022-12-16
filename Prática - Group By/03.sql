SELECT u.name AS writer, 
	COUNT (te."writerId") AS "testimonialCount"
FROM users u
JOIN testimonials te
	ON u.id = te."writerId"
WHERE te."writerId" = 435
GROUP BY u.id;

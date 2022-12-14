SELECT t.id, w.name AS writer, r.name AS recipient, t.message FROM testimonials t JOIN users w ON t."writerId" = w.id JOIN users r ON "writerId"=r.id;

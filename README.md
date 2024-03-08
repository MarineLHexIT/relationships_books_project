Mini project to create relationships between Models in Rails

Database model : https://dbdiagram.io/d/relationships_books_project-65ead197b1f3d4062c703874
```
// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs

Table books {
id integer
title string
isbn string
author_id integer
}

Table authors {
id integer
first_name string
last_name string
}

Table readers {
id integer
login string
email string
}

Table books_readers {
book_id integer
reader_id integer
rating integer
comment text
started_at timestamp
finished_at timestamp
}

Table editions {
id integer
published_date datetime
language string // en, fr, etc.
type string // paperbook, ebook, audiobook
publisher_id integer
book_id integer
}

Table publishers {
id integer
name string
}

Ref: books.author_id > authors.id
Ref: books_readers.book_id > books.id
Ref: books_readers.reader_id > readers.id
Ref: editions.book_id > books.id
Ref: editions.publisher_id > publishers.id
```
-- PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS question_follows; 
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER,
  parent_id INTEGER,
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
  users (fname, lname)
VALUES
  ('Ruth', 'Knee'),
  ('Eggy', 'Sunny'),
  ('Bart', 'Simpson');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('why?', 'why not?', (SELECT id FROM users WHERE fname = 'Eggy' AND lname = 'Sunny')),
  ('who?', 'you', (SELECT id FROM users WHERE fname = 'Ruth' AND lname = 'Knee'));

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Bart' AND lname = 'Simpson'),
   (SELECT id FROM questions WHERE title = 'why?'));

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Bart' AND lname = 'Simpson' ),
   (SELECT id FROM questions WHERE title = 'who?'));

INSERT INTO
  replies (user_id, question_id, parent_id, body)
VALUES
  ((SELECT id FROM users WHERE fname = 'Bart' AND lname = 'Simpson'),
  (SELECT id FROM questions WHERE title = 'why?'),
  NULL,
  'I have the same question.');
  
INSERT INTO
  replies (user_id, question_id, parent_id, body)
VALUES
  ((SELECT id FROM users WHERE fname = 'Ruth' AND lname = 'Knee'),
  (SELECT id FROM questions WHERE title = 'why?'),
  (SELECT id FROM replies WHERE id = 1),
  'Same same question, same.');


-- SELECT * FROM users;
-- SELECT * FROM replies;
-- SELECT * FROM questions;
-- SELECT * FROM question_likes;
-- SELECT * FROM question_follows;
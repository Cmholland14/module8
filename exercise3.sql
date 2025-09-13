
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Users (username, email, password_hash, created_at) VALUES
('alice', 'alice@example.com', 'hashedpassword1', '2025-09-13 10:00:00'),
('bob', 'bob@example.com', 'hashedpassword2', '2025-09-13 11:00:00');


CREATE TABLE Posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

INSERT INTO Posts (user_id, title, description, image_url, created_at) VALUES
(1, 'My First Blog Post', 'This is my first blog post about MongoDB.', 'https://example.com/image1.jpg', '2025-09-13 12:00:00'),
(2, 'Hello World!', 'Introducing myself on this new blog.', 'https://example.com/image2.jpg', '2025-09-13 12:30:00');


CREATE TABLE Comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);


INSERT INTO Comments (post_id, user_id, content, created_at) VALUES
(1, 2, 'Great first post, Alice!', '2025-09-13 12:45:00'),
(2, 1, 'Welcome, Bob! Nice to see you here.', '2025-09-13 13:00:00');


CREATE TABLE Likes (
    like_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    UNIQUE KEY unique_like (post_id, user_id)
);

INSERT INTO Likes (post_id, user_id, created_at) VALUES
(1, 2, '2025-09-13 13:15:00'),
(2, 1, '2025-09-13 13:30:00');

{
  "Users": {
    "fields": {
      "user_id": { "type": "int", "primary_key": true, "auto_increment": true },
      "username": { "type": "varchar(50)", "not_null": true, "unique": true },
      "email": { "type": "varchar(100)", "not_null": true, "unique": true },
      "password_hash": { "type": "varchar(255)", "not_null": true },
      "created_at": { "type": "timestamp", "default": "CURRENT_TIMESTAMP" }
    }
  },
  "Posts": {
    "fields": {
      "post_id": { "type": "int", "primary_key": true, "auto_increment": true },
      "user_id": { "type": "int", "foreign_key": "Users.user_id", "not_null": true },
      "title": { "type": "varchar(200)", "not_null": true },
      "description": { "type": "text" },
      "image_url": { "type": "varchar(255)" },
      "created_at": { "type": "timestamp", "default": "CURRENT_TIMESTAMP" }
    }
  },
  "Comments": {
    "fields": {
      "comment_id": { "type": "int", "primary_key": true, "auto_increment": true },
      "post_id": { "type": "int", "foreign_key": "Posts.post_id", "not_null": true },
      "user_id": { "type": "int", "foreign_key": "Users.user_id", "not_null": true },
      "content": { "type": "text", "not_null": true },
      "created_at": { "type": "timestamp", "default": "CURRENT_TIMESTAMP" }
    }
  },
  "Likes": {
    "fields": {
      "like_id": { "type": "int", "primary_key": true, "auto_increment": true },
      "post_id": { "type": "int", "foreign_key": "Posts.post_id", "not_null": true },
      "user_id": { "type": "int", "foreign_key": "Users.user_id", "not_null": true },
      "created_at": { "type": "timestamp", "default": "CURRENT_TIMESTAMP" }
    },
    "indexes": [
      { "name": "unique_like", "columns": ["post_id", "user_id"], "unique": true }
    ]
  }
}

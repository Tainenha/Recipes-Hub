
-- Bảng User (Người dùng)
CREATE TABLE User (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Bảng Category (Danh mục công thức)
CREATE TABLE Category (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- Bảng Ingredient (Nguyên liệu)
CREATE TABLE Ingredient (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Bảng Recipe (Công thức nấu ăn)
CREATE TABLE Recipe (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    image_url VARCHAR(255),
    category_id BIGINT,
    FOREIGN KEY (category_id) REFERENCES Category(id)
);

-- Bảng Step (Các bước nấu ăn)
CREATE TABLE Step (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    recipe_id BIGINT,
    step_number INT NOT NULL,
    description TEXT NOT NULL,
    FOREIGN KEY (recipe_id) REFERENCES Recipe(id) ON DELETE CASCADE
);

-- Bảng RecipeIngredient (Liên kết giữa Recipe và Ingredient)
CREATE TABLE RecipeIngredient (
    recipe_id BIGINT,
    ingredient_id BIGINT,
    quantity VARCHAR(50),
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipe(id) ON DELETE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(id) ON DELETE CASCADE
);

-- Bảng UserFavoriteRecipe (Lưu các công thức yêu thích của người dùng)
CREATE TABLE UserFavoriteRecipe (
    user_id BIGINT,
    recipe_id BIGINT,
    PRIMARY KEY (user_id, recipe_id),
    FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE,
    FOREIGN KEY (recipe_id) REFERENCES Recipe(id) ON DELETE CASCADE
);

-- Bảng Comment (Bình luận của người dùng cho công thức)
CREATE TABLE Comment (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    recipe_id BIGINT,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (recipe_id) REFERENCES Recipe(id) ON DELETE CASCADE
);

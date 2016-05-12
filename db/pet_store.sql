CREATE TABLE petstore(
    id serial4 primary key,
    name VARCHAR(255),
    address VARCHAR(255),
    type VARCHAR(255)
  );

CREATE TABLE pets(
  id serial4 primary key,
  pet_name VARCHAR(255),
  pet_breed VARCHAR(255),
  pet_image VARCHAR(255),
  store_id INT2 references stores(id)
  -- artist_id INT4 references artists(id) 
  );
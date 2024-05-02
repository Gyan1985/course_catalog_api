# README

## Setup

### Clone the Repository

Clone the repository to your local machine:

```
git clone <repository-url>
```
Navigate to the project directory:
cd project-directory

Install dependencies:
bundle install

Set up the database:
rails db:create
rails db:migrate
rails db:seed

Start the Rails server:
rails server

#API Documentation

# Create User API

## Overview

This API endpoint allows you to create a new user.

## Endpoint

### URL
- **Production:** `https://course-catalog-api-production.onrender.com/users`

### Method

- POST

### Payload Example

```
{
  "name": "Gyan",
  "username": "Gyan Gupta",
  "email": "gyan@gmail.com",
  "password": "12345678#!23",
  "password_confirmation": "12345678#!23"
}
```

# Generate Token API

## Overview

This API endpoint allows you to generate a token by logging in with user credentials.

## Endpoint

### URL

- **Your Domain:** `your_domain/auth/login`

### Method

- POST

### Payload Example

```
{
  "email": "gyan@gmail.com",
  "password": "12345678#!23"
}
```

### Response Example
```
{
  "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE3MTQ3NTQ5ODd9.KG_ngCO_dLimJ56fsE_I68qx8tRJ6AsSRR7f3ek5W5Y",
  "exp": "05-03-2024 22:19",
  "username": "Gyan Gupta"
}
```

# Categories API

Get All Categories
To get all categories, send a GET request to /api/v1/categories.

Pagination
You can also paginate the results by passing page and per_page parameters.

Filter by Vertical ID
To fetch categories associated with a specific vertical ID, include the vertical_id parameter in the request payload.

Example: ```/api/v1/categories?page=1&per_page=5&vertical_id=2```

Create Categories with Nested Attributes
To create categories with nested attributes, send a POST request to /api/v1/categories.

```
{
  "category": {
    "name": "New Category",
    "vertical_id": 1,
    "courses_attributes": [
      {
        "name": "New Course 1",
        "author": "Author 1"
      },
      {
        "name": "New Course 2",
        "author": "Author 2"
      }
    ]
  }
}
```

Update Categories
To update a category, send a PUT request to /api/v1/categories/:id.

Delete Categories
To delete a category, send a DELETE request to /api/v1/categories/:id.



# Courses API

## Overview

This API allows you to perform CRUD operations on courses.

## Endpoints

### Get All Courses

To get all courses, send a GET request to `/api/v1/courses`.

#### Pagination

You can paginate the results by including `page` and `per_page` parameters in the request.

#### Filter by Category ID

To fetch courses associated with a specific category ID, include the `category_id` parameter in the request payload.

Example: `/api/v1/courses?page=1&per_page=5&category_id=2`

### Get a Course

To get details of a specific course, send a GET request to `/api/v1/courses/:id`.

### Create a Course

To create a new course, send a POST request to `/api/v1/courses`.

#### Payload Example

```
{
  "course": {
    "name": "New Course",
    "author": "Author Name",
    "category_id": 1
  }
}
```


### Update a Course
To update an existing course, send a PUT request to /api/v1/courses/:id.

### Delete a Course
To delete a course, send a DELETE request to /api/v1/courses/:id.


# Verticals API

## Overview

This API allows you to perform CRUD operations on verticals.

## Endpoints

### Get All Verticals

To get all verticals, send a GET request to `/api/v1/verticals`.

#### Pagination

You can paginate the results by including `page` and `per_page` parameters in the request.

### Get a Vertical

To get details of a specific vertical, send a GET request to `/api/v1/verticals/:id`.

### Create a Vertical

To create a new vertical, send a POST request to `/api/v1/verticals`.

#### Payload Example

```
{
  "vertical": {
    "name": "Test Vertical",
    "categories_attributes": [
      {
        "name": "Test Category 1",
        "courses_attributes": [
          {
            "name": "Course 1 for Category 1",
            "author": "Author 1"
          },
          {
            "name": "Course 2 for Category 1",
            "author": "Author 2"
          }
        ]
      },
      {
        "name": "Test Category 2",
        "courses_attributes": [
          {
            "name": "Course 1 for Category 2",
            "author": "Author 3"
          },
          {
            "name": "Course 2 for Category 2",
            "author": "Author 4"
          }
        ]
      }
    ]
  }
}
```

###  Update a Vertical
To update an existing vertical, send a PUT request to /api/v1/verticals/:id.
Endpoint :- ```/api/v1/verticals/1``` 

Payload:- 
```
{
  "vertical": {
    "name": "Updated Vertical Name",
    "categories_attributes": [
      {
        "id": 1,
        "name": "Updated Category 1",
        "courses_attributes": [
          {
            "id": 1,
            "name": "Updated Course 1 for Category 1",
            "author": "Updated Author 1"
          },
          {
            "id": 2,
            "name": "Updated Course 2 for Category 1",
            "author": "Updated Author 2"
          }
        ]
      },
      {
        "id": 2,
        "name": "Updated Category 2",
        "courses_attributes": [
          {
            "id": 3,
            "name": "Updated Course 1 for Category 2",
            "author": "Updated Author 3"
          },
          {
            "id": 4,
            "name": "Updated Course 2 for Category 2",
            "author": "Updated Author 4"
          }
        ]
      }
    ]
  }
}

```


###  Delete a Vertical
To delete a vertical, send a DELETE request to /api/v1/verticals/:id.


# 🎓 School Management System (Ruby on Rails)

A role-based School Management System built with **Ruby on Rails** that allows Admins, School Admins, and Students to manage schools, courses, batches, enrollments, and student progress.

---

## 🚀 Features Overview

### User Roles
- **Admin**
- **SchoolAdmin**
- **Student**

Each role has clearly defined responsibilities and permissions.

---

## 👥 User Responsibilities

### 👑 Admin
- Create Schools
- Create School Admins
- Full system access

### 🏫 SchoolAdmin
- Update School information
- Create Courses
- Create Batches
- Add Students to Batches
- Approve / Reject student enrollment requests

### 🎓 Student
- Request enrollment in a Batch
- View classmates in the same Batch
- View own progress

---

## 🔐 Authentication & Authorization

- JWT-based authentication
- `current_user` method available in controllers
- Role-based access using `enum role`

---

## 🗄️ Database Tables

### users
| Column | Type |
|------|------|
| id | integer |
| name | string |
| email | string |
| password_digest | string |
| role | integer (enum: admin, school_admin, student) |

---

### schools
| Column | Type |
|------|------|
| id | integer |
| name | string |
| address | string |
| school_admin_id | integer |

---

### courses
| Column | Type |
|------|------|
| id | integer |
| name | string |
| description | text |
| school_id | integer |

---

### batches
| Column | Type |
|------|------|
| id | integer |
| name | string |
| start_date | date |
| end_date | date |
| course_id | integer |

---

### enrollments
| Column | Type |
|------|------|
| id | integer |
| user_id | integer |
| batch_id | integer |
| status | integer (enum: pending, approved, rejected) |

---

### progresses
| Column | Type |
|------|------|
| id | integer |
| user_id | integer |
| batch_id | integer |
| score | integer |
| remarks | string |

---

## 🧩 Model Associations

### User
```ruby
has_many :enrollments
has_many :batches, through: :enrollments
enum role: { admin: 0, school_admin: 1, student: 2 }

School
belongs_to :school_admin, class_name: "User"
has_many :courses

Course
belongs_to :school
has_many :batches

Batch
belongs_to :course
has_many :enrollments
has_many :users, through: :enrollments

Enrollment
belongs_to :user
belongs_to :batch
enum status: { pending: 0, approved: 1, rejected: 2 }

Progress
belongs_to :user
belongs_to :batch

🧠 Model Validations

User

name, email presence

email uniqueness

School

name presence

Course

name presence

Batch

name, start_date, end_date presence

Enrollment

uniqueness of user per batch

🛠️ API Controllers & Actions
Admin::UsersController
Action	Description
create_school_admin	Create School Admin
Admin::SchoolsController
Action	Description
create	Create School
SchoolAdmins::CoursesController
Action	Description
create	Create Course
SchoolAdmins::BatchesController
Action	Description
create	Create Batch
SchoolAdmins::EnrollmentsController
Action	Description
approve	Approve enrollment
reject	Reject enrollment
Students::EnrollmentsController
Action	Description
create	Request batch enrollment
StudentsController
Action	Description
create	Create single student
bulk_upload	Bulk student upload via CSV
```

### Testing
Tools Used: 

RSpec
FactoryBot
Faker
Shoulda Matchers
Test Coverage
Model validations
Model associations
Controller actions
Role-based access
Enrollment workflow

🧩 Authentication in Tests

Controller specs stub authentication using helper:
allow(controller).to receive(:authenticate_request).and_return(true)
allow(controller).to receive(:current_user).and_return(user)

🏗️ Project Structure
app/
  controllers/
  models/
spec/
  controllers/
  models/
  factories/
  support/

  🧪 Testing
Tools Used

RSpec

FactoryBot

Faker

Shoulda Matchers

Test Coverage

Model validations

Model associations

Controller actions

Role-based access

Enrollment workflow

Bulk CSV upload

🧩 Authentication in Tests

Controller specs stub authentication using helper:

allow(controller).to receive(:authenticate_request).and_return(true)
allow(controller).to receive(:current_user).and_return(user)

Project Structure
app/
  controllers/
  models/
spec/
  controllers/
  models/
  factories/
  support/

Tech Stack

Ruby 3.4.1

Rails  8.0.2

JWT

RSpec

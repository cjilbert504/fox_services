# Owner
* attributes
    
    - name
    - email
    - phone number
    - password

* associations
    - has_many :lists
    - has_many :tasks
    - has_many :employees, through: tasks


# List
* attributes
    - name(date for name)

* associations
    - belongs_to :owner
    - has_many :tasks
    - has_many :employees, through: :tasks


# Task
* attributes
    - title
    - content
    - address

* associations
    - belongs_to :owner
    - belongs_to :list
    - belongs_to :employee


# Employee
* attributes
    - name
    - email
    - phone number
    - password

* associations
    - belongs_to :owner
    - has_many :tasks
    - has_many :lists, through: :tasks
---
---
# Next To Do's
* build out ability to assign an employee to a task
* only employees who have a given task assigned to them can mark as complete and/or incomplete
* build log in functionality
---
---
# General Planning Thoughts
 * Admins and users visit the same login page, but are redirected after successful login based upon being and admin or not
 * Think about what routes need to be accessible to Admins only and placed within a namespaced route
 * Lists can only be made by admins and should be assigned to that admin after being created

    
    

    
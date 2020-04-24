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
* Build out employee model
---
---
# General Planning Thoughts
 - Admins and users visit the same login page, but are redirected after successful login based upon being and admin or not
 - Admins go to a hidden url in order to sign up as an admin?
 - Users can signup via a visible sign up link in header?
 - Think about what routes need to be accessible to Admins only and placed within a namespaced route
 - May be able to have shared signup between both Admin and User models by having a secret admin password that can be entered at signup in order to gain Admin status if password entered matches the secret password
    
    

    
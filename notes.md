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
    - has_many :tasks
    - has_many :lists, through: :tasks
---
---
# Next To Do's
* Tasks
    - handle errors for failed validations
    
    

    
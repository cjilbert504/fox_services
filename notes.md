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
    - contact info

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
    - ability to mark tasks complete and able to change back to incomplete
    - ability to move task to a different list?
    - think about all attributes that tasks may need i.e. date, time, location and how to implement these (drop dowmn menus for date and time?, map for location?)
    - add validations so that no attributes can be blank
    - handle errors for failed validations
    
    

    
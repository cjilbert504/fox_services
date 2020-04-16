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
    - name

* associations
    - belongs_to :owner
    - has_many :tasks
    - has_many :employees, through: :tasks


# Task
* attributes
    - title
    - content

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
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
employee_1 = Employee.create(name: "Henry", email: "henry@henry.com", password: "Henry")
employee_2 = Employee.create(name: "Jordan", email: "jordan@jordan.com", password: "Jordan")
employee_3 = Employee.create(name: "Todd", email: "todd@todd.com", password: "Todd")


list_1 = List.create("created_by" => "#{employee_1.name}", "name(2i)" => "5", "name(3i)" => "10", "name(1i)" => "2020")
list_2 = List.create("created_by" => "#{employee_2.name}", "name(2i)" => "5", "name(3i)" => "11", "name(1i)" => "2020")
list_3 = List.create("created_by" => "#{employee_1.name}", "name(2i)" => "5", "name(3i)" => "12", "name(1i)" => "2020")

task_1 = Task.create(
    title: "Exterior Cleaning",
    content: "The housing perimeter needs to be cleared of all debris",
    address: "1234 Task One Drive",
    list_id: list_1.id,
    employee_id: employee_1.id)

task_2 = Task.create(
    title: "Lot Bushhogging",
    content: "Lot that needs to be cleared so that it can be prepared for home construction",
    address: "1234 Task Two Drive",
    list_id: list_1.id,
    employee_id: employee_2.id)

task_3 = Task.create(
    title: "Driveway Gradding",
    content: "Grade the dirt/sand piled up in driveway area smoothly all the way from the driveway to the curb. Make sure to clean any sand/dirt that gets into the street.",
    address: "1234 Task Three Drive",
    list_id: list_1.id,
    employee_id: employee_3.id)

task_4 = Task.create(
    title: "Lawn cut",
    content: "Typical grass cutting",
    address: "1234 Task Four Drive",
    list_id: list_2.id,
    employee_id: employee_2.id)

task_5 = Task.create(
    title: "Transport Bulldozer",
    content: "Bring the big dozer to address listed.",
    address: "1234 Task Five Drive",
    list_id: list_2.id,
    employee_id: employee_3.id)
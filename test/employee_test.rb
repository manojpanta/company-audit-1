require './test/test_helper'
require './lib/employee'

class EmployeeTest < Minitest::Test
  def test_instantiation
    employee = Employee.new('5', 'Sally Jackson', 'Engineer', '2015-01-01','2018-01-01', nil)
    assert_instance_of Employee, employee
  end

  def test_attributes
    employee = Employee.new('5', 'Sally Jackson', 'Engineer', '2015-01-01','2018-01-01', nil)
    assert_equal 5, employee.id
    assert_equal 'Sally Jackson', employee.name
    assert_equal "Engineer", employee.role
    assert_instance_of Date, employee.start_date
    assert_instance_of Date, employee.end_date
    assert_instance_of Integer, employee.id
  end

end

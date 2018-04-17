require './test/test_helper'
require './lib/company'

class CompanyTest < Minitest::Test

  def test_it_exists
    company = Company.new({:employees => './data/employees.csv',
                            :projects => './data/projects.csv',
                            :timesheets => './data/timesheets.csv'})

    assert_instance_of Company, company
    assert_equal 3, company.projects.length
    assert_equal 2, company.employees.length
    assert_equal 25, company.timesheets.length

    assert_instance_of Employee, company.employees.first
    assert_instance_of Project, company.projects.first
    assert_instance_of TimeSheet, company.timesheets.first
  end


  def test_it_can_load_datas
    company = Company.new({:employees => './data/employees.csv',
                            :projects => './data/projects.csv',
                            :timesheets => './data/timesheets.csv'})

    assert_equal 'Susan Smith', company.employees.first.name
    assert_equal 1, company.employees.first.id

    assert_equal 'Widgets', company.projects.first.name
    assert_equal 1, company.projects.first.id

    assert_equal 1, company.timesheets.first.employee_id
    assert_equal 1, company.timesheets.first.project_id
  end

  def test_it_can_find_employees_by_id
    company = Company.new({:employees => './data/employees.csv',
                           :projects => './data/projects.csv',
                           :timesheets => './data/timesheets.csv'})

    result = company.find_employee_by_id(1)
    assert_equal "Susan Smith", result.name
    assert_instance_of Employee, result
  end

  def test_it_returns_nil_for_invalid_employees_by_id
    company = Company.new({:employees => './data/employees.csv',
                           :projects => './data/projects.csv',
                           :timesheets => './data/timesheets.csv'})

    result = company.find_employee_by_id(5)
    assert_nil result
  end

  def test_it_can_find_projects_by_project_id
    company = Company.new({:employees => './data/employees.csv',
                            :projects => './data/projects.csv',
                            :timesheets => './data/timesheets.csv'})

    result = company.find_project_by_id(1)
    assert_equal "Widgets", result.name
    assert_instance_of Project, result
  end

  def test_it_can_return_nil_for_invalid_project_id
    company = Company.new({:employees => './data/employees.csv',
                            :projects => './data/projects.csv',
                            :timesheets => './data/timesheets.csv'})

    result = company.find_project_by_id(100)
    assert_nil result
  end

  def test_it_can_find_invalid_timesheets
    company = Company.new({:employees => './data/employees.csv',
      :projects => './data/projects.csv',
      :timesheets => './data/timesheets.csv'})

      result = company.timesheet_valid?(1)


  end
end

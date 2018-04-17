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



end

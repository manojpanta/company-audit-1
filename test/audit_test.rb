require './test/test_helper'
require './lib/audit'

class AuditTest < Minitest::Test

  def test_it_exists
    audit = Audit.new
    assert_instance_of Audit, audit
  end

  def test_it_can_load_company_data
    audit = Audit.new
    company = Company.new({:employees => './data/employees.csv',
                            :projects => './data/projects.csv',
                            :timesheets => './data/timesheets.csv'})

    result = {:success => true, :error => nil}
    assert_equal result,  company.load_employees('./data/employees.csv')
    result = {:success => true, :error => nil}
    assert_equal result,  company.load_projects('./data/projects.csv')
    result = {:success => true, :error => nil}
    assert_equal result,  company.load_timesheets('./data/timesheets.csv')
  end


end

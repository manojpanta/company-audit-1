require './test/test_helper'
require './lib/audit'

class AuditTest < Minitest::Test

  def test_it_exists
    audit = Audit.new(nil)
    assert_instance_of Audit, audit
  end

  def test_it_can_load_company_data
    company = Company.new({:employees => './data/employees.csv',
                            :projects => './data/projects.csv',
                            :timesheets => './data/timesheets.csv'})

    audit = Audit.new(company)

    result = {:success => true, :error => nil}
    assert_equal result,  company.load_employees('./data/employees.csv')
    result = {:success => true, :error => nil}
    assert_equal result,  company.load_projects('./data/projects.csv')
    result = {:success => true, :error => nil}
    assert_equal result,  company.load_timesheets('./data/timesheets.csv')
  end

  def test_it_can_load_company
    company = Company.new({:employees => './data/employees.csv',
                          :projects => './data/projects.csv',
                          :timesheets => './data/timesheets.csv'})

    audit = Audit.new(company)
    result = audit.load_company(audit.company)
    assert_instance_of Company, result
  end


  def test_it_can_detect_invlaid_days_worked
    company = Company.new({:employees => './data/employees.csv',
                            :projects => './data/projects.csv',
                            :timesheets => './data/bad_timesheets.csv'})

    audit = Audit.new(company)

    result = audit.were_invalid_days_worked

    assert_equal nil, result


  end
end

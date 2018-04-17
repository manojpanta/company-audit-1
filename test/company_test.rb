require './test/test_helper'
require './lib/company'

class CompanyTest < Minitest::Test

  def test_it_exists
    company = Company.new({:employees => './data/employees.csv'
                            :projects => './data/projects.csv'
                            :timesheets => './data/timesheets.csv' })

    assert_instance_of Company, company


  end



end

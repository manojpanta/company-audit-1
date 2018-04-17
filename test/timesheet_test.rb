require './test/test_helper'
require './lib/timesheet'

class TimeSheetTest < Minitest::Test

  def test_it_exists
    timesheet = TimeSheet.new('5', '7', '2015-01-01', '120')
    assert_instance_of TimeSheet, timesheet
  end

  def test_attributes
    timesheet = TimeSheet.new('5', '7', '2015-01-01', '120')

    assert_instance_of Integer, timesheet.employee_id
    assert_instance_of Integer, timesheet.project_id
    assert_instance_of Date, timesheet.date
    assert_instance_of Integer, timesheet.minutes
  end



end

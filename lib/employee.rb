require_relative '../modules/date_handler'
class Employee
  attr_reader :id,
              :employee_id,
              :name,
              :role,
              :start_date,
              :end_date,
              :company

  def initialize(employee_id, name, role, start_date, end_date, company)
    @company = company
    @id = employee_id.to_i
    @name = name
    @role = role
    @start_date = DateHandler.string_to_date(start_date) if !start_date.nil?
    @end_date = DateHandler.string_to_date(end_date) if !end_date.nil?
  end
end

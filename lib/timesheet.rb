require_relative'../modules/date_handler'
class TimeSheet
  attr_reader :employee_id,
              :project_id,
              :date,
              :minutes,
              :company

  def initialize(employee_id, project_id, date, minutes, company)
    @company = company
    @employee_id = employee_id.to_i
    @project_id = project_id.to_i
    @date = DateHandler.string_to_date(date) if !date.nil?
    @minutes = minutes.to_i
  end

  def valid_project_id
    company.projects.any? do |project|
      project.id == project_id
    end
  end

  def valid_employee_id
    company.employees.any? do |employee|
      employee.id == eployee_id
    end
  end

  def valid_date
    a = company.projects find do |project|
      project if project.id == project_id
    end
    DateHandler.DHDate.new(@date).date_between(a.start_date, a.end_date)
  end
end

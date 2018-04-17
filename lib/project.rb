require_relative '../modules/date_handler'
class Project
  attr_reader :id,
              :name,
              :start_date,
              :end_date,
              :company

  def initialize(project_id, name, start_date, end_date, company)
    @company = company
    @id = project_id.to_i
    @name = name
    @start_date = DateHandler.string_to_date(start_date)
    @end_date = DateHandler.string_to_date(end_date)
  end
end

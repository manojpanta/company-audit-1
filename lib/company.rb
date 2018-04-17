require_relative 'project'
require_relative 'employee'
require_relative 'timesheet'
require 'csv'


class Company

  attr_reader :employees,
              :projects,
              :timesheets,
              :path

  def initialize(path)
    @path = path
    @employees = []
    @projects = []
    @timesheets = []
    load_employees(path[:employees])
    load_projects(path[:projects])
    load_timesheets(path[:timesheets])
  end

  def load_employees(path = path[:employees])
    CSV.foreach(path, headers: false, header_converters: :symbol) do |data|
      if data.length == 5
        @employees <<  Employee.new(data[0], data[1], data[2], data[3], data[4])
      else
        return {success: false, error: 'bad_data'}
      end

    end
  end

  def load_projects(path = path[:projects])
    CSV.foreach(path, headers: false, header_converters: :symbol) do |data|
      if data.length == 4
        @projects << Project.new(data[0], data[1], data[2], data[3])
      else
        return {success: false, error: 'bad_data'}
      end
    end
  end

  def load_timesheets(path = path[:timesheets])
    CSV.foreach(path, headers: false, header_converters: :symbol) do |data|
      if data.length == 4
        @timesheets << TimeSheet.new(data[0], data[1], data[2], data[3])
      else
        return {success: false, error: 'bad_data'}
      end
    end
  end


  def find_employee_by_id(employee_id)
    employees.find do |employee|
      employee.id == employee_id
    end
  end

  def find_project_by_id(project_id)
    projects.find do |project|
      # require 'pry'; binding.pry
      project.id == project_id

    end
  end


end

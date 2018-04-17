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
  end

  def self.load_employees(path)
    CSV.foreach(path, headers: true, header_converters: :symbol) do |data|
      merchant = Merchant.new(data, self)
  end



end

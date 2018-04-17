require_relative 'company'
class Audit
  attr_reader :company
  def initialize(company)
    @company = company
    load_company(company)
  end

  def load_company(company)
    company
  end

end

require './test/test_helper'
require './lib/project'

class ProjectTest < Minitest::Test
  def test_it_exists
    project = Project.new('123', 'Widget Maker', '2015-01-01', '2018-01-01', nil)
    assert_instance_of Project, project
  end

  def test_attributes
    project = Project.new('123', 'Widget Maker', '2015-01-01', '2018-01-01', nil)

    assert_equal 123, project.id
    assert_instance_of Integer, project.id
    assert_equal 'Widget Maker', project.name
    assert_instance_of Date, project.start_date
    assert_instance_of Date, project.end_date
  end

end

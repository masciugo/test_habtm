require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "assign habtm by objects" do
    john = User.find_by(name: 'john')
    john.projects = Project.all
    assert_equal 2, john.projects.count
  end
  test "assign habtm by ids" do
    john = User.find_by(name: 'john')
    john.project_ids = Project.ids
    assert_equal 2, john.projects.count
  end
  test "assign habtm by inserting" do
    john = User.find_by(name: 'john')
    john.projects << Project.first
    assert_equal 1, john.projects.count
  end
  test "assign habtm by creating" do
    john = User.find_by(name: 'john')
    proj = john.projects.build(title: 'yo')
    proj.save
    assert_equal 1, john.projects.count
  end
end

require 'test_helper'

class ProjectCostTest < ActiveSupport::TestCase
  test "search finds relevant information" do
    project1 = Project.create!(user: users(:one), name: "Cellar Door",
      description: "The most beautiful phrase in the English language")
    pc1 = ProjectCost.create!(project: project1, cost_type: "Shipping", amount: 50)
    pc2 = ProjectCost.create!(project: project1, cost_type: "License fees", amount: 2500)
    pc = ProjectCost.all

    #Check that names are searched
    results = ProjectCost.search(pc, "Shipping")
    assert results.include?(project1)

    #Check that search is case insensitive
    results = ProjectCost.search(pc, "Fees")
    assert results.include?(project1)

    #Check that unfound items don't return results
    results = ProjectCost.search(pc, "West")
    refute results.include?(project1)
  end
end

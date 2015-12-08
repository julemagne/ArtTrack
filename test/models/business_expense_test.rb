require 'test_helper'

class BusinessExpenseTest < ActiveSupport::TestCase
  test "search finds relevant information" do
    be1 = BusinessExpense.create!(user_id: 1, name: "Taco Bill", description: "Too much", amount: 5000)
    be2 = BusinessExpense.create!(user_id: 1, name: "Rent", description: "Also too much", amount: 25000)

    #Check that names are searched
    results = BusinessExpense.search("Taco")
    assert results.include?(be1)
    refute results.include?(be2)

    #Check that descriptions are searched and search is case insensitive
    results = BusinessExpense.search("too")
    assert results.include?(be1)
    assert results.include?(be2)

    results = BusinessExpense.search("also")
    refute results.include?(be1)
    assert results.include?(be2)
  end
end

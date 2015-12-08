require 'test_helper'

class MaterialPurchaseTest < ActiveSupport::TestCase
  test "search finds relevant information" do
    mp1 = MaterialPurchase.create!(user_id: 1, name: "Wood", cost: 500, units: 30)
    mp2 = MaterialPurchase.create!(user_id: 1, name: "iron", cost: 2500, units: 90)

    #Check that names are searched
    results = MaterialPurchase.search("Wood")
    assert results.include?(mp1)
    refute results.include?(mp2)

    #Check that descriptions are searched and search is case insensitive

    results = MaterialPurchase.search("Iron")
    refute results.include?(mp1)
    assert results.include?(mp2)
  end

  test "quantity remaining updates when material is used" do
    mp1 = MaterialPurchase.create!(user_id: 1, name: "Wood", cost: 500, units: 30, units_remaining: 30)
    mu1 = MaterialUse.create!(user_id: 1, material_purchase_id: mp1.id, units: 10)

    mp1.units_remaining = mp1.update_stock
    mp1.save
    mp1.reload
    expected = 20
    assert_equal expected, mp1.units_remaining
  end
end

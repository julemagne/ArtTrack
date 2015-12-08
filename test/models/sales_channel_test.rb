require 'test_helper'

class SalesChannelTest < ActiveSupport::TestCase
  test "search finds relevant information" do
    sc1 = SalesChannel.create!(user_id: 1, name: "The Van", description: "Down By thE RiVer")
    sc2 = SalesChannel.create!(user_id: 1, name: "Super Festival", description: "down BY th RIVER")

    #Check that names are searched
    results = SalesChannel.search("Van")
    assert results.include?(sc1)
    refute results.include?(sc2)

    #Check that descriptions are searched and search is case insensitive
    results = SalesChannel.search("river")
    assert results.include?(sc1)
    assert results.include?(sc2)

    results = SalesChannel.search("super")
    refute results.include?(sc1)
    assert results.include?(sc2)
  end

  test "amount by channel returns channel sales info" do
    SalesChannel.destroy_all

    sc1 = SalesChannel.create!(user_id: 1, name: "The Van", description: "Down By thE RiVer")
    sc2 = SalesChannel.create!(user_id: 1, name: "Super Festival", description: "down BY th RIVER")

    Sale.create!(project_id: 1, sales_channel_id: sc1.id, gross: 100, net: 80, date: Date.today - rand(1..5).days)
    Sale.create!(project_id: 2, sales_channel_id: sc2.id, gross: 300, net: 250, date: Date.today - rand(1..5).days)

    expected = [{"label": "The Van",
              "value": 100.0,
              "color": "#007353"},
              {"label": "Super Festival",
              "value": 300.0,
              "color": "#C97300"}]
    results = SalesChannel.amount_by_channel

    assert_equal expected, results
  end
end

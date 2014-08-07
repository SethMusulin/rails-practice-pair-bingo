require 'rails_helper'

describe "Pairing" do
  describe ".pairing_date" do
    it "can return the date on which two partners paired" do
      user1 = create_user(name: "pair_dude", email: "pair_dude@example.com")
      user2 = create_user(name: "partner2", email: "partner2@example.com")
      Pairing.create(user_id: user1.id, partner_id: user2.id, date: 2.days.ago.to_date)

      expect(Pairing.pairing_date(user1, user2)).to eq(2.days.ago.to_date)
    end
  end

  it "cannot be created without a date" do
    user1 = create_user(email: "pair_dude@example.com", name: "pair_dude")
    user2 = create_user(name: "partner2", email: "partner2@example.com")
    pairing = Pairing.new(user_id: user1, partner_id: user2, date: 2.days.ago.to_date)

    expect(pairing).to be_valid

    pairing.date = ""
    expect(pairing).to_not be_valid
  end

  it "cannot have a date in the future" do
    user1 = create_user(name: "pair_dude", email: "pair_dude@example.com")
    user2 = create_user(name: "partner2", email: "partner2@example.com")
    pairing = Pairing.new(user_id: user1, partner_id: user2, date: 2.days.ago.to_date)

    expect(pairing).to be_valid

    pairing.date = "2014-09-05"
    expect(pairing).to_not be_valid
  end


end
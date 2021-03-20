require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new(
		first_name: "takuya",
		last_name: "kinoshita",
		email: "kktak02@gmail.com",
		password: "password"
		)
  end



  it "is valid with a first name, last name, email, and password" do
    expect(@user).to be_valid
  end

  it "returns the full name" do
    expect(@user.name).to eq "takuya kinoshita"
  end

  it "is invalid with a wrong firstname" do
    @user.first_name = "a"*20
    expect(@user).to_not be_valid
  end



  it "is valid with a firstname" do
    @user.first_name = "a"*19
    expect(@user).to be_valid
  end

  it "firstname is present" do
     expect(@user.first_name).to be_truthy
  end

  it "email is present" do
    @user.email = " "
    expect(@user).to_not be_valid
  end

  it "email is not too long" do
    @user.email = "a"*244+"@gmail.com"
    expect(@user).to be_valid
  end



  it "email is too long" do
    @user.email = "a"*245+"@gmail.com"
    expect(@user).to_not be_valid
  end

  it "email validation accepts valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.lasr@foo.jp alice+bob@baz.cn]

    valid_addresses.each do |valid_address|
    @user.email = valid_address
    expect(@user).to be_valid
    end
  end

  it "email validation rejects invalid addresses" do
    invalid_addresses = "user.user@gmail"
    @user.email = invalid_addresses
    expect(@user).to_not be_valid
  end


end

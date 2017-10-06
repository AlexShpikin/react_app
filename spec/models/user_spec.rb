require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(login: "user@example.com", password: "foobar", password_confirmation: "foobar", role: '1')}
  subject { user }
	it { should respond_to(:login) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:role) }
	it { should respond_to(:authenticate) }
	it {should be_valid}

	describe "when login format is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                  foo@bar_baz.com foo@bar+baz.com]
    		addresses.each do |invalid_address|
      		user.login = invalid_address
      		expect(user).not_to be_valid
    		end
    	end
  	end
  	describe "when password is not present" do
	  	before { user.password = user.password_confirmation = " " }
	  	it { should_not be_valid }
	end

	describe "when password doesn't match confirmation" do
	  	before { user.password_confirmation = "mismatch" }
	  	it { should_not be_valid }
	end

	describe "when login format is valid" do
	    it "should be valid" do
	    	addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
	    	addresses.each do |valid_address|
	      	user.login = valid_address
	      	expect(user).to be_valid
	    	end
	    end
	end
	
	describe "return value of authenticate method" do
	  	before { user.save }
	  	let(:found_user) { User.find_by(login: user.login) }

	  	describe "with valid password" do
	    	it { should eq found_user.authenticate(user.password) }
	  	end

	  	describe "with invalid password" do
	    	let(:user_for_invalid_password) { found_user.authenticate("invalid") }

	    	it { should_not eq user_for_invalid_password }
	    	specify { expect(user_for_invalid_password).to be false }
	  	end
	end

	describe "with a password that's too short" do
  		before { user.password = user.password_confirmation = "a" * 5 }
  		it { should be_invalid }
	end
end
require 'rails_helper'

RSpec.describe Role, type: :model do

	let(:role) {Role.create({title: 'manager'})}
	subject {role}
		it {should respond_to(:title)}
		it {should be_valid}

	describe "when title is already taken" do
    	before do
      		role_with_same_title = role.dup
      		role_with_same_title.save
    	end
    	it { should_not be_valid }
  	end
end
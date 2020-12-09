require 'rails_helper'

RSpec.describe User type: :model do

    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_length_of (:password).is_at_least(6)]}
    it {should have_many(:goals)}

 describe "#find_by_credentials" do
       
    context "with vaild username and password" do
     it "should return the correct user" do
        bob = User.create(username: "Bob", password:"abcdef")
        user = User.find_by_credentials("Bob", "abcdef")
        expect(bob.username).to eq(user.username)
        expect(bob.password_digest).to eq(user.password_digest)
     end
    end

    context "with invalid username or password" do
      it "should return nil" do
        bob = User.create(username: "Bob", password:"abcdef")
        user = User.find_by_credentials("Bob", "abcdefg")
        expect(user).to be_nil
      end  
    end
end

end 
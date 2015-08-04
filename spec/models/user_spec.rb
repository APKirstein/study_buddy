require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:username).when("Robert1441") }
  it { should have_valid(:email).when("Robert1441@hotmail.com") }
  it { should have_valid(:year).when(3) }
  it { should_not have_valid(:username).when(nil) }
  it { should_not have_valid(:email).when(nil) }
  it { should_not have_valid(:year).when(5) }
end

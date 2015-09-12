require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:username).when("Robert1441") }
  it { should have_valid(:email).when("Robert1441@hotmail.com") }
  it { should_not have_valid(:username).when(nil) }
  it { should_not have_valid(:email).when(nil) }
end

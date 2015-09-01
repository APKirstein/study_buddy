require 'rails_helper'

RSpec.describe Class, type: :model do
  it { should have_valid(:name).when("Property") }
  it { should have_valid(:subject).when("Real Estate Law") }
  it { should have_valid(:professor).when("Prof. James") }
  it { should have_valid(:time).when("Thursday, Jan. 10th, 10:10AM") }
  it { should have_valid(:location).when("Room 312") }
  it { should_not have_valid(:name).when(nil) }
  it { should_not have_valid(:subject).when("L") }
  it { should_not have_valid(:professor).when("DJ") }
  it { should_not have_valid(:time).when(1/14/2014) }
  it { should_not have_valid(:location).when(40.689060) }
end

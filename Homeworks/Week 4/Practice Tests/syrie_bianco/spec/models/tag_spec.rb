require 'rails_helper'

RSpec.describe Tag, :type => :model do
  it { should validate_presence_of(:post) }
  it { should validate_presence_of(:name) }
  it { should belong_to(:post) }
end

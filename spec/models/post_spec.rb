require "rails_helper"

describe Post do
  it { should validate_presence_of :name}
  it { should validate_presence_of :author }
  it { should validate_presence_of :content }
  it {should have_many :answers }

  it 'is private by default' do
    post = FactoryGirl.create(:post)
    post.author.should eq "LisaTheMighty"
  end

end

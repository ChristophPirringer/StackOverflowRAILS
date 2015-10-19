require 'rails_helper'

describe "the add an answer process" do
  it "adds an answer" do
    post = Post.create(:author => 'Someone useless', :name => 'Something useless', :content => 'Something even more useless')
    answer = Answer.create(:author => 'Chris the bear', :post_id => post.id)
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Author', :with => 'Chris the bear'
    fill_in 'Name', :with => 'Chris the bear'
    fill_in 'Author', :with => 'Chris the bear'
    click_on 'Update Post'
    expect(page).to have_content 'Chris the bear'
  end

  it "gives error when no content is entered" do
      post = Post.create(:author => 'Someone useless', :name => 'Something useless', :content => 'Something even more useless')
      answer = Answer.create(:author => 'Chris the bear', :post_id => post.id)
      visit post_path(post)
      click_on 'Edit'
      fill_in 'Author', :with => 'Chris the bear'
      fill_in 'Name', :with => ''
      fill_in 'Author', :with => 'Chris the bear'
      click_on 'Update Post'
    expect(page).to have_content 'errors'
  end
end

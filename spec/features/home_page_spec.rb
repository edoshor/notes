require 'spec_helper'

feature 'user visit home page' do

  it 'welcomes the user' do
    visit '/'
    page.should have_content 'Welcome'
    page.has_link? 'notes'
    page.has_link? 'intentions'
  end

end
require 'spec_helper'

feature 'list intentions' do

  scenario 'empty list' do
    visit intentions_path
    page.should have_content 'intentions'
    page.should have_link 'New Intention'
    page.should have_table 'intentions'
    page.should have_selector('table tr', count:1)
  end

  scenario 'not empty list' do
    intention = FactoryGirl.create(:intention, title: 'One',content: "Israel, Oriata & KBH are one")
    visit intentions_path
    page.should have_content 'intentions'
    page.should have_link 'New Intention'
    page.should have_table 'intentions'
    page.should have_selector('table tr', count:2)
    page.should have_link('Show', href: intention_path(intention))
    page.should have_link('Edit', href: edit_intention_path(intention))
    page.should have_link('Destroy', href: intention_path(intention))
    destroy_link = page.find_link('Destroy')
    destroy_link['data-confirm'].should eq('Are you sure?')
    destroy_link['data-method'].should eq('delete')
  end

end

feature 'create intentions' do

  scenario 'create new intention' do
    Intention.count.should == 0

    visit new_intention_path
    fill_in 'intention_name', with: 'name'
    fill_in 'intention_title', with: 'title'
    fill_in 'intention_content', with: 'content'
    click_button 'Save'

    Intention.count.should == 1
  end

end
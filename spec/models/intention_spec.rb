require 'spec_helper'

describe Intention do

  it 'correctly determines if its for the group' do
    #intention = Intention.new(content: 'The group is in gar de Atzilut')
    intention = FactoryGirl.build(:intention, content: 'The group is in gar de Atzilut')
    intention.is_for_group?.should == true

    intention.content = 'My ego is my king'
    intention.is_for_group?.should == false
  end

end

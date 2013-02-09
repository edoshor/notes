class Intention < ActiveRecord::Base
  attr_accessible :content, :name, :title

  def is_for_group?
    content.include? 'gro'
  end


end

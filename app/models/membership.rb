# == Schema Information
#
# Table name: memberships
#
#  id              :integer         not null, primary key
#  user_id         :integer
#  organization_id :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class Membership < ActiveRecord::Base
  attr_accessible :organization_id
  belongs_to :user              # , class_name: "User"            not needed here since it's inferred from the name
  belongs_to :organization      # , class_name: "Organization"    not needed here since it's inferred from the name
  
  validates :user_id, :presence => true
  validates :organization_id, :presence => true
  
end

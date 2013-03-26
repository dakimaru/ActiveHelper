# == Schema Information
#
# Table name: projects
#
#  id                  :integer         not null, primary key
#  name                :string(255)
#  location            :string(255)
#  cost                :string(255)
#  start               :datetime
#  end                 :datetime
#  duration            :integer
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  organization_id     :integer
#  in_short            :text
#  objective           :text
#  who_should_apply    :text
#  further_details     :text
#  mission_type        :string(255)
#  status              :string(255)
#  cap                 :integer
#  applicant_count     :integer
#

class Project < ActiveRecord::Base
  attr_accessible :name, :location, :cost, :start, :end, :duration, :avatar, :organization_id,
                  :in_short, :objective, :who_should_apply, :further_details, :mission_type, :status,
                  :cap, :applicant_count
  has_attached_file :avatar
  
  belongs_to :organization
  
  validates :name, presence: true, length: { maximum: 250 }
  validates :in_short, length: { maximum: 400 }
  validates :organization_id, presence: true
  
end

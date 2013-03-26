require 'spec_helper'

describe Project do
  pending "add some examples to (or delete) #{__FILE__}"
end
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


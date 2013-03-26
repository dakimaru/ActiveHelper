require 'spec_helper'

describe Organization do
  
  before do
    @organization = Organization.new(name: "Example Org", email: "org@example.com",
                                            password: "foobar", password_confirmation: "foobar")
  end
  
  subject { @organization}
  
  it { should respond_to (:name) }
  it { should respond_to (:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
    
  it { should be_valid }

  describe "when name is not present" do
    before { @organization.name = " " }
    it { should_not be_valid }
  end
end # == Schema Information
#
# Table name: organizations
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#

# == Schema Information
#
# Table name: organizations
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  password_digest        :string(255)
#  remember_token_org     :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  url                    :string(255)
#  mission                :text
#  description            :text
#  active_field_1         :string(255)
#  active_field_2         :string(255)
#  active_field_3         :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

# == Schema Information
#
# Table name: organizations
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  password_digest        :string(255)
#  remember_token         :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  about_me               :string(255)
#

# == Schema Information
#
# Table name: organizations
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  password_digest        :string(255)
#  remember_token         :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  about_me               :string(255)
#

# == Schema Information
#
# Table name: organizations
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  password_digest        :string(255)
#  remember_token         :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  about_me               :text
#

# == Schema Information
#
# Table name: organizations
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  password_digest        :string(255)
#  remember_token         :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  about_me               :text
#

# == Schema Information
#
# Table name: organizations
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  password_digest        :string(255)
#  remember_token         :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  about_me               :text
#

# == Schema Information
#
# Table name: organizations
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  password_digest        :string(255)
#  remember_token_org     :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  about_me               :text
#  url                    :string(255)
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

# == Schema Information
#
# Table name: organizations
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  password_digest        :string(255)
#  remember_token_org     :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  about_me               :text
#  url                    :string(255)
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

# == Schema Information
#
# Table name: organizations
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  password_digest        :string(255)
#  remember_token_org     :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  about_me               :text
#  url                    :string(255)
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

# == Schema Information
#
# Table name: organizations
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  password_digest        :string(255)
#  remember_token_org     :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  url                    :string(255)
#  mission                :text
#  description            :text
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

# == Schema Information
#
# Table name: organizations
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  password_digest        :string(255)
#  remember_token_org     :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  url                    :string(255)
#  mission                :text
#  description            :text
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

# == Schema Information
#
# Table name: organizations
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  password_digest        :string(255)
#  remember_token_org     :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  url                    :string(255)
#  mission                :text
#  description            :text
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

# == Schema Information
#
# Table name: organizations
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  password_digest        :string(255)
#  remember_token_org     :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  url                    :string(255)
#  mission                :text
#  description            :text
#  active_field_1         :string(255)
#  active_field_2         :string(255)
#  active_field_3         :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

# == Schema Information
#
# Table name: organizations
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  password_digest        :string(255)
#  remember_token_org     :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  url                    :string(255)
#  mission                :text
#  description            :text
#  active_field_1         :string(255)
#  active_field_2         :string(255)
#  active_field_3         :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

# == Schema Information
#
# Table name: organizations
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  password_digest        :string(255)
#  remember_token_org     :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  url                    :string(255)
#  mission                :text
#  description            :text
#  active_field_1         :string(255)
#  active_field_2         :string(255)
#  active_field_3         :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#


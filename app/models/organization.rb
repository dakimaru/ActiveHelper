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

class Organization < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :mission, :description, :url, 
                  :facebook_link, :twitter_link, :avatar, :active_field_1, :active_field_2, :active_field_3
  has_attached_file :avatar
  has_secure_password
  
  has_many :reverse_memberships, class_name:  "Membership",   #need to include class name, or otherwise will search for reverse_memberships class, which doesnt exist
                                 dependent:  :destroy           #, foreign_key: "organization_id"      not needed here since it's inferred from the name
  has_many :users, through: :reverse_memberships
  has_many :projects, dependent: :destroy

  before_save { |organization| organization.email = organization.email.downcase }
  before_save { generate_token(:remember_token_org) }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :mission, length: { maximum: 360 }
  validates :description, length: { maximum: 2000 }
   
  def feed
    Micropost.from_organizations_followed_by(self)
  end
  
  def following?(other_organization)
    relationships.find_by_followed_id(other_organization.id)
  end
  
  def follow!(other_organization)
    relationships.create!(followed_id: other_organization.id)
  end
  
  def unfollow!(other_organization)
    relationships.find_by_followed_id(other_organization.id).destroy
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!(:validate => false)
    OrganizationMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Organization.exists?(column => self[column])
  end
end

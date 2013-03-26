# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  password_digest        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  remember_token         :string(255)
#  admin                  :boolean         default(FALSE)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  about_me               :text
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :about_me, :facebook_link,
                  :twitter_link, :avatar
  has_attached_file :avatar
  has_secure_password
  
  has_many :microposts, dependent: :destroy
  
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :reverse_relationships, foreign_key: "followed_id",
                                    class_name:  "Relationship",
                                     dependent:  :destroy
  
  
  has_many :memberships, dependent: :destroy      #, foreign_key: "user_id"         not needed here since it's inferred from the name
  has_many :organizations, through: :memberships
  
# THE FOLLOWING IS TO CREATE A REVERSE MEMBERSHIP TABLE ASSOCIATION -- F NEEDED, ADD
#  has_many :reverse_memberships, foreign_key: "organization_id",
#                                    class_name: "Membership",
#                                    dependent: :destroy
#  has_many :organizations, through: :reverse_memberships, source: :organization


  before_save { |user| user.email = user.email.downcase }
  before_save { generate_token(:remember_token) }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :about_me, length: { maximum: 1000 }
  
  def feed
    Micropost.from_users_followed_by(self)
  end
  
  #for following relationship
  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end
  
  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end
  
  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end
  
  
  #for membership
  def member?(some_organization)
    memberships.find_by_organization_id(some_organization.id)
  end
  def join!(some_organization)
    memberships.create!(organization_id: some_organization.id)
  end
  
  def leave!(some_organization)
    memberships.find_by_organization_id(some_organization.id).destroy
  end
  
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!(:validate => false)
    UserMailer.password_reset(self).deliver
  end
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end

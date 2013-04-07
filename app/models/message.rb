class Message
  include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming
  
    validates_presence_of :name
    validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
    validates_presence_of :subject
    validates_presence_of :body
    validates_length_of :body, :maximum => 1000
  
  attr_accessor :name, :email, :subject, :body
  
  def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def persisted?
      false
    end
  end

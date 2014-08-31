class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username
  before_validation { self.username = username.downcase }
  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
  validates_format_of :username, :with => /\A[a-z0-9]+\z/i
  validates :email, presence: true
  validates_email_format_of :email, message: 'is not in a valid format'
  has_secure_password
  validates :password, length: { minimum: 6 }, :on => :create
  validates :password, length: { minimum: 6 }, allow_blank: true

  before_save { self.email = email.downcase }
  before_save :add_url_protocol
  before_create :create_remember_token

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end

    def add_url_protocol
      if !self.website.nil?
        unless self.website[/^https?:\/\//]
          self.website = "http://#{self.website}"
        end
      end
    end
end

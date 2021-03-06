class User < ActiveRecord::Base
  has_many :rivers
  has_many :active_relationships, class_name:  "Relationship",
           foreign_key: "favoriter_id",
           dependent:   :destroy
  has_many :favorites, through: :active_relationships, source: :favorited


  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true


  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    begin
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    rescue
      log_out
    end
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Favorites a river.
  def favorite(id)
    active_relationships.create(favorited_id: id)
  end

  # removes favorite river.
  def remove_favorite(id)
    active_relationships.find_by(favorited_id: id).destroy
  end

  # returns true if user favorites river
  def following?(river)
    favorites.include?(river)
  end
end

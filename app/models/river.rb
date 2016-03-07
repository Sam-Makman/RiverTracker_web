class River < ActiveRecord::Base
    belongs_to :user
    has_many :active_relationships, class_name:  "Relationship",
             foreign_key: "favorited_id",
             dependent:   :destroy
    has_many :favoriters, through: :active_relationships, source: :favorited

    mount_uploader :picture, PictureUploader

    validates :name,  presence: true
    validates :section, presence: true
    validates :difficulty, presence: true
    validates :state, length:{is:2}, presence: true
    validate :usgs_validator
    validate  :picture_size

  private
  def usgs_validator
    if (self.usgs_id.strip.length != 0) && (self.usgs_id.length != 8)
      errors.add(:usgs_id, "should either be blank or an 8 digit number")
    end
  end

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end

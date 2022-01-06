class Post < ApplicationRecord
    default_scope { order(created_at: :desc)}
    mount_uploader :image, ImageUploader
    attribute :total_likes_count, :integer, default: 0
    attribute :total_comments_count, :integer, default: 0

    belongs_to :account
    has_many :likes
    has_many :comments
    
    before_create :set_active

    scope :active, -> { where active: true }
    
    def set_active
        self.active = true
    end

end

class Product < ActiveRecord::Base
  # include ActiveStorageSupport::SupportForBase64

  has_one_attached  :image

  has_many :categories
  accepts_nested_attributes_for :categories
  has_one_attached :image, :dependent=> :destroy
 mount_uploader :image, ImageUploader
  serialize :avatars, JSON # If you use SQLite, add this line.

  validates :name, presence: true, if: :step1?
  validates :quantity, numericality: true, if: :step2?
  validates :tags, presence: true, if: :step3?

  include MultiStepModel

  def self.total_steps
    3
  end

end

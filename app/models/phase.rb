# == Schema Information
#
# Table name: phases
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  slug        :string
#  row         :integer
#  published   :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  color       :string
#  path_id     :integer
#
# Indexes
#
#  index_phases_on_path_id  (path_id)
#

class Phase < ActiveRecord::Base
  include RankedModel
  ranks :row, with_same: :path_id

  extend FriendlyId
  friendly_id :name

  belongs_to :path
  has_many :course_phases
  has_many :courses, -> { uniq }, through: :course_phases

  after_initialize :default_values

  scope :published, -> { where(published: true) }
  validates :path, presence: true

  def next
    Phase.published.order(:row).where('row > ?', self.row).first
  end

  private
    def default_values
      self.published ||= false
    rescue ActiveModel::MissingAttributeError => e
      # ranked_model makes partial selects and this error is thrown
    end
end

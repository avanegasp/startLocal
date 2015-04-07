# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(100)
#  roles           :string           is an Array
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  last_active_at  :datetime
#  profile         :hstore
#  status          :integer
#  settings        :hstore
#

class User < ActiveRecord::Base
  attr_accessor :password_confirmation
  has_secure_password validations: false

  has_many :solutions, dependent: :destroy
  has_and_belongs_to_many :resources

  hstore_accessor :profile,
    first_name: :string,
    gender: :string,
    birthday: :date,
    mobile_number: :string,
    optimism: :string,
    mindset: :string,
    motivation: :string,
    activated_at: :datetime

  hstore_accessor :settings,
    password_reset_token: :string,
    password_reset_sent_at: :datetime

  enum status: [:created, :active]

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, presence: true, length: { within: 6..40 }, on: :create
  validates :password, presence: true, length: { within: 6..40 }, if: :password_digest_changed?
  validates :password_confirmation, presence: true, on: :update, if: :password_digest_changed?
  validates_confirmation_of :password, on: :update, if: :password_digest_changed?


  after_initialize :default_values

  def has_role?(role)
    roles && roles.include?(role)
  end

  def is_admin?
    has_role?("admin")
  end

  def str_status
    active? ? "Activo" : "Sin Activar"
  end

  def str_optimism
    return "" if optimism.nil?
    optimism == "high" ? "alto" : "bajo"
  end

  def progress(course)
    resources_count = course.resources.published.count
    challenges_count = course.challenges.published.count
    return 1.0 if (resources_count + challenges_count == 0)

    completed_resources = self.resources.published.where(course_id: course.id).count
    completed_challenges = self.solutions.completed.joins(:challenge).where('challenges.course_id = ?', course.id).count

    (completed_resources + completed_challenges).to_f/(resources_count + challenges_count).to_f
  end

  def send_password_reset
    generate_token
    self.password_reset_sent_at = Time.current
    save!
    UserMailer.password_reset(self).deliver_now
  end

  private
    def default_values
      self.roles ||= ["user"]
    end

    def generate_token
      begin
        self.settings = { password_reset_token: SecureRandom.urlsafe_base64 }
      end while  User.exists?(["settings -> 'password_reset_token' = '#{self.settings['password_reset_token']}'"])
    end
end

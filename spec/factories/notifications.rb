# == Schema Information
#
# Table name: notifications
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  status            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  notification_type :integer
#  data              :json
#
# Indexes
#
#  index_notifications_on_created_at  (created_at)
#  index_notifications_on_status      (status)
#  index_notifications_on_user_id     (user_id)
#

FactoryGirl.define do
  factory :notification do
    user { create(:user) }
    status Notification.notification_types[:notice]
    data { { message: Faker::Lorem.sentence } }
  end
end

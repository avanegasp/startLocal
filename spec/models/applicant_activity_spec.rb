# == Schema Information
#
# Table name: applicant_activities
#
<<<<<<< HEAD
#  id             :integer          not null, primary key
#  applicant_id   :integer
#  user_id        :integer
#  comment_type   :integer
#  comment        :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  info           :hstore
#  type           :string
#  current_status :string
#  past_status    :string
#  subject        :string
#  body           :text
=======
#  id           :integer          not null, primary key
#  applicant_id :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  info         :hstore
#  type         :string
>>>>>>> 8d47a6cd8669436c2acf0afdbec97e2147f8d226
#

require 'rails_helper'

RSpec.describe ApplicantActivity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

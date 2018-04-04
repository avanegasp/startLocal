require 'rails_helper'

RSpec.feature "EmailApplicantActivities", type: :feature do

  scenario "send email to top applicant", js: true do
    ActionMailer::Base.deliveries.clear
    visit login_path
    visit on_site_login_path

    fill_in "email", with: "David"


  end
end

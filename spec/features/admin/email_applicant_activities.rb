require 'rails_helper'

RSpec.feature "EmailApplicantActivities", type: :feature do

  scenario "send email to top applicant", js: true do
    ActionMailer::Base.deliveries.clear
    visit  "/top"

    find('button[type="button"]').click
    find('input[type="checkbox"]').click
    find('.next[type="button"]').click

    fill_in "first-name", with: "Pedro"
    fill_in "last-name", with: "Perez"
    fill_in "email", with: "lead@example.com"
    fill_in "birthday", with: "12/05/2016"
    select "Otro", from: 'gender'
    select "Colombia", from: 'country'
    expect(page).to have_selector '#mobile'
    fill_in "mobile", with: "3131234567"
    fill_in "applicant[skype]", with: "3131234567"
    fill_in "applicant[twitter]", with: "vanegaspinto"
    fill_in "applicant[url]", with: "www.davidcillo.com"

    #
    find('.next[type="button"]').click
    fill_in "goal", with: "mi motivación es aprender"
    fill_in "experience", with: "1 año"
    fill_in "additional", with: "me gustan los animales"
    find('.finish[type="button"]').click

    #
    expect(current_path).to eq thanks_top_path
    #
  end
end

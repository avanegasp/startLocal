class ApplicationMailer < ActionMailer::Base
  default from: "info@makeitreal.camp"
  layout 'mailer'

  helper ApplicationHelper
end

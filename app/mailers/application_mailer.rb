class ApplicationMailer < ActionMailer::Base
  default from: "dontreply@tome.com"
  layout 'mailer'
end

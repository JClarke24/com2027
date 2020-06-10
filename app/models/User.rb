class User < ActiveRecord::Base
  include MailForm::Delivery

  append :remote_ip, :user_agent, :session
  attributes :name, :email, :created_at

  def headers
    {
      :to => "your.email@your.domain.com",
      :subject => "User created an account"
    }
  end
end

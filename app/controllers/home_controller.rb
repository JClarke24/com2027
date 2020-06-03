class HomeController < ApplicationController
  def home
  end
  def admins
  end
  def warnUser
    report = params[:report]
    report.action = true
    report.save!
  end
  def banUser
  end
end

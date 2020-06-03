class HomeController < ApplicationController
  def home
  end
  def admins
  end
  def warnUser
    #mark the report as actioned so it doesn't show up again in the list
    report = Report.find(params[:report])
    report.action = true
    report.save!
    #warn the user - set a flag on their account
    if(report.user_type =='tutor') then
    user = Tutor.find(report.user_id)
    #if a warning already exists (this would be their second warning) then ban
    if (user.warned == true) then
      user.banned = true
      user.flag_reason = report.reason
      user.save!
    else
      user.warned = true
      user.flag_reason = report.reason
      user.save!
    end
  else
    user = Student.find(report.user_id)
    #if a warning already exists (this would be their second warning) then ban
    if (user.warned == true) then
      user.banned = true
      user.save!
    else
      user.warned = true
      user.save!
  end
 end
end
  def banUser
  end
end

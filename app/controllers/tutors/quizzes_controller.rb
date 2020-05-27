class Tutors::QuizzesController < ApplicationController
  include Accessible_tutor
  before_action :authenticate_tutor!

  def tutortest
  end

  def english
  end

  def spanish
  end

  def german
  end

  def french
  end

  def success
    current_tutor.approved!
    redirect_to authenticated_tutor_root_path
  end

end

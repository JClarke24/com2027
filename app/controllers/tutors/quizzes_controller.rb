class Tutors::QuizzesController < ApplicationController
  include Accessible_tutor
  before_action :authenticate_tutor!

  def show
    @tutor = current_tutor
  end

end

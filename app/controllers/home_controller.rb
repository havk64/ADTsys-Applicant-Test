class HomeController < ApplicationController
  def index
    @makes = Make.all
    update_makes
  end

  private
    def update_makes
      @check = UpdateMakes.new
      @check.update
    end
end

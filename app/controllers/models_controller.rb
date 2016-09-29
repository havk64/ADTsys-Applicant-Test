class ModelsController < ApplicationController
  def index
    @make = set_make
    @models = Model.where(make_id: @make.id)
    update_models
  end

  private
    def update_models
      @check = UpdateModels.new(@make, params[:webmotors_make_id])
      @check.update
    end
    def set_make
      @make = Make.where(webmotors_id: params[:webmotors_make_id])[0]
    end
end

class ModelsController < ApplicationController
  before_action :set_make, only: [:index]

  def index
    @models = Model.where(make_id: @make.id)
    update_models
  end

  private
    def update_models
      @check = UpdateModels.new(set_make, set_params)
      @check.update
    end

    def set_make
      @make = Make.where(webmotors_id: set_params)[0]
    end

    def set_params
      params.require(:webmotors_make_id)
    end
end

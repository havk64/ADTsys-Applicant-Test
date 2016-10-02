class UpdateModels < UpdateAPI
  def initialize(make, params)
    @make   = make
    @path   = '/carro/modelos'
    @data   = { marca: params }
    @size   = Model.where(make_id: @make.id).size
  end

  def add_to_db(json)
    # Itera no resultado e grava os modelos que ainda não estão persistidas
    json.each do |item|
      if Model.where(name: item['Nome'], make_id: @make.id).size.zero?
        Model.create(make_id: @make.id, name: item['Nome'])
      end
    end
  end
end

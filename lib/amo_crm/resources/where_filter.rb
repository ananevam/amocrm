module AmoCRM::Resources::WhereFilter

  # Возвращает список элементов по переданному фильтру.
  # Например:
  # > universe.features.where goodUuid: uuid
  #
  # @return [Array of AmoCRM::Entities::Base]
  #
  def where filter
    values.select { |v| filtered? v, filter }
  end

  # Возвращает первый найденный по фильтру элемент или
  # nil
  #
  # @return AmoCRM::Entities::Base || nil
  def findWhere filter
    where(filter).first
  end

  private

  def filtered? o, filter={}
    filter.select { |k,v| o.send(k)==v }.count == filter.keys.count
  end
end

class AppSerializer < ActiveModel::Serializer
  def attributes(*args)
    hash = super
    hash.each do |key, value|
      next unless value.nil?

      k = {}
      k[key] = ''
      hash = hash.merge(k)
    end
    hash
  end
end

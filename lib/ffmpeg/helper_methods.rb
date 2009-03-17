module FFMpeg
  module HelperMethods
    def returning(value)
      yield  value
      return value
    end
  end
end
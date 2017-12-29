class Book < ApplicationRecord
  before_save :default_values

  private

    def default_values
      self.available = true
    end

end

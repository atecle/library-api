class Book < ApplicationRecord
  before_save :default_values
  validates :title, :author, presence: true

  private

    def default_values
      self.available = true
    end

end

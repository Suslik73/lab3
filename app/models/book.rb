class Book < ActiveRecord::Base
  attr_accessible :author, :state, :title, :year
  validates :title, :presence => true
  validates :author, :presence => true
  validates :year, :presence => true

    state_machine initial: :unpublished do
      event :unpublish do
        transition all => :unpublished
      end

      event :publish do
        transition all => :published
      end

      event :delete do
        transition all => :deleted
      end
    end
end

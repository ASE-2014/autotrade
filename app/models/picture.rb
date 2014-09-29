class Picture < ActiveRecord::Base
  belongs_to :auction
  validates_format_of :url, with: /(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?/ix #TODO: There should be a reaction in the view.

end

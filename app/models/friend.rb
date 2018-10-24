class Friend < ApplicationRecord
  validates :followfrom_id, presence: true
  validates :followto_id, presence: true
end

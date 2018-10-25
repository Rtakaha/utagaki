class Friend < ApplicationRecord
  validates :followfrom_id, presence: true
  validates :followto_id, presence: true

  before_destroy :should_not_destroy_if_presence

  private

  def should_not_destroy_if_presence
    if followfrom_id.nil? || followto_id.nil?
      throw :abort
    end
  end

end

class Task < ApplicationRecord
  validate :validate_name_not_including_comma
  validates :name,presence:true,uniqueness:true,length: {maximum: 30}
  before_validation :set_mameles_mame
  belongs_to :user


 scope :recent,->{order(created_at: :desc)}
private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end

  def set_mameles_mame
    self.name="名前なし" if name.blank?
  end
end

# == Schema Information
#
# Table name: lunchboxes
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  price      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :lunchbox do
  end
end

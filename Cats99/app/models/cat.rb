# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'date'
require 'action_view'
class Cat < ApplicationRecord

    include ActionView::Helpers::DateHelper

    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion: { in: ['Calico', 'Black', 'White', "Tabby", "Gray", "Orange", "Spotted", "Other"]}
    validates :sex, inclusion: {in: ['M', "F"]}

    def age
        return DateTime.now.year - self.birth_date.year
    end

end

require 'rails_helper'

RSpec.describe Lecture, type: :model do
  describe 'validate must_be_hope_day_after_today' do
    context '授業を登録する日について' do
      let(:lecture) { build(:lecture, hope_day: Date.today - 1) }
      
      it '前日であれば無効である' do
        lecture.valid?
        expect(lecture).not_to be_valid
      end
    end
  end
end

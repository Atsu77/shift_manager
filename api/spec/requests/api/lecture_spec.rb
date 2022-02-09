require 'rails_helper'

RSpec.describe 'Api::Lectureclasses', type: :request do
  before do
    @student = FactoryBot.create(:student)
    @auth_tokens, @student_id = sign_in_id('students')
  end

  describe 'create: POST /api/students/:student_id/lecture' do
    context 'パラメータが有効な場合' do
      it 'ステータスコード200が返ってくること' do
        params = FactoryBot.attributes_for(:lecture)
        post "/api/students/#{@student_id}/lecture", params: params, headers: @auth_tokens
        expect(response.status).to eq(200)
      end
    end

    context '今日より前の日付をhope_dayに設定すると' do
      it 'ステータスコード422が返ってくること' do
        params = FactoryBot.attributes_for(:lecture, hope_day: Time.zone.today - 1)
        post "/api/students/#{@student_id}/lecture", params: params, headers: @auth_tokens
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'delete: DELETE /api/students/:student_id/lecture/:id' do
    let(:lecture) { @student.lectures.create(FactoryBot.attributes_for(:lecture)) }
    it 'ステータスコード200が返ってくること' do
      delete "/api/students/#{@student_id}/lecture/#{lecture.id}", headers: @auth_tokens
      expect(response.status).to eq(200)
    end
  end
end

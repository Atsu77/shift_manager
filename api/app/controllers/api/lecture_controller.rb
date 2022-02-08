class Api::LectureController < ApplicationController
  before_action :authenticate_api_student!, only: %i[create]
  before_action :set_lecture_class, only: %i[destroy]

  def create
    lecture = current_api_student.lectures.build(lecture_class_params)
    if lecture.save
      render json: lecture
    else
      render json: lecture.errors, status: 422
    end
  end

  def destroy
    @lecture = current_api_student.lectures.find(params[:id])
    binding.pry
    if @lecture.destroy
      render json: @lecture_class
    else
      render json: @lecture_class.errors, status: 422
    end
  end

  private
  def lecture_class_params
    params.permit(:timetable_id, :subject_id, :hope_day)
  end

  def set_lecture_class
    binding.pry
    @lecture = current_api_student.lectures.find(params[:id])
  end
end

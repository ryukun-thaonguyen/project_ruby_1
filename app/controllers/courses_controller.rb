class CoursesController < ApplicationController
  before_action :auth

  def show
    return @course = Course.find(params[:id]) if current_user.role
    @user_courses = UserCourse.find_by(course_id: params[:id], user_id: current_user.id)
  end

  def create
    @course = Course.new(course_params)
    @course.user_id = current_user.id
    if @course.save
      flash[:success] = t('course.create_course_m_s')
      redirect_to home_path
    else
      flash[:danger] = t('course.create_course_m_f')
      redirect_to home_path
    end
  end

  def add_people_view
    @course = Course.find(params[:id])
    @user_courses = @course.user_courses
  end

  def add_people
    @course = Course.find([params[:id]])
    @user = User.find_by(email: params[:email])
    @tasks = @course[0].tasks
    unless @tasks.nil?
      @tasks.each do |i|
       unless UserTask.new(user_id: @user.id, task_id: i.id).save
        flash[:danger] = t('course.add_people_m_f')
        redirect_to "/courses/#{@course[0].id}/add-people"
       end
      end
    end
    @user_course = UserCourse.new(user_id: @user.id, course_id: @course[0].id)
    if @user_course.save
      flash[:success] = t('course.add_people_m_s')
    else
      flash[:danger] = t('course.add_people_m_f')
    end
    redirect_to "/courses/#{@course[0].id}/add-people"
  end

  private

  def course_params
    params.require(:course).permit(:name, :description,:start_date, :end_date)
  end

  def auth
    redirect_to root_url unless logged_in?
  end
end

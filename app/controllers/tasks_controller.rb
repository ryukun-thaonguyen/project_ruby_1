class TasksController < ApplicationController

  def show
    @task = Task.find_by(params[:id])
  end

  def edit
    @task = Task.find_by(params[:id])
  end

  def update
    @task = Task.find_by(params[:id])
    if @task.update(task_params)
      flash[:success] = t('task.update_task_m_s')
      redirect_to @task
    else
      flash[:danger] = t('task.update_task_m_f')
      redirect_to @task
    end
  end

  def create
    @task = Task.new(task_params)
    @course = Course.find_by(id: task_params[:course_id])
    @user_courses = UserCourse.find_by(course_id: @course.id)
    if @task.save
      unless @user_courses.nil?
        @user_courses.each do |i|
          @user_task = UserTask.new(user_id: i.user_id, task_id: @task.id)
          unless @user_task.save
            flash[:danger] = t('task.create_task_m_f')
            redirect_to @course
          end
        end
      end
      flash[:success] = t('task.create_task_m_s')
      redirect_to @course
    else 
      flash[:danger] = t('task.create_task_m_f')
      redirect_to @course
    end
  end

  def finish_task
    @task = Task.find_by(params[:id])
    @user_task = UserTask.find_by(user_id: current_user.id, task_id: @task.id)
    @user_task.status = true
    if @user_task.save
      flash[:success] = t('task.finish_task_m_s')
      redirect_to @task
    else
      flash[:success] = t('task.finish_task_m_f')
      redirect_to @task
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :course_id, :description,:due_date)
  end
end

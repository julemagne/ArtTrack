class TimeEntriesController < ApplicationController
  before_action :require_login
  before_action :set_time_entry, only: [:show, :edit, :update, :destroy]
  before_action :validate_user, except: [:index, :clock_in, :clock_out]

  # GET /time_entries
  def index
    if params[:id]
      @project = Project.find(params[:id])
      @time_entries = TimeEntry.where('project_id = ?', @project.id)
      @time_entries_day = @time_entries.where('date > ?', Time.current - 1.day)
      @time_entries_week = @time_entries.where('date > ?', 1.week.ago)
      @time_entries_month = @time_entries.where('date > ?', 1.month.ago)
    else
      redirect_to dashboard_user_path(@current_user.id), notice: "You must specify a project to view time entries."
    end
  end

  # GET /time_entries/1
  def show
  end

  # GET /time_entries/1/edit
  def edit
  end

  # PATCH/PUT /time_entries/1
  def update
    time_entry = TimeEntry.new(time_entry_params)
    total_time = time_entry.stop_time - time_entry.start_time
    if total_time > 0 && @time_entry.update(time_entry_params)
      @time_entry.total_time = total_time
      @time_entry.save
      redirect_to @time_entry, notice: 'Time entry was successfully updated.'
    else
      flash.now[:error] = "Time entry could not be saved"
      render :edit
    end
  end

  # DELETE /time_entries/1
  def destroy
    project_id = @time_entry.project_id
    @time_entry.destroy
    redirect_to time_entries_url(id: project_id), notice: 'Time entry was successfully destroyed.'
  end

  def clock_in
    unless clocked_in?
      @time_entry = TimeEntry.new(time_entry_params)
      @time_entry.start_time = Time.zone.now
      @time_entry.save
      redirect_to project_path(@time_entry.project_id), notice: "Time entry started"
    else
      flash[:error] = "You must clock out before clocking in again."
      redirect_to project_path(time_entry_params[:project_id])
    end
  end

  def clock_out
    @time_entry = TimeEntry.where('project_id = ?', params[:time_entry][:project_id]).last
    if @time_entry.stop_time
      redirect_to project_path(@time_entry.project_id),
        alert: 'You must clock in before clocking out.'
    else
      start = @time_entry.start_time
      @time_entry.update(stop_time: Time.zone.now,
      date: Time.zone.now.to_date,
      total_time: (Time.zone.now - start).round)
      redirect_to project_path(@time_entry.project_id), notice: 'Time entry was successfully saved.'
    end
  end

  private
    # So that people cannot PATCH and DELETE unless they are the @current_user
    def time_entry_scope
      TimeEntry.where(project_id: Project.where(user_id: @current_user.id).pluck(:id))
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_time_entry
      @time_entry = TimeEntry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def time_entry_params
      params.require(:time_entry).permit(:start_time, :stop_time, :total_time, :date, :project_id)
    end

    def validate_user
      user = @time_entry.project.user
      redirect_to dashboard_user_path(session[:user_id]) unless user == @current_user
    end
end

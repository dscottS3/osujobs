class JobLogsController < ApplicationController
  before_action :set_job_log, only: [:show, :edit, :update, :destroy]

  # GET /job_logs
  # GET /job_logs.json
  def index
    @job_logs = JobLog.all
  end

  # GET /job_logs/1
  # GET /job_logs/1.json
  def show
  end

  # GET /job_logs/new
  def new
    @job_log = JobLog.new
  end

  # GET /job_logs/1/edit
  def edit
  end

  # POST /job_logs
  # POST /job_logs.json
  def create
    @job_log = JobLog.new(job_log_params)

    respond_to do |format|
      if @job_log.save
        format.html { redirect_to @job_log, notice: 'Job log was successfully created.' }
        format.json { render action: 'show', status: :created, location: @job_log }
      else
        format.html { render action: 'new' }
        format.json { render json: @job_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_logs/1
  # PATCH/PUT /job_logs/1.json
  def update
    respond_to do |format|
      if @job_log.update(job_log_params)
        format.html { redirect_to @job_log, notice: 'Job log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_logs/1
  # DELETE /job_logs/1.json
  def destroy
    @job_log.destroy
    respond_to do |format|
      format.html { redirect_to job_logs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_log
      @job_log = JobLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_log_params
      params[:job_log]
    end
end

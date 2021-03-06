class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: [:show, :edit, :update, :destroy]
  before_action :check_for_new_jobs, only: [:index]

  # GET /job_postings
  # GET /job_postings.json
  def index
    @search = JobPosting.search(params[:q])
    @job_postings = @search.result.order('title ASC').page params[:page]
  end

  # GET /job_postings/1
  # GET /job_postings/1.json
  def show
  end

  # GET /job_postings/new
  def new
    @job_posting = JobPosting.new
  end

  # GET /job_postings/1/edit
  def edit
  end

  # POST /job_postings
  # POST /job_postings.json
  def create
    @job_posting = JobPosting.new(job_posting_params)

    respond_to do |format|
      if @job_posting.save
        format.html { redirect_to @job_posting, notice: 'Job posting was successfully created.' }
        format.json { render action: 'show', status: :created, location: @job_posting }
      else
        format.html { render action: 'new' }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_postings/1
  # PATCH/PUT /job_postings/1.json
  def update
    respond_to do |format|
      if @job_posting.update(job_posting_params)
        format.html { redirect_to @job_posting, notice: 'Job posting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_postings/1
  # DELETE /job_postings/1.json
  def destroy
    @job_posting.destroy
    respond_to do |format|
      format.html { redirect_to job_postings_url }
      format.json { head :no_content }
    end
  end

  def check_for_new_jobs
    job_log = JobLog.order('created_at DESC').first
    
    if (job_log.blank?) || job_log.created_at < DateTime.now.yesterday.beginning_of_day
      %x[rake job_postings:fetch RAILS_ENV=development]
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_posting
      @job_posting = JobPosting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_posting_params
      params.require(:job_posting).permit(:title, :published, :link, :description, :osu_job_id, :department_id, q: [:title_cont])
    end
end

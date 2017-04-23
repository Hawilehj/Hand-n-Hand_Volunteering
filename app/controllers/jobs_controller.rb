class JobsController < ApplicationController
  #These actions are to check prior for jobs controller
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  # An org is required to be logged in to create or destroy
  before_action :logged_in_organization, only: [:create, :destroy]

  # The two comments below are generated from rails, rather generic will appear for other
  # controllers that have been generated from command line
  # GET /jobs
  # GET /jobs.json


  def index
    # Any where .paginate is acts as a function to create pages based on
    # how many lists per page (ex. 10 per page)
    @jobs = Job.paginate(page: params[:page], :per_page => 5)
  end

  #The 4 below are filtered by type that I have specified on the view, and have a specific page for each

  def school
    @jobs = Job.where(job_type: 'school')
  end

  def hospital
    @jobs = Job.where(job_type: 'hospital')
  end

  def animal_shelter
    @jobs = Job.where(job_type: 'animal shelter')
  end

  def church
    @jobs = Job.where(job_type: 'church')
  end

  # Generated comment
    # GET /jobs/1
    # GET /jobs/1.json

  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json

  # Here comes the fun part so location is the parent table and jobs is the child table
  # thus each job refers back to the parent table which allows on the view for jobs to be
  # created directly within each location page
  def create
    @location = Location.find(params[:location_id])
    @job = @location.jobs.create(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to location_path(@location), notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :text, :date, :job_type)
    end
end
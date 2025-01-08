class JobController < ApplicationController
    protect_from_forgery with: :null_session
    def index
        @job = Job.all
        render json: @job
    end
    def create
      # Create a new job with all permitted parameters
      new_job = Job.create(job_params)
  
      if new_job.persisted?
        render json: { job: new_job }, status: :created
      else
        render json: { errors: new_job.errors.full_messages }, status: :unprocessable_entity
      end
    end
    def type
        employment_type = params[:employment_type]

        if employment_type.present?
            @jobs = Job.where(employment_type: employment_type)
            render json: @jobs
        else
            render json: { error: 'employment_type parameter is missing' }, status: :bad_request
        end
    end
    private
  
    def job_params
      params.require(
        :job_title
        ).permit(
        :url, 
        :employer_name, 
        :employer_description, 
        :job_title, 
        :job_description, 
        :year_of_exp, 
        :education, 
        :industry, 
        :salary, 
        :employment_type
        )
    end
  end
  
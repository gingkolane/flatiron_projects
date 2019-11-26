class StudiesController < ApplicationController
  before_action :set_study, only: [:show, :edit, :update, :destroy]


  def index
    @studies = Study.all
  end

  def show
  end

  private
    def set_study
      @study = Study.find(params[:id])
    end

    def study_params
      params.require(:study).permit(:NCT_ID, :BRIEF_TITLE, :BRIEF_SUMMARY, :OVERALL_STATUS, :START_DATE, :START_DATE_TYPE, :COMPLETION_DATE, :COMPLETION_DATE_TYPE, :PHASE, :STUDY_TYPE, :ENROLLMENT_TYPE, :ENROLLMENT, :CRITERIA, :GENDER, :MINIMUM_AGE, :MAXIMUM_AGE, :URL)
    end
end

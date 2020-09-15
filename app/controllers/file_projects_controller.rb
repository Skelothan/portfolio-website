class FileProjectsController < ApplicationController
  before_action :set_file_project, only: [:show, :edit, :update, :destroy]
  before_action :set_resources, only: [:new, :edit, :update]
  authorize_resource

  # GET /file_projects
  # GET /file_projects.json
  def index
    @file_projects = FileProject.all
  end

  # GET /file_projects/1
  # GET /file_projects/1.json
  def show
  end

  # GET /file_projects/new
  def new
    @file_project = FileProject.new
  end

  # GET /file_projects/1/edit
  def edit
  end

  # POST /file_projects
  # POST /file_projects.json
  def create
    @file_project = FileProject.new(file_project_params)

    respond_to do |format|
      if @file_project.save
        format.html { redirect_to @file_project, notice: 'File project was successfully created.' }
        format.json { render :show, status: :created, location: @file_project }
      else
        format.html { render :new }
        format.json { render json: @file_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_projects/1
  # PATCH/PUT /file_projects/1.json
  def update
    respond_to do |format|
      if @file_project.update(file_project_params)
        format.html { redirect_to @file_project, notice: 'File project was successfully updated.' }
        format.json { render :show, status: :ok, location: @file_project }
      else
        format.html { render :edit }
        format.json { render json: @file_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_projects/1
  # DELETE /file_projects/1.json
  def destroy
    @file_project.destroy
    respond_to do |format|
      format.html { redirect_to file_projects_url, notice: 'File project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_project
      @file_project = FileProject.find(params[:id])
    end

    def set_resources
      @files = UploadedFile.all.collect{|f| [f.name, f.id]}
      @projects = Project.all.collect{|p| [p.name, p.id]}
    end

    # Only allow a list of trusted parameters through.
    def file_project_params
      params.require(:file_project).permit(:uploaded_file_id, :project_id)
    end
end

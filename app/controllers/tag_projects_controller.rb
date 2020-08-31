class TagProjectsController < ApplicationController
  before_action :set_tag_project, only: [:show, :edit, :update, :destroy]
  authorize_resource

  # GET /tag_projects
  # GET /tag_projects.json
  def index
    @tag_projects = TagProject.all
  end

  # GET /tag_projects/1
  # GET /tag_projects/1.json
  def show
  end

  # GET /tag_projects/new
  def new
    @tag_project = TagProject.new
  end

  # GET /tag_projects/1/edit
  def edit
  end

  # POST /tag_projects
  # POST /tag_projects.json
  def create
    @tag_project = TagProject.new(tag_project_params)

    respond_to do |format|
      if @tag_project.save
        format.html { redirect_to @tag_project, notice: 'Tag project was successfully created.' }
        format.json { render :show, status: :created, location: @tag_project }
      else
        format.html { render :new }
        format.json { render json: @tag_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag_projects/1
  # PATCH/PUT /tag_projects/1.json
  def update
    respond_to do |format|
      if @tag_project.update(tag_project_params)
        format.html { redirect_to @tag_project, notice: 'Tag project was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag_project }
      else
        format.html { render :edit }
        format.json { render json: @tag_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_projects/1
  # DELETE /tag_projects/1.json
  def destroy
    @tag_project.destroy
    respond_to do |format|
      format.html { redirect_to tag_projects_url, notice: 'Tag project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_project
      @tag_project = TagProject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_project_params
      params.require(:tag_project).permit(:project_id, :tag_id)
    end
end

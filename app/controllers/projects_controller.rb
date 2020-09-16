class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_resources, only: [:new, :edit, :update]
  authorize_resource

  # GET /projects
  # GET /projects.json
  def index
    if logged_in_as_webmaster?
      @projects = Project.all
    else
      @projects = Project.active
    end
    @title = "All"
  end

  def index_gamedev
    @projects = Project.for_category("Game Development").by_priority
    if not logged_in_as_webmaster?
      @projects = @projects.active
    end
    @title = "Game Development"
    render :index
  end

  def index_webdev
    @projects = Project.for_category("Web Development").by_priority
    if not logged_in_as_webmaster?
      @projects = @projects.active
    end
    @title = "Web Development"
    render :index
  end

  def index_gameaudio
    @projects = Project.for_category("Game Audio").by_priority
    if not logged_in_as_webmaster?
      @projects = @projects.active
    end
    @title = "Game Music and Sound Design"
    render :index
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @gallery = @project.uploaded_files.has_media_type("image")
    @links = @project.links
    @files = @project.uploaded_files.not_media_type("image")
    @tags = @project.tags.by_name
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
      if not (@project.active or logged_in_as_webmaster?) then
        flash[:error] = "Guests are not able to view that page."
        redirect_to projects_path
      end
      @back_link = back_link(@project)
    end

    def set_resources
      @thumbnails = UploadedFile.has_media_type("image").collect{|f| [f.name, f.id]}
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :start_date, :end_date, :short_description, :description, :active, :thumbnail_id, :category, :priority)
    end

    # Clicking "back" on a project show page sends to the correct index:
    def back_link(project)
      if project.active then
        if project.category == "Game Development"
            return gamedev_path
        elsif project.category == "Game Audio"
            return gameaudio_path
        elsif project.category == "Web Development"
            return webdev_path
        end
      end
      return projects_path
  end
end

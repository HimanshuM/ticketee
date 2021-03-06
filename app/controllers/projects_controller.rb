class ProjectsController < ApplicationController
	before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
		@projects = Project.all
    end

    def new
		@project = Project.new
    end

	def show
	end

	def edit
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			flash[:notice] = "Project has been created."
			redirect_to @project
		else
			flash[:alert] = "Project has not been created."
			render "new"
		end
	end

	def update
		if @project.update project_params
			flash[:notice] = "Project has been updated successfully."
			redirect_to @project
		else
			flash[:alert] = "Failed to update project"
			render "edit"
		end
	end

	def destroy
		@project.destroy

		flash[:notice] = "Project has been deleted"
		redirect_to projects_path
	end

	private
	def project_params
		params.require(:project).permit(:name, :description)
	end

	private
	def set_project
		@project = Project.find params[:id]
		rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The project you were looking for does not exist"
		redirect_to projects_path
	end
end

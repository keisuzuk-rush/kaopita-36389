class FacesController < ApplicationController
  def index
		@faces = Face.order("created_at DESC")
  end

	def new
		@face = Face.new
	end

	def create
		@face = Face.new(face_params)
    if @face.save
      redirect_to faces_path
    else
      render :new
    end
	end

	def show
		@face = Face.find(params[:id])
	end

	private

	def face_params
		params.require(:face).permit(:image, :text, :skill, :hobby, :gender_id, :birthplace_id, :department_id, :history_id).merge(user_id: current_user.id)
	end

end

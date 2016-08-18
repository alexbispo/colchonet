class UsersController < ApplicationController

	def show 
		set_user
	end

	def new 
		@user = User.new
	end

	def create
		@user = User.new user_params
		if @user.save
			Signup.confirm_email(@user).deliver_now
			redirect_to @user, notice: 'Cadastro criado com sucesso!'
		else
			render :new
		end
	end

	def edit 
		set_user
	end

	def update 
		set_user
		if @user.update user_params
			redirect_to @user, notice: 'Cadastro atualizado com sucesso!'
		else
			render :edit
		end
	end

	private

	def user_params
		params.require(:user).permit(:full_name, :location, :email, :password, :password_confirmation, :bio)
	end

	def set_user
		@user = User.find params[:id]
	end

end
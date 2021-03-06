# frozen_string_literal: true

class UsersController < ProtectedController
  skip_before_action :authenticate, only: %i[signup signin] # removed show and index

  #  def create
  #   @user = User.new(user_params)
  #   # @user = current_user.users.new(user_params)
  #
  #   if @user.save
  #     render json: @user, status: :created, location: @user
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  # end

  def show
    # Test user show action in browser
    # if you just want to see your own user profile, change to render json: current_user
    render json: current_user # (OR) User.find(params[:id])
  end

  def index
    render json: User.all
  end

  # PATCH/PUT /users/1
  def update
    @user = current_user
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user/1
  def destroy
    current_user.destroy
    head :no_content
  end

  # POST '/sign-up'
  def signup
    user = User.create(user_creds)
    if user.valid?
      render json: user, status: :created
    else
      render json: user.errors, status: :bad_request
    end
  end

  # POST '/sign-in'
  def signin
    creds = user_creds
    if (user = User.authenticate creds[:email],
                                 creds[:password])
      render json: user, serializer: UserLoginSerializer, root: 'user'
    else
      head :unauthorized
    end
  end

  # DELETE '/sign-out'
  def signout
    current_user.logout
    head :no_content
  end

  # PATCH '/change-password/:id'
  def changepw
    # if the the old password authenticates,
    # the new one is not blank,
    # and the model saves
    # then 204
    # else 400
    if current_user.authenticate(pw_creds[:old]) &&
       !(current_user.password = pw_creds[:new]).blank? &&
       current_user.save
      head :no_content
    else
      head :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, :User_Name, :Location, :About, :Gender_Identity, :Preferred_Pronoun)
  end

  def user_creds
    params.require(:credentials)
          .permit(:email, :password, :password_confirmation)
  end

  def pw_creds
    params.require(:passwords)
          .permit(:old, :new)
  end
end

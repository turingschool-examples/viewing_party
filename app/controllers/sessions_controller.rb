class SessionsController <ApplicationController
    def welcome   ##was  def new
    end

    def create
        found_user = User.find_by(email: params[:email])
        if found_user && found_user.authenticate(params[:password])
            session[:user_id] = found_user.id
            flash[:success] = "Welcome, #{found_user.email}!"
            redirect_to "/dashboard"
        else
            flash[:error] = "Your email or password are incorrect"
            redirect_to "/"
        end
    end

    # def destroy
    #     session[:user_id] = nil
    #     redirect_to '/'
    # end
end

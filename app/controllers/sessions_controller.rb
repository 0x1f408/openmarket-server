# definition of the JSON object we're sending TO our Ember frontend

def create
  user = User.find_by_email(params[:email])
  if user && user.authenticate(params[:password])
    if request.format.json?
      data = {
        token: user.authentication_token,
        email: user.email
        # todo: Make it possible to use either email or username
      }
      render json: data, status: 201 and return
    end
  end
end

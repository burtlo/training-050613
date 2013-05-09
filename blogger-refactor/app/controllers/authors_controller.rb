class AuthorsController < ApplicationController

  before_filter :require_login

  # GET /authors
  # GET /authors.json
  def index
    @authors = Author.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authors }
    end
  end

  # GET /authors/1
  # GET /authors/1.json
  def show
    @author = Author.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json do
        render json: @author
      end
    end
  end

  # GET /authors/new
  # GET /authors/new.json
  def new
    @author = Author.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @author }
    end
  end

  # GET /authors/1/edit
  def edit
    @author = Author.find(params[:id])
  end

  # POST /authors
  # POST /authors.json
  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to @author, notice: 'Author was successfully created.' }
        format.json { render json: @author, status: :created, location: @author }
      else
        format.html { render action: "new" }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /authors/1
  # PUT /authors/1.json
  def update

    @author = Author.find(params[:id])

    respond_to do |format|
      if @author.update_attributes(author_params)
        format.html { redirect_to @author, notice: 'Author was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.json
  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    respond_to do |format|
      format.html { redirect_to authors_url }
      format.json { head :no_content }
    end
  end

  def author_params
    # Solution 1
    params[:author].permit(:username,:email,:password,:password_confirmation)

    # Solution 2
    # author_params = params[:author]
    # {
    #   username: author_params[:username],
    #   password: author_params[:password],
    #   password_confirmation: author_params[:password_confirmation],
    #   email: author_params[:email]
    # }

    # Solution 3
    # author_params.except(:admin)

    # Solution 4
    # author_params = {}
    # [ :username, :password, :password_confirmation, :email ].each do |key|
    #   author_params[key] = params[:author][key]
    # end
    # author_params

    # Solution 5
    # params[:author].only(:username, :password, :password_confirmation, :email)
  end

end

# Solution 5
# class HashWithIndifferentAccess
#   def only(*params)
#     new_hash = {}
#     params.each do |key|
#       new_hash[key] = self[key] if has_key?(key)
#     end

#     new_hash
#   end
# end

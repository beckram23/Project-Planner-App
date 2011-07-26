class UsersController < ApplicationController
  # GET /users
  # GET /users.xml

  before_filter :if_admin, :only => %w(index show new edit create update destroy)
  before_filter :if_logged_in, :only => %w(tasklist tabsframe open closed suspended tasksframe)
  helper_method :respond_to, :redirect_to

  def login
	@user = User.search(params[:user],params[:password])
	if @user.nil? == false
		session[:UserName] = User.encrypt(@user.UserName,@user.Password)
		session[@user.UserName] = session[:UserName]
		#redirect_to :action => 'tasklist', :user => @user.UserName
		respond_to do |format|
			format.html { redirect_to :controller => 'users', :action => 'tasklist', :user => @user.UserName }
			format.xml  { render :xml => @user }
		end
	else
		respond_to do |format|
			format.html
			format.xml  { render :xml => @user }
		end
	end
  end

  def tasklist
	@user = params[:user]
	if session[:UserName]
		respond_to do |format|
			format.html # index.html.erb
			format.xml  { render :xml => @user }
		end
	end
  end

  def open
  end

  def tasksframe
  end

  def closed
  end

  def suspended
  end

  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end

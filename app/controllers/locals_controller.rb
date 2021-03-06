class LocalsController < ApplicationController
  before_action :set_local, only: [:show, :edit, :update, :destroy]

  # GET /locals
  # GET /locals.json
  def index
    @locals = current_user.locals.order :name
  end

  # GET /locals/1
  # GET /locals/1.json
  def show
  end

  # GET /locals/new
  def new
    if current_user.user_type == 'admin'
      @local = Local.new
    else
      redirect_to root_path
    end
  end

  # GET /locals/1/edit
  def edit
  end

  # POST /locals
  # POST /locals.json
  def create
    @local = Local.new(local_params)

    respond_to do |format|
      if @local.save
        UserLocal.create({user_id:current_user.id, local_id:@local.id})
        format.html { redirect_to locals_path, notice: 'Local was successfully created.' }
        format.json { render :show, status: :created, location: @local }
      else
        format.html { render :new }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locals/1
  # PATCH/PUT /locals/1.json
  def update
    respond_to do |format|
      if @local.update(local_params)
        format.html { redirect_to @local, notice: 'Local was successfully updated.' }
        format.json { render :show, status: :ok, location: @local }
      else
        format.html { render :edit }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locals/1
  # DELETE /locals/1.json
  def destroy
    @local.destroy
    respond_to do |format|
      format.html { redirect_to locals_url, notice: 'Local was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_user_to_local
    id = params[:user]
    local = params[:local]

    if local and id
      user_local = Local.find(local).user_locals.build user_id: id
      user_local.save

      render status: 200, json: {status: 200}
    else
      render status: 406, json: {status: 406}
    end
  end

  def remove_user_from_local
    id = params[:user]
    local = params[:local]

    if local and id
      user_local = UserLocal.where({user_id: id, local_id: local}).first

      if user_local and user_local.destroy
        render status: 200, json: {status: 200}
      else
        render status: 406, json: {status: 406}
      end
    else
      render status: 406, json: {status: 406}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local
      @local = Local.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_params
      params.require(:local).permit(:name, :latitude, :longitude, :radius, :address)
    end
end

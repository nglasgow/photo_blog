class PhlogsController < ApplicationController
  # GET /phlogs
  # GET /phlogs.json
  def index
    @phlogs = Phlog.all
    @uploader = Phlog.new.image
    @uploader.success_action_redirect = new_phlog_url
  end

  # GET /phlogs/1
  # GET /phlogs/1.json
  def show
    @phlog = Phlog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @phlog }
    end
  end

  # GET /phlogs/new
  # GET /phlogs/new.json
  def new
    @phlog = Phlog.new(key: params[:key])
  end

  # GET /phlogs/1/edit
  def edit
    @phlog = Phlog.find(params[:id])
  end

  # POST /phlogs
  # POST /phlogs.json
  def create
    @phlog = Phlog.new(params[:phlog])
    if @phlog.save
      redirect_to phlogs_url, notice: "Phlog was successfully created."
    else
      render :action => 'new'
    end
  end

  # PUT /phlogs/1
  # PUT /phlogs/1.json
  def update
    @phlog = Phlog.find(params[:id])

    respond_to do |format|
      if @phlog.update_attributes(params[:phlog])
        format.html { redirect_to @phlog, notice: 'Phlog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @phlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phlogs/1
  # DELETE /phlogs/1.json
  def destroy
    @phlog = Phlog.find(params[:id])
    @phlog.destroy

    respond_to do |format|
      format.html { redirect_to phlogs_url }
      format.json { head :no_content }
    end
  end
end

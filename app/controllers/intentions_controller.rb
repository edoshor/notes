class IntentionsController < ApplicationController
  # GET /intentions
  # GET /intentions.json
  def index
    @intentions = Intention.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @intentions }
    end
  end

  # GET /intentions/1
  # GET /intentions/1.json
  def show
    @intention = Intention.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @intention }
    end
  end

  # GET /intentions/new
  # GET /intentions/new.json
  def new
    @intention = Intention.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @intention }
    end
  end

  # GET /intentions/1/edit
  def edit
    @intention = Intention.find(params[:id])
  end

  # POST /intentions
  # POST /intentions.json
  def create
    @intention = Intention.new(params[:intention])

    respond_to do |format|
      if @intention.save
        format.html { redirect_to @intention, notice: 'Intention was successfully created.' }
        format.json { render json: @intention, status: :created, location: @intention }
      else
        format.html { render action: "new" }
        format.json { render json: @intention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /intentions/1
  # PUT /intentions/1.json
  def update
    @intention = Intention.find(params[:id])

    respond_to do |format|
      if @intention.update_attributes(params[:intention])
        format.html { redirect_to @intention, notice: 'Intention was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @intention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intentions/1
  # DELETE /intentions/1.json
  def destroy
    @intention = Intention.find(params[:id])
    @intention.destroy

    respond_to do |format|
      format.html { redirect_to intentions_url }
      format.json { head :no_content }
    end
  end
end

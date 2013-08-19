class SignatureCollectionLocationsController < ApplicationController
  # GET /signature_collection_locations
  # GET /signature_collection_locations.json
  def index
    @signature_collection_locations = SignatureCollectionLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @signature_collection_locations }
    end
  end

  # GET /signature_collection_locations/1
  # GET /signature_collection_locations/1.json
  def show
    @signature_collection_location = SignatureCollectionLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @signature_collection_location }
    end
  end

  # GET /signature_collection_locations/new
  # GET /signature_collection_locations/new.json
  def new
    @signature_collection_location = SignatureCollectionLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @signature_collection_location }
    end
  end

  # GET /signature_collection_locations/1/edit
  #def edit
  #  @signature_collection_location = SignatureCollectionLocation.find(params[:id])
  #end

  # POST /signature_collection_locations
  # POST /signature_collection_locations.json
  def create
    @signature_collection_location = SignatureCollectionLocation.new(params[:signature_collection_location])

    respond_to do |format|
      if @signature_collection_location.save
        format.html { redirect_to @signature_collection_location, notice: 'Signature collection location was successfully created.' }
        format.json { render json: @signature_collection_location, status: :created, location: @signature_collection_location }
      else
        format.html { render action: "new" }
        format.json { render json: @signature_collection_location.errors, status: :unprocessable_entity }
      end
    end
  end

  ## PUT /signature_collection_locations/1
  ## PUT /signature_collection_locations/1.json
  #def update
  #  @signature_collection_location = SignatureCollectionLocation.find(params[:id])
  #
  #  respond_to do |format|
  #    if @signature_collection_location.update_attributes(params[:signature_collection_location])
  #      format.html { redirect_to @signature_collection_location, notice: 'Signature collection location was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @signature_collection_location.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  #
  ## DELETE /signature_collection_locations/1
  ## DELETE /signature_collection_locations/1.json
  #def destroy
  #  @signature_collection_location = SignatureCollectionLocation.find(params[:id])
  #  @signature_collection_location.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to signature_collection_locations_url }
  #    format.json { head :no_content }
  #  end
  #end
end

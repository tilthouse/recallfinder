class SignatureCollectionLocationsController < ApplicationController
  # GET /signature_collection_locations
  # GET /signature_collection_locations.json

  # GET /signature_collection_locations/1
  # GET /signature_collection_locations/1.json
  def show
    # used as "thanks" page
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

  # POST /signature_collection_locations
  # POST /signature_collection_locations.json
  def create
    @signature_collection_location = SignatureCollectionLocation.new(params[:signature_collection_location])
    @signature_collection_location.created_by_ip_address = request.remote_ip
    @signature_collection_location.active = true if @signature_collection_location.ready

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


end

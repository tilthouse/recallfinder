class LocationSearchesController < ApplicationController
  def new
    @location_search = LocationSearch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location_search }
    end
  end

  def create
    @location_search = LocationSearch.new(params[:location_search])
    respond_to do |format|
      if @signature_collection_locations = @location_search.find_by_address(@location_search.address).displayable
        gon.signature_collection_locations = @signature_collection_locations
        gon.search_location = @location_search
        logger.debug @results.inspect
        #format.html { redirect_to @location_search, notice: 'Signature collection location was successfully created.' }
        format.html
        format.json { render json: @location_search, status: :created, location: @location_search }
      else
        format.html { render action: "new" }
        format.json { render json: @location_search.errors, status: :unprocessable_entity }
      end
    end
  end
end

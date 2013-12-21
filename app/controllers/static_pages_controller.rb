class StaticPagesController < ApplicationController
  include StaticPagesHelper
  include SessionsHelper
  def home
  	@user = @current_user
  	render 'home'
  end

  def help
  end

  def about
  end

  def createfilm
    @names=[]
  	@film=Film.new
  	5.times{@film.locations.build}
  end

  def create
    @names=[]
  	@film=Film.new(film_params)
  	@film.save

  	render "static_pages/home"
  end
def search
    @filmloc=params[:location]
    @select=String.new(params[:searchId])
    @names=[]
    @locOfRoute=[]
    @location=[]
    @printname=String.new
    @route=String.new
    @locationId=[]
    @catchFilmId=[]
    @filmIds=[]
    @catchlocationId=[]
    if @select=='1'
     # Film.all.each do |t|
     #  # if @filmloc==t.getLocation
     #  #      @names << t.getName
     #  #    @printname=@printname + t.getName
     #  # end
     #  t.getLocation.each do |judge|
     #      if @filmloc==judge
     #        @names << t.getName
     #      end
     #  end
     # end
     @locationId=Location.find_all_by_name(@filmloc)
     @locationId.each do |t|
      @filmIds += FilmsLocations.find_all_by_location_id(t)
    end
    # @filmId=FilmsLocations.find_all_by_location_id(@locationId)
     @filmIds.each do |filmId|
      @names << Film.find(filmId.film_id).name
     end
    elsif @select=='2'
      #  Film.all.each do |t|
      # if @filmloc==t.getName
      #      @location << t.getLocation
         #@printname=@printname + t.getName
         @catchFilmId=Film.find_all_by_name(@filmloc)
         @catchFilmId.each do |c|
          @catchlocationId+=FilmsLocations.find_all_by_film_id(c)
        end
        @catchlocationId.each do |catchloc|
           if !Location.find(catchloc.location_id).name.empty?
          @location << Location.find(catchloc.location_id).name
        end
        end
      end
    render 'createroute'
  end

  def addRoute
    @loc=[]
    @locOfRoute=Location.new
    @locOfRoute.save
    @locOfRoute.setName(params[:addroute])
    @current_user=current_user
    @current_route_id=current_user.getCurrentRoute
    @currentRoute=Route.find(@current_route_id)
    @location_ids=RoutesLocations.find_all_by_route_id(@current_route_id)
    @location_names=[]
    @location_ids.each do |locname|
      @location_names<<Location.find(locname.location_id)
      @loc<<Location.find(locname.location_id).name
    end
    @location_names<<@locOfRoute

    @loc<<@locOfRoute.name
    @currentRoute.addLocations(@locOfRoute)
    @names=[]
    @location=[]
    render 'createroute'
  end
  def newRoute
    @loc=[]
    @routename=params[:routename]
    @current_user=current_user
    @current_route_id=current_user.getCurrentRoute
    @currentRoute=Route.find(@current_route_id)
    @currentRoute.setRouteName(@routename)
    @location_ids=RoutesLocations.find_all_by_route_id(@current_route_id)
    @location_names=[]
    @location_ids.each do |locname|
      @location_names<<Location.find(locname.location_id)
        @loc<<Location.find(locname.location_id).name
    end
    @names=[]
    @location=[]
    render 'createroute'
  end
  def createroute
    #@filmloc=Film.new
    #@name=String.new
    Route.all.each do |dele|
      if dele.name.blank?
        dele.destroy
      end
    end
    @location_names=[]
    @current_user=current_user
    @route=Route.new
    @route.save
    @route.setUserId(current_user.id)
    @current_user.setCurrentRoute(@route.getId)
    @current_user.save!
    @current_route_id=current_user.getCurrentRoute
    @current_user.addRout(@route)
    @names=[]
     @location=[]
    @locOfRoute=[]
    @printname=String.new

  end 

  def showroute
    @routes = Route.paginate(:page => params[:page], :per_page => 5)  
    #@routes = Route.all

  end 
  private
  def film_params
  	params.require(:film).permit(:name, locations_attributes: [:id, :name])
  end
end

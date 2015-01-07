class UserRoutesController < ApplicationController
  before_action :authorizeUser
  
  # gets
    def showAll
      @climbs = getAll()
    end
    
    def showClimbed
      @climbs = getClimbed()
    end

    def showUnclimbed
      @climbs = getUnclimbed()
    end

  # posts
    def addRoute
      if params[:route]
        # get user

      end
    end  

  # puts
    def updateRoute
    end

  # deletes
    def removeRoute
    end

  private
    def getAll
    end
    def getClimbed
    end
    def getUnclimbed
    end
end

class SiteController < ApplicationController

  def activity_user_nike
  api_response = Site.all_activities_nike
  render json: api_response, status: 201
  end

  def activity_user_runtastic
  api_response = Site.all_activities_runtastic
  render json: api_response, status: 201
  end
  
end

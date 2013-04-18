class CampaignsController < ApplicationController
  def new
  end

  def show
    @campaign = Campaign.find(params[:id])
    @sponsor = User.find(@campaign.user_id)
  end

end
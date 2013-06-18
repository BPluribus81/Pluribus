class CampaignsController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update]

  def new
  end

  def show
    @campaign = Campaign.find(params[:id])
    @sponsor = User.find(@campaign.user_id)
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(params[:campaign])
      flash.now[:success] = "Campaign updated"
      render 'edit'
    else
      render 'edit'
    end
  end
end
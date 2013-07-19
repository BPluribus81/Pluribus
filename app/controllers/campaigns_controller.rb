class CampaignsController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update]
  before_filter only: [:edit, :update] do
    redirect_to root_path unless current_user.admin?
  end
    
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

  private

    def admin?
      self.admin == true
    end
end
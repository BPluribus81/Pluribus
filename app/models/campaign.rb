class Campaign < ActiveRecord::Base
  attr_accessible :address, :amountraised, :campaignlength, :datepublished, :description, :fundtarget, :organization, :title, :user_id
end

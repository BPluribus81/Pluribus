namespace :db do
  desc "Fill in Database with Initial Data"
  task populate: :environment do
    User.create!(email: "brian@pluribusfund.com",
                 firstname: "Brian",
                 lastname: "Whitesides",
                 zipcode: "20037",
                 password: "pluribus",
                 password_confirmation: "pluribus")
    Campaign.create!(title: "A New Fresh Urban Market",
                     user_id: "1",
                     organization: "Local Community Investment Group",
                     description: "This is where the description will go",
                     address: "20037",
                     fundtarget: "100000",
                     datepublished: DateTime.now,
                     campaignlength: "30",
                     amountraised: "75000")            
  end
end
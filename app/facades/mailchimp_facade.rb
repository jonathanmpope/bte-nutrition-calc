class MailchimpFacade

    def self.add_subscriber(user)
        mailchimp = MailchimpService.create_update_user(user)
        binding.pry 
        # list_id = ENV["mailchimp_list_id"]

        # subscribing_user = {
        #     first_name: "Apple",
        #     last_name: "Sauce",
        #     email_address: "applesauce@example.com"
        # }
        # binding.pry 
        # response = mailchimp.lists.add_list_member list_id, {
        #     email_address: subscribing_user[:email_address],
        #     status: "subscribed",
        #     merge_fields: {
        #         FNAME: subscribing_user[:first_name],
        #         LNAME: subscribing_user[:last_name]
        #         },
        #     }
        # binding.pry 

        # begin
        #     mailchimp = MailchimpMarketing::Client.new
        #     mailchimp.set_config({
        #         :api_key => ENV["mailchimp_api_key"],
        #         :server => ENV["mailchimp_server"]
        #     })
        #     response =
        #         mailchimp.lists.set_list_member(
        #         ENV["mailchimp_list_id"],
        #         'subscriber_hash',
        #         {   
        #             'email_address' => user.email,
        #             'status_if_new' => 'subscribed'
        #         },
        #         'merge_fields': 
        #         {
        #             'FNAME' => user.name,
        #             'LNAME' => "Pope"
        #         }
        #         )
        #     p response
        #     binding.pry 
        # rescue MailchimpMarketing::ApiError => e
        #     puts "Error: #{e}"
        # end

    end 

end 
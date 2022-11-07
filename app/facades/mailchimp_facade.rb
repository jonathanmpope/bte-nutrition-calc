class MailchimpFacade

    def self.add_subscriber(user)
        # need to update person model to split name into first / last
        user_details = {
        email_address: user.email,
        status: "subscribed",
        merge_fields: {
            FNAME: user.name,
            LNAME: "Test",
        },
        };

        conn = MailchimpService.conn(user)
        
        response = conn.put() do |req|
            req.body = user_details.to_json
        end

        response = JSON.parse(response.body)
        binding.pry 
    end  
end 
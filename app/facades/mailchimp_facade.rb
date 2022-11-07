class MailchimpFacade

    def self.add_subscriber(user)
        user_details = {
        email_address: user.email,
        status: "subscribed",
        merge_fields: {
            FNAME: user.name,
            LNAME: "Test",
        },
        };

        conn = Faraday.new(
            url: "https://#{ENV['mailchimp_server']}.api.mailchimp.com/3.0/lists/#{ENV['mailchimp_list_id']}/members/#{user.email}",
            headers: {'Content-Type' => 'application/json', 'Authorization': "Bearer #{ENV['mailchimp_api_key']}"}
        )
        
        response = conn.put() do |req|
            req.body = user_details.to_json
        end

        response = JSON.parse(response.body)
    end 

end 
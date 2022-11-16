
class MailchimpService
    def self.conn(user)
        Faraday.new(
            url: "https://#{ENV['mailchimp_server']}.api.mailchimp.com/3.0/lists/#{ENV['mailchimp_list_id']}/members/#{user.email}",
            headers: {'Content-Type' => 'application/json', 'Authorization': "Bearer #{ENV['mailchimp_api_key']}"}
            )
    end
end
# require "MailchimpMarketing"

class MailchimpService
    def self.conn
        Faraday.new(url: "https://#{ENV['mailchimp_server']}.api.mailchimp.com/3.0") do |faraday|
            faraday.headers['apikey'] = ENV['mailchimp_api_key']
        end 
    end

    def self.create_update_user(user)
        response = conn.put("/lists/#{ENV['mailchimp_list_id']}/members/#{user.email}") do |faraday|
            faraday.params['email_address'] = user.email
            faraday.params['status_if_new'] = 'subscribed'
        end
        result = JSON.parse(response.body, symbolize_names: true) 
        binding.pry 
      end
end
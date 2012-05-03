class QuiiqService

  def initialize(quiiq_server_url, username, password)
    @client  = Savon::Client.new do
      wsdl.document = quiiq_server_url
    end
    response = @client.request(:login) do
      soap.body = { :username => username, :password => password }
    end

    @token = response.body[:login_response][:token]
  end

  def get_new_home_server_events
    response = call_quiiq_service(:get_new_home_server_events)
    [response.body[:get_new_home_server_events_response][:events][:home_server_event],
     response.body[:get_new_home_server_events_response][:has_more]]
  rescue
    [[], false]
  end

  def get_new_events
    response = call_quiiq_service(:get_new_events)
    [response.body[:get_new_events_response][:events][:device_event],
     response.body[:get_new_events_response][:has_more]]
  rescue
    [[], false]
  end

  def call_quiiq_service(service)
    token = @token
    @client.request(service) do
      soap.body = { :token => token }
    end
  end
end


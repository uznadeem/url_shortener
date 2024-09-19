class LogVisitJob < ApplicationJob
  queue_as :default

  def perform(redirection_id, ip_address, user_agent_string)
    start_time = Time.now
    puts "\n\n\njob start: #{start_time}"
    sleep (10)
    finish_time = Time.now
    puts "job finish: #{finish_time}"
    puts "time_consumed: #{finish_time - start_time}\n\n\n"






    # redirection = Redirection.find(redirection_id)
    # user_browser = Browser.new(user_agent_string)

    # redirection.visits.create!(
    #   ip_address: ip_address,
    #   user_agent: user_agent_string,
    #   browser: user_browser.name,
    #   operating_system: user_browser.platform.name
    # )

    # VisitsChannel.broadcast_to(redirection, { visits_count: redirection.visits.count })
  end
end

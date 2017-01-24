class PostpublishJob < ApplicationJob
    
  include Sidekiq::Jobs
  queue_as :default
  
  def perform(object)
    object.each do |post|
        if post.publish_date <= Date.current
           post.publish = true
           post.save
        end   
    end 	
  end
end

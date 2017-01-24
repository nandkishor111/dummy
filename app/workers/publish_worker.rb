class PublishWorker
  include Sidekiq::Worker
  def perform(post_obj)
       post_obj.each do |post|
         if post.publish_date <= Date.current
             post.update_attribute(:publish=>true)
         end   
       end   
   end
end
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
# ActsAsTaggableOn.force_lowercase = true
end
class Article < ActiveRecord::Base
require "elasticsearch/rails/version"
 
class Article < ActiveRecord::Base
  include Elasticsearch::Model
  include  Elasticsearch::Model::Callbacks
end
Article.import # for auto sync model with elastic search
end

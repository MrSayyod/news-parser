class ArticleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :url
end

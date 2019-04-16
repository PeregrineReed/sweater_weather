class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :url,
             :description,
             :alt_description
end

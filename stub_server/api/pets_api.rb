require 'json'


MyApp.add_route('POST', '/api/pets', {
  "resourcePath" => "/Pets",
  "summary" => "Create a pet",
  "nickname" => "create_pets", 
  "responseClass" => "void",
  "endpoint" => "/api/pets", 
  "notes" => "",
  "parameters" => [
    ]}) do
  cross_origin
  # the guts live here

  {"message" => "yes, it worked"}.to_json
end


MyApp.add_route('GET', '/api/pets', {
  "resourcePath" => "/Pets",
  "summary" => "List all pets",
  "nickname" => "list_pets", 
  "responseClass" => "Array<Pet>",
  "endpoint" => "/api/pets", 
  "notes" => "",
  "parameters" => [
    {
      "name" => "limit",
      "description" => "How many items to return at one time (max 100)",
      "dataType" => "Integer",
      "allowableValues" => "",
      "paramType" => "query",
    },
    ]}) do
  cross_origin
  # the guts live here

  {"message" => "yes, it worked"}.to_json
end


MyApp.add_route('GET', '/api/pets/{petId}', {
  "resourcePath" => "/Pets",
  "summary" => "Info for a specific pet",
  "nickname" => "show_pet_by_id", 
  "responseClass" => "Pet",
  "endpoint" => "/api/pets/{petId}", 
  "notes" => "",
  "parameters" => [
    {
      "name" => "pet_id",
      "description" => "The id of the pet to retrieve",
      "dataType" => "String",
      "paramType" => "path",
    },
    ]}) do
  cross_origin
  # the guts live here

  {"message" => "yes, it worked"}.to_json
end


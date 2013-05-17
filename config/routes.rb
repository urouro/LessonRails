Testapi::Application.routes.draw do

  root to: "top#index"

  match "city" => "top#city"

  match "member/list"
  get "member/add"
  get "member/delete"
  get "member/update"

end

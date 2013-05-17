class TopController < ApplicationController
  def index
  end

  def city
    array = {
      'cities' => [
                   'Osaka', 
                   'Tokyo',
                   'Fukuoka',
                   'Tottori',
                   'Kanazawa',
                   'Sapporo',
                   'Tokushima',
                  ],
      'name' => 'city',
      'created_at' => Time.now.to_s,
    }

    render :json => array
  end  

end

class SecretbeerController < ApplicationController  
  def new
  end

  def create
    save_star_file
    flash[:notice] = "Posted"

    redirect_to '/secretbeer/new'
  end

private
  def save_star_file
    data = render_to_string( :template => 'secretbeer/beer', :layout => false, :locals => { :params => params } )

    File.open('tmp/beer.star', "w"){|f| f << data }
  end
end

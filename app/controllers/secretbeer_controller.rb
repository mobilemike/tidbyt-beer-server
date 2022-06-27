class SecretbeerController < ApplicationController  
  API_TOKEN = 'eyJhbGciOiJFUzI1NiIsImtpZCI6IjY1YzFhMmUzNzJjZjljMTQ1MTQyNzk5ODZhMzYyNmQ1Y2QzNTI0N2IiLCJ0eXAiOiJKV1QifQ.eyJhdWQiOiJodHRwczovL2FwaS50aWRieXQuY29tIiwiZXhwIjoxNjg3OTAzNzQ1LCJpYXQiOjE2NTYzNjc3NDUsImlzcyI6Imh0dHBzOi8vYXBpLnRpZGJ5dC5jb20iLCJzdWIiOiJEYXdFbFc3NjNhUDFmZ0xFbzF0T1duVnQ5ZmIyIiwic2NvcGUiOiJkZXZpY2UiLCJkZXZpY2UiOiJ5ZWFybHktZWFydGh5LXByZWZlcnJlZC1jYWxmLTYwMyJ9.nmAx3VTaaxOUcJS1wayC05tIAR5Al4B__ag88FIIVe_jw02RF-CcVbzP3H6LO_E0v9uy5CU4IHp3T1NZ1ma5uw'
  ID = 'yearly-earthy-preferred-calf-603'

  def new
  end

  def create
    save_star_file
    pixlet_render
    pixlet_push

    flash[:notice] = "Posted"

    redirect_to '/secretbeer/new'
  end

private
  def save_star_file
    data = render_to_string( :template => 'secretbeer/beer', :layout => false, :locals => { :params => params } )

    File.open('tmp/beer.star', "w"){|f| f << data }
  end

  def pixlet_render
    system('pixlet render tmp/beer.star -o tmp/beer.webm')
  end

  def pixlet_push
    command = "pixlet push --api-token "
    command += API_TOKEN
    command += " --installation-id #{params[:short_name]} "
    command += "#{ID} tmp/beer.webm"

    system(command)
  end

end

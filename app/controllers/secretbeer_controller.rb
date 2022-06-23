class SecretbeerController < ApplicationController  
  API_TOKEN = 'eyJhbGciOiJFUzI1NiIsImtpZCI6IjY1YzFhMmUzNzJjZjljMTQ1MTQyNzk5ODZhMzYyNmQ1Y2QzNTI0N2IiLCJ0eXAiOiJKV1QifQ.eyJhdWQiOiJodHRwczovL2FwaS50aWRieXQuY29tIiwiZXhwIjoxNjg2MTUwMDQzLCJpYXQiOjE2NTQ2MTQwNDMsImlzcyI6Imh0dHBzOi8vYXBpLnRpZGJ5dC5jb20iLCJzdWIiOiJEYXdFbFc3NjNhUDFmZ0xFbzF0T1duVnQ5ZmIyIiwic2NvcGUiOiJkZXZpY2UiLCJkZXZpY2UiOiJzdWF2ZWx5LWVjc3RhdGljLXRyaXVtcGhhbnQtbGVhZnJvbGxlci1jNmUifQ.5Phj3eM3n6aOALAQiavUwDR9AAHKgK94cHthjPWf7hepfIamlLgTFkY8Jamuz7sQ-b3s8ii1AOmuo50hn-Ybwg'
  ID = 'suavely-ecstatic-triumphant-leafroller-c6e'

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

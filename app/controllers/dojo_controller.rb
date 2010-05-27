
class DojoController < ApplicationController

  protect_from_forgery :only => []

  def index
    redirect_to :action => "choose_dojo", :id => params[:id]
  end

  def choose_dojo
    @dojos = visible_files('dojos')
  end

  def choose_kata
    @dojo_id = params[:dojo_id]
    @katas = visible_files("dojos/#{@dojo_id}")
  end

  def choose_avatar
    @dojo_id = params[:dojo_id]
    @kata_id = params[:kata_id]
    @avatars = Avatar.names
    @title = "Cyber Dojo"
  end

  private
  
  def visible_files(path)
    Dir.entries(path).reject {|file| file =~ /^\./ }
  end
end

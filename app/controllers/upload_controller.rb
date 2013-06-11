class UploadController < ApplicationController
  def index
    if user_signed_in?
      if current_user.nickname=="Khin"
        render :file => 'app/views/upload/uploadfile.html.erb'
      else
        render :file => "public/404.html"
      end
    else
      render :file => "public/404.html"
    end
  end
  
  def uploadFile
    if user_signed_in?
      if current_user.nickname=="Khin"
        post = DataFile.save(params[:upload], params[:gallery], params[:pictures])
        redirect_to( :controller => :galleries, :action => :show2, :id => params[:gallery][:id] )
      else
        render :file => "public/404.html"
      end
    else
      render :file => "public/404.html"
    end
  end

end

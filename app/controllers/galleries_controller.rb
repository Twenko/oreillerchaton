class GalleriesController < ApplicationController
  # GET /galleries
  # GET /galleries.xml
  def index
    @galleries = Gallery.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @galleries }
    end
  end

  def index2
    if user_signed_in?
      if current_user.nickname=="Khin"
        @galleries = Gallery.all

        respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml => @galleries }
        end
      else
        render :file => "public/404.html"
      end
    else
      render :file => "public/404.html"
    end
  end

  # GET /galleries/1
  # GET /galleries/1.xml

  def show2
    if user_signed_in?
      if current_user.nickname=="Khin"
        @gallery = Gallery.find(params[:id])
    
        @counting = 0
    
        respond_to do |format|
          format.html # show.html.erb
          format.xml  { render :xml => @gallery }
        end
      else
        render :file => "public/404.html"
      end
    else
      render :file => "public/404.html"
    end
  end

  def show
    @gallery = Gallery.find(params[:id])

    @counting = 0

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gallery }
    end
  end

  # GET /galleries/new
  # GET /galleries/new.xmlx
  def new
    if user_signed_in?
      if current_user.nickname=="Khin"
        @gallery = Gallery.new
    
        respond_to do |format|
          format.html # new.html.erb
          format.xml  { render :xml => @gallery }
        end
      else
        render :file => "public/404.html"
      end
    else
      render :file => "public/404.html"
    end
  end

  # GET /galleries/1/edit
  def edit
    if user_signed_in?
      if current_user.nickname=="Khin"
        @gallery = Gallery.find(params[:id])
      else
        render :file => "public/404.html"
      end
    else
      render :file => "public/404.html"
    end
  end

  # POST /galleries
  # POST /galleries.xml
  def create
    if user_signed_in?
      if current_user.nickname=="Khin"
        @gallery = Gallery.new(params[:gallery])
    
        respond_to do |format|
          if @gallery.save
            flash[:notice] = 'Gallery was successfully created.'
            format.html { redirect_to(root_path) }
            format.xml  { render :xml => @gallery, :status => :created, :location => @gallery }
          else
            format.html { render :action => "new" }
            format.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
          end
        end
      else
        render :file => "public/404.html"
      end
    else
      render :file => "public/404.html"
    end
  end

  # PUT /galleries/1
  # PUT /galleries/1.xml
  def update
    if user_signed_in?
      if current_user.nickname=="Khin"
        @gallery = Gallery.find(params[:id])
    
        respond_to do |format|
          if @gallery.update_attributes(params[:gallery])
            flash[:notice] = 'Gallery was successfully updated.'
            format.html { redirect_to(:controller => :galleries, :action => :index2) }
            format.xml  { head :ok }
          else
            format.html { render :action => "edit" }
            format.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
          end
        end
      else
        render :file => "public/404.html"
      end
    else
      render :file => "public/404.html"
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.xml
#  def destroy
#    @gallery = Gallery.find_by_id(params[:name])
#    @gallery.activate = 0
#    @gallery.save
    #@gallery.destroy

#    respond_to do |format|
#      format.html { redirect_to(galleries_url) }
#      format.xml  { head :ok }
#    end
#  end
  
#  def deact
#    @gallery = Gallery.find_by_name(params[:name])
#    @gallery.activate=0
#    @gallery.save
#    format.html { redirect_to(:controller => :galleries, :action => :index2) }
    
#  end
  
end

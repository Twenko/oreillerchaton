class PicturesController < ApplicationController
  # GET /pictures
  # GET /pictures.xml
  def index
    @pictures = Picture.all
    @counting = 0

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pictures }
    end
  end
  
  def index2
    if user_signed_in?
      if current_user.nickname=="Khin"
        @pictures = Picture.all
        @counting = 0
        
        respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml => @pictures }
        end
      else
        render :file => "public/404.html"
      end
    else
      render :file => "public/404.html"
    end
  end

  # GET /pictures/1
  # GET /pictures/1.xml
  def show
    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.xml
  def new
    if user_signed_in?
      if current_user.nickname=="Khin"
        @picture = Picture.new
    
        respond_to do |format|
          format.html # new.html.erb
          format.xml  { render :xml => @picture }
        end
      else
        render :file => "public/404.html"
      end
    else
      render :file => "public/404.html"
    end
  end

  # GET /pictures/1/edit
  def edit
    if user_signed_in?
      if current_user.nickname=="Khin"
        @picture = Picture.find(params[:id])
      else
        render :file => "public/404.html"
      end
    else
      render :file => "public/404.html"
    end
  end

  # POST /pictures
  # POST /pictures.xml
  def create
    if user_signed_in?
      if current_user.nickname=="Khin"
        @picture = Picture.new(params[:picture])
    
        respond_to do |format|
          if @picture.save
            flash[:notice] = 'Picture was successfully created.'
            format.html { redirect_to(@picture) }
            format.xml  { render :xml => @picture, :status => :created, :location => @picture }
          else
            format.html { render :action => "new" }
            format.xml  { render :xml => @picture.errors, :status => :unprocessable_entity }
          end
        end
      else
        render :file => "public/404.html"
      end
    else
      render :file => "public/404.html"
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.xml
  def update
    if user_signed_in?
      if current_user.nickname=="Khin"
        @picture = Picture.find(params[:id])
    
        respond_to do |format|
          if @picture.update_attributes(params[:picture])
            flash[:notice] = 'Picture was successfully updated.'
            format.html { redirect_to(@picture) }
            format.xml  { head :ok }
          else
            format.html { render :action => "edit" }
            format.xml  { render :xml => @picture.errors, :status => :unprocessable_entity }
          end
        end
      else
        render :file => "public/404.html"
      end
    else
      render :file => "public/404.html"
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.xml
  def destroy
    if user_signed_in?
      if current_user.nickname=="Khin"
        @picture = Picture.find(params[:id])
        @picture.destroy
    
        respond_to do |format|
          format.html { redirect_to(pictures_url) }
          format.xml  { head :ok }
        end
      else
        render :file => "public/404.html"
      end
    else
      render :file => "public/404.html"
    end
  end
end

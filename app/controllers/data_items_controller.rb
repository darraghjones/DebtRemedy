class DataItemsController < ApplicationController
  # GET /data_items
  # GET /data_items.xml
  def index
    @data_items = DataItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @data_items }
    end
  end

  # GET /data_items/1
  # GET /data_items/1.xml
  def show
    @data_item = DataItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @data_item }
    end
  end

  # GET /data_items/new
  # GET /data_items/new.xml
  def new
    @data_item = DataItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @data_item }
    end
  end

  # GET /data_items/1/edit
  def edit
    @data_item = DataItem.find(params[:id])
  end

  # POST /data_items
  # POST /data_items.xml
  def create
    @data_item = DataItem.new(params[:data_item])

    respond_to do |format|
      if @data_item.save
        format.html { redirect_to(@data_item, :notice => 'Data item was successfully created.') }
        format.xml  { render :xml => @data_item, :status => :created, :location => @data_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @data_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /data_items/1
  # PUT /data_items/1.xml
  def update
    @data_item = DataItem.find(params[:id])

    respond_to do |format|
      if @data_item.update_attributes(params[:data_item])
        format.html { redirect_to(@data_item, :notice => 'Data item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @data_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /data_items/1
  # DELETE /data_items/1.xml
  def destroy
    @data_item = DataItem.find(params[:id])
    @data_item.destroy

    respond_to do |format|
      format.html { redirect_to(data_items_url) }
      format.xml  { head :ok }
    end
  end
end

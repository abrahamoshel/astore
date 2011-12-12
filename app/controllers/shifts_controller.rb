class ShiftsController < ApplicationController
  # GET /shifts
  # GET /shifts.xml
  def shift_taken
    @css =  File.read(File.join(Rails.root, 'public', 'stylesheets', 'notifier.css'))
     @shift = Shift.find(params[:id])
    respond_to do |format|
      format.html
      format.html {render :html => @shift}
    end
  end 
  def index
    @title = "Shift Switch"
    @shifts = Shift.find(:all, :conditions => {:date => Date.today - 2...Date.today + 65, :takingEmail => nil}, :order => "date DESC")
    @shiftscovered = Shift.find(:all, :conditions => {:date => Date.today - 2...Date.today + 65}, :order => "date DESC", :limit => 30)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shifts }
      format.html { render :html => @shifts }
    end
  end

  # Just a list of all shifts for mangers to see.
  def manager
    @title = "Manager View of Shifts"
    @shifts = Shift.all(:conditions => {:takingEmail => nil}, :order => "date DESC")
    @shiftscovered = Shift.find(:all , :order => "date DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shifts }
      format.html { render :html => @shifts }
    end
  end

  # GET /shifts/1
  # GET /shifts/1.xml
  def show
    @title = "Shift Switch"
    @shift = Shift.find(params[:id])
    @shift.endtime 
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shift }
    end
  end

  # GET /shifts/new
  # GET /shifts/new.xml
  def new
    @title = "Posting New Shift"
    @shift = Shift.new
    @shift.date ||= Date.today.strftime('%a %b %d, %Y')
    @shift.starttime ||= Time.now
    @shift.endtime ||= Time.now+5.hour

    respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @shift }
    end
  end

  # GET /shifts/1/edit
  def edit
    @title = "Shift Switch"
    @shift = Shift.find(params[:id])
  end

  # POST /shifts
  # POST /shifts.xml
  def create
    @shift = Shift.new(params[:shift])

    respond_to do |format|
      if @shift.save
        format.html { redirect_to(shifts_path, :notice => 'Shift was successfully created.') }
        format.xml  { render :xml => @shift, :status => :created, :location => @shift }

      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shift.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shifts/1
  # PUT /shifts/1.xml
  def update
    @shift = Shift.find(params[:id])

    respond_to do |format|
      if @shift.update_attributes(params[:shift]) && @shift.takingFirstName != "" && @shift.takingEmail != ""
        #Tell the ShiftMailer to send a Email if someone enters name and email for taking shift
        ShiftMailer.shift_taken(@shift).deliver

        format.html { redirect_to(@shift, :notice => 'Shift was successfully Taken!!') }
        format.xml  { head :ok }

      elsif @shift.update_attributes(params[:shift])
        format.html { redirect_to(@shift, :notice => 'Shift was successfully Updated.') }
        format.xml  { head :ok }

      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shift.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1
  # DELETE /shifts/1.xml
  def destroy
    @shift = Shift.find(params[:id])
      if @shift.destroy
        DestroyMailer.shift_destroy(@shift).deliver
      end
    @shift.destroy

    respond_to do |format|
      format.html { redirect_to(shifts_url) }
      format.xml  { head :ok }
    end
  end
end

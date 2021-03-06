class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  before_action :set_plan_course, only: [:addcourse, :removecourse]
  before_action :set_plan_year, only: [:addyear, :removeyear]
  skip_before_action :verify_authenticity_token

  # GET /plans
  # GET /plans.json
  def index
    @plans = Plan.where(user_id: current_user.id)
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
    @id = @plan.id
    @name = @plan.name
    @major = @plan.major
  end

  # GET /plans/new
  def new
    @plan = Plan.new
  end
  
  def addcourse
    @term = Term.find_by(plan: @plan.id, semester: params[:semester], year: params[:year])
    TermCourse.create(term: @term, course: @course)
  end
  
  def removecourse
    @term = Term.find_by(plan: @plan.id, semester: params[:semester], year: params[:year])
    @termcourse = TermCourse.find_by(term: @term, course: @course)
    TermCourse.delete(@termcourse)
  end
  
  def addyear
    @term = Term.exists?(plan: @plan, year: params[:year])
    if @term
      puts "Not added"
      puts @term
    else
      Term.create([{plan: @plan, semester: "Fall", year: params[:year]}, {plan: @plan, semester: "Spring", year: params[:year]}, {plan: @plan, semester: "Summer", year: params[:year]}])

    end
    #Term.new()
    #Term.new(plan: @plan, semester: "Summer", year: params[:year])
  end
  
  
  def removeyear
    @year = Term.where(plan: @plan, year: params[:id])
    # @termcourse = TermCourse.where(term: @term, course: @course)
    Term.delete(@year)
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, notice: 'Plan was successfully created.' }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan, notice: 'Plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: 'Plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end
    def set_plan_course
      @plan = Plan.find(params[:plan_id])
      @course = Course.find_by(cid: params[:id])
    end
    
    def set_plan_year
      @plan = Plan.find(params[:plan_id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:name, :user_id)
    end
end

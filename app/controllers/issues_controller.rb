class IssuesController < ApplicationController
  before_action :set_issue, only: %i[ show edit update destroy ]

  # GET /issues or /issues.json
  def index
    @issues = Issue.all
  end

  # GET /issues/1 or /issues/1.json
  def show
    @project_id = params[:project_id]
    @comments= @issue.comments
  end

  # GET /issues/new
  def new
    @issue = Issue.new
    @project_id = params[:project_id]
  end

  # GET /issues/1/edit
  def edit
    @project_id = params[:project_id]
  end

  # POST /issues or /issues.json
  def create
    @issue = Issue.new(issue_params)
    
    respond_to do |format|
      if @issue.save
        format.html { redirect_to project_issue_url(@issue.project_id, @issue), notice: "Issue was successfully created." }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1 or /issues/1.json
  def update
    respond_to do |format|
      if @issue.update!(issue_params)
        format.html { redirect_to project_issue_url(@issue.project_id, @issue), notice: "Issue was successfully updated." }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1 or /issues/1.json
  def destroy
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to project_url(@issue.project_id), notice: "Issue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def issue_params
      params.require(:issue).permit(:title, :description, :status, :project_id,
                                    :user_id
      )
    end


end

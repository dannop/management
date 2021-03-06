class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :block_non_logged

  # Relação entre Time e Usuário
  def add_users_team
    @usersteam = UsersTeam.create(team_id: params[:id], user_id: params[:users_team][:user_id])
    respond_to do |format|
      if UsersTeam.find_by(user_id: @usersteam.user.id, team_id: @usersteam.team.id)
        @usersteam.destroy
        format.html { redirect_to team_path, notice: 'Membro já adicionado.' }
        format.json { head :no_content }
      else
        @usersteam.save
        format.html { redirect_to team_path, notice: 'Membro adicionado com sucesso.' }
        format.json { head :no_content }
      end
    end
  end

  # GET /teams
  # GET /teams.json
  def index
    @users_team = UsersTeam.all
    @teams = if params[:term]
      Team.where('name LIKE ?', "%#{params[:term]}%").paginate(page: params[:page], per_page: 10)
    else
      Team.paginate(page: params[:page], per_page: 10)
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @users_teams = UsersTeam.where(team_id: params[:id])
    @users_team = UsersTeam.new
    @users = User.all
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :number_of_members, :user_id_id, :limit_of_projects)
    end
end

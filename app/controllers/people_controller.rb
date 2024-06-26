class PeopleController < AdminController
  before_action :set_person, only: %i[ show edit update destroy changed ]

  respond_to :html

  # GET /people or /people.json
  def index
    @people = Person.all
  end

  # GET /people/1 or /people/1.json
  def show
    @person = PersonPresenter.new(@person)

    respond_with @person
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)
    @person.admin = params[:admin] if session[:admin]

    flash[:notice] = 'Pessoa salva' if @person.save
    respond_with @person
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    @person.admin = params[:admin] if session[:admin]

    flash[:notice] = 'Pessoa atualizada' if @person.update(person_params)
    respond_with @person
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    flash[:notice] = 'Pessoa apagada' if @person.destroy
    respond_with @person
  end

  def admins
    @admins = Person.admins
  end

  def changed
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id]) rescue nil

      if !@person
        flash[:notice] = "Pessoa não encontrada"

        redirect_to action: "index"
        return
      end
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:name, :email, :password_digest, :born_at, :image_title, :data_stream)
    end
end

class Admin::PeopleController < ApplicationController
  before_action :set_admin_person, only: %i[ show edit update destroy ]

  # GET /admin/people or /admin/people.json
  def index
    @admin_people = Person.all
  end

  # GET /admin/people/1 or /admin/people/1.json
  def show
  end

  # GET /admin/people/new
  def new
    @admin_person = Person.new
  end

  # GET /admin/people/1/edit
  def edit
  end

  # POST /admin/people or /admin/people.json
  def create
    @admin_person = Admin::Person.new(admin_person_params)

    respond_to do |format|
      if @admin_person.save
        format.html { redirect_to admin_person_url(@admin_person), notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @admin_person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/people/1 or /admin/people/1.json
  def update
    respond_to do |format|
      if @admin_person.update(admin_person_params)
        format.html { redirect_to admin_person_url(@admin_person), notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/people/1 or /admin/people/1.json
  def destroy
    @admin_person.destroy!

    respond_to do |format|
      format.html { redirect_to admin_people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_person
      @admin_person = Admin::Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_person_params
      params.fetch(:admin_person, {})
    end
end

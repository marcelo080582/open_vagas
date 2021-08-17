class PositionsController < ApplicationController
  before_action :set_company, :set_i18n_careers, :set_i18n_contracts, except: [:public_position]
  before_action :set_position, only: %i[edit show update]

  def index
    @positions = @company.positions
  end

  def show
  end

  def new
    @position = @company.positions.build
  end

  def edit
  end

  def create
    @position = @company.positions.new(params_position)
    if @position.save
      flash[:notice] = 'Vaga cadastrada com sucesso.'
      redirect_to positions_path
    else
      render :new
    end
  end

  def update
    if @position.update(params_position)
      flash[:notice] = 'Vaga atualizada com sucesso.'
      redirect_to positions_path
    else
      render :edit
    end
  end

  def public_position
    @position = Position.find_by(slug: params[:slug])
  end

  private

  def set_position
    @position = @company.positions.find(params[:id])
  end

  def set_company
    if current_user.company.nil?
      flash[:alert] = "Primeiramente cadastre uma empresa."
      redirect_to new_company_path
    else
      @company = current_user.company
    end
  end

  def set_i18n_careers
    @careers = I18n.t('activerecord.attributes.position.careers')
  end

  def set_i18n_contracts
    @contracts = I18n.t('activerecord.attributes.position.contracts')
  end

  def params_position
    params.require(:position).permit(:name, :career, :contract, :remote, :publish, :city, :state, :summary, :description)
  end
end

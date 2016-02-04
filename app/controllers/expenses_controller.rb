class ExpensesController < ApplicationController
 before_action :set_expense, only: [:show, :edit, :update, :destroy]

 def index
    @expenses = Expense.paginate(:page => params[:page], :per_page => 20)
  end

 def show
    set_expense
  end


  def new
    @expense = Expense.new
    set_money_sources
  end

 def destroy
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_url }
      format.json { head :no_content }
    end
  end

 def update

    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

 def create
    @expense = Expense.new(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render action: 'show', status: :created, location: @expense }
      else
        format.html { render action: 'new' }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    set_money_sources
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
#      @categories = ItemCategory.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:image_url, :name, :description, :amount, :money_source_id)
    end

    def set_money_sources
      @money_sources = []
      MoneySource.all.map {|x| @money_sources << [x.name, x.id] }
    end
end

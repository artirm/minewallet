class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:edit, :update, :destroy]
  before_action :set_account, only: [:index]
  before_action :isset_account
  before_filter :create_update_interval, only: [:edit, :update]

  # GET /transactions
  # GET /transactions.json
  def index
    @account ? @transactions = @account.transactions.order('create_at DESC').to_a :  @transactions = current_user.transactions.order('created_at DESC').to_a
    #not_found if @transactions.empty?
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = current_user.transactions.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transactions_url, notice: 'Transaction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transaction }
        params[:transaction][:kind] == "1" ? inc(@transaction, params[:transaction][:amount]) : dec(@transaction, params[:transaction][:amount])
      else
        format.html { render action: 'new' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    kind = @transaction.kind
    amount = @transaction.amount
    account = @transaction.account
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transactions_url, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
          unless account == @transaction.account
            kind == 0 ? account.increment!(:balance,  amount) : account.decrement!(:balance, amount)# При смене кошелька возвращаем баланс в предыдущем
          end
        @transaction.kind == 1 ? inc(@transaction, params[:transaction][:amount]) : dec(@transaction, params[:transaction][:amount])
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = current_user.transactions.find(params[:id])
    end

    def set_account
      @account = current_user.accounts.find(params[:account_id]) if params[:account_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params[:transaction].permit(:account_id, :kind, :tags, :amount, :description)
    end

    def create_update_interval
        redirect_to transactions_path, alert: t('transactions.update_forbidden')  unless @transaction.update_allowed
    end

    def not_found
      redirect_to root_path, notice: 'Transaction empty!.'
      #raise ActionController::RoutingError.new('Not Found')
    end

    def inc(transaction, amount)
      transaction.account.increment!(:balance,  amount.to_f)
    end

    def dec(transaction, amount)
      transaction.account.decrement!(:balance, amount.to_f)
    end
end

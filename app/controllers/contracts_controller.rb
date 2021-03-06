class ContractsController < ApplicationController
    before_action :set_contract, only: [:show, :edit, :update, :destroy]

    # GET /contracts
    # GET /contracts.json
    def index
      @contracts = Contract.all
      @search = Contract.search(params[:q])
      @contracts = @search.result
    end

    # GET /contracts/1
    # GET /contracts/1.json
    def show
    end

    # GET /contracts/new
    def new
      @contract = Contract.new
    end

    # GET /contracts/1/edit
    def edit
    end

    # POST /contracts
    # POST /contracts.json
    def create
      @contract = Contract.new(contract_params)

      respond_to do |format|
        if @contract.save
          format.html { redirect_to @contract, notice: (t 'contracts.title')+(t 'actions.created') }
          format.json { render action: 'show', status: :created, location: @contract }
        else
          format.html { render action: 'new' }
          format.json { render json: @contract.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /contracts/1
    # PATCH/PUT /contracts/1.json
    def update
      respond_to do |format|
        if @contract.update(contract_params)
          format.html { redirect_to @contract, notice: (t 'contracts.title')+(t 'actions.updated') }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @contract.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /contracts/1
    # DELETE /contracts/1.json
    def destroy
      @contract.destroy
      respond_to do |format|
        format.html { redirect_to contracts_url }
        format.json { head :no_content }
      end
    end
  
    #def maintenance_contract
        #@contracts = Contract.all
        #%x(bundle exec thor datashift:export:excel -m Contract -r public/Contract.xls)
    #end 
   
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_contract
        @contract = Contract.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def contract_params
        params.require(:contract).permit(:contract_no, :name, :description, :company_id, :value, :starts_on, :ends_on, :issued_by, :contract_type, :category)
      end

end

class TpcMembersController < ApplicationController
before_action :authenticate_user!
  def new
    @tpc=TpcMember.new
    authorize! :create,@tpc
  end

  def index
    @tpc=TpcMember.sorted
  end

  def create
    @tpc = TpcMember.new(tpc_params())
    # Save the object
    if @tpc.save
      # If save succeeds, redirect to the index action
      #flash[:notice]="Company succeessfully created"
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @tpc=TpcMember.find(params[:id])
    authorize! :update,@tpc

  end

  def update
    @tpc=TpcMember.find(params[:id])
    if @tpc.update_attributes(tpc_params())
        #flash[:notice]="Company succeessfully updated"
      redirect_to(:action=>'index',:id=>@tpc.id)
    else
      render('edit')
    end
  end

  def delete
    @tpc=TpcMember.find(params[:id])
    authorize! :destroy,@tpc

  end

  def destroy
    tpc=TpcMember.find(params[:id]).destroy
    flash[:notice]="Member succeessfully destroyed"
      redirect_to(:action=>'index')
  end

  private
  def tpc_params
    params.require(:tpc).permit(:t_roll_no,:t_name,:t_batch,:team,:date_of_joining)
  end
end

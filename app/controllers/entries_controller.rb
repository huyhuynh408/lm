class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      flash[:notice] = "Your entry was created"
      redirect_to(action: 'index')
    else
      render('new')
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:name, :amount)
  end
end
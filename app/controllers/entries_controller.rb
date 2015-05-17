class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def show
    @entry = Entry.find_by_id(params[:id])
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

  def edit
    @entry = Entry.find_by_id(params[:id])
  end

  def update
    @entry = Entry.find_by_id(params[:id])
    if @entry.update(entry_params)
      flash[:notice] = "Updated!!!!"
      redirect_to(action: 'show', id: "#{@entry.id}")
    else
      render('edit')
    end
  end

  def destroy
    Entry.find_by_id(params[:id]).destroy
    flash[:notice] = "Deleted!"
    redirect_to(action: 'index')
  end

  private
  def entry_params
    params.require(:entry).permit(:name, :amount)
  end
end
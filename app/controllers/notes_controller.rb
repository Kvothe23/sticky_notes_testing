class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def edit
    @note = Note.find(params[:id])
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      flash[:notice] = "Note created."
      redirect_to @note
    else
      flash[:alert] = "Please try again."
      render :new
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      flash[:notice] = "Note updated."
      redirect_to @note
    else
      flash[:alert] = "Please try again."
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    flash[:notice] = "Note deleted."
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :content)
  end
end

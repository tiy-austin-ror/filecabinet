class NotesController < ApplicationController
  def index
    notes = Note.all
    render locals: { notes: notes }
  end

  def show
    if Note.exists?(params[:id])
      note = Note.find(params[:id])
      render locals: { note: note }
    else
      render html: 'Note not found', status: 404
    end
  end

  def new
    render locals: { note: Note.new }
  end

  def create
    note = Note.new(note_params)
    if note.save
      redirect_to note
    else
      render :new, locals: { note: note }
    end
  end

  def edit
    render locals: { note: Note.find(params[:id]) }
  end

  def update
    if Note.exists?(params[:id])
      note = Note.find(params[:id])
      if note.update(note_params)
        redirect_to note
      else
        render :edit
      end
    else
      render html: 'Note not found', status: 404
    end
  end

  def destroy
    if Note.exists?(params[:id])
      Note.destroy(params[:id])
      flash[:notice] = "Note deleted"
      redirect_to notes
    else
      flash[:alert] = "There was an error - please try again"
    end
  end

  private
  def note_params
    params.require(:note).permit(:user_id, :category_id, :name, :body, :file_type)
  end
end

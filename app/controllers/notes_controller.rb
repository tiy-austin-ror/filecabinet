class NotesController < ApplicationController
  def index
    notes = Note.all
    if has_permission?(notes)
      render locals: { notes: notes }
    else
      flash[:alert] = "You do not have permission to view this page."
      redirect_to root_path
    end
  end

  def show
    note = Note.find(params[:id])
    if has_permission?(note)
      if note
        render locals: { note: note }
      else
        render html: 'Note not found', status: 404
      end
    else
      flash[:alert] = "You do not have permission to view this page."
      redirect_to root_path
    end
  end

  def new
    render locals: { note: Note.new }
  end

  def create
    note = current_user.notes.build(note_params)
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
    note = Note.find(params[:id])
    if has_permission?(note)
      if note
        if note.update(note_params)
          redirect_to note
        else
          render :edit
        end
      else
        render html: 'Note not found', status: 404
      end
    else
      flash[:alert] = "You do not have permission to view this page."
      redirect_to root_path
    end
  end

  def destroy
    if has_permission?
    note = Note.find(params[:id])
      if note
        note.destroy
        flash[:notice] = "Note deleted"
        redirect_to notes
      else
        flash[:alert] = note.errors
      end
    else
      flash[:alert] = "You do not have permission to delete this note."
      redirect_to root_path
    end
  end

  private
  def note_params
    params.require(:note).permit(:user_id, :category_id, :name, :body, :file_type)
  end

  def has_permission?(notes)
    Note.user_id == current_user.id || current_user.admin?
  end
end

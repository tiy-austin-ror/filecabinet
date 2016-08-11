class NotesController < ApplicationController
  before_action :disable_search

  def index
    if params[:search]
      notes = Note.where("name ~* '.*#{params[:search]}.*'")
    else
      notes = Note.all
    end
    render locals: { notes: notes.select { |note| current_permission?(note) }.order(:updated_at) }
  end

  def show
    note = Note.find(params[:id])
    if note
      if current_permission?(note)
        render locals: { note: note, permission: Permission.new }
      else
        flash[:alert] = "You do not have permission to view this page."
        redirect_to root_path
      end
    else
      render html: 'Note not found', status: 404
    end
  end

  def new
    render locals: { note: Note.new }
  end

  def create
    note = current_user.notes.build(note_params)
    if note.save

      Tagging.create_tags(note, params)
      redirect_to note
    else
      flash[:alert] = "Note could not be created: #{note.errors.full_messages}"
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
          Tagging.update_tags(note, params)
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
    note = Note.find(params[:id])
    if has_permission?(note)
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
end

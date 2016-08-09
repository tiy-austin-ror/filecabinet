class NotesController < ApplicationController
  def index
    notes = Note.all
    render locals: { notes: notes }
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
      params["tags"]["name"].split(",").each do |tag|
        next if tag.blank?
        t = Tag.find_or_create_by(name: tag.strip.downcase)
        Tagging.find_or_create_by(tag: t, taggable_type: note.class, taggable_id: note.id)
      end
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

  def has_permission?(note)
    note.user_id == current_user.id || current_user.admin?
  end
end

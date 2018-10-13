class Video < ApplicationRecord
    belongs_to :box

    def video_note(current_user_id,box_id)
        note = Note.find_by(["user_id = ? and box_id = ? and note_type = 1", current_user_id,box_id])
        return 0 if note.blank?
        return note.text
    end
end

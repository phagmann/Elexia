class Paragraph < ApplicationRecord
    belongs_to :box

    def paragraph_note(current_user_id,box_id)
        note = Note.find_by(["user_id = ? and box_id = ? and note_type = 5", current_user_id,box_id])
        return 0 if note.blank?
        return note.text
    end
end

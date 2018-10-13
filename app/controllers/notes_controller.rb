class NotesController < ApplicationController
    def new
        
        respond_to do |format|
          format.json { 
            # p params
            # p "$$$$$$$$$$$$$$$$$$$$$$$"
            n = Note.find_by(note_type: params[:note_type], user_id: params[:user_id], box_id: params[:box_id])
            if n.blank?
                Note.create(note_type: params[:note_type], user_id: params[:user_id], box_id: params[:box_id],text: params[:main_string])
            else
                n.update(text: params[:main_string])
            end

            
          }




          format.html {
            
          }
        end
    end
end

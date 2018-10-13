class ToolsController < ApplicationController


    def addition 
    end


    def subtraction
    end

    def definition
        respond_to do |format|

        format.json { 

            client = OxfordDictionary::Client.new(app_id: 'f926bed8', app_key: 'ef3d69263885f327bd2004157357b5d0')
            client = OxfordDictionary.new(app_id: 'f926bed8', app_key: 'ef3d69263885f327bd2004157357b5d0')
        
            entry = client.entry(params[:word])

            render json: entry.lexical_entries[0].entries[0].senses[0].definitions[0]

 
          }
        end
    end


end
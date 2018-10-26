require 'caracal/core/models/paragraph_model'
require 'caracal/core/models/line_break_model'
require 'caracal/errors'


module Caracal
  module Core
    
    # This module encapsulates all the functionality related to adding text
    # to the document.
    #
    module Text
      def self.included(base)
        base.class_eval do
          
          #-------------------------------------------------------------
          # Public Methods
          #-------------------------------------------------------------
          
          #============== PARAGRAPHS ==========================
          
          def p(*args, &block)
            options = Caracal::Utilities.extract_options!(args)
            options.merge!({ content: args.first }) if args.first
            
            model = Caracal::Core::Models::ParagraphModel.new(options, &block)
            if model.valid?
              contents << model
            else
              raise Caracal::Errors::InvalidModelError, 'Paragraphs and headings, which delegate to the :p command, require at least one text string.'
            end
            model
          end
          
          
          #============== HEADINGS ============================
          
          # All heading methods simply delegate to the paragraph
          # model with an explicitly set style class.
          #
          [:h1, :h2, :h3, :h4, :h5, :h6].each do |cmd|
            define_method "#{ cmd }" do |*args, &block|
              options = Caracal::Utilities.extract_options!(args)
              options.merge!({ style: style_id_for_header(cmd) })
              p(args.first, options, &block)
            end
          end
          
          
          #-------------------------------------------------------------
          # Private Methods
          #-------------------------------------------------------------
          private
          
          # This method translates the html-like command to the 
          # corresponding style id.
          #
          def style_id_for_header(command)
            case command.to_s
              when 'h1' then 'Heading1'
              when 'h2' then 'Heading2'
              when 'h3' then 'Heading3'
              when 'h4' then 'Heading4'
              when 'h5' then 'Heading5'
              when 'h6' then 'Heading6'
              else 'Normal'
            end
          end
          
        end
      end
    end
    
  end
end

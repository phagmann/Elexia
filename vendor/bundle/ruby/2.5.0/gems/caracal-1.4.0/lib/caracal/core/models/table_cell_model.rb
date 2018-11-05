require 'caracal/core/models/base_model'
require 'caracal/core/models/margin_model'
require 'caracal/core/models/paragraph_model'


module Caracal
  module Core
    module Models

      # This class handles block options passed to tables via their data
      # collections.
      #
      class TableCellModel < BaseModel

        #-------------------------------------------------------------
        # Configuration
        #-------------------------------------------------------------

        # constants
        const_set(:DEFAULT_CELL_BACKGROUND,       'ffffff')
        const_set(:DEFAULT_CELL_MARGINS,          Caracal::Core::Models::MarginModel.new({ top: 100, bottom: 100, left: 100, right: 100 }))
        const_set(:DEFAULT_CELL_VERTICAL_ALIGN,   :top)

        # accessors
        attr_reader :cell_background
        attr_reader :cell_width
        attr_reader :cell_margins
        attr_reader :cell_vertical_align
        attr_reader :cell_rowspan
        attr_reader :cell_colspan

        # initialization
        def initialize(options={}, &block)
          @cell_background      = DEFAULT_CELL_BACKGROUND
          @cell_margins         = DEFAULT_CELL_MARGINS
          @cell_vertical_align  = DEFAULT_CELL_VERTICAL_ALIGN

          if content = options.delete(:content)
            p content, options.dup, &block
          end

          super options, &block

          p_klass = Caracal::Core::Models::ParagraphModel     # the final tag in a table cell
          unless contents.last.is_a? p_klass                  # *must* be a paragraph for OOXML
            contents << p_klass.new(content: '')              # to not throw an error.
          end
        end


        #-------------------------------------------------------------
        # Public Methods
        #-------------------------------------------------------------

        #=============== DATA ACCESSORS =======================

        def contents
          @contents ||= []
        end


        #=============== STYLES ===============================

        # This method allows styles to be applied to this cell
        # from the table level.  It attempts to add the style
        # first to the instance, and then to any sub-models that
        # respond to the method.
        #
        # In all cases, invalid options will simply be ignored.
        #
        def apply_styles(opts={})
          # make dup of options so we don't
          # harm args sent to sibling cells
          options = opts.dup

          # first, try apply to self
          options.each do |(k,v)|
            send(k, v)  if respond_to?(k)
          end

          # prevent top-level attrs from trickling down
          options.delete_if { |(k,v)| option_keys.include?(k) }

          # then, try apply to contents
          contents.each do |model|
            options.each do |k,v|
              model.send(k, v) if model.respond_to?(k)
            end

            # finally, apply to runs. options do trickle down
            # because paragraph-level styles don't seem to
            # affect runs within tables. weirdsies.
            if model.respond_to?(:runs)
              model.runs.each do |run|
                options.each do |k,v|
                  run.send(k, v) if run.respond_to?(k)
                end
              end
            end
          end
        end

        def calculate_width(default_width)
          width(default_width) unless cell_width.to_i > 0

          container_width = cell_width - cell_margin_left - cell_margin_right

          contents.each do |model|
            if model.respond_to?(:calculate_width)
              model.calculate_width(container_width)    # will always be a TableModel
            end
          end
        end


        #=============== GETTERS ==============================

        # margin attrs
        [:top, :bottom, :left, :right].each do |m|
          define_method "cell_margin_#{ m }" do
            v = cell_margins ? cell_margins.send("margin_#{ m }") : 0
          end
        end


        #=============== SETTERS ==============================

        # integers
        [:width, :colspan, :rowspan].each do |m|
          define_method "#{ m }" do |value|
            instance_variable_set("@cell_#{ m }", value.to_i)
          end
        end

        # models
        [:margins].each do |m|
          define_method "#{ m }" do |options = {}, &block|
            instance_variable_set("@cell_#{ m }", Caracal::Core::Models::MarginModel.new(options, &block))
          end
        end

        # strings
        [:background].each do |m|
          define_method "#{ m }" do |value|
            instance_variable_set("@cell_#{ m }", value.to_s)
          end
        end

        #symbols
        [:vertical_align].each do |m|
          define_method "#{ m }" do |value|
            instance_variable_set("@cell_#{ m }", value.to_s.to_sym)
          end
        end

        #=============== VALIDATION ===========================

        def valid?
          contents.size > 0
        end


        #-------------------------------------------------------------
        # Private Instance Methods
        #-------------------------------------------------------------
        private

        def option_keys
          [:background, :margins, :width, :vertical_align, :rowspan, :colspan]
        end

      end

    end
  end
end

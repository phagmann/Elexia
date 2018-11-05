require 'spec_helper'

describe Caracal::Core::Models::StyleModel do
  subject do
    described_class.new do
      id        'Normal'
      name      'normal'
      font      'Arial'
      size      20
      line      360
    end
  end

  #-------------------------------------------------------------
  # Configuration
  #-------------------------------------------------------------

  describe 'configuration tests' do

    # constants
    describe 'constants' do
      it { expect(described_class::DEFAULT_STYLE_TYPE).to eq 'paragraph' }
      it { expect(described_class::DEFAULT_STYLE_COLOR).to eq '333333' }
      it { expect(described_class::DEFAULT_STYLE_SIZE).to eq 20 }
      it { expect(described_class::DEFAULT_STYLE_BOLD).to eq false }
      it { expect(described_class::DEFAULT_STYLE_ITALIC).to eq false }
      it { expect(described_class::DEFAULT_STYLE_UNDERLINE).to eq false }
      it { expect(described_class::DEFAULT_STYLE_CAPS).to eq false }
      it { expect(described_class::DEFAULT_STYLE_ALIGN).to eq :left }
      it { expect(described_class::DEFAULT_STYLE_TOP).to eq 0 }
      it { expect(described_class::DEFAULT_STYLE_BOTTOM).to eq 0 }
      it { expect(described_class::DEFAULT_STYLE_LINE).to eq 360 }
      it { expect(described_class::DEFAULT_STYLE_BASE).to eq 'Normal' }
      it { expect(described_class::DEFAULT_STYLE_NEXT).to eq 'Normal' }
    end

    # accessors
    describe 'accessors' do
      it { expect(subject.style_default).to eq true }
      it { expect(subject.style_id).to eq 'Normal' }
      it { expect(subject.style_name).to eq 'normal' }
      it { expect(subject.style_type).to eq 'paragraph' }
      it { expect(subject.style_color).to eq '333333' }
      it { expect(subject.style_font).to eq 'Arial' }
      it { expect(subject.style_size).to eq 20 }
      it { expect(subject.style_bold).to eq false }
      it { expect(subject.style_italic).to eq false }
      it { expect(subject.style_underline).to eq false }
      it { expect(subject.style_caps).to eq false }
      it { expect(subject.style_align).to eq :left }
      it { expect(subject.style_top).to eq 0 }
      it { expect(subject.style_bottom).to eq 0 }
      it { expect(subject.style_line).to eq 360 }
      it { expect(subject.style_base).to eq 'Normal' }
      it { expect(subject.style_next).to eq 'Normal' }
    end

  end


  #-------------------------------------------------------------
  # Public Methods
  #-------------------------------------------------------------

  describe 'public method tests' do

    #=============== SETTERS ==========================

    # booleans
    describe '.bold' do
      before { subject.bold(true) }

      it { expect(subject.style_bold).to eq true }
    end
    describe '.italic' do
      before { subject.italic(true) }

      it { expect(subject.style_italic).to eq true }
    end
    describe '.underline' do
      before { subject.underline(true) }

      it { expect(subject.style_underline).to eq true }
    end
    describe '.caps' do
      before { subject.caps(true) }

      it { expect(subject.style_caps).to eq true }
    end

    # integers
    describe '.bottom' do
      before { subject.bottom(100) }

      it { expect(subject.style_bottom).to eq 100 }
    end
    describe '.size' do
      before { subject.size(24) }

      it { expect(subject.style_size).to eq 24 }
    end
    describe '.line' do
      before { subject.line(480) }

      it { expect(subject.style_line).to eq 480 }
    end
    describe '.top' do
      before { subject.top(100) }

      it { expect(subject.style_top).to eq 100 }
    end
    describe '.indent_left' do
      before { subject.indent_left(1440) }

      it { expect(subject.style_indent_left).to eq 1440 }
    end
    describe '.indent_right' do
      before { subject.indent_right(720) }

      it { expect(subject.style_indent_right).to eq 720 }
    end
    describe '.indent_right' do
      before { subject.indent_first(567) }

      it { expect(subject.style_indent_first).to eq 567 }
    end

    # strings
    describe '.id' do
      before { subject.id('heading1') }

      it { expect(subject.style_id).to eq 'heading1' }
    end
    describe '.name' do
      before { subject.name('Heading 1') }

      it { expect(subject.style_name).to eq 'Heading 1' }
    end
    describe '.color' do
      before { subject.color('444444') }

      it { expect(subject.style_color).to eq '444444' }
    end
    describe '.font' do
      before { subject.font('Helvetica') }

      it { expect(subject.style_font).to eq 'Helvetica' }
    end

    # symbols
    describe '.align' do
      before { subject.align(:right) }

      it { expect(subject.style_align).to eq :right }
    end

    # custom
    describe '.type' do
      describe 'when valid' do
        before { subject.type 'character'}

        it { expect(subject.style_type).to eq 'character' }
      end
      describe 'when invalid' do
        before { subject.type 'bogus'}

        it { expect(subject.style_type).to eq 'paragraph' }
      end
    end


    #=================== STATE ===============================

    # .matches?
    describe '.matches?' do
      describe 'when search term matches' do
        let(:actual) { subject.matches?('normal') }

        it { expect(actual).to eq true }
      end
      describe 'when search term does not match' do
        let(:actual) { subject.matches?('Dummy') }

        it { expect(actual).to eq false }
      end
    end


    #=============== VALIDATION ===========================

    describe '.valid?' do
      describe 'when type and id provided' do
        it { expect(subject.valid?).to eq true }
      end
      [:id, :name].each do |prop|
        describe "when #{ prop } nil" do
          before do
            allow(subject).to receive("style_#{ prop }").and_return(nil)
          end

          it { expect(subject.valid?).to eq false }
        end
      end
    end

  end


  #-------------------------------------------------------------
  # Private Methods
  #-------------------------------------------------------------

  describe 'private method tests' do

    # .option_keys
    describe '.option_keys' do
      let(:actual)   { subject.send(:option_keys).sort }
      let(:expected) { [:type, :bold, :italic, :underline, :caps, :top, :bottom, :size, :line, :id, :name, :color, :font, :align, :indent_left, :indent_right, :indent_first].sort }

      it { expect(actual).to eq expected }
    end

  end

end

require './flatten'

describe '#flatten' do
  subject { flatten(input) }

  context 'when input is invalid' do
    context 'when input is not an array' do
      context 'when input is Nil' do
        let(:input) { nil }

        it 'raises an error' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end

      context 'when input is a Boolean' do
        let(:input) { true }

        it 'raises an error' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end

      context 'when input is a Symbol' do
        let(:input) { :input }

        it 'raises an error' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end

      context 'when input is a Fixnum' do
        let(:input) { 1 }

        it 'raises an error' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end

      context 'when input is a String' do
        let(:input) { '1' }

        it 'raises an error' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end

      context 'when input is a Hash' do
        let(:input) { { a: 1, b: 2 } }

        it 'raises an error' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end
    end

    context 'when input is an array' do
      context 'when input contains a Nil element' do
        let(:input) { [1, 2, [3, nil], [4, [5]]] }

        it 'raises an error' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end

      context 'when input contains a Boolean element' do
        let(:input) { [1, 2, [3, true], [4, [5]]] }

        it 'raises an error' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end

      context 'when input contains a Symbol element' do
        let(:input) { [1, 2, [3, :element], [4, [5]]] }

        it 'raises an error' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end

      context 'when input contains a String element' do
        let(:input) { [1, 2, [3, '1'], [4, [5]]] }

        it 'raises an error' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end

      context 'when input contains a Hash element' do
        let(:input) { [1, 2, [3, { a: 1, b: 2 }], [4, [5]]] }

        it 'raises an error' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end
    end
  end

  context 'when input is valid' do
    context 'when input is empty' do
      let(:input) { [] }

      it 'returns an empty array' do
        expect(subject).to eq(input)
      end
    end

    context 'when input is a flat array' do
      let(:input) { [1, 2, 3] }

      it 'returns same array, as in the input' do
        expect(subject).to eq(input)
      end
    end

    context 'when input is a nested array' do
      context 'when input has only 1 level of nesting' do
        let(:input)  { [1, 2, 3, [4, 5]] }
        let(:output) { [1, 2, 3, 4, 5] }

        it 'returns the flattened input' do
          expect(subject).to eq(output)
        end
      end

      context 'when input has more than 1 level of nesting' do
        let(:input)  { [1, [2, 3, [4, [5]]]] }
        let(:output) { [1, 2, 3, 4, 5] }

        it 'returns the flattened input' do
          expect(subject).to eq(output)
        end
      end
    end

    context 'when input contains empty arrays' do
      let(:input)  { [[[], []], 1, [2, 3, [], [4, [5], [[[]]]]]] }
      let(:output) { [1, 2, 3, 4, 5] }

      it 'returns the flattened input' do
        expect(subject).to eq(output)
      end
    end
  end
end
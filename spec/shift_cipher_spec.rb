require 'spec_helper'

describe ShiftCipher do

  describe 'Caesar Shift Cipher' do

    context 'cipher encrypts and decrypts message given offset' do
      let(:cipher) { ShiftCipher::Caesar.new(1) }
      
      it 'encrypts a message' do
        expect(cipher.encrypt('hello world')).to eq('ifmmpxpsme')
      end

      it 'decrypts a message' do
        expect(cipher.decrypt('ifmmpxpsme')).to eq('helloworld')
      end

      it 'correctly cycles alphabet' do
        expect(cipher.encrypt('xyz')).to eq('yza')
        expect(cipher.encrypt('zab')).to eq('abc')

        expect(cipher.decrypt('yza')).to eq('xyz')
        expect(cipher.decrypt('abc')).to eq('zab')
      end

      it 'has a negative offset' do
        negative_cipher = ShiftCipher::Caesar.new(-1)
        expect(negative_cipher.encrypt('hello world')).to eq('gdkknvnqkc')
      end
    end

    context 'cipher initialized with starting letter' do
      let(:cipher) { ShiftCipher::Caesar.new('b') }

      it 'sets the offset to one' do
        expect(cipher.offset).to eq(1)
      end    
    end

    context 'cipher initialized with integer offset' do
      let(:cipher) { ShiftCipher::Caesar.new(1) }
      
      it 'sets the offset to one' do
        expect(cipher.offset).to eq(1)
      end
    end

    context 'cipher initialized with string offset' do
      let(:cipher) { ShiftCipher::Caesar.new('1') }
      
      it 'sets the offset to one' do
        expect(cipher.offset).to eq(1)
      end
    end

    context 'cipher initialized with no offset (takes default)' do
      let(:cipher) { ShiftCipher::Caesar.new }
      
      it 'sets the offset to zero' do
        expect(cipher.offset).to eq(0)
      end
    end

    context 'cipher string includes capital letters' do
      let(:cipher) { ShiftCipher::Caesar.new(1) }
      
      it 'encrypts a message' do
        expect(cipher.encrypt('Hello WORLD')).to eq('ifmmpxpsme')
      end

      it 'decrypts a message' do
        expect(cipher.decrypt('ifmMPxPSme')).to eq('helloworld')
      end
    end

    context 'cipher string includes numeric characters' do
      let(:cipher) { ShiftCipher::Caesar.new(1) }
      
      it 'encrypts a message' do
        expect(cipher.encrypt('h3ll0 w0rld!')).to eq('i3mm0x0sme')
      end

      it 'decrypts a message' do
        expect(cipher.decrypt('i3mm0x0sme!')).to eq('h3ll0w0rld')
      end
    end

    context 'cipher string includes non-alpha-numeric characters' do
      let(:cipher) { ShiftCipher::Caesar.new(1) }
      
      it 'encrypts a message' do
        expect(cipher.encrypt('Oh!world,&howIsay,"hello"tothee.')).to eq('pixpsmeipxjtbzifmmpupuiff')
      end      
    end

    context 'multi-line message' do
      let(:cipher) { ShiftCipher::Caesar.new(1) }

      it 'encrypts a multi-line message' do
        message = "Love is too young to know what conscience is,\nYet who knows not conscience is born of love?"
        encrypted_message = "mpwfjtuppzpvohuplopxxibudpotdjfodfjtzfuxiplopxtopudpotdjfodfjtcpsopgmpwf"
        expect(cipher.encrypt(message)).to eq(encrypted_message)
      end
    end

    context 'cipher given empty string' do
      let(:cipher) { ShiftCipher::Caesar.new(1) }
      
      it 'encrypts a message' do
        expect(cipher.encrypt('')).to eq('')
      end

      it 'decrypts a message' do
        expect(cipher.decrypt('')).to eq('')
      end
    end
  end
end
require 'spec_helper'

describe ShiftCipher do

  describe 'Caeser Shift Cipher' do

    context 'cipher encrypts and decrypts message given offset' do
      let(:cipher) { ShiftCipher::Caeser.new(1) }
      
      it 'encrypts a message' do
        expect(cipher.encrypt('hello world')).to eq('ifmmp xpsme')
      end

      it 'decrypts a message' do
        expect(cipher.decrypt('ifmmp xpsme')).to eq('hello world')
      end

      it 'correctly cycles alphabet' do
        expect(cipher.encrypt('xyz')).to eq('yza')
        expect(cipher.encrypt('zab')).to eq('abc')

        expect(cipher.decrypt('yza')).to eq('xyz')
        expect(cipher.decrypt('abc')).to eq('zab')
      end
    end

    context 'cipher initialized with starting letter' do
      let(:cipher) { ShiftCipher::Caeser.new('b') }

      it 'sets the offset to one' do
        expect(cipher.offset).to eq(1)
      end    
    end

    context 'cipher initialized with integer offset' do
      let(:cipher) { ShiftCipher::Caeser.new(1) }
      
      it 'sets the offset to one' do
        expect(cipher.offset).to eq(1)
      end
    end

    context 'cipher initialized with string offset' do
      let(:cipher) { ShiftCipher::Caeser.new('1') }
      
      it 'sets the offset to one' do
        expect(cipher.offset).to eq(1)
      end
    end

    context 'cipher initialized with no offset (takes default)' do
      let(:cipher) { ShiftCipher::Caeser.new }
      
      it 'sets the offset to zero' do
        expect(cipher.offset).to eq(0)
      end
    end

    context 'cipher string includes capital letters' do
      let(:cipher) { ShiftCipher::Caeser.new(1) }
      
      it 'encrypts a message' do
        expect(cipher.encrypt('Hello WORLD')).to eq('ifmmp xpsme')
      end

      it 'decrypts a message' do
        expect(cipher.decrypt('ifmMP xPSme')).to eq('hello world')
      end
    end

    context 'cipher string includes numeric characters' do
      let(:cipher) { ShiftCipher::Caeser.new(1) }
      
      it 'encrypts a message' do
        expect(cipher.encrypt('h3ll0 w0rld!')).to eq('i3mm0 x0sme')
      end

      it 'decrypts a message' do
        expect(cipher.decrypt('i3mm0 x0sme!')).to eq('h3ll0 w0rld')
      end
    end

    context 'cipher string includes non-alpha-numeric characters' do
      let(:cipher) { ShiftCipher::Caeser.new(1) }
      
      it 'encrypts a message' do
        expect(cipher.encrypt('Oh! world, & how I say, "hello" to thee.')).to eq('pi xpsme ipx j tbz ifmmp up uiff')
      end      
    end

    context 'multi-line message' do
      let(:cipher) { ShiftCipher::Caeser.new(1) }

      it 'encrypts a multi-line message' do
        message = "Love is too young to know what conscience is,\nYet who knows not conscience is born of love?"
        encrypted_message = "mpwf jt upp zpvoh up lopx xibu dpotdjfodf jt\nzfu xip lopxt opu dpotdjfodf jt cpso pg mpwf"
        expect(cipher.encrypt(message)).to eq(encrypted_message)
      end
    end

    context 'cipher given empty string' do
      let(:cipher) { ShiftCipher::Caeser.new(1) }
      
      it 'encrypts a message' do
        expect(cipher.encrypt('')).to eq('')
      end

      it 'decrypts a message' do
        expect(cipher.decrypt('')).to eq('')
      end
    end
  end
end
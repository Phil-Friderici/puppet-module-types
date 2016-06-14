require 'spec_helper'
describe 'types::file' do
  let(:title) { '/tmp/file1' }

  context 'file with metaparameters specified' do
    let(:params) do
      { :ensure                  => 'present',
        :before                  => 'File[before]',
        :notify                  => 'File[notify]',
        :require                 => 'File[require]',
        :subscribe               => 'File[subscribe]',
        :tag                     => 'rspec-tag',
      }
    end

    it { should contain_file('/tmp/file1').without_before }
    it { should contain_file('/tmp/file1').without_notify }
    it { should contain_file('/tmp/file1').without_require }
    it { should contain_file('/tmp/file1').without_subscribe }
    it { should contain_file('/tmp/file1').with_tag('rspec-tag') }

    it do
      should contain_file('/tmp/file1').only_with({
        'ensure'    => 'present',
        'before'    => nil,
        'notify'    => nil,
        'require'   => nil,
        'subscribe' => nil,
        'tag'       => 'rspec-tag',
      })
    end
  end
end
=begin
  describe 'with ensure' do
    ['present','absent','file','directory','link'].each do |value|
      context "set to #{value}" do
        let(:params) { { :ensure => value } }

        it { should contain_file('/tmp/foo').with({
            'ensure'  => value,
            'owner'   => 'root',
            'group'   => 'root',
            'mode'    => '0644',
          })
        }
      end
    end
  end

  context 'file with invalid ensure' do
    let(:params) { { :ensure => 'invalid' } }

    it 'should fail' do
      expect {
        should contain_class('types')
      }.to raise_error(Puppet::Error,/types::file::\/tmp\/foo::ensure is invalid and does not match the regex\./)
    end
  end

  describe 'file with mode set to invalid' do
    ['666',665,'10666','foo',true].each do |value|
      context "value of #{value}" do
        let(:params) { { :mode => 'invalid' } }

        it 'should fail' do
          expect {
            should contain_class('types')
          }.to raise_error(Puppet::Error,/types::file::\/tmp\/foo::mode must be exactly 4 digits\./)
        end
      end
    end
  end

  context 'file with name that is not an absolute path' do
    let(:params) { { :ensure => 'invalid/path' } }

    it 'should fail' do
      expect {
        should contain_class('types')
      }.to raise_error(Puppet::Error,/types::file::\/tmp\/foo::ensure is invalid and does not match the regex\./)
    end
  end
end
=end
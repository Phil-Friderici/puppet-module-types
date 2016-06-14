require 'spec_helper'
describe 'types' do

  context 'with metaparameters set' do
    let(:facts) { { :osfamily => 'RedHat' } }
    let(:params) { { :files => {
      '/tmp/file1' => {
        'before'                  => 'File[before]',
        'notify'                  => 'File[notify]',
        'require'                 => 'File[require]',
        'subscribe'               => 'File[subscribe]',
        'tag'                     => 'rspec-tag',
      },
    } } }

    it { should contain_file('/tmp/file1').without_before }
    it { should contain_file('/tmp/file1').without_notify }
    it { should contain_file('/tmp/file1').without_require }
    it { should contain_file('/tmp/file1').without_subscribe }
    it { should contain_file('/tmp/file1').without_tag }
    it do
      should contain_file('/tmp/file1').with({
        'before'                  => nil,
        'notify'                  => nil,
        'require'                 => nil,
        'subscribe'               => nil,
        'tag'                     => nil,
      })
    end

    it { should contain_types__file('/tmp/file1').with_before('File[before]') }
    it { should contain_types__file('/tmp/file1').with_notify('File[notify]') }
    it { should contain_types__file('/tmp/file1').with_require('File[require]') }
    it { should contain_types__file('/tmp/file1').with_subscribe('File[subscribe]') }
    it { should contain_types__file('/tmp/file1').with_tag('rspec-tag') }

    it do
      should contain_types__file('/tmp/file1').with({
        'before'                  => 'File[before]',
        'notify'                  => 'File[notify]',
        'require'                 => 'File[require]',
        'subscribe'               => 'File[subscribe]',
        'tag'                     => 'rspec-tag',
      })
    end
  end
end

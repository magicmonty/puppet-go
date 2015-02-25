require "spec_helper"

describe "go::local" do
  let(:default_params) do
    {
      :ensure  => "present",
      :version => "1.4.1"
    }
  end

  let(:facts) do
    {
      :boxen_home                  => '/opt/boxen',
      :boxen_user                  => 'martingondermann',
      :macosx_productversion_major => '10.10'
    }
  end

  let(:title) { "/tmp" }

  context 'ensure => present' do
    let(:params) { default_params }

    it do
      should include_class("go::1_4_1")

      should contain_file("/tmp/.go-version").with({
        :ensure  => "present",
        :content => "1.4.1\n",
        :replace => true
      })
    end
  end

  context "ensure => absent" do
    let(:params) { default_params.merge(:ensure => "absent") }

    it do
      should_not include_class("go::1_4_1")

      should contain_file("/tmp/.go-version").with({
        :ensure => "absent"
      })
    end
  end
end

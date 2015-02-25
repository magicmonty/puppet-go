require "spec_helper"

describe "go" do
  let(:facts) { default_test_facts }

  it do
    should include_class("boxen::config")
    should contain_file("/opt/boxen/env.d/goenv.sh").with({
      :ensure => "absent"
    })

    should contain_boxen__env_script("go")

    should contain_repository("/test/boxen/chgo").with({
      :ensure => "v0.1.6",
      :source => "magicmonty/chgo",
      :user   => "testuser"
    })
  end

  context "linux" do
    let(:facts) { default_test_facts.merge(:osfamily => "Linux") }

    it do
      should_not include_class("boxen::config")
    end
  end
end

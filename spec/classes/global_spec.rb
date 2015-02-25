require "spec_helper"

describe "go::global" do
  let(:facts) { default_test_facts }
  let(:params) { { :version => "1.3" } }

  it do
    should include_class("go")
    should include_class("go::1_3")

    should contain_file("/test/boxen/chgo/version").with({
      :content => "1.3\n",
    })
  end
end

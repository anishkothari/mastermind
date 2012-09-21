require 'code_builder'

describe CodeBuilder do

  it 'builds a four lowercase character code' do
    builder = CodeBuilder.new
    code = builder.build_code
    code.length.should == 4
    code.should =~ /^[a-f][a-f][a-f][a-f]$/
  end

  it "generates a unique code" do
    builder = CodeBuilder.new
    builder.build_code.should_not == builder.build_code
  end

end

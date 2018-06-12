RSpec.describe Codebreaker do
  # it "has a version number" do
  #   expect(Codebreaker::VERSION).not_to be nil
  # end

  # it "does something useful" do
  #   expect(false).to eq(true)
  # end

  it 'saves secret string with numbers from 1 to 6' do
    expect(game.instance_variable_get(:@secret_code)).to match(/^[1-6]{4}\z/)
  end
end

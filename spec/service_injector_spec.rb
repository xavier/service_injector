require "spec_helper"

SimpleService = Class.new

class Injectee

  include ServiceInjector

end

describe "A class including ServiceInjector" do

  it "has a ::uses methods" do
    expect(Injectee).to respond_to(:uses)
  end

end

describe "Simple injection" do

  before do
    Injectee.uses :simple_service
  end

  let(:injectee) { Injectee.new }

  describe "the injected service method" do

    it "has a protected service method" do
      expect(injectee.protected_methods).to include(:simple_service)
    end

    it "returns a service instance" do
      expect(injectee.send(:simple_service)).to be_a(SimpleService)
    end

    it "memoizes the service instance" do
      expect(injectee.send(:simple_service)).to be_eql(injectee.send(:simple_service))
    end

  end

end

describe "Injection with a constructor block" do

  before do
    Injectee.uses(:other_service) { SimpleService.new }
  end

  let(:injectee) { Injectee.new }

  describe "the injected service method" do

    it "has a protected service method" do
      expect(injectee.protected_methods).to include(:other_service)
    end

    it "returns a service instance" do
      expect(injectee.send(:other_service)).to be_a(SimpleService)
    end


    it "memoizes the service instance" do
      expect(injectee.send(:other_service)).to be_eql(injectee.send(:other_service))
    end


  end

end
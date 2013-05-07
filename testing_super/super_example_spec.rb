# require 'spec_helper'

class BaseRenderer

  def initialize(base,options={})
    @base = base
    @options = options
  end

  def data
    @data ||= fetch_data_from_external_service(@options[:url])
  end

  def fetch_data_from_external_service(url)
    ExternalService.new(url).fetch_data
  end

  def render!
    puts "### I'm renderering text"
    render
  end

  # TO BE SUBCLASSED
  def render ; end

end

class HTMLRenderer < BaseRenderer
  def render
    puts "### I'm the HTML renderer"
  end
end

# HTMLRenderer.new.render

describe HTMLRenderer do

  let(:subject) { described_class.new "something", url: "http://google.com" }

  describe "#render" do
    it "calls to the external service" do
      pending
      #HTMLRenderer.any_instance.should_receive(:fetch_data_from_external_service).with("http://google.com")
      subject
    end

    it "calls the base renderer" do
      subject.render!
    end
  end
end
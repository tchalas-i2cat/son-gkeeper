require_relative '../spec_helper'
require 'webmock/rspec'
require 'json'
require 'securerandom'
require 'pp'

RSpec.describe 'Package API' do
  describe 'POST /packages' do
    # curl -F "package=@simplest-example.son" localhost:5000/packages
  
    package_file_name = 'simplest-example.son'
    let(:response_body) {{ 'uuid'=> "dcfb1a6c-770b-460b-bb11-3aa863f84fa0", 'descriptor_version' => "1.0", 'package_group' => "eu.sonata-nfv.package", 'package_name' => "simplest-example", 
      'package_version' => "0.1", 'package_maintainer' => "Michael Bredel, NEC Labs Europe"}}
    @package = { filename: package_file_name, type: 'application/octet-stream', name: 'package', tempfile: File.read('./spec/fixtures/'+package_file_name),
      head: "Content-Disposition: form-data; name=\"package\"; filename=\"#{package_file_name}\"\r\nContent-Type: application/octet-stream\r\n"
    }
    let(:package_file) {Rack::Test::UploadedFile.new('./spec/fixtures/simplest-example.son','application/octet-stream', true)}
    let(:pkgmgr) {stub_request(:post, 'http://localhost:5100/packages').to_return(:status=>201, :body=>response_body, :headers=>{ 'Content-Type'=>'application/json' })}
    # .with(:headers => { 'Content-Type' => 'application/octet-stream' })
    
    #let(:body) { { :key => "abcdef" }.to_json }
    #before do
    #  post '/channel/create', body, {'Content-Type' => 'application/json'}
    #end
    #subject { last_response }
    #it { should be_ok }
    
    before do
      stub_request(:any, 'localhost:5100/packages').to_return(:status=>201, :body=>response_body.to_json, :headers=>{ 'Content-Type'=>'application/json' })
      post '/packages', :package => package_file
    end
    
    after do
      
    end

#    it 'accessed the Package Manager' do
#      expect(pkgmgr).to have_been_requested  
#    end
    
    it 'should upload a file' do
      expect(last_response.status).to eq 201
    end
  
    it 'returns the JSON related to the resource creation' do
      expect(last_response.headers['Content-Type']).to eq 'application/json'
      parsed_body = JSON.parse(JSON.parse(last_response.body, :quirks_mode => true))
      expect(parsed_body).to be_an_instance_of(Hash)
      expect(parsed_body).to eq response_body
    end
  
    it 'should return a UUID' do
      parsed_body = JSON.parse(JSON.parse(last_response.body, :quirks_mode => true))
      uuid = parsed_body.fetch('uuid')
      expect(uuid).to be_an_instance_of(String)
      expect(uuid.length).to eq 36
    end
    
#    it "should upload a file" do
#      file = Rack::Test::UploadedFile.new("./HelloWorld.bin", "application/octet-stream")
#      json = {:md5sum => "0cd74c7a3cf2207ffd68d43177681e6b", :config => "./testconfig.yaml"}.to_json

#      post "/upload", :json => json, :file => file
#      last_response.should be_ok
#      (JSON.parse(last_response.body)["status"]).should be_true
#      (JSON.parse(last_response.body)["filename"]).should eq("HelloWorld.bin")
#    end

#    it "download a file successfully" do
#      filename = "HelloWorld.bin"
#      get '/download/' + filename
#      last_response.should be_ok
#      last_response.headers['Content-Type'].should eq "application/octet-stream"
#    end
  end
end

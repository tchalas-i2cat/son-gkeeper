##
## Copyright 2015-2017 Portugal Telecom Inovacao/Altice Labs
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##   http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
# encoding: utf-8
require 'pp'

class VFunction
  
  attr_accessor :url
  
  JSON_HEADERS = {'Accept'=>'application/json', 'Content-Type'=>'application/json'}
  
  def initialize(url, logger)
    @url = url
    @logger = logger
  end
  
  def find(params)
    headers = { 'Accept'=> 'application/json', 'Content-Type'=>'application/json'}
    headers[:params] = params unless params.empty?
    pp "VFunction#find(#{params}): headers #{headers}"

    uri = @url
    pp "VFunction#find(#{uri})"
    begin
      response = RestClient.get(uri, headers)
      pp "VFunction#find: response #{response}"
      services = JSON.parse(response.body)
      pp "VFunction#find: services #{services}"
      services
    rescue => e
      puts e.backtrace
      nil
    end
  end

  def find_by_uuid(uuid)
    headers = { 'Accept'=> 'application/json', 'Content-Type'=>'application/json'}
    headers[:params] = uuid
    begin
      response = RestClient.get(@url + "/#{uuid}", headers) 
      parsed_response = JSON.parse(response)
      pp "VFunction#find_by_uuid(#{uuid}): #{parsed_response}"
      parsed_response      
    rescue => e
      puts e.backtrace
      nil
    end
  end
end
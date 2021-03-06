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
require 'addressable/uri'

class GtkApi < Sinatra::Base
  
  # GET many services
  get '/services/?' do
    uri = Addressable::URI.new
    uri.query_values = params
    logger.debug "Settings Srv. Mgmt. = #{settings.service_management.class}"
    logger.debug "GtkApi: entered GET /services?#{uri.query}"
    
    params[:offset] ||= DEFAULT_OFFSET 
    params[:limit] ||= DEFAULT_LIMIT
    
    services = settings.service_management.find_services(params)
    if services
      logger.debug "GtkApi: leaving GET /services?#{uri.query} with #{services}"
      halt 200, services.to_json if services
    else
      logger.debug "GtkApi: leaving GET /services?#{uri.query} with \"No services with #{uri.query} were found\""
      halt 404, "No services with #{uri.query} were found"
    end
  end
  
  # GET a specific service
  get '/services/:uuid' do
    logger.debug "Settings Srv. Mgmt. = #{settings.service_management.class}"
    logger.debug "GtkApi: entered GET /services/#{params[:uuid]}"
    
    service = settings.service_management.find_services_by_uuid(params[:uuid])
    if service
      logger.debug "GtkApi: leaving GET /services/#{params[:uuid]} with #{service}"
      halt 200, service.to_json if service
    else
      logger.debug "GtkApi: leaving GET /services/#{params[:uuid]} with \"Service #{params[:uuid]} no found\""
      halt 404, "Service #{params[:uuid]} no found"
    end
  end
  
  get '/admin/services/logs' do
    logger.debug "GtkApi: entered GET /admin/services/logs"
    headers 'Content-Type' => 'text/plain; charset=utf8', 'Location' => '/'
    log = settings.service_management.get_log
    halt 200, log.to_s
  end
end

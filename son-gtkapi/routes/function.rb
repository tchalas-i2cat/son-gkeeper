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
  
  # GET many functions
  get '/functions/?' do
    uri = Addressable::URI.new
    uri.query_values = params
    logger.debug "GtkApi: entered GET /functions?#{uri.query}"
    
    params[:offset] ||= DEFAULT_OFFSET 
    params[:limit] ||= DEFAULT_LIMIT
     
    functions = settings.function_management.find_functions(params)
    if functions
      logger.debug "GtkApi: leaving GET /functions?#{uri.query} with #{functions}"
      halt 200, functions.to_json if functions
    else 
      logger.debug "GtkApi: leaving GET /functions?#{uri.query} with \"No function with params #{uri.query} was found\""
      json_error 404, "No function with params #{uri.query} was found"
    end  
  end
  
  # GET function by uuid
  get '/functions/:uuid' do
    unless params[:uuid].nil?
      logger.info "GtkApiss: entered GET \"/functions/#{params[:uuid]}\""
      function = settings.function_management.find_functions_by_uuid(params[:uuid])
      if function 
        logger.info "GtkApi: in GET /functions/#{params[:uuid]}, found function #{function}"
        response = function
        logger.info "GtkApi: leaving GET /functions/#{params[:uuid]} with response="+response
        halt 200, response
      else
        logger.error "GtkApi: leaving GET \"/functions/#{params[:uuid]}\" with \"No functions with UUID=#{params[:uuid]} was found\""
        json_error 404, "No function with UUID=#{params[:uuid]} was found"
      end
    end
    logger.error "GtkApi: leaving GET \"/functions/#{params[:uuid]}\" with \"No function UUID specified\""
    json_error 400, 'No function UUID specified'
  end
  
  get '/admin/functions/logs' do
    logger.debug "GtkApi: entered GET /admin/functions/logs"
    headers 'Content-Type' => 'text/plain; charset=utf8', 'Location' => '/'
    log = settings.function_management.get_log
    halt 200, log.to_s
  end
end

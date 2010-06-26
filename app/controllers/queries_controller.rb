class QueriesController < ApplicationController

  def new
  end

  def create
    output = []
    RDF::RDFa::Reader.open(params[:uri]) do |reader|
      reader.each_statement do |statement|
        output << CGI.escapeHTML(statement.to_s)
      end
    end
    render :text => output.join("<br />")
  rescue Exception => e
    render :text => "Bad Query: #{e}"
  end

end
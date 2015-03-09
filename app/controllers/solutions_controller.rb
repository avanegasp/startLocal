class SolutionsController < ApplicationController
  before_action :private_access

  def update_documents
    @solution = Solution.find(params[:id])
    save_documents_with_no_versioning
    head :no_content
  end

  def submit
    @solution = Solution.find(params[:id])
    save_documents
    evaluate_solution
  end

  def preview
    solution = Solution.find(params[:id]).documents.where(name: params[:file]).take
    if solution
      render text: solution.content, content_type: content_type_file(params[:file])
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  private
    def save_documents
      @solution.documents.each { |doc| doc.update(content: params["content-#{doc.id}"]) }
    end

    def save_documents_with_no_versioning
      @solution.documents.each do |doc|
        doc.without_versioning do
          doc.update(content: params["content-#{doc.id}"])
        end
      end
    end

    def evaluate_solution
      @error = @solution.evaluate
      @status = @error ? :failed : :completed
    end

    def content_type_file(name)
      mode = { "html" => "text/html", "js" => "text/javascript", "rb" => "text/ruby", "css" => "text/css", "sql" => "text/sql" }
      mode[name.split(".")[1]]
    end
end
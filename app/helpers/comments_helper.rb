module CommentsHelper

  def generate_comments_path(commentable_instance)
    klass = commentable_instance.class
    resource_name = klass.to_s.underscore
    if klass.is_a? FriendlyId
      id = commentable_instance.friendly_id || commentable_instance.id
    else
      id = commentable_instance.id
    end
    Rails.application.routes.url_helpers.comments_path(commentable_resource: resource_name, id: id)
  end

  def button_delete(comment)
    link_to "x" , comment_path(comment), remote: true, data: {confirm: "¿Esta seguro que quiere eliminar esto?"}, method: :delete, class: "close pull-right remove-comment", id:"remove-coment-#{comment.id}", title: "Eliminar Comentario"
  end

end

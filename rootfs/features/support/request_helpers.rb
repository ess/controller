module RequestHelpers
  def with_json_body(&block)
    old_content_type = current_session.instance_eval {@headers.delete('Content-Type')}

    header('Content-Type', "application/json")

    block.call

    unless old_content_type.nil?
      header('Content-Type', old_content_type)
    end
  end

end

World(RequestHelpers)

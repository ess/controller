module AuthHelpers
  def set_token(token)
    indifferently_memorize_fact(:token, token)
  end

  def unset_token
    begin
      forget_fact(:token)
    rescue
    end
  end

  def token
    recall_fact(:token)
  end

  def with_authentication(&block)
    header 'Authorization', "token #{token}"

    block.call

    current_session.instance_eval {@headers.delete('Authorization')}
  end

  def without_authentication(&block)
    oldauth = current_session.instance_eval {@headers.delete('Authorization')}

    block.call

    unless oldauth.nil?
      header 'Authorization', oldauth
    end
  end
end

World(AuthHelpers)

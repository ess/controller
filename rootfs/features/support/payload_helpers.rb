module PayloadHelpers
  def set_payload(payload)
    indifferently_memorize_fact(:payload, payload)
  end

  def update_payload_key(key, value)
    set_payload(payload.merge({key => value}))
  end

  def remove_payload_key(key)
    p = payload
    p.delete(key)
    set_payload(p)
  end

  def payload
    recall_fact(:payload)
  end
end

World(PayloadHelpers)

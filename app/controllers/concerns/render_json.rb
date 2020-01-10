module RenderJSON
  %w[200 401].each do |status|
    define_method "render_#{status}" do |data = nil|
      render_oj_json(status.to_i, data)
    end
  end

  def render_oj_json(status, data = {})
    message, content = if error_code?(status)
                         data.present? ? [data, {}] : ['error', {}]
                       else
                         ['success', data]
                       end

    meta = { code: status, message: message, data: content }

    render json: Oj.dump(meta, mode: :compat), status: status
  end

  def error_code?(status)
    !success_code?(status)
  end

  def success_code?(status)
    success_code.include?(status)
  end

  def success_code
    [200]
  end
end

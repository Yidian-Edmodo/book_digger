module RenderJSON
  ALL_CODES = %w[200 401].freeze
  SUCCESS_CODES = %w[200].freeze

  ALL_CODES.each do |status|
    define_method "render_#{status}" do |data = nil|
      render_oj_json(status, data)
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
    SUCCESS_CODES.include?(status)
  end
end

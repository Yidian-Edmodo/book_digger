module RenderJSON
  ALL_CODES = %w[200 401].freeze
  SUCCESS_CODES = %w[200].freeze

  ALL_CODES.each do |status|
    define_method "render_#{status}" do |data = nil|
      render_oj_json(status, data)
    end
  end

  def render_oj_json(status, data = {})
    message, content = if SUCCESS_CODES.include?(status)
                         ['success', data]
                       else
                         [data, nil]
                       end

    meta = { code: status, message: message, data: content }

    render json: Oj.dump(meta, mode: :compat), status: status
  end
end

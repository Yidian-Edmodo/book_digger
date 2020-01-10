module RenderJSON
  ALL_CODES = %w[200 401].freeze
  SUCCESS_CODES = %w[200].freeze

  ALL_CODES.each do |status|
    define_method "render_#{status}" do |data = nil|
      render_oj_json(status, data)
    end
  end

  def render_oj_json(status, data = {})
    meta = { code: status, message: success?(status), data: data }
    render json: Oj.dump(meta, mode: :compat), status: status
  end

  def success?(status)
    SUCCESS_CODES.include?(status) ? 'success' : 'error'
  end
end

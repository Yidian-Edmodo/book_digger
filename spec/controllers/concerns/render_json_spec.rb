require 'rails_helper'

class Render < ApplicationController
  include RenderJson
end

RSpec.describe Render do
  let(:render) { Render.new }
  subject { render }

  describe '#redner' do
    it 'has render_200' do
      expect(render.method('render_200').name).to eq :render_200
    end

    it 'has render_401' do
      expect(render.method('render_401').name).to eq :render_401
    end
  end
end

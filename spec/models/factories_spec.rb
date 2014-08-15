require 'spec_helper'

FactoryGirl.factories.map(&:name).each do |factory_name|
  describe "factory #{factory_name}" do
    it 'is valid' do
      model = FactoryGirl.build(factory_name)

      if model.respond_to?(:valid?)
        expect(model).to be_valid, model.errors.full_messages.join(',')
      end
    end
  end
end

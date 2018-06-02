require "active_support"
require "active_support/concern"
require "active_support/core_ext/class/subclasses"

require 'rails'

require 'open_api'

require 'open_api_annotator/field'
require 'open_api_annotator/attribute'
require 'open_api_annotator/association'
require 'open_api_annotator/version'
require 'open_api_annotator/errors'
require 'open_api_annotator/controller_annotatable'
require 'open_api_annotator/serializer_annotatable'
require 'open_api_annotator/type_validator'
require 'open_api_annotator/format_validator'
require 'open_api_annotator/nullable_validator'
require 'open_api_annotator/paths_builder'
require 'open_api_annotator/components_builder'
require 'open_api_annotator/spec_builder'

module OpenApiAnnotator
  def self.create_spec_yaml(info:, file_path:)
    spec = SpecBuilder.new.build(info: info)
    yaml = OpenApi::Serializers::YamlSerializer.new.serialize(spec)
    File.write(file_path, yaml)
  end
end

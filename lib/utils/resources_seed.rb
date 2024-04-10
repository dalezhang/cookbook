module ResourcesSeed
  def self.seed_resource(file_name)
    filepath = full_filepath(file_name)

    results = YAML.safe_load_file(filepath)

    logger = Logger.new($stdout)
    results.each_pair do |model_name, objects|
      create_records(model_name, objects)
      logger.info "Refreshed #{objects.size} #{model_name}s"
    end
  end
  def self.full_filepath(file_name)
    filepath = File.expand_path("tasks/#{file_name}", __dir__)

    # search in `db/resources` if not found
    filepath = File.expand_path("../../db/resources/#{file_name}", __dir__) unless File.exist?(filepath)

    filepath
  end

  def self.create_records(model_name, objects)
    objects.each do |attributes|
      attributes.deep_symbolize_keys!
      obj = model_name.camelcase.constantize.find_or_create_by(attributes)
    end
  end
end

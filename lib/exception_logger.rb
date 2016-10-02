module ExceptionLogger
  # Logs exception
  # Optional args:
  # info: "A descriptive messsage"
  def log e, args
    info = args[:info]

    Rails.logger.error info unless info.nil?
    Rails.logger.error e.message
  end
end

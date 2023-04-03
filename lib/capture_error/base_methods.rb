# frozen_string_literal: true

module CaptureError
  module BaseMethods
    extend ActiveSupport::Concern

    def capture_context
      {
        user: capture_user,
        tags: capture_tags,
        extra: capture_extra
      }
    end

    def capture_user
      nil
    end

    def capture_extra
      {}
    end

    def capture_tags
      {}
    end

    def capture_message(message, options = {})
      context = capture_context.deep_merge(options)
      CaptureError.capture_message(message, context)
    end

    def capture_error!(exception, options = {})
      capture_error(exception, options)
      raise exception
    end

    def capture_error(exception, options = {})
      context = capture_context.deep_merge(options)
      CaptureError.capture(exception, context)
    end

    def log_error(error, skip_backtrace: false)
      CaptureError.log_error(error, skip_backtrace: skip_backtrace)
    end
  end
end

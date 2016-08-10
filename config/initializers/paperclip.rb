case Rails.env.to_sym
when :development, :test
  Paperclip::Attachment.default_options[:storage] = :filesystem
  Paperclip::Attachment.default_options[:path] = "#{Rails.root}/test/fixtures/:class/:id_partition/:style.:extension"
when :production
  Rails.application.config.before_initialize do
    Paperclip::Attachment.default_options[:url] = ':filecabinet-tiy-ror.s3.amazonaws.com'
    Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
  end

  Paperclip::Attachment.default_options[:s3_host_name] = 's3.amazonaws.com'
  Paperclip::Attachment.default_options[:s3_region] = 'us-east-1'
  Paperclip::Attachment.default_options[:bucket] = 'filecabinet-tiy-ror'
  Paperclip::Attachment.default_options = {
    storage: :s3,
    s3_credentials: {
      bucket: ENV.fetch('S3_BUCKET_NAME'),
      access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
      secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
      s3_region: ENV.fetch('AWS_REGION')
    }
  }

else
  fail "What are you doing? -- You are operating in an env that is not setup for paperclip"
end

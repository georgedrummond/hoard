class RequiredEnv
  VARIABLES = [
    'GITHUB_API_KEY',
    'GITHUB_API_SECRET',
    'GITHUB_ORGANIZATION_NAME',
    'AWS_BUCKET',
    'AWS_KEY',
    'AWS_SECRET'
  ]

  def self.set?
    RequiredEnv.missing.empty?
  end

  def self.missing
    VARIABLES - ENV.keys
  end
end

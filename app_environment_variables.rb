# RDS
ENV['RDS_USERNAME'] = 'devmenumap'
ENV['RDS_PASSWORD'] = 'startup2015'
ENV['RDS_HOSTNAME'] = 'menumapdb.cl3vmveiczjg.ap-northeast-1.rds.amazonaws.com'
ENV['RDS_PORT']     = '3306'

if Rails.env.development?
  ENV['RDS_DB_NAME']  = 'new_menumap_development'
elsif Rails.env.production?
  ENV['RDS_DB_NAME']  = 'new_menumap_production'
else Rails.env.test?
  ENV['RDS_DB_NAME']  = 'new_menumap_test'
end

# S3
ENV['S3_ACCESS_KEY'] = 'AKIAJZ2F3JYQPCPK76DQ'
ENV['S3_SECRET_KEY'] = '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'
ENV['S3_REGION'] = 'ap-northeast-1'

if Rails.env.development?
	ENV['S3_BUCKET'] = 'menumap-s3-development'
elsif Rails.env.production?
	ENV['S3_BUCKET'] = 'menumap-s3-production'
else Rails.env.test?
	# pending creation
	ENV['S3_BUCKET'] = 'menumap-s3-test'
end

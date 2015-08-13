# RDS
ENV['RDS_USERNAME'] = 'devmenumap'
ENV['RDS_PASSWORD'] = 'startup2015'
ENV['RDS_HOSTNAME'] = 'newmenumapdb.cl3vmveiczjg.ap-northeast-1.rds.amazonaws.com'
ENV['RDS_PORT']     = '3306'

if Rails.env.development?
  ENV['RDS_DB_NAME']  = 'new_menumap_development'
elsif Rails.env.production?
  ENV['RDS_DB_NAME']  = 'new_menumap_production'
end

# S3
# IAM::developer_001 
ENV['S3_ACCESS_KEY'] = 'AKIAJZ2F3JYQPCPK76DQ'
ENV['S3_SECRET_KEY'] = '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'

if Rails.env.development?
	ENV['S3_BUCKET'] = 'menumap-s3-development'
elsif Rails.env.production?
	ENV['S3_BUCKET'] = 'menumap-s3-production'
else Rails.env.test?
	# pending creation
	ENV['S3_BUCKET'] = 'menumap-s3-test'
end

# Devise
ENV['DEVISE_SECRET_KEY'] = '660fca6110afbe041b243dc2a314d7e66820df093ca44a0b889162475bd3b8d32fa9ad7a211671d3f17bcf582244966a0d47d5a2ed27e186c62646cad28955a3'

# Facebook
ENV['FB_APP_ID'] = '1053593421318380'
ENV['FB_APP_SECRET'] = '25db942c04bb6e4b69c29cd2982a01d9'

# SES
ENV['SENDER'] = 'info@menumap.co.kr'
ENV['SES_ADDRESS'] = 'email-smtp.us-east-1.amazonaws.com'
ENV['SES_PORT'] = '587'
ENV['SES_USER_NAME'] = 'AKIAJOQLGTLT7IVGM5KQ'
ENV['SES_PASSWORD'] = 'Ag7hdXlaO5DzdsfCEzk/iRw4RdN4E1UJkiH3aI6jeqsv'

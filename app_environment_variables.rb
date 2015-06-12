# RDS
ENV['RDS_USERNAME'] = 'devmenumap'
ENV['RDS_PASSWORD'] = 'startup2015'
ENV['RDS_HOSTNAME'] = 'menumapdb.cl3vmveiczjg.ap-northeast-1.rds.amazonaws.com'
ENV['RDS_PORT']     = '3306'

if Rails.env.development?
  ENV['RDS_DB_NAME']  = 'new_menumap_development'
end

if Rails.env.production?
  ENV['RDS_DB_NAME']  = 'new_menumap_production'
end

if Rails.env.production?
  ENV['RDS_DB_NAME']  = 'new_menumap_test'
end

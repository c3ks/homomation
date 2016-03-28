json.array! @measurements do |measurement|
  json.created_at I18n.l(measurement.created_at, format: '%Y/%m/%d %H:%M:%S')
  json.data measurement.data
end

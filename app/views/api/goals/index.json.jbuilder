
json.array! @goals.each do |goal|
  json.partial! "goal.json.jbuilder", goal: goal

end


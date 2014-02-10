json.array!(@entries) do |entry|
  json.extract! entry, :entry_date, :title
  json.set!(:start, entry.entry_date)
  json.set!(:title, "Journal Entry")
  json.url entry_url(entry, format: :html)
end


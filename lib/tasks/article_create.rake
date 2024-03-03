namespace :article do
  desc 'タスク'
  task name: :environment do
    File.open('sample.txt', 'w') do |f|
      Article.find_each do |a|
        f.puts ".#{a.title}{"
        f.puts "  background-color: #{a.id};"
        f.puts '  color: white;' if a.published_at.nil?
        f.puts '}'
        f.puts ''
      end
    end
  end
end

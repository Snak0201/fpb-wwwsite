namespace :task do
  task :search do
    desc 'defined tasks'
    on roles(:app) do
      within current_path do
        execute :bundle, :exec, :rake, '-T'
      end
    end
  end

  namespace :db do
    task :check do
      desc 'db migrate status'
      on roles(:app) do
        with rails_env: fetch(:rails_env) do
          within current_path do
            execute :bundle, :exec, :rake, 'db:migrate:status'
          end
        end
      end
    end
  end
end

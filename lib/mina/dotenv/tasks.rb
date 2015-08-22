require 'mina/dotenv/utils'

namespace :dotenv do
  desc 'Copies the local .env file to the server'
  task :push do
    remote_dotenv_path = "#{deploy_to}/shared/.env"

    dotenv = Mina::Dotenv::Utile.read_file(dotenv_location)
    queue! %(echo #{dotenv.shellescape} > #{remote_dotenv_path})
    queue! %(ln -nFs #{remote_dotenv_path} #{deploy_to}/#{current_path}/.env)
  end

  # TODO: Implement this
  # desc 'Copies the remote .env file to the current directory'
  # task :pull do
  # end
end
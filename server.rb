module Portfolio
  class Server < Sinatra::Base

    get "/" do
      erb :index
  	end

      get "/contact" do
      	erb :contact
      end

      post '/contact' do
      	name = params["name"]
      	email = params["email"]
      	message = params["message"]

            conn.exec_params("INSERT INTO contact_data (name, email, message) VALUES ($1, $2, $3)", [name, email, message])
    @contact_submitted = true     
    erb :contact

        private

  def conn 
  if ENV["RACK_ENV"] == 'production'
  PG.connect(
    dbname: ENV["POSTGRES_DB"],
    host: ENV["POSTGRES_HOST"],
    password: ENV["POSTGRES_PASSWORD"],
    user: ENV["POSTGRES_USER"]
  )
else
  PG.connect(dbname: "portfolio")
end


      end
  end
end

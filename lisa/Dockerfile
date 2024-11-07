# Use the official Ruby image with the specified version
FROM ruby:2.6.3

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Install the correct version of bundler
RUN gem install bundler -v 2.0.2

# Set the working directory inside the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock first to leverage Docker cache
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Expose the port Sinatra will run on
EXPOSE 4567

# Set the default environment to production
ENV RACK_ENV=production

# Define the command to run your Sinatra app in production
CMD ["bundle", "exec", "ruby", "app.rb", "-o", "0.0.0.0", "-p", "4567"]

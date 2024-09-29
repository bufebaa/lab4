FROM nginx:alpine

# Copy the static website files to the default Nginx directory
COPY . /usr/share/nginx/html

# Create the templates directory before writing the configuration
RUN mkdir -p /etc/nginx/templates

# Use envsubst to substitute the dynamic $PORT into the Nginx configuration
RUN echo 'server { listen 0.0.0.0:$PORT; root /usr/share/nginx/html; index index.html; }' > /etc/nginx/templates/default.conf

# Expose the dynamic $PORT environment variable
EXPOSE $PORT

# Start Nginx and substitute the environment variables with envsubst
CMD ["sh", "-c", "envsubst < /etc/nginx/templates/default.conf > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"]

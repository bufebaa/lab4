FROM nginx:alpine

# Copy the website files to the default Nginx HTML directory
COPY . /usr/share/nginx/html

# Use envsubst to substitute the dynamic $PORT into the Nginx configuration
RUN echo 'server { listen 0.0.0.0:$PORT; root /usr/share/nginx/html; index index.html; }' > /etc/nginx/templates/default.conf

# Expose the dynamic $PORT environment variable
EXPOSE $PORT

# Start Nginx and substitute the environment variables with envsubst
CMD ["sh", "-c", "envsubst < /etc/nginx/templates/default.conf > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"]

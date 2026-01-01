FROM nginx:1.29-alpine

# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy your static site (index.html, style.css, folders, etc.)
COPY . /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

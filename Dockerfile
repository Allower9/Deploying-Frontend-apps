# Stage 1: Build application
FROM node:18-alpine as builder
WORKDIR /app

# Cache dependencies layer
COPY package*.json ./
RUN npm ci --silent

# Copy source and build
COPY . .
RUN npm run build

# Stage 2: Production image
FROM nginx:alpine

# Create directory and set permissions
RUN mkdir -p /var/www/dist && \
    chown -R nginx:nginx /var/www && \
    chmod -R 755 /var/www

# Copy built assets from builder
COPY --from=builder --chown=nginx:nginx /app/dist /var/www/dist

# Health check (optional)
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

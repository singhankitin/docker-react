FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build --> stuff we care about

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# No need for start-up command - default start-up command for nginx image start nginx up
# Step 1
FROM node:14.15.4-alpine3.10 as build-step
RUN mkdir /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build

# Stage 2
FROM nginx:1.18.0
COPY --from=build-step /app/build /usr/share/nginx/html
# pull official base image
FROM # pull official base image
FROM node:21.5.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent

# add app
COPY . ./

# expose port 7775
EXPOSE 7775

# start app on port 7775
CMD ["npm", "start", "--", "--port", "7775"]

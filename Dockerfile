# Use an official ubuntu image
FROM ubuntu:18.04
FROM node:14.5.0-stretch
# Use an official Python runtime as a parent image

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

RUN apt-get update

RUN apt-get install -y libcups2-dev 
RUN apt-get install -y libavahi-compat-libdnssd-dev 
# RUN apt-get install -y chromium-browser

# install manually all the missing libraries for chrome
RUN apt-get install -y gconf-service libasound2 libatk1.0-0 libcairo2 libcups2 libfontconfig1 libgdk-pixbuf2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libxss1 fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils

RUN npm install -g cordova

RUN npm install yarn

# install chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

# Install needed packages
RUN yarn install

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Run
CMD ["npm", "run", "serve"]
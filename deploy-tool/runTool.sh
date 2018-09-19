#!/bin/bash

cd tool
trash ./artifacts/*
cp -rf ../artifacts ./
trash fabric*
pm2 start app.js
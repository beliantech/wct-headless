export DISPLAY=:99
Xvfb :99 -shmem -screen 0 1024x768x24 &
su - seleuser -c "cd /opt/code/; bower install; wct test; rm -rf bower_components;"


export DISPLAY=:99
Xvfb :99 -shmem -screen 0 1024x768x24 &
cd /opt/code/;
bower install --allow-root;
su - seleuser -c "wct test"


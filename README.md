# Setup weave
weave launch && weave launch-proxy -debug --with-dns
weave status
eval $(weave env)

# When switching RAILS_ENV
docker exec dvo305demo_web_1 rake db:create
docker exec dvo305demo_web_1 rake db:migrate

ln -s -f `realpath app1-desc.yaml` /app.yaml
skopos load --project app1 --env app1-env.yaml app1-model.yaml

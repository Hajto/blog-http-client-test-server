# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :mix_docker, image: "hajto/http-clients-test"

config :http_client_test,
  target: "${TARGET}",
  dockerfile_build: "Dockerfile.build",
  port: "${PORT}"

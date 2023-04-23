#!/usr/bin/env bats

pass() {
  echo "${BATS_TEST_NUMBER}: ${BATS_TEST_DESCRIPTION} - passed"
}

fail() {
  echo "${BATS_TEST_NUMBER}: ${BATS_TEST_DESCRIPTION} - failed"
}

@test "-> check if Dockerfile exists" {
  [ -f "Dockerfile" ]
}

@test "-> check if container is running" {
  result="$(docker ps | grep sysmonimage )"
  [ "$result" != "" ]
  pass
}

@test "-> check if netstat service is running" {
  result="$(docker run sysmonimage netstat)"
  [ "$result" != "" ]
}
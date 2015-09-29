rm -rf temp
mkdir -p temp
rm -rf build
mkdir -p build
sed "s/BUILD_NUMBER/$BUILD_NUMBER/g" < Dockerrun.aws.json.t > build/Dockerrun.aws.json
